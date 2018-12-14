<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content= "IE=edge">
<meta charset="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Start Up</title>
<style type="text/css">
	.imgs_wrap{
			width: 600px;
			margin-top: 50px;
		}
	.imgs_wrap img{
		max-width: 200px;
		}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js" charset="utf-8"></script>
<script type="text/javascript">
	var sel_files = [];
	var test;
	var previewIndex = 0;
	var index = 0;
	
	$(document).ready(function() {
		alert("아 나가자 동해바다로");
		$("#input_imgs").on("change", handleImgsFilesSelect);
	});
	
	function handleImgsFilesSelect(e){
		//sel_files = [];
		//test = new Array;
		alert("들어가자 !!!!");
		
		//$(".imgs_wrap").empty();
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		 alert("들어가라~ 111");
		
		   filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_files.push(f);
			 
			alert("111" + sel_files+ ",");
			
			var reader = new FileReader();
			reader.onload = function(e){
				
				var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove("+index+")'></a>"+
							"<br>"+"<br>"+"<br>"
							
                $(".imgs_wrap").append(html);
				alert("파일 번호 : " + index );
				index++;
				
			}
			reader.readAsDataURL(f);
			alert("전체 길이: " + sel_files.length);
		});
		 /* $('input_imgs').val(sel_files); */
	}
	
	
	function deleteImageAction(index) {
		sel_files.splice(index, 1);
        var img_id = "#img_id_"+index;
        $(img_id).remove();
    }
	
	function fileSubmit(){
		//var formData = new FormData($("#fileForm")[0]);
		//var data = new FormData();
		//
		var form = $('#uploadForm')[0];
		alert("안녕???" + form);
		var formData = new FormData(form);
		alert("악악악!! : " + Object.keys(sel_files).length);
		alert("호호 : " + sel_files.length);
		
		
		for (var index1 = 0; index1 < Object.keys(sel_files).length; index1++){
			//alert("data : " + data);
			alert("호호11 : " + sel_files.length);
			alert("배열값을 보자 : " + sel_files);
			alert("앆!!! : " + formData);
			//var name = "image_"+i;
			formData.append('files', sel_files[index1]);
			alert("data22 : " + sel_files[index1]);
			//alert("data : " + data);
		}
		

		$.ajax({
            type : 'post',
            enctype : 'multipart/form-data',
            url : 'fileUpload',
            dataType : 'JSON',
            data : formData,
            processData : false,
            contentType : false,
            success : function(html) {
            	if(html == -1){
            		alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
            	}else if(html == -2){
            		alert('파일이 10MB를 초과하였습니다.')
            	}else{
            		alert("파일 업로드하였습니다.");
            	}
            	
                
            },
            error : function(error) {
                alert("파일 업로드에 실패하였습니다.");
                console.log(error);
                console.log(error.status);
            }
        });
	}
	
</script>
</head>
<body>

	<div>
		<h2><b>이미지 미리보기</b></h2>
		<p class="title">다중 이미지 업로드</p>
			<input type="file" id="input_imgs" name="input_imgs" multiple />
			<input type="button" value="전송하기" onClick="fileSubmit();" />
		<form id="uploadForm" style="display: none;"></form>
	</div>
	<div>
		<div class="imgs_wrap">
		</div>
		<div class="text_wrap"></div>
	</div>
</body>
</html>