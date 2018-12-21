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
	/* .upload_right_cont_enter{
			width: 600px;
			margin-top: 50px;
	}
	
	.upload_right_cont_enter img{
		max-width: 200px;
	} */
</style>
<link rel="stylesheet" type="text/css" href="../resources/css/main_style.css">
<link rel="stylesheet" type="text/css" href="../resources/css/sub/upload_style.css"> 
<link rel="stylesheet" type="text/css" href="../resources/css/header_footer_style.css">
<link rel="stylesheet" href="http://cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
<link href="../resources/css/sub/upload_jquery.multiselect.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../resources/js/upload.jquery.multiselect.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js" charset="utf-8"></script>
<script type="text/javascript">
	var sel_files = [];
	var sel_file = [];
	var index = 0;
	var index2 = 0;
	
	$(document).ready(function() {
		
		alert("아 나가자 동해바다로");
		
		$("#input_imgs").on("change", handleImgsFilesSelect);
	});
	
	function handleImgsFilesSelect(e){
		alert("들어가자 !!!!");
		
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
                $(".upload_right_cont_enter").append(html);
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
		var form = $('#uploadForm')[0];
		alert("폼의 값은hh?" + form.toString);
		var forme = $('#uploadCoverForm')[0];
		alert("폼e의 값은?" + forme.toString);
		//var title = $('#upload_title').val();
		var title = document.getElementById("upload_title").value;
		alert(title);
		alert("안녕???" + form);
		var formData = new FormData(form + forme);
		
		for (var index1 = 0; index1 < Object.keys(sel_files).length; index1++){
			//alert("data : " + data);
			//alert("호호11 : " + sel_files.length);
			alert("배열값을 보자 : " + sel_files);
			//alert("앆!!! : " + formData);
			//var name = "image_"+i;
			formData.append('files', sel_files[index1]);
			//alert("data22 : " + sel_files[index1]);
			//alert("data : " + data);
		}
		for (var hi = 0; hi < Object.keys(sel_file).length; hi++){
			formData.append('cover', sel_file[hi]);	
		}
		
		alert("안녕 디지몬 : " + sel_file);
		alert("안녕 디지몬 길이 : " + sel_file.length);
		formData.append('title', title);
		alert("formData 사이즈 :" +  formData.size);
		alert("formData 랭쓰 :" +  formData.length);

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
		/* var textHi = "<input type='text'/>"+ "<br>" + "<br>"; */
		var textHi = "<div class='upload_txt_upload'>"
					+"<ul>"
					+"<li>"
					+"<img src='../resources/images/txt_1.png' alt='굵게'>"
					+"</li>"
					
					+"<li>"
					+"<img src='../resources/images/txt_2.png' alt='기울기'>"
					+"</li>"
					
					+"<li>"
					+"<img src='../resources/images/txt_3.png' alt='밑줄'>"
					+"</li>"
					
					+"<li>"
					+"<img src='../resources/images/txt_4.png' alt='왼쪽정렬'>"
					+"</li>"
					
					+"<li>"
					+"<img src='../resources/images/txt_5.png' alt='가운데정렬'>"
					+"</li>"
					
					+"<li>"
					+"<img src='../resources/images/txt_6.png' alt='오른쪽정렬'>"
					+"</li>"
					
					+"<li>"
					+"<img src='../resources/images/txt_7.png' alt='취소선'>"
					+"</li>"
					
					+"<ul>"
					+"<textarea onkeyup='autoTextarea(this,100);' row='100%' cols='auto' style='resize: none;'></textarea>"
					+"</div>"
		
		$(".upload_right_cont_enter").append(textHi);
	}
	
	
	//여기서 부터는 커버
	
	/* <script type="text/javascript"> */
	
	function gocover(){
		$("#input_cover").trigger("click");
		//여기까지는 감
	}
	
	$(document).ready(function(){
		alert("000000000000000");
		$("#input_cover").on("change",handlecoverimgSelect);
	});
	
	function handlecoverimgSelect(e){
		sel_file = [];
		$(".cover_after").empty();
		var file = e.target.files;
		
		var fileArr = Array.prototype.slice.call(file);
		fileArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file.push(f);
		var reader1 = new FileReader();
		reader1.onload = function(e){
			var html2 = "<a href=\"javascript:void(0);\" onclick=\"deletecoverImageAction("+index2+")\" id=\"img_id_cover"+index2+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove("+index2+")'></a>";
			$(".cover_after").append(html2);
			index2++;
		}
		reader1.readAsDataURL(f);
		});
		if(sel_file != null){
			$(".cover_before").hide();
		}
	}
	
	function deletecoverImageAction(index2){
		sel_file.splice(index2, 1);
		sel_file = [];
		if(sel_file.length == 0){
			$(".cover_after").empty();
		}
	
		$(".cover_before").show();
		
		var img_id_cover = "#img_id_cover" + index2;
		$(img_id_cover).remove();
	}
	
