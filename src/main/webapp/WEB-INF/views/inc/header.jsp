<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="../resources/css/header.css">
<div id="memberMenu" style="float: right;position: relative;top: 7px;">


	 <%-- <c:choose>
	
	    <c:when test="${empty check}">
	     <header id="header">
	    	<nav>
	    		<div class="inwrap">
	    			<div id="logo"><a href="/ShotPlace"><img src="../images/logo.png" alt="로고"></a></div>
	    				<ul class="main_navi_list">      
	                        <li><a href="/ShotPlace/bbs/list">GALLERY</a></li>
	                        <li><a href="/ShotPlace/bbs/list">FEED</a></li>
	                        <li><a href="/ShotPlace/bbs/list">SUPPORT</a></li>
	                        <li><a href="/ShotPlace/bbs/list">MARCKET</a></li>
	                        <li><a href="/ShotPlace/bbs/list">MAGAZINE</a></li>
	                    </ul>
	                    
						<ul class="main_navi_right">로그인 회원가입
							<li>
                              <ul class="logout" style="display:block;">★★★★★로그아웃했을때// 숨길시 display:none; 보이게 할 때 display:block;
                                 <li><a href="/ShotPlace/users/login">LOGIN</a></li>
                                 <li><a href="/ShotPlace/users/signUp">JOIN US</a></li>
                              </ul>
        
							</li>
							<li class="searchbox">
                                    <div class="searchbox_container">
                                        <span class="icon"><a href="#" alt="검색"><i class="xi-search"></i></a></span>
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
	    		</div>
	    	</nav>
	        <!-- <input type="button" value="로그인" onclick="location.href='/ShotPlace/users/login'" />
	        <li><a href="/ShotPlace/users/login">LOGIN</a></li>
	        <input type="button" value="회원가입" onclick="location.href='/ShotPlace/users/signUp'" />
	        <li><a href="/ShotPlace/users/signUp">JOIN US</a></li> -->
	        </header> 
	    </c:when>
	    <c:otherwise>
	        <input type="button" value="로그아웃" onclick="location.href='/ShotPlace/users/logout'" />
	        <input type="button" value="내정보수정" onclick="location.href='/ShotPlace/users/editAccount'" />
	    </c:otherwise>
	    
	</c:choose> --%>
	
	
	 <header id="header">헤더
                <nav>     

                        <div class="inwrap">
                            <div id="logo"><a href="../html/main.html"><img src="../../../artpie/img/logo.png" alt="로고"></a></div>로고
        
        
                            <ul class="main_navi_list">메인네비
                                <li><a href="/ShotPlace/bbs/list">GALLERY</a></li>
                                <li><a href="/ShotPlace/bbs/list">FEED</a></li>
                                <li><a href="/ShotPlace/bbs/list">SUPPORT</a></li>
                                <li><a href="#">MARCKET</a></li>
                                <li><a href="#">MAGAZINE</a></li>
                            </ul>
        
                            <ul class="main_navi_right">로그인 회원가입
                                <li>
                                    <ul class="logout" style="display:block;"><!-- ★★★★★로그아웃했을때// 숨길시 display:none; 보이게 할 때 display:block; -->
                                        <li><a href="#">LOGIN</a></li>
                                        <li><a href="#">JOIN US</a></li>
                                    </ul>
        
                                    <!-- <ul class="login">
                                        <li><a href="#"><img src="../img/alarm_gr.png" alt="알림"></a><div class="main_alarm"></div></li>
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
        
        
                                    <ul class="login" style="display:none;">★★★★★로그인했을때// 숨길시 display:none; 보이게 할 때 display:block;
                                                <li><a href="#"><img src="../../../artpie/img/alarm_gr.png" alt="알람"></a><div class="main_alarm"></div></li>
                                                <li class="main_profile"><a href="#" class="main_profile_photo"><img src="../../../artpie/img/img_sample.jpg"></a>
                                                    <ul>
                                                        <li><a href="#">마이페이지</a></li>
                                                        <li><a href="#">회원정보수정</a></li>
                                                        <li><a href="#">서포트 내역</a></li>
                                                        <li><a href="#">로그아웃</a></li>
                                                    </ul>
                                                </li>
                                                <li class="header_upload"><a href="../html/sub/upload.html"><span>UPLOAD</span><i class="xi-cloud-upload-o"></i></a></li>
                                    </ul>
                                </li>
                                
                                <li class="searchbox">
                                    <div class="searchbox_container">
                                        <span class="icon"><a href="#" alt="검색"><i class="xi-search"></i></a></span>
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
	
	
	
	
	
	
	</div>




  <!-- <header id="header">헤더
                <nav>     

                        <div class="inwrap">
                            <div id="logo"><a href="../html/main.html"><img src="../../../artpie/img/logo.png" alt="로고"></a></div>로고
        
        
                            <ul class="main_navi_list">메인네비
                                <li><a href="../html/sub/gallery/all.html">GALLERY</a></li>
                                <li><a href="../html/sub/feed.html">FEED</a></li>
                                <li><a href="../html/sub/support/2.html">SUPPORT</a></li>
                                <li><a href="#">MARCKET</a></li>
                                <li><a href="#">MAGAZINE</a></li>
                            </ul>
        
                            <ul class="main_navi_right">로그인 회원가입
                                <li>
                                    <ul class="logout" style="display:block;">★★★★★로그아웃했을때// 숨길시 display:none; 보이게 할 때 display:block;
                                        <li><a href="#">LOGIN</a></li>
                                        <li><a href="#">JOIN US</a></li>
                                    </ul>
        
                                    <ul class="login">
                                        <li><a href="#"><img src="../img/alarm_gr.png" alt="알림"></a><div class="main_alarm"></div></li>
                                        <li><a href="#" id="current">프로필</a>
                                            <ul>
                                               <li><a href="#">마이페이지</a></li>
                                               <li><a href="#">회원정보수정</a></li>
                                               <li><a href="#">서포트 내역</a></li>
                                               <li><a href="#">로그아웃</a></li>
                                            </ul>
                                        </li>
                                        <li class="header_upload"><a href="#"><span>UPLOAD</span><i class="xi-cloud-upload-o"></i></a></li>
                                    </ul>
        
        
                                    <ul class="login" style="display:none;">★★★★★로그인했을때// 숨길시 display:none; 보이게 할 때 display:block;
                                                <li><a href="#"><img src="../../../artpie/img/alarm_gr.png" alt="알람"></a><div class="main_alarm"></div></li>
                                                <li class="main_profile"><a href="#" class="main_profile_photo"><img src="../../../artpie/img/img_sample.jpg"></a>
                                                    <ul>
                                                        <li><a href="#">마이페이지</a></li>
                                                        <li><a href="#">회원정보수정</a></li>
                                                        <li><a href="#">서포트 내역</a></li>
                                                        <li><a href="#">로그아웃</a></li>
                                                    </ul>
                                                </li>
                                                <li class="header_upload"><a href="../html/sub/upload.html"><span>UPLOAD</span><i class="xi-cloud-upload-o"></i></a></li>
                                    </ul>
                                </li>
                                
                                <li class="searchbox">
                                    <div class="searchbox_container">
                                        <span class="icon"><a href="#" alt="검색"><i class="xi-search"></i></a></span>
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
        
                            
                        </div>.inwrap
        
                </nav>
        </header> -->