 define([], function () {

 	var model = avalon.define({
 		$id : 'newlist',
 		lujing: '/community/newdetail/',

         newlist :'',
         getData:function(){
             $('#demo').pagination({
                 dataSource: function(done) {
                     $.ajax({
                         type: 'GET',
                         url : '/community/getnewlist/',
                         dataType : 'json',
                         success: function(response) {
                             if(response.statuss){
                                 done(response.data);
                             }
                         }
                     });
                 },
                 pageSize: 10,
                 className:"paginationjs-theme-blue",
                 showGoInput: true,
                 showGoButton: true,
                 callback: function(data) {
                     if(data){
                         model.newlist = data;
                     }

                 }
             })

         },

 	});
     model.getData();
 	return model;
 });