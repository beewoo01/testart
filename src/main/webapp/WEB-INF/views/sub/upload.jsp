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
<!-- <link rel="stylesheet" type="text/css" href="../resources/css/main_style.css"> -->
<link rel="stylesheet" type="text/css" href="../resources/css/sub/upload_style.css"> 
<link rel="stylesheet" type="text/css" href="../resources/css/header_footer_style.css">
<link rel="stylesheet" href="http://cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
<link href="../resources/css/sub/upload_jquery.multiselect.css" rel="stylesheet" />

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../resources/js/upload.jquery.multiselect.js"></script>
<script type="text/javascript">
	var sel_files = []; //이미지에 쓰이는 배열
	var sel_file = [];  //커버 이미지에 쓰이는 배열
	var sel_tag = [];   // 태그 배열
	var sel_txt = []; //글 배열
	var rank = []; // 이미지, 글작성 순서 배열
	var typeq = []; // type 배열
	var ranknum =0; // 이미지, 글 작성 번호
	var typenum = 0; // 이미지, 글 타입
	var index = 0;  //이미지에 들어갈 ID
	var index2 = 0; // 커버 이미지에 들어갈 ID
	var index3 = 0; // 글 쓰기 ID
	var tagnum1 = 0;//태그 삭제할때 추가ID
	var cclstring; //ccl 값이 저장될 변수
	
	
	$(document).ready(function() {
		
		
		$("#input_imgs").on("change", handleImgsFilesSelect);
	});
	
	function handleImgsFilesSelect(e){
		// 이미지 선택시 추가 함수
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		
		   filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			rank.push(f);
			sel_files.push(f);
			alert("f는 뭐니? : "+ f);
			
			
			
			var reader = new FileReader();
			reader.onload = function(e){
				
				var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove("+index+")'></a>"+
							"<br>"+"<br>"+"<br>"
                $(".upload_right_cont_enter").append(html);
				//alert("파일 번호 : " + index );
				index++;
				
			}
			reader.readAsDataURL(f);
			//alert("전체 길이: " + sel_files.length);
		});
	}
	
	
	function deleteImageAction(index) {
		//이미지 삭제 함수
		
		//sel_files.splice(index, 1);
		rank.splice(index, 1,"#")
        var img_id = "#img_id_"+index;
        $(img_id).remove();
    }
	
	function fileSubmit(){
		//파일전송!
		
		var form = $('#uploadForm')[0];
		
		//공개여부 부분
		var foods = document.getElementsByName('ra_info');
		var food_value;
		var visib;
		var what = 0;
		 for(var i = 0; i<foods.length; i++){
			alert("i 는 무었인가 : " + i);
			
			if(foods[i].checked){
				food_value = foods[i].value;
				if(food_value == "공개"){
					alert("여기는 공개 : " + food_value);
					visib = false;
					what ++;
				}
				else if(food_value == "비공개"){
					alert("여기는 비공개!!!: " + food_value);
					visib = true;
					what ++;
					 
				}
				alert("여기는 옵니다 공개여부!!");
			}
		}
		 if(what < 1){
			 
			 alert("이게 뭐야 이게 선택을 안했어?!!!: " + food_value);
				return false;
		 }
		//공개여부 여기까지
		
		
		
		
		//글작성이랑 이미지 한꺼번에 처리
		
		//글작성
		/* for(var i=0; i < index3; i++){//index3
			//var txta = document.getElementById("txtarea"+[i]).value;
			var txta = document.getElementById("txtarea"+[i]);
			alert("if로 가자 : " + txta);
			if(txta != null && txta.value.trim() != ""){
				sel_txt.push(txta.value);
			}else{
				alert("글 작성 마저해요");
				return false;
			}
			alert("sel_txt: "+ sel_txt[i]);
			
		}
		for(var i=0; i < sel_txt.length; i++){
			alert("sel_txt "+i+i+i+i+i+i+i+ "번째: " + sel_txt[i]);
			
		} */
		
		
		
		//글작성 여기까지
		
		//CCL 가져오기
		alert("ccl: " + cclstring);
		//dropdown2_ccl
		var title = document.getElementById("upload_title").value;
		alert("CCL 값은 무엇이니? : "+ cclstring);
		alert(title);
		alert("안녕???" + form);
		var formData = new FormData(form);
		alert("formData: "+formData);
		
		for (var index1 = 0; index1 < Object.keys(sel_files).length; index1++){
			//업로드 이미지 formData에 값 넣기
			formData.append('files', sel_files[index1]);
		}
		
		
		//추가추가추가추가추가추가추가추가추가추가추가추가추가추가추가추가추가추가
		for (var i = 0; i < Object.keys(rank).length; i++){
			if(rank[i] == "#"){
				//alert("!!: "+rank[i]+" : " +typeof rank[i]);
				rank.splice(i, 1);
				//alert("!!: "+rank[i]+" : " +typeof rank[i]);
			}
			if(typeof rank[i] ==='object'){
				//alert("object 아님!!!");
			}else{
				if(i < 10){
					rank.splice(i, 1, rank[i]+"0"+i);
				}else{
					rank.splice(i, 1, rank[i]+i);
				}
				
			}
			
			//rank[i].append(i);
			
			
			
			formData.append('upload', rank[i]);
		}
		//추가추가추가추가추가추가추가추가추가추가추가추가추가추가추가추가추가추가
		
		
		for (var hi = 0; hi < Object.keys(sel_file).length; hi++){
			//커버 이미지 formData에 값 넣기
			formData.append('cover', sel_file[hi]);	//커버 이미지
		}
		for (var ti = 0; ti < sel_tag.length; ti++){
			//태그 전달
			if(sel_tag[ti] == "#"){
				// #으로 된 배열값 제거 
				sel_tag.splice(ti, 1);
			}else{
				// formData 에 값 넣기
				formData.append('tag', sel_tag[ti]);//태그
				// tag 넘겼으니 받아야함
			}
		}
		// 작성한 글 배열에 추가
		for (var i=0; i < sel_txt.length; i++){
			formData.append('txt', sel_txt[i]);	//글작성
		}
		
		formData.append('visib', visib);//공개여부
		formData.append('title', title);//제목
		formData.append('ccl',cclstring);//ccl
		
		
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
	
	$(document).ready(function() {

		  $('#dropdown2_cclid li').click(function() {
		    alert($(this).attr('data-val'));
		    cclstring = $(this).attr('data-val');
		    alert("ccl: " + cclstring);
		  });
		});
	
	function goImage(){
		$("#input_imgs").trigger("click");
	}
	function gotext(){
		
		var textHi = "<div class='upload_txt_upload' id='deletxt"+index+"'>" //index3
					+"<ul>"
					+"<li>"
					+"<i class='xi-bold'>"
					+"</i>"
					+"</li>"
					
					+"<li>"
					+"<i class='xi-italic'>"
					+"</i>"
					+"</li>"
					
					+"<li>"
					+"<i class='xi-underline'>"
					+"</i>"
					+"</li>"
					
					+"<li>"
					+"<i class='xi-align-left'>"
					+"</i>"
					+"</li>"
					
					+"<li>"
					+"<i class='xi-align-center'>"
					+"</i>"
					+"</li>"
					
					+"<li>"
					+"<i class='xi-align-right'>"
					+"</i>"
					+"</li>"
					
					+"<li>"
					+"<i class='xi-strikethrough'>"
					//+"<img src='../resources/images/txt_7.png' alt='취소선'>"
					+"</i>"
					+"</li>"
					
					+"</ul>"
					+"<textarea id='txtarea"+index+"' onchange='savetxt(this,"+index+")' onkeyup='autoTextarea(this,100);' row='100%' cols='auto' style='resize: none;'></textarea>" //index3
					+"<div id='upload_txt_clear' onclick='deltxt("+index+")'><i class='xi-close'>" //삭제버튼  //index3
					+"</i>"
					+"</div>"
					+"</div>"
		
		$(".upload_right_cont_enter").append(textHi);
		rank.push("#");
		index++;
		
	}
	function savetxt(obj, index){
		
		//글작성
			//var txta = document.getElementById("txtarea"+[i]).value;
			var txta = document.getElementById("txtarea"+index);
			//alert("if로 가자 : " + txta);
			if(txta != null && txta.value.trim() != ""){
				//sel_txt.push(txta.value);
				//rank.push(txta.value);
				rank.splice(index, 1,txta.value);
			}else{
				alert("글 작성 마저해요");
				return false;
			}
			/* alert("rank: "+ rank[index]);
			alert("rank: "+ rank.length); */
			
	}
	
	
	
	function deltxt(index){//index3
		
		//sel_files.splice(index, 1);
        var write_id = "#deletxt"+index; //index3
        sel_txt.splice(index, 1,"#");
        rank.splice(index, 1, "#");
        $(write_id).remove();
        alert("글 삭제 됨??");
	}
	
	function autoTextarea(obj,limit){
		//alert("여기와?? 텍스트에어리아");
		obj.style.height = "1px";
		if(limit >= obj.scrollHeight){
			obj.style.height = (20+obj.scrollHeight)+"px";
		}else{
			obj.style.height = (20+limit)+"px";
		}
	}
	
	//여기서 부터는 커버
	
	function gocover(){
		$("#input_cover").trigger("click");
		//여기까지는 감
	}
	
	$(document).ready(function(){
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
	
	
	
	/* 태그부분 */
	function tagEnter(){
		//엔터, 스페이스바, 탭 을 누를시 함수 시작됨
		var tag = document.getElementById("upload_tag").value;
		if (tag == ''){
			alert("어머나 이러지마세요");
			return false;
		}
		
		var tagnum =  		
					"<li id='tagli"+tagnum1+"'>"
					+ "#" + tag
					+ "<span id='deldeltag"+tagnum1+"'class='upload_tag_clear'>"
					+ "<i class='xi-close-min' id='tagi"+tagnum1+"' onclick='deltag("+tagnum1+")'>"
					+ "</i>"
					+ "</span>"
					+ "</li>";
					
		$(".putTag").append(tagnum);
		sel_tag.push(tag);
		alert("추가된 sel_tag : " + sel_tag);
		alert("추가한 tagnum1 : " + tagnum1);
		tagnum1++;
	}
	
	function deltag(tagnum1){
		//태그 배열에 쌓인 목록 삭제
		alert("받아온 tagnum1 : " + tagnum1);
		sel_tag.splice(tagnum1, 1,"#"); //삭제시 해당 배열위치에 #으로 대체
		alert("삭제후 sel_tag : " + sel_tag);
		//태그 화면에서 삭제
		var tagdel = "#tagli" + tagnum1;
		var tagdel2 = "#tagi" + tagnum1;
		var tagdel3 = "#deldeltag" + tagnum1;
		$('li').remove(tagdel);
		$('span').remove(tagdel3);
		$('i').remove(tagdel2);
		
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
        <form id="uploadForm" >
        <section id="section">
        	<div class="inwrap">
        		<ul class="upload_left">
        			<li> <!--카테고리-->
	                    <select id="selectId" onchange="chageLangSelect(this)" name="basic[]" multiple="multiple" class="2col active">
	                                <option value="편집디자인">편집디자인</option>
	                                <option value="일러스트레이션">일러스트레이션</option>
	                                <option value="포토그래피">포토그래피</option>
	                                <option value="타이포그래피">타이포그래피</option>
	                                <option value="산업디자인">산업디자인</option>
	                    </select>
	                 </li>
                        <script>/*카테고리 스크립트*/
                            $(function () {
                                $('select[multiple].active.2col').multiselect({
                                    columns: 1,
                                    placeholder: '카테고리 선택 (최대 2개)',
                                    search: false,
                                    selectAll: false
                                });
                        
                            });
                            
                             function chageLangSelect(obj){
                            	var langSelect = document.getElementById("selectId");
                            	$("#selectId option").not(":selected").attr("disabled",true);
                            	alert("기리기리보이: ")
                            	var val;
                            	var vae = 0;
                            		for(var i =0; i < langSelect.length; i++){
                            			
                                		if(langSelect.options[i].selected == true){
                                			val = langSelect.options[i].value;
                                			vae++;
                                			alert("기리기리보이: " + langSelect);
                                			if(vae >= 3){
                                				
                                				// $('#selectId option').attr('selected', false);
                                				// $('#selectId').children("[value='포토그래피']").remove();
                                				// $('#selectId option').attr('disabled', true);
                                				 //docment.test.select.basic[].disabled = true;
                                				 //$('#selectId option[value!=1]').remove();
                                				 alert(langSelect[i].type);
                                				 //$("select option[value*='편집디자인']").prop('disabled',true);
                                				 alert("오니33333? " + vae);
                                				
                                				//$('#selectId').attr('disabled', 'true');
                                				//alert($("#selectId option:selected").prevAll().size());
                                				//$(select).empty().data('options');
                                				//$("#selectId option:eq(0)").remove();
                                				//alert("여기여기보이: " + vae);
                                				//$("#selectId option:last").remove();
                                			}
                                			
                                		}
                                	}
                            } 
                        </script>
                    
                    <li class="selectbox_ccl"><!-- CCL -->
                        <dl class="dropdown_ccl" >
                          <dt><a href="#" style="padding-top:4px;"><span >CCL 표시 안함</span></a></dt>
                          <dd>
                            <ul class="dropdown2_ccl" id="dropdown2_cclid">
                              <li data-val="1"><a href="#">저작자</a></li>
                              <li data-val="2"><a href="#">저작자/비영리</a></li>
                              <li data-val="3"><a href="#">저작자/변경금지</a></li>
                              <li data-val="4"><a href="#">저작자/동일조건변경허락</a></li>
                              <li data-val="5"><a href="#">저작자/비영리/동일조건변경허락</a></li>
                              <li data-val="6"><a href="#">저작자/비영리/변경금지</a></li>
                            </ul>
                          </dd>
                        </dl>
                    </li>
                        <script>/*CCL 셀렉트박스 스크립트*/
                            $(".dropdown_ccl img.flag").addClass("flagvisibility");
        
                            $(".dropdown_ccl dt a").click(function() {
                            $(".dropdown_ccl dd ul").toggle();
                            });
        
                            $(".dropdown_ccl dd ul li a").click(function() {
                            var text = $(this).html();
                            $(".dropdown_ccl dt a span").html(text);
                            $(".dropdown_ccl dd ul").hide();
                            /* $("#result").html("Selected value is: " + getSelectedValue("sample"));*/
                            });
        
                            function getSelectedValue(id) {
                            return $("#" + id).find("dt a span.value").html();
                            }
        
                            $(document).bind('click', function(e) {
                            var $clicked = $(e.target);
                            if (!$clicked.parents().hasClass("dropdown_ccl"))
                                $(".dropdown_ccl dd ul").hide();
                            });
        
                        </script>
                    
                    <li class="upload_left_tag"><!-- 태그 -->
                        <ul>
                        	<div class="putTag">
                        	<!-- 입력한 tag가 쌓이는 공간 -->
	                            <!-- <li>태그태그1<span class="upload_tag_clear"><i class="xi-close-min"></i></span></li>
	                            <li>태그2<span class="upload_tag_clear"><i class="xi-close-min"></i></span></li>
	                            <li>태그3<span class="upload_tag_clear"><i class="xi-close-min"></i></span></li>
	                            <li>태그태그4<span class="upload_tag_clear"><i class="xi-close-min"></i></span></li>
	                            <li>태그5<span class="upload_tag_clear"><i class="xi-close-min"></i></span></li>
	                            <li>태그태그태그6<span class="upload_tag_clear"><i class="xi-close-min"></i></span></li> -->
                            </div>
                        </ul>
                        <input type="text" name="upload_tag" maxlength="100" value="태그입력 (tab, Enter로 구분)" onfocus="this.value=''"
                        	id = "upload_tag"onkeypress="if(event.keyCode==13 || event.keyCode ==32){tagEnter(); return}" onkeydown="if(event.keyCode==9){ tagEnter(this); return}"/>
                        	<!-- onkeyup="tagf(this);" 는  key를 눌럿다가 땟을때 발생하는 이벤트
                        			onkeypress =실제로 글자가 써질때 이벤트이다
                        			onchange="tagf(this);"
                        			onkeydown = 키가 밑으로 내려갔을때 발생하는 이벤트 , tab 을 사용하려면 이 이벤트를 써야 할듯.
                        	-->
                    </li>
                    
                    <li class="upload_left_cover"><!-- 커버업로드 -->
                        <div class="cover_before" onclick="gocover();" ><!-- <a href="#"> --><p><span>커버업로드</span></p><!-- </a> --></div>
                        <input type="file" id="input_cover" name="input_cover" style="display: none;" enctype="multipart/form-data"/>
                        <!-- <div class="cover_after" style="display:none;"><img src="../resources/images/img_sample.jpg"></div> -->
                        <!-- <form id="uploadCoverForm" style="display: none;"></form> -->
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
                                <!-- 테스트 하는중 -->
                            </ul>
                        </div>
                    </li>
                    
                    
        		
        		</ul><!--.upload_left-->
        		
        		<!-- 여기야 여기!!!!! -->
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
	                    
	        		</div><!--.upload_right-->
        		
        	</div> <!-- inward -->
        </section>
        </form>
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