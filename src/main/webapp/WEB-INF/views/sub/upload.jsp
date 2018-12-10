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
	
	$(document).ready(function() {
		
		$("#input_imgs").on("change", handleImgsFilesSelect);
		alert("하하하.");
	});
	
	function handleImgsFilesSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
	
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			
			sel_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e){
				var img_html = "<img src=\"" + e.target.result + "\" />";
				$(".imgs_wrap").append(img_html);
			}
			reader.readAsDataURL(f);
		});
		
		var file = files[0]
		console.log(file)
		var formData = new FormData($("#fileForm")[0]);
		
		formData.append("file", file);
		
		$.ajax({
			url: '/uploadAjax',
			data: formData,
			dataType:'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function(data){

				alert("파일 업로드하였습니다.")

			  },
			  error : function(error){
				  alert("파일 업로드에 실패하였습니다.");
	                console.log(error);
	                console.log(error.status);
			  }
			})
			function checkImageType(fileName){
 				var pattern = /jpg$|gif$|png$|jpeg$/i;
 					return fileName.match(pattern);
 			}


 			function getOriginalName(fileName){
 				if(checkImageType(fileName)){
 					return;
 				}

 				var idx = fileName.indexOf("_") + 1 ;
 				return fileName.substr(idx);

 		}
 			function getImageLink(fileName){

 	 			if(!checkImageType(fileName)){
 	 				return;
 	 			}
 	 			var front = fileName.substr(0,12);
 	 			var end = fileName.substr(14);

 	 			return front + end;

 	 		}

		
	}	
	
</script>
</head>
<body>

	<div>
		<h2><b>이미지 미리보기</b></h2>
		<p class="title">다중 이미지 업로드</p>
		<form action="uploadForm" method="post" enctype="multipart/form-data">
		<input type="file" id="input_imgs" multiple />
		
		<input type="submit" value="업로드">
		</form>
	</div>
	<div>
		<div class="imgs_wrap">
		</div>
	</div>
</body>
</html>