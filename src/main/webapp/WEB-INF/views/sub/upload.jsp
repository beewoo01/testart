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
	
	
	$(document).ready(function() {
		alert("아 나가자 동해바다로");
		$("#input_imgs").on("change", handleImgsFilesSelect);
	});
	
	function handleImgsFilesSelect(e){
		//sel_files = [];
		//test = new Array;
		
		$(".imgs_wrap").empty();
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		var index = 0;
	
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			//test.push(f);
			sel_files.push(f);
			 
			alert("111" + sel_files+ ",");
			var reader = new FileReader();
			reader.onload = function(e){
				 var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
                $(".imgs_wrap").append(html);
                alert("첫눈처럼");
                /* change.innerHTML = "<input type=\"file\" id=\"input_imgs\" name=\"input_imgs\" value=\"" + sel_files + "\" multiple />"; */
				/* var img_html = "<img src=\"" + e.target.result + "\" />";
				$(".imgs_wrap").append(html); */
				index++;
			}
			reader.readAsDataURL(f);
		});
		 /* $('input_imgs').val(sel_files); */
	}
	
	function deleteImageAction(index) {
        console.log("index : "+index);
        console.log("sel length : "+sel_files.length);

        sel_files.splice(index, 1);

        var img_id = "#img_id_"+index;
        $(img_id).remove();
    }
	
	function fileSubmit(){
		var formData = new FormData($("#fileForm")[0]);
		var data = new FormData();
		for(var i=0, len=sel_files.length; i < len; i++){
			var name = "image_"+i;
			data.append(name, sel_files[i]);
			alert("호호 : " + name, sel_files[i]);
			alert("data : " + data);
		}
		data.append("image_count", sel_files.length);
		alert("data22 : " + sel_files.length);

		$.ajax({
            type : 'post',
            url : 'fileUpload',
            data : formData,
            processData : false,
            contentType : false,
            success : function(html) {
                alert("파일 업로드하였습니다.");
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
		<form id="fileForm" action="fileUpload" method="post" enctype="multipart/form-data">
			<input type="file" id="input_imgs" name="input_imgs" multiple />
			
			<input type="button" value="전송하기" onClick="fileSubmit();" />
		</form>
	</div>
	<div>
		<div class="imgs_wrap">
		</div>
	</div>
</body>
</html>