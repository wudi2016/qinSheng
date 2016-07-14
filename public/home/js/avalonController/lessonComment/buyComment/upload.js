define(['lessonComment/PrimecloudPaas'], function(PrimecloudPaas) {

	var upload = avalon.define({
		$id: 'uploadController',
		progressBar: 0,
		uploadStatus: 1,
		submitDisable: false,
		uploadTip: '',
		uploadInfo: {
			fileID: null,
			courseTitle: null,
			message: null
		},
		titleLength: 0,
		messageLength: 0,
		warning: {title: false, message: false},
		getData: function(url, model, data, method, callback) {
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
								upload.endUpload('中断上传');
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
						if (model == 'finishUpload') {
							location.href = '/member/student/' + upload.mineID;
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
		submit: function() {
			if (!upload.submitDisable) return false;
			if (!upload.uploadInfo.fileID) {
				upload.uploadStatus = 3
				upload.uploadTip = '<span style="color: red;">请先上传视频</span>';
				return false;
			}
			for (var i in upload.warning) {
				if (upload[i+'Length'] < 1) {
					upload.warning[i] = true;
					return false;
				}
			}
			upload.uploadInfo.userId = upload.mineID;
			upload.getData('/lessonComment/finishUpload', 'finishUpload', {data: upload.uploadInfo, orderID: upload.orderID}, 'POST');
		}
	});

	return upload;

});