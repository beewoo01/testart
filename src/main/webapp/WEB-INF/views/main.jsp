<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">

    <title>ARTPIE</title>

	<link rel="stylesheet" type="text/css" href="resources/css/header_footer_style.css"> 
    <link rel="stylesheet" type="text/css" href="resources/css/main_style.css"> 
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">

	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
    <script type="text/javascript">
    
    var bool_sw = true;
    var orderby = "time";
    
    $(document).ready(function(){
    	orderByTime();	
    });
    
    function orderByTime(){
		$.ajax({
    		url : "/",
    		type : "POST",
    		cache : false,
    		success : function(response){
    			
    			bool_sw = false;
    			var html = "";
    			html = getBoard(response);
    			
    			$("#boards").html(html);
    			setTimeout(function(){bool_sw = true;}, 500);
    		},
    		error : function(){
    			alert("실패");
    			}
    		});
	}
    
    function getBoard(response){
    	var html = "";
		for(var i=0; i<response.length; i++){
            html += "<li class='gallery' data-bno='"+response[i].board_no+"'><a href='/board?board_no="+response[i].board_no+"' alt='갤러리'>";
			html += "<div class='gallery_thumnail'><img src='../upload/"+response[i].cover_img+"' alt='썸네일'></div><!-- .gallery_thumnail -->";
            html += "<div class='gallery_title'><p>["+response[i].board_no+"]"+response[i].title+"</p></div><!-- .gallery_title -->";
            html += "<div class='gallery_profile'>";
            html += "<div class='gallery_profile_photo'><img src='../profile/"+response[i].profile_img+"'></div><!-- .gallery_profile_photo -->";
            html += "<div class='gallery_profile_username'><span>"+response[i].name+"</span></div><!-- .gallery_profile_username -->";
            html += "</div><!-- .gallery_profile -->";
            html += "<div class='gallery_footer'>";
            html += "<ul>";
            html += "<li><i class='xi-eye-o'></i><span>"+response[i].hits+"</span></li>";
            html += "<li><i class='xi-heart-o'></i><span>"+response[i].like_count+"</span></li>";
            html += "<li><i class='xi-forum-o'></i><span>"+response[i].reply_count+"</span></li>";
            html += "</ul>";
            html += "</div><!-- .gallery_footer -->";
            html += "</a></li><!-- .gallery -->";	
		}
		return html;
    }
    

    //무한 스크롤 인식
    $(window).scroll(function() {
    	if(bool_sw && orderby == "time"){
    		if($(window).scrollTop() >= $(document).height() - $(window).height()){
        		
        		bool_sw = false;
        		var board_no = $(".gallery:last").attr("data-bno") ;

        		$.ajax({
            		url : "/scroll",
            		type : "POST",
            		data : "board_no=" + board_no,
            		cache : false,
            		success : function(response){
            			
            			var html = "";
            			html = getBoard(response);
            			$("#boards").append(html);
            			//$(".gallery:last").after(html);
            			setTimeout(function(){bool_sw = true;}, 500);
    	
            		}
        		    /* ,
            		error : function(){
            			alert("222실패");
            			}*/
            		});
        	}

    	}
    });
    

    
    
    </script>
  </head>



  <body>
    <div id="wrap">

        <header id="header"><!-- 헤더 -->
                <nav>     

                        <div class="inwrap">
                            <div id="logo"><a href="../html/main.html"><img src="resources/images/logo.png" alt="로고"></a></div><!-- 로고 -->
        
        
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
                                                <li><a href="../html/mypage/alarm.html"><img src="resources/images/alarm_gr.png" alt="알람"></a><div class="main_alarm"></div></li>
                                                <!--<li class="main_profile"><a href="../html/mypage/profile.html" class="main_profile_photo"><img src="../img/user_profile.png"></a>-->
                                                <li class="main_profile_photo">
													<img src="resources/images/img_sample.jpg">

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
                                                
                                                <li class="header_upload"><a href="/ShotPlace/sub/upload"><span>UPLOAD</span><i class="xi-cloud-upload-o"></i></a></li>
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


        <!-- 스크립트까지가 탑버튼 -->
        <a id="MOVE_TOP_BTN" href="#"><i class="xi-caret-up-circle xi-3x"></i></a>
        <script>
            $(function() {
                $(window).scroll(function() {
                    if ($(this).scrollTop() > 500) {
                        $('#MOVE_TOP_BTN').fadeIn();
                    } else {
                        $('#MOVE_TOP_BTN').fadeOut();
                    }
                });
                
                $("#MOVE_TOP_BTN").click(function() {
                    $('html, body').animate({
                        scrollTop : 0
                    }, 400);
                    return false;
                });
            });
        </script><!-- 여기까지가 탑버튼 -->



        <section id="section01"><!-- 메인배너/서브네비 -->
            <ul class="sub_navi_list"><!-- 서브네비 -->
                <li><a href="../../../html/sub/gallery/all.html">전체작품</a></li>
                <li><a href="../html/sub/gallery/1.html">편집디자인</a></li>
                <li><a href="../html/sub/gallery/2.html">일러스트레이션</a></li>
                <li><a href="../html/sub/gallery/3.html">포토그래피</a></li>
                <li><a href="../html/sub/gallery/4.html">타이포그래피</a></li>
                <li><a href="../html/sub/gallery/5.html">산업디자인</a></li>
                <li><a href="../html/sub/gallery/6.html">UI/UX</a></li>




                <div class="selectbox"><!-- 최신순 정렬 -->
                    <dl class="dropdown">
                      <!-- <dt><a href="#" style="padding-top:4px;"><span>최신순</span></a></dt>-->
                      <dt><a style="padding-top:4px;"><span>최신순</span></a></dt>
                      <dd>
                        <ul class="dropdown2">
                          <li><a onclick="javascript:order('time')">최신순</a></li>
                          <li><a onclick="javascript:order('likes')">추천순</a></li>
                          <li><a onclick="javascript:order('hits')">조회순</a></li>
                          <li><a onclick="javascript:order('replies')">댓글순</a></li>
                        </ul>
                      </dd>
                    </dl>
                </div>


                <script>/*셀렉트박스 스크립트*/
                    $(".dropdown img.flag").addClass("flagvisibility");

                    $(".dropdown dt a").click(function() {
                    $(".dropdown dd ul").toggle();
                    });

                    $(".dropdown dd ul li a").click(function() {
                    var text = $(this).html();
                    $(".dropdown dt a span").html(text);
                    $(".dropdown dd ul").hide();
                    $("#result").html("Selected value is: " + getSelectedValue("sample"));
                    });

                    function getSelectedValue(id) {
                    return $("#" + id).find("dt a span.value").html();
                    }

                    $(document).bind('click', function(e) {
                    var $clicked = $(e.target);
                    if (!$clicked.parents().hasClass("dropdown"))
                        $(".dropdown dd ul").hide();
                    });
                    
                    	
                    function order(value){
 
                    	alert(orderby);
                    	if(orderby != value){
                    		
                        	alert('다름');
                        	orderby = value;
                        	alert(orderby);
                        	
                        	if(orderby == 'time'){
                        		$("#boards").empty();
                        		orderByTime();
                        		
                        	} else{
                        		
                        		$.ajax({                    	
                            		url : "/order",            	
                            		type : "GET",
                            		data : {"orderby":orderby},
                            		cache : false,
                            		success : function(response){
                            		bool_sw = false;
                            		var html = "";
                            		html = getBoard(response);
                            		$("#boards").empty();
                            		$("#boards").html(html);
                            		//bool_sw=false;
                            		setTimeout(function(){bool_sw = true;}, 500);
                            		}
                           		});
                        		
                        	}
                        	             
                        	
                    	} else{
                    		alert('그대로');
                    	}
                    	
       
                    }
                   

                </script>
    


        </ul><!-- .sub_navi_list -->
            <div id="s_banner_wrap"><!-- 메인 슬라이드배너 -->
                <ul class="bxslider">
                    <div style="width:100%; height:500px; background:navy"><img src="resources/images/img_sample.jpg"></div>
                    <div style="width:100%; height:500px; background:salmon"></div>
                    <div style="width:100%; height:500px; background:rebeccapurple"></div>
                </ul>
            </div>
              
            <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
            <script src="resources/js/jquery.bxslider.min.js"></script>
            <script>
            $(document).ready(function(){
              var slider = $('.bxslider').bxSlider({
                  auto: true, mode:'fade',
                });
                // 클릭시 멈춤 현상 해결 //
                $(document).on('click','.bx-next, .bx-prev,  #bx-pager1',function() {
                slider.stopAuto();
                slider.startAuto();
                slider_01.stopAuto();
                slider_01.startAuto();
                slider_02.stopAuto();
                slider_02.startAuto();
              });	
            });
            </script>

        </section><!-- #section01 메인배너 -->



        <section id="section02"><!-- 위클리베스트 -->
            <div class="inwrap">
                <h2>WEEKLY BEST</h2>

                <div class="square1">
                    <div class="content1">
                        <div class="content1_box1"><img src="resources/images/img_sample.jpg"></div>
                        <div class="content1_box2"><img src="resources/images/img_sample.jpg"></div>
                    </div>
                </div><!-- .section02_box1 -->


                <div class="square2">
                    <div class="content2">
                            <div class="content2_box0"><img src="resources/images/img_sample.jpg"></div>
                    </div>
                </div><!-- .section02_box2 -->


                <div class="square3">
                    <div class="content3">
                        <div class="content3_box1_1">
                            <h3>NEW CREATORS</h3>
                            
                            	<c:forEach var="member" items="${newMembers}">
                            		<ul>
                                    <li>
                                        <div class="profile_img"><img src="../profile/${member.profile_img}" alt="프사"></div>
                                    </li><!-- 프로필사진 -->
                                    <li>
                                        <p class="weekly_best_username">${member.name}</p>
                                        <p class="weekly_best_userintro">${member.introduce}</p>
                                    </li><!-- 이름이랑 소개 -->
                                    <li><a href="#" alt="구독"><i class="xi-plus-circle-o xi-2x"></i></a></li><!-- 구독버튼 -->
                                	</ul>
                            	</c:forEach>
                            
                        </div>
                        <div class="content3_box1_2">
                            <h3>HOT CREATORS</h3>
                            
                            	<c:forEach var="member" items="${hotMembers}">
                        		    <ul>
                             		   <li>
                              		      <div class="profile_img"><img src="../profile/${member.profile_img}" alt="프사"></div>
                             		   </li><!-- 프로필사진 -->
                             		   <li>
                             		       <p class="weekly_best_username">${member.name}</p>
                             		       <p class="weekly_best_userintro">${member.introduce}</p>
                            		    </li><!-- 이름이랑 소개 -->
                           		     <li><a href="#" alt="구독"><i class="xi-plus-circle-o xi-2x"></i></a></li><!-- 구독버튼 -->
                        		    </ul>                            		
                            	</c:forEach>  

                        </div>
                        <div class="content3_box2_1"><img src="resources/images/img_sample.jpg"></div>
                        <div class="content3_box2_2"><img src="resources/images/img_sample.jpg"></div>
                    </div>
                </div><!-- .section02_box3 -->


            </div><!-- .inwrap -->
        </section><!-- #section02 위클리베스트 -->



        <section id="section03"><!-- 메인갤러리 -->

    
                    <div class="square0">
                        
                        <div class="content0">
                            <ul class="content0_gallery_box" id="boards">

                                

                                
                            </ul>
                        </div>
                        
                    </div><!-- .section03_squar0 -->


        </section><!-- #section03 메인갤러리 -->
        


        <footer id="footer"><!-- 풋터 -->
            
            <ul>
                <li><a href="./" alt="ABOUT US">ABOUT US</a></li>
                <li><a href="/ShotPlace/bbs/list" alt="NOTICE">NOTICE</a></li>
                <li><a href="./" alt="FAQ">FAQ</a></li>
                <li><a href="/ShotPlace/bbs/contact" alt="CONTACT US">CONTACT US</a></li>
                <li><a href="../html/access_terms.html" alt="이용약관">이용약관</a></li>
                <li><a href="./" alt="개인정보취급방침">개인정보취급방침</a></li>
                <li><a href="./" alt="인스타그램"><i class="xi-instagram"></i></a></li>
                <li><a href="./" alt="블로그"><i class="xi-blogger"></i></a></li>
            </ul>

        </footer>


    </div><!-- #wrap -->
  </body>
</html>