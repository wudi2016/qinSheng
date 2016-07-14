define(['lessonComment/PrimecloudPaas'], function(PrimecloudPaas) {

	var upload = avalon.define({
		$id: 'uploadController',
		progressBar: 0,
		uploadStatus: 1,
		submitDisable: true,
		uploadTip: '',
		fileID: '',
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
										upload.fileID = response.data.data.FileID;
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
						} else {
							user[model] = response.data;
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
		}
	});

	return upload;

});