</script>
</head>
<body>
	<div id="wrap">
		<header id="header"><!-- 헤더 -->
                <nav>     

                        <div class="inwrap">
                            <div id="logo"><a href="../html/main.html"><img src="../resources/images/logo.png" alt="로고"></a></div><!-- 로고 -->
        
        
                            <ul class="main_navi_list"><!-- 메인네비 -->
                                <li><a href="../html/sub/gallery/all.html">GALLERY</a></li>
                                <li><a href="../html/sub/feed.html">FEED</a></li>
                                <li><a href="../html/sub/support/2.html">SUPPORT</a></li>
                                <li><a href="/ShotPlace/sub/upload">MARCKET</a></li>
                                <li><a href="#">MAGAZINE</a></li>
                            </ul>
        
                            <ul class="main_navi_right"><!-- 로그인 회원가입 -->
                                <li>
                                    <ul class="logout" style="display:block;">
                                        <li><a href="/ShotPlace/users/login">LOGIN</a></li>
                                        <li><a href="/ShotPlace/users/signUp">JOIN US</a></li>
                                    </ul>
        
        
                                    <ul class="login">
                                                <li><a href="../html/mypage/alarm.html"><img src="../resources/images/alarm_gr.png" alt="알람"></a><div class="main_alarm"></div></li>
                                                <!--<li class="main_profile"><a href="../html/mypage/profile.html" class="main_profile_photo"><img src="../img/user_profile.png"></a>-->
                                                <li class="main_profile_photo">
													<img src="../resources/images/img_sample.jpg">

                                                    <ul id="menu">
                                                        <li>
                                                            
                                                            <ul>
                                                                <li><a href="../html/mypage/profile.html">마이페이지</a></li>
                                                                <li><a href="../html/mypage/account.html">회원정보수정</a></li>
                                                                <li><a href="../html/mypage/breakdown.html">서포트 내역</a></li>
                                                                <li><a href="#">로그아웃</a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
													<a href="../html/mypage/profile.html" ></a>
                                                </li>
                                                    <!--<ul>
                                                        <li><a href="../html/mypage/profile.html">마이페이지</a></li>
                                                        <li><a href="../html/mypage/account.html">회원정보수정</a></li>
                                                        <li><a href="../html/mypage/breakdown.html">서포트 내역</a></li>
                                                        <li><a href="#">로그아웃</a></li>
                                                    </ul>-->
                                                
                                                <li class="header_upload"><a href="../ShotPlace/sub/upload"><span>UPLOAD</span><i class="xi-cloud-upload-o"></i></a></li>
                                    </ul>
                                </li>
                                
                                <li class="searchbox">
                                    <div class="searchbox_container">
                                        <span class="icon"><a href="../html/sub/search.html" alt="검색"><i class="xi-search"></i></a></span>
                                        <input type="search" id="search" placeholder="" />
                                    </div>
                                </li>
                                <li class="sitemap">
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
                </nav>
        </header>
        
        <section id="section">
        	<div class="inwrap">
        		<ul class="upload_left">
        			<li> <!--카테고리-->
                        <select name="basic[]" multiple="multiple" class="2col active">
                                <option value="편집디자인">편집디자인</option>
                                <option value="일러스트레이션">일러스트레이션</option>
                                <option value="포토그래피">포토그래피</option>
                                <option value="타이포그래피">타이포그래피</option>
                                <option value="산업디자인">산업디자인</option>
                        </select>
                        
                        <script>
                            $(function () {
                                $('select[multiple].active.2col').multiselect({
                                    columns: 1,
                                    placeholder: '카테고리 선택 (최대 2개)',
                                    search: false,
                                    selectAll: false
                                });
                        
                            });
                        </script>
                    </li>
                    
                    <li><!--CCL-->
                        <select class="upload_ccl_select">
                            <option value="CCL 표시 안함">CCL 표시 안함</option>
                            <option value="저작자">저작자</option>
                            <option value="저작자/비영리">저작자/비영리</option>
                            <option value="저작자/변경금지">저작자/변경금지</option>
                            <option value="저작자/동일조건변경허락">저작자/동일조건변경허락</option>
                            <option value="저작자/비영리/동일조건변경허락">저작자/비영리/동일조건변경허락</option>
                            <option value="저작자/비영리/변경금지" selected="selected">저작자/비영리/변경금지</option>
                        </select>
                    </li>
                    
                    <li><!-- 태그 -->
                        <ul>
                            <li>태그태그1<span class="upload_tag_clear"><i class="xi-close-min"></i></span></li>
                            <li>태그2<span class="upload_tag_clear"><i class="xi-close-min"></i></span></li>
                            <li>태그3<span class="upload_tag_clear"><i class="xi-close-min"></i></span></li>
                            <li>태그태그4<span class="upload_tag_clear"><i class="xi-close-min"></i></span></li>
                            <li>태그5<span class="upload_tag_clear"><i class="xi-close-min"></i></span></li>
                            <li>태그태그태그6<span class="upload_tag_clear"><i class="xi-close-min"></i></span></li>
                        </ul>
                        <input type="text" name="upload_tag" maxlength="100" value="태그입력 (tab, Enter로 구분)" onfocus="this.value=''">
                    </li>
                    
                    <li><!-- 커버업로드 -->
                        <div class="cover_before" onclick="gocover();" ><!-- <a href="#"> --><p><span>커버업로드</span></p><!-- </a> --></div>
                        <input type="file" id="input_cover" name="input_cover" style="display: none;" enctype="multipart/form-data"/>
                        <!-- <div class="cover_after" style="display:none;"><img src="../resources/images/img_sample.jpg"></div> -->
                        <form id="uploadCoverForm" style="display: none;"></form>
                        <div class="cover_after">
                    	<!-- 커버 이미지 쌓이는 공간 -->
                    	
                    	</div>
                    </li>
                    

                    <li><!--공개여부-->
                        <div>
                            <div class="upload_private_title">공개여부</div>
                            <ul class="upload_private_select">
                                <li><input type="radio" name="ra_info" value="공개"><span>공개</span></li>
                                <li><input type="radio" name="ra_info" value="비공개"><span style="padding-right:0;">비공개</span></li>
                            </ul>
                        </div>
                    </li>
        		
        		</ul><!--.upload_left-->
        		
        		<div class="upload_right">
        			<div class="upload_right_title"><!-- 제목 -->
              			<input type="text" name="upload_title" id="upload_title" maxlength="100" value="제목을 입력해주세요." onfocus="this.value=''">
                    </div><!-- .upload_right_title -->
                    
                    <div class="upload_right_cont"><!-- 내용 -->
                    	<div class="upload_right_cont_enter">
                    	<!-- 이미지, 글 쌓이는 공간 -->
                    	
                    	</div>
						<div class="upload_right_cont_btn"><!-- 입력전 -->
							<input type="file" id="input_imgs" name="input_imgs" style="display: none;" multiple />
							<p class="upload_img_btn" onclick="goImage();"><i class="xi-library-image-o xi-2x"></i></p>
							<p class="upload_txt_btn" onclick="gotext();"><i class="xi-pen-o xi-2x"></i></p>
						</div><!-- .upload_right_cont_btn -->                
                    </div><!-- .upload_right_cont -->
                    <div class="upload_right_btn" onClick="fileSubmit();"><!-- 업로드 버튼 -->
                    	업로드
                    </div><!-- .upload_right_btn -->
                    <form id="uploadForm" style="display: none;"></form>
        		</div><!--.upload_right-->
        	</div>
        </section>
	<!-- <div>
		<h2><b>이미지 미리보기</b></h2>
		<p class="title">다중 이미지 업로드</p>
			<input type="file" id="input_imgs" name="input_imgs" style="display: none;" multiple />위로 올려야한다
			<input type="button" onclick="goImage();"/>나중에 삭제해도 됨
			<input type="button" onclick="gotext();"/>나중에 삭제해도 됨
			<input type="button" value="전송하기" onClick="fileSubmit();" /> 나중에 삭제해도 됨
		<form id="uploadForm" style="display: none;"></form> 나중에 삭제해도 됨
	</div> -->
	
		<footer id="footer">
            
                <ul>
                    <li><a href="./" alt="ABOUT US">ABOUT US</a></li>
                    <li><a href="./" alt="NOTICE">NOTICE</a></li>
                    <li><a href="./" alt="FAQ">FAQ</a></li>
                    <li><a href="./" alt="CONTACT US">CONTACT US</a></li>
                    <li><a href="./" alt="이용약관">이용약관</a></li>
                    <li><a href="./" alt="개인정보취급방침">개인정보취급방침</a></li>
                    <li><a href="#" alt="인스타그램"><i class="xi-instagram"></i></a></li>
                    <li><a href="#" alt="블로그"><i class="xi-blogger"></i></a></li>
                </ul>
    
        </footer>
	</div>
</body>
</html>