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
	var cate = '' ; // 카테고리
	var ranknum =0; // 이미지, 글 작성 번호
	var typenum = 0; // 이미지, 글 타입
	var index = 0;  //이미지에 들어갈 ID
	var index2 = 0; // 커버 이미지에 들어갈 ID
	var index3 = 0; // 글 쓰기 ID
	var tagnum1 = 0; //태그 삭제할때 추가ID
	var cclstring = 0; //ccl 값이 저장될 변수 0 ccl표시안함 , 1 저작자, 2 ../비영리, 3 ../변경금지, 등등 
	
	
	
	$(document).ready(function() {
		
		
		$("#input_imgs").on("change", handleImgsFilesSelect);
	});
	
	function handleImgsFilesSelect(e){
		// 이미지 선택시 추가 함수
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		var reader;
		   filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
			}else{
				
				reader = new FileReader();
				reader.onload = function(e){
					alert("빨리오셈");
					var image = new Image();
					image.src = reader.result;
					image.onload = function(){
						alert("이미지 위드쓰 : "+image.width+ ", 이미지 헤이트 : "+ image.height);
						if(image.width >= 600 && image.height >= 600){
							var html = 		/*  "<a href=\"javascript:void(0);\"id=\"img_id_"+index+"\">"
											+"<img src=\""+ e.target.result + "\" data-file='"+f.name+"'"
											+"class='selProductFile' title='Click to remove("+index+")'>"
											+"<div id='upload_img_clear' onclick=\"deleteImageAction("+index+")\">"
											+"<i class='xi-close'></i>"
											+"</div><br></a>"; 
											 */
											
											
											"<div class='upload_img_upload' id=\"img_id_"+index+"\">"
											+"<img src=\""+ e.target.result +"\" data-file='"+f.name+"'>"
											+"<div id='upload_img_clear' title='Click to remove' onclick=\"deleteImageAction("+index+")\">"
											+"<i class='xi-close'>"
											+"</i></div>"
											+"</div>";
											
											
											
											
											/* "<a href=\"javascript:void(0);\"
											+ "id=\"img_id_"+index+"\">"
											+"<img src=\"" + e.target.result + "\" data-file='"+f.name+"' "+
											"class='selProductFile' title='Click to remove("+index+")' >"+
											"<div id='upload_img_clear' onclick=\"deleteImageAction("+index+")\"></div></a>" */
											
											
										
			                $(".upload_right_cont_enter").append(html);
			                
							index++;
							rank.push(f);
						}else{
							alert("600픽셀 이상 이미지를 넣어주세요");
						}
						
					};
					
				}
				reader.readAsDataURL(f);
				
			}
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
					visib = "F";
					what ++;
				}
				else if(food_value == "비공개"){
					alert("여기는 비공개!!!: " + food_value);
					visib = "T";
					what ++;
					 
				}
				alert("여기는 옵니다 공개여부!!");
			}
		}
		 if(what < 1){
			 
			 alert("공개여부를 선택하여 주세요.");
				return false;
		 }
		//공개여부 여기까지
		
		var chk = document.getElementsByName("cate");
		var catelength = chk.length;
		var checkRow = '';
		var checkCnt = 0;
		var catenum=0;
		var checkLast ='';
		var rowid = '';
		var cnt = 0;
		alert("캌퉤 랭쓰 : "+ catelength);
			for(var i = 0; i < catelength; i++){
				if(chk[i].checked == true){
					checkCnt++;
					checkLast = i;
			
				}
			}
			
			for(var i = 0; i < catelength; i++){
				if(chk[i].checked == true){
					checkRow = chk[i].value;
					
					if(checkCnt == 1){
						rowid += checkRow+",0"; // 1개만 선택했을경우
					}else{
						if(i == checkLast){
							rowid += checkRow; // 마지막 선택일 경우
						}else{
							rowid += checkRow+","; //첫번째 선택	
						}
					}
					cnt++;
					checkRow = '';
				}
			}
			
			if(rowid == ''){
				alert("카테고리를 선택하여 주세요");
				return false;
			}
		
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
		
		if(title == ""){
			alert("제목을 입력해 주세요.");
			return false;
		}
		

		var formData = new FormData(form);
		
		formData.append('catego', rowid);
		
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
		/* document.write("title : " + typeof title + "<br>" +
						"visib : " + typeof visib + "<br>" + 
						"ccl : " + typeof cclstring + "<br>" +
						"txt : " + typeof sel_txt + "<br>" ); */
		
		$.ajax({
            type : 'post',
            enctype : 'multipart/form-data',
            url : 'fileUpload',
            dataType : 'JSON',
            data : formData,
            processData : false,
            contentType : false,
            success : function(html) {
            	/* if(html == -1){
            		alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
            	}else if(html == -2){
            		alert('파일이 10MB를 초과하였습니다.')
            	}else{
            		alert("파일 업로드하였습니다.");
            	} */
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
		var reader1 = new FileReader();
		var fileArr = Array.prototype.slice.call(file);
		fileArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
		}
		
		else{
			sel_file.push(f);
			
			reader1.onload = function(e){
				var html2 = "<a href=\"javascript:void(0);\" onclick=\"deletecoverImageAction("+index2+")\" id=\"img_id_cover"+index2+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove("+index2+")'></a>";
				$(".cover_after").append(html2);
				index2++;
			}
			reader1.readAsDataURL(f);
		}
		
		
		});
		if(sel_file.length != 0){
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
		if (tag.trim() == ''){
			alert("어머나 이러지마세요");
			return false;
		}else{
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
			tagnum1++;
			//alert("hihi");
		}
		
		
		document.getElementById("upload_tag").value = '';
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
                        <dl class="dropdown_category">
                          <dt><a href="#" style="padding-top:4px;"><option id="person" value="2">카테고리 선택 (최대 2개)</option></a></dt>
                          <dd>
                            <ul class="dropdown2_category">
                              <li><label><input type="checkbox" name="cate" value="1"/>편집디자인</label></li>
                              <li><label><input type="checkbox" name="cate" value="2"/>일러스트레이션</label></li>
                              <li><label><input type="checkbox" name="cate" value="3"/>포토그래피</label></li>
                              <li><label><input type="checkbox" name="cate" value="4"/>타이포그래피</label></li>
                              <li><label><input type="checkbox" name="cate" value="5"/>산업디자인</label></li>
                              <li><label><input type="checkbox" name="cate" value="6"/>UI/UX</label></li>
                            </ul>
                          </dd>
                        </dl>
                        

                        <script>
                            // html 이 다 로딩된 후 실행
                            $(document).ready(function() {
                                // 체크박스들이 변경됬을때
                                $(":checkbox").change(function() {
                                    var cnt = $("#person").val();
                                    var check = document.getElementById("cate");
                                    // 셀렉트박스의 값과 체크박스중 체크된 갯수가 같을때, 다른 체크박스들을 disable 처리
                                    if( cnt==$(":checkbox:checked").length ) {
                                        $(":checkbox:not(:checked)").attr("disabled", "disabled");
                                    }
                                    // 체크된 갯수가 다르면 활성화 시킴
                                    else {
                                        $(":checkbox").removeAttr("disabled");
                                    }
                                });

                            });
                        </script>

                        <script>/*카테고리 셀렉트박스 스크립트*/
                                $(".dropdown_category img.flag").addClass("flagvisibility");

                                $(".dropdown_category dt a").click(function() {
                                $(".dropdown_category dd ul").toggle();
                                });

                                $(".dropdown_category dd ul li a").click(function() {
                                var text = $(this).html();
                                $(".dropdown_category dt a span").html(text);

                                /* $("#result").html("Selected value is: " + getSelectedValue("sample"));*/
                                });

                                function getSelectedValue(id) {
                                return $("#" + id).find("dt a span.value").html();
                                }

                                $(document).bind('click', function(e) {
                                var $clicked = $(e.target);
                                if (!$clicked.parents().hasClass("dropdown_category"))
                                    $(".dropdown_category dd ul").hide();
                                });


                                // 체크 되어 있는 값 추출
                                $("#person").click(function() {
                                $("input[name=box]:checked").each(function() {
                                    var test = $(this).val();
                                    alert("#@#@!#@!#@! : "+ test);
                                });
                                });

                        </script>

                    </li>
                    
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
                        <input type="file" accept=".gif, .jpg, .png, .GIF, .JPG, .PNG" id="input_cover" name="input_cover" style="display: none;" enctype="multipart/form-data"/>
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
	              			<input type="text" name="upload_title" id="upload_title" maxlength="100" placeholder="제목을 입력해주세요." onfocus="this.value=''">
	                    </div><!-- .upload_right_title -->
	                    
	                    <div class="upload_right_cont"><!-- 내용 -->
	                    	<div class="upload_right_cont_enter">
	                    	<!-- 이미지, 글 쌓이는 공간 -->
	                    	
	                    	</div>
							<div class="upload_right_cont_btn"><!-- 입력전 -->
								<input type="file" id="input_imgs" name="input_imgs" accept=".gif, .jpg, .png, .GIF, .JPG, .PNG" style="display: none;" multiple />
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