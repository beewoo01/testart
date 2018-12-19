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

<title>ARTPIE</title>
<style type="text/css">
	.imgs_wrap{
			width: 600px;
			margin-top: 50px;
		}
	.imgs_wrap img{
		max-width: 200px;
		}
</style>
<link rel="stylesheet" type="text/css" href="../resources/css/main_style.css">
<link rel="stylesheet" type="text/css" href="../resources/css/sub/upload_style.css"> 
<link rel="stylesheet" href="http://cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
<link href="../resources/css/sub/upload_jquery.multiselect.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../resource/js/upload.jquery.multiselect.js"></script>
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
	function goImage(){
		$("#input_imgs").trigger("click");
	}
	function gotext(){
		var textHi = "<input type='text'/>"+ "<br>" + "<br>";
		$(".imgs_wrap").append(textHi);
	}
	
</script>
</head>
<body>
	<div id="wrap">
	<header id="header"><!-- 헤더 -->
                <nav>     

                        <div class="inwrap">
                            <div id="logo"><a href="../"><img src="resources/images/logo.png" alt="로고"></a></div><!-- 로고 -->
        
        
                            <ul class="main_navi_list"><!-- 메인네비 -->
                                <li><a href="../../../artpie/html/sub/gallery/all.html">GALLERY</a></li>
                                <li><a href="../../../artpie/html/sub/feed.html">FEED</a></li>
                                <li><a href="../../../artpie/html/sub/support/2.html">SUPPORT</a></li>
                                <li><a href="#">MARCKET</a></li>
                                <li><a href="#">MAGAZINE</a></li>
                            </ul>
        
                            <ul class="main_navi_right"><!-- 로그인 회원가입 -->
                                <li>
                                    <ul class="logout" style="display:none;">
                                        <li><a href="../ShotPlace/users/login">LOGIN</a></li>
                                        <li><a href="../ShotPlace/users/signUp">JOIN US</a></li>
                                    </ul>
        
                                    <!-- <ul class="login">
                                        <li><a href="#"><img src="../../artpie/img/alarm_gr.png" alt="알림"></a><div class="main_alarm"></div></li>
                                        <li><a href="#" id="current">프로필</a>
                                            <ul>
                                               <li><a href="#">마이페이지</a></li>
                                               <li><a href="#">회원정보수정</a></li>
                                               <li><a href="#">서포트 내역</a></li>
                                               <li><a href="#">로그아웃</a></li>
                                            </ul>
                                        </li>
                                        <li class="header_upload"><a href="#"><span>UPLOAD</span><i class="xi-cloud-upload-o"></i></a></li>
                                    </ul> -->
        
        
                                    <div class="login">
                                            <ul>
                                                <li><a href="#"><img src="resources/images/alarm_gr.png" alt="알람"></a><div class="main_alarm"></div></li>
                                                <li class="main_profile"><a href="#" class="main_profile_photo"><img src="resource/images/user_profile.png"></a>
                                                    <ul>
                                                        <li><a href="#">마이페이지</a></li>
                                                        <li><a href="#">회원정보수정</a></li>
                                                        <li><a href="#">서포트 내역</a></li>
                                                        <li><a href="#">로그아웃</a></li>
                                                    </ul>
                                                </li>
                                                <li class="header_upload"><a href="resources/images/sub/upload.html"><span>UPLOAD</span><i class="xi-cloud-upload-o"></i></a></li>
                                            </ul>
                                    </div>
        
        
        
        
        
        
                                </li>
                                <li class="searchbox">
                                    <div class="searchbox_container">
                                        <span class="icon"><a href="#" alt="검색"><i class="xi-search"></i></a></span>
                                        <input type="search" id="search" placeholder="" />
                                    </div>
                                </li>
                                <li>
                                    <button id="sitemap_btn">
                                            <span></span><span></span><span></span>
                                    </button>
                                </li>

                                <script>
                                    var e = document.getElementById('sitemap_btn');
                                    e.addEventListener('click', function() {
                                        if (this.className == 'on') this.classList.remove('on');
                                        else this.classList.add('on');
                                    });
                                </script>
                            </ul>
        
                            
                        </div><!-- .inwrap -->
        
        
        
                        <ul class="sub_navi_list"><!-- 서브네비 -->
                                <li><a href="../../../artpie/html/sub/gallery/all.html">전체작품</a></li>
                                <li><a href="../../../artpie/html/sub/gallery/1.html">편집디자인</a></li>
                                <li><a href="../../../artpie/html/sub/gallery/2.html">일러스트레이션</a></li>
                                <li><a href="../../../artpie/html/sub/gallery/3.html">포토그래피</a></li>
                                <li><a href="../../../artpie/html/sub/gallery/4.html">타이포그래피</a></li>
                                <li><a href="../../../artpie/html/sub/gallery/5.html">산업디자인</a></li>
                                <li><a href="../../../artpie/html/sub/gallery/6.html">UI/UX</a></li>
        
        
        
        
                            <select name="list_select" class="list_select"><!-- 최신순 정렬 -->
                                <option value="최신순" selected="selected">최신순</option>
                                <option value="추천순">추천순</option>
                                <option value="조회순">조회순</option>
                                <option value="댓글순">댓글순</option>
                            </select>
        
        
        
                                <!-- ★★★셀렉트박스X 디자인은 되는데 선택은 안되는거...★★★ -->
                               <!-- <div class="list_select">  --><!-- 서브네비 우측 리스트 -->
                                <!--    <ul>
                                        <li><a href="#" id="current">최신순&nbsp;&nbsp;&nbsp;&nbsp;<span>▼</span></a>
                                            <ul>
                                                <li><a href="#">최신순</a></li>
                                                <li><a href="#">추천순</a></li>
                                                <li><a href="#">조회순</a></li>
                                                <li><a href="#">댓글순</a></li>
                                            </ul>
                                        </li>--> <!-- #current -->
                                    <!-- </ul>
                                </div> --><!-- .list_select 서브네비 우측 리스트 -->
                    
        
        
                        </ul><!-- .sub_navi_list -->

                </nav>
        </header>
	</div>

	<div>
		<h2><b>이미지 미리보기</b></h2>
		<p class="title">다중 이미지 업로드</p>
			<input type="file" id="input_imgs" name="input_imgs" style="display: none;" multiple />
			<input type="button" onclick="goImage();"/>
			<input type="button" onclick="gotext();"/>
			<input type="button" value="전송하기" onClick="fileSubmit();" />
		<form id="uploadForm" style="display: none;"></form>
	</div>
	<div>
		<div class="imgs_wrap">
		<div class="text_wrap">
		</div>
		</div>
		
	</div>
</body>
</html>