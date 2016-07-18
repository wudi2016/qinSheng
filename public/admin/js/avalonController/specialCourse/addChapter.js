define(['PrimecloudPaas'], function(PrimecloudPaas) {

    var upload = avalon.define({
        $id: "uploadController",
        chapter:false,
        section:false,
        or:false,
        //selectid:'',//选择的章还是节的标识
        //chapterinfo:{
        //    courseid:'',
        //    title:'',
        //},
        select:function(id,courseid){
            upload.uploadInfo.courseid = courseid;//页面传的专题课程ID
            if(id == 1){
                upload.chapter = true;
                upload.section = false;
                upload.or = true;
                upload.uploadInfo.selectid = id;
            }else if(id == 2){
                upload.uploadInfo.courseid = courseid;//页面传的专题课程ID
                upload.section = true;
                upload.chapter = true;
                upload.or = true;
                upload.uploadInfo.selectid = id;
            }else{
                upload.section = false;
                upload.chapter = false;
                upload.or = false;
                upload.uploadInfo.selectid = id;
            }
        },

        //选择的所属parentId
        parentId:function(id){
            upload.uploadInfo.parentId = id;
        },


        //视频上传部分
        progressBar: 0,
        uploadStatus: 1,
        uploadTip: '',
        uploadInfo: {
            selectid:'',
            courseid:'',
            title:'',
            parentId:'',
            fileID: null,
            courseLowPath: null,
            courseMediumPath:null,
            courseHighPath:null,
        },
        getData: function(url, model, data, method, callback) {
            if (data) data._token = upload.csrf;
            $.ajax({
                type: method || 'GET',
                url: url,
                data: data || {},
                dataType: "json",
                success: function(response) {
                    if (response.type) {
                        if (model == 'uploadResource') {
                            if (upload.uploadStatus == 2 && response.data.code != 401) {
                                if (response.data.data.AllowUpload == 2) {
                                    upload.progressBar = 100;
                                    setTimeout(function() {
                                        upload.endUpload('视频上传完成！');
                                        upload.uploadInfo.fileID = response.data.data.FileID;
                                        //console.log(response.data.data);return;
                                        upload.getData('/lessonComment/transformation', 'transformation', {fileID: upload.uploadInfo.fileID}, 'POST');
                                    }, 1000);
                                } else {
                                    if (response.data.data.AllowUpload == 1) upload.paas.requestUpload({ url: response.data.data.UUrl, method: "POST", data: {"filedata": upload.file} });
                                    console.log('文件上传进度： ' + parseInt(response.data.data.UploadLength / response.data.data.FileLenth * 100) + '%');
                                    upload.progressBar = 25 + response.data.data.UploadLength / response.data.data.FileLenth * 100 * 0.75;
                                    setTimeout(function() {
                                        upload.getData('/lessonComment/uploadResource', 'uploadResource', {md5: upload.fileMD5, filename: upload.fileName, directory: '/'}, 'POST');
                                    }, 500);
                                }
                            } else {
                                upload.endUpload('上传中断');
                            }
                        }
                        if (model == 'transformation') {
                            if (response.data.code == 200 && response.data.data.Waiting < 0) {
                                for (var i in response.data.data.FileList) {
                                    switch(response.data.data.FileList[i].Level) {
                                        case 1:
                                            upload.uploadInfo.courseLowPath = response.data.data.FileList[i].FileID;
                                            break;
                                        case 2:
                                            upload.uploadInfo.courseMediumPath = response.data.data.FileList[i].FileID;
                                            break;
                                        case 3:
                                            upload.uploadInfo.courseHighPath = response.data.data.FileList[i].FileID;
                                            break;
                                    }
                                }
                            }
                        }
                    }
                },
                error: function(error) {
                    upload.endUpload('上传失败请重试');
                }
            });
        },
        file: null,
        fileName: null,
        fileMD5: null,
        paas: null,
        uploadResource: function(value) {
            upload.paas = upload.paas || new PrimecloudPaas();
            upload.uploadStatus = 2;
            upload.uploadTip = '';
            upload.paas.MD5(upload.file, function(result){
                if (result) {
                    upload.fileName = upload.paas.splitFileName(value);
                    $('#md5container').val(result);
                    upload.fileMD5 = $('#md5container').val();
                    upload.getData('/lessonComment/uploadResource', 'uploadResource', {md5: upload.fileMD5, filename: upload.fileName, directory: '/'}, 'POST');
                    console.log('------------------------------------  扫描完成  ---------------------------------------');
                } else {
                    upload.endUpload('上传失败请重试');
                }
            }, function(pos, size){
                if (upload.uploadStatus != 2) {
                    upload.endUpload('上传中断');
                    return false;
                }
                console.log('文件扫描进度： ' + parseInt(pos / size * 100) + '%');
                upload.progressBar = pos / size * 100 * 0.25;
            });
        },
        endUpload: function(tip) {
            upload.paas.endUpload();
            upload.progressBar = 0;
            upload.uploadStatus = 3;
            upload.uploadTip = tip || '';
        },


        //提交
        errormessagetitle:'',
        errormessagebelong:'',
        submit:function(){
            if(upload.uploadInfo.selectid == 1){ //选择章
                if(!upload.uploadInfo.title){
                    upload.errormessagetitle = '<span style="color: red;">请输入名称</span>';
                    return false;
                }
                console.log(upload.uploadInfo.title);

                $.ajax({
                    type: "post",
                    data:upload.uploadInfo,
                    url: "/admin/specialCourse/doAddSpecialChapter",

                    dataType: 'json',
                    success: function (res) {
                        console.log(res);
                        if(res == 1){
                            location.href= '/admin/specialCourse/specialChapterList/'+ upload.uploadInfo.courseid;
                            alert('添加成功');
                        }
                    }
                });
            }else{
                if(upload.uploadInfo.selectid == 2){ //选择节
                    if(!$('#belong').val()){
                        upload.errormessagebelong = '<span style="color: red;">请选择所属章</span>';
                        return false;
                    }
                    if(!upload.uploadInfo.title){
                        upload.errormessagetitle = '<span style="color: red;">请输入名称</span>';
                        return false;
                    }
                    if(!upload.uploadInfo.fileID){
                        upload.uploadStatus = 3
                        upload.uploadTip = '<span style="color: red;">请先上传视频</span>';
                        return false;
                    }
                    console.log(upload.uploadInfo.fileID);
                    console.log(upload.uploadInfo.courseLowPath);
                    console.log(upload.uploadInfo.courseMediumPath);
                    console.log(upload.uploadInfo.courseHighPath);
                    $.ajax({
                        type: "post",
                        data:upload.uploadInfo,
                        url: "/admin/specialCourse/doAddSpecialChapter",

                        dataType: 'json',
                        success: function (res) {
                            console.log(res);
                            if(res == 1){
                                location.href= '/admin/specialCourse/specialChapterList/'+ upload.uploadInfo.courseid;
                                alert('添加成功');
                            }
                        }
                    });
                }
            }


        }
    })

    return upload;

})