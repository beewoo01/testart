<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">

    <title>ARTPIE</title>

    <link rel="stylesheet" type="text/css" href="resources/css/main_style.css">
    <link rel="stylesheet" type="text/css" href="resources/css/header_footer_style.css">
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">

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
                                    <ul class="logout">
                                        <li><a href="/ShotPlace/users/login">LOGIN</a></li>
                                        <li><a href="/ShotPlace/users/signUp">JOIN US</a></li>
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
        
        
                                    <div class="login">
                                            <ul>
                                                <li><a href="#"><img src="../img/alarm_gr.png" alt="알람"></a><div class="main_alarm"></div></li>
                                                <li class="main_profile"><a href="#" class="main_profile_photo"><img src="../img/user_profile.png"></a>
                                                    <ul>
                                                        <li><a href="#">마이페이지</a></li>
                                                        <li><a href="#">회원정보수정</a></li>
                                                        <li><a href="#">서포트 내역</a></li>
                                                        <li><a href="#">로그아웃</a></li>
                                                    </ul>
                                                </li>
                                                <li class="header_upload"><a href="/ShotPlace/sub/upload"><span>UPLOAD</span><i class="xi-cloud-upload-o"></i></a></li>
                                            </ul>
                                    </div>
        
        
        
        
        
        
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



        <section id="section01"><!-- 메인배너/서브네비 -->
            <ul class="sub_navi_list"><!-- 서브네비 -->
                <li><a href="../html/sub/gallery/all.html">전체작품</a></li>
                <li><a href="#">편집디자인</a></li>
                <li><a href="#">일러스트레이션</a></li>
                <li><a href="#">포토그래피</a></li>
                <li><a href="#">타이포그래피</a></li>
                <li><a href="#">산업디자인</a></li>




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
            <div id="s_banner_wrap"><!-- 메인 슬라이드배너 -->
                <ul class="bxslider">
                    <div style="width:100%; height:500px; background:navy"></div>
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
                        <div class="content1_box1">.content1_box1</div>
                        <div class="content1_box2">.content1_box2</div>
                    </div>
                </div><!-- .section02_box1 -->


                <div class="square2">
                    <div class="content2">
                            <div class="content2_box0">.content2_box0</div>
                    </div>
                </div><!-- .section02_box2 -->


                <div class="square3">
                    <div class="content3">
                        <div class="content3_box1_1">
                            <h3>NEW CREATORS</h3>
                            
                            	<c:forEach var="member" items="${members}">
                            		<ul>
                                    <li>
                                        <div class="profile_img"></div>
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
                            
                            <ul>
                                <li>
                                    <div class="profile_img"></div>
                                </li><!-- 프로필사진 -->
                                <li>
                                    <p class="weekly_best_username">닉네임</p>
                                    <p class="weekly_best_userintro">소개</p>
                                </li><!-- 이름이랑 소개 -->
                                <li><a href="#" alt="구독"><i class="xi-plus-circle-o xi-2x"></i></a></li><!-- 구독버튼 -->
                            </ul>

                            <ul>
                                <li>
                                    <div class="profile_img"></div>
                                </li><!-- 프로필사진 -->
                                <li>
                                    <p class="weekly_best_username">닉네임</p>
                                    <p class="weekly_best_userintro">소개</p>
                                </li><!-- 이름이랑 소개 -->
                                <li><a href="#" alt="구독"><i class="xi-plus-circle-o xi-2x"></i></a></li><!-- 구독버튼 -->
                            </ul>


                            <ul>
                                <li>
                                    <div class="profile_img"></div>
                                </li><!-- 프로필사진 -->
                                <li>
                                    <p class="weekly_best_username">닉네임</p>
                                    <p class="weekly_best_userintro">소개</p>
                                </li><!-- 이름이랑 소개 -->
                                <li><a href="#" alt="구독"><i class="xi-plus-circle-o xi-2x"></i></a></li><!-- 구독버튼 -->
                            </ul>  

                        </div>
                        <div class="content3_box2_1">.content3_box2_1</div>
                        <div class="content3_box2_2">.content3_box2_1</div>
                    </div>
                </div><!-- .section02_box3 -->


            </div><!-- .inwrap -->
        </section><!-- #section02 위클리베스트 -->



        <section id="section03"><!-- 메인갤러리 -->

    
                    <div class="square0">
                        
                        <div class="content0">
                            <ul class="content0_gallery_box">

                                <li class="gallery"><a href="#" alt="갤러리">
                                    <div class="gallery_thumnail"></div><!-- .gallery_thumnail -->
                                    <div class="gallery_title"><p>제목이 많이많이많이 길면 여기까지 노출됩니다.</p></div><!-- .gallery_title -->
                                    <div class="gallery_profile">
                                        <div class="gallery_profile_photo"></div><!-- .gallery_profile_photo -->
                                        <div class="gallery_profile_username"><span>닉네임이 많이 길어질 경우는 여기까지 노출됩니다.</span></div><!-- .gallery_profile_username -->
                                    </div><!-- .gallery_profile -->
                                    <div class="gallery_footer">
                                        <ul>
                                            <li><i class="xi-eye-o"></i><span>50</span></li>
                                            <li><i class="xi-heart-o"></i><span>40</span></li>
                                            <li><i class="xi-forum-o"></i><span>30</span></li>
                                        </ul>
                                    </div><!-- .gallery_footer -->
                                </a></li><!-- .gallery -->

                                <li class="gallery"><a href="#" alt="갤러리">
                                    <div class="gallery_thumnail"></div><!-- .gallery_thumnail -->
                                    <div class="gallery_title"><p>제목입니다.</p></div><!-- .gallery_title -->
                                    <div class="gallery_profile">
                                        <div class="gallery_profile_photo"></div><!-- .gallery_profile_photo -->
                                        <div class="gallery_profile_username"><span>닉네임</span></div><!-- .gallery_profile_username -->
                                    </div><!-- .gallery_profile -->
                                    <div class="gallery_footer">
                                        <ul>
                                            <li><i class="xi-eye-o"></i><span>50</span></li>
                                            <li><i class="xi-heart-o"></i><span>40</span></li>
                                            <li><i class="xi-forum-o"></i><span>30</span></li>
                                        </ul>
                                    </div><!-- .gallery_footer -->
                                </a></li><!-- .gallery -->
                                
                                <li class="gallery"><a href="#" alt="갤러리">
                                    <div class="gallery_thumnail"></div><!-- .gallery_thumnail -->
                                    <div class="gallery_title"><p>제목입니다.</p></div><!-- .gallery_title -->
                                    <div class="gallery_profile">
                                        <div class="gallery_profile_photo"></div><!-- .gallery_profile_photo -->
                                        <div class="gallery_profile_username"><span>닉네임</span></div><!-- .gallery_profile_username -->
                                    </div><!-- .gallery_profile -->
                                    <div class="gallery_footer">
                                        <ul>
                                            <li><i class="xi-eye-o"></i><span>50</span></li>
                                            <li><i class="xi-heart-o"></i><span>40</span></li>
                                            <li><i class="xi-forum-o"></i><span>30</span></li>
                                        </ul>
                                    </div><!-- .gallery_footer -->
                                </a></li><!-- .gallery -->
                                
                                <li class="gallery"><a href="#" alt="갤러리">
                                    <div class="gallery_thumnail"></div><!-- .gallery_thumnail -->
                                    <div class="gallery_title"><p>제목입니다.</p></div><!-- .gallery_title -->
                                    <div class="gallery_profile">
                                        <div class="gallery_profile_photo"></div><!-- .gallery_profile_photo -->
                                        <div class="gallery_profile_username"><span>닉네임</span></div><!-- .gallery_profile_username -->
                                    </div><!-- .gallery_profile -->
                                    <div class="gallery_footer">
                                        <ul>
                                            <li><i class="xi-eye-o"></i><span>50</span></li>
                                            <li><i class="xi-heart-o"></i><span>40</span></li>
                                            <li><i class="xi-forum-o"></i><span>30</span></li>
                                        </ul>
                                    </div><!-- .gallery_footer -->
                                </a></li><!-- .gallery -->

                                <li class="gallery"><a href="#" alt="갤러리">
                                    <div class="gallery_thumnail"></div><!-- .gallery_thumnail -->
                                    <div class="gallery_title"><p>제목입니다.</p></div><!-- .gallery_title -->
                                    <div class="gallery_profile">
                                        <div class="gallery_profile_photo"></div><!-- .gallery_profile_photo -->
                                        <div class="gallery_profile_username"><span>닉네임</span></div><!-- .gallery_profile_username -->
                                    </div><!-- .gallery_profile -->
                                    <div class="gallery_footer">
                                        <ul>
                                            <li><i class="xi-eye-o"></i><span>50</span></li>
                                            <li><i class="xi-heart-o"></i><span>40</span></li>
                                            <li><i class="xi-forum-o"></i><span>30</span></li>
                                        </ul>
                                    </div><!-- .gallery_footer -->
                                </a></li><!-- .gallery -->

                                <li class="gallery"><a href="#" alt="갤러리">
                                    <div class="gallery_thumnail"></div><!-- .gallery_thumnail -->
                                    <div class="gallery_title"><p>제목입니다.</p></div><!-- .gallery_title -->
                                    <div class="gallery_profile">
                                        <div class="gallery_profile_photo"></div><!-- .gallery_profile_photo -->
                                        <div class="gallery_profile_username"><span>닉네임</span></div><!-- .gallery_profile_username -->
                                    </div><!-- .gallery_profile -->
                                    <div class="gallery_footer">
                                        <ul>
                                            <li><i class="xi-eye-o"></i><span>50</span></li>
                                            <li><i class="xi-heart-o"></i><span>40</span></li>
                                            <li><i class="xi-forum-o"></i><span>30</span></li>
                                        </ul>
                                    </div><!-- .gallery_footer -->
                                </a></li><!-- .gallery -->

                                <li class="gallery"><a href="#" alt="갤러리">
                                    <div class="gallery_thumnail"></div><!-- .gallery_thumnail -->
                                    <div class="gallery_title"><p>제목입니다.</p></div><!-- .gallery_title -->
                                    <div class="gallery_profile">
                                        <div class="gallery_profile_photo"></div><!-- .gallery_profile_photo -->
                                        <div class="gallery_profile_username"><span>닉네임</span></div><!-- .gallery_profile_username -->
                                    </div><!-- .gallery_profile -->
                                    <div class="gallery_footer">
                                        <ul>
                                            <li><i class="xi-eye-o"></i><span>50</span></li>
                                            <li><i class="xi-heart-o"></i><span>40</span></li>
                                            <li><i class="xi-forum-o"></i><span>30</span></li>
                                        </ul>
                                    </div><!-- .gallery_footer -->
                                </a></li><!-- .gallery -->
                                
                                <li class="gallery"><a href="#" alt="갤러리">
                                    <div class="gallery_thumnail"></div><!-- .gallery_thumnail -->
                                    <div class="gallery_title"><p>제목입니다.</p></div><!-- .gallery_title -->
                                    <div class="gallery_profile">
                                        <div class="gallery_profile_photo"></div><!-- .gallery_profile_photo -->
                                        <div class="gallery_profile_username"><span>닉네임</span></div><!-- .gallery_profile_username -->
                                    </div><!-- .gallery_profile -->
                                    <div class="gallery_footer">
                                        <ul>
                                            <li><i class="xi-eye-o"></i><span>50</span></li>
                                            <li><i class="xi-heart-o"></i><span>40</span></li>
                                            <li><i class="xi-forum-o"></i><span>30</span></li>
                                        </ul>
                                    </div><!-- .gallery_footer -->
                                </a></li><!-- .gallery -->                              

                                <li class="gallery"><a href="#" alt="갤러리">
                                    <div class="gallery_thumnail"></div><!-- .gallery_thumnail -->
                                    <div class="gallery_title"><p>제목입니다.</p></div><!-- .gallery_title -->
                                    <div class="gallery_profile">
                                        <div class="gallery_profile_photo"></div><!-- .gallery_profile_photo -->
                                        <div class="gallery_profile_username"><span>닉네임</span></div><!-- .gallery_profile_username -->
                                    </div><!-- .gallery_profile -->
                                    <div class="gallery_footer">
                                        <ul>
                                            <li><i class="xi-eye-o"></i><span>50</span></li>
                                            <li><i class="xi-heart-o"></i><span>40</span></li>
                                            <li><i class="xi-forum-o"></i><span>30</span></li>
                                        </ul>
                                    </div><!-- .gallery_footer -->
                                </a></li><!-- .gallery -->                               
                                
                                <li class="gallery"><a href="#" alt="갤러리">
                                    <div class="gallery_thumnail"></div><!-- .gallery_thumnail -->
                                    <div class="gallery_title"><p>제목입니다.</p></div><!-- .gallery_title -->
                                    <div class="gallery_profile">
                                        <div class="gallery_profile_photo"></div><!-- .gallery_profile_photo -->
                                        <div class="gallery_profile_username"><span>닉네임</span></div><!-- .gallery_profile_username -->
                                    </div><!-- .gallery_profile -->
                                    <div class="gallery_footer">
                                        <ul>
                                            <li><i class="xi-eye-o"></i><span>50</span></li>
                                            <li><i class="xi-heart-o"></i><span>40</span></li>
                                            <li><i class="xi-forum-o"></i><span>30</span></li>
                                        </ul>
                                    </div><!-- .gallery_footer -->
                                </a></li><!-- .gallery -->          
                                
                                <li class="gallery"><a href="#" alt="갤러리">
                                    <div class="gallery_thumnail"></div><!-- .gallery_thumnail -->
                                    <div class="gallery_title"><p>제목입니다.</p></div><!-- .gallery_title -->
                                    <div class="gallery_profile">
                                        <div class="gallery_profile_photo"></div><!-- .gallery_profile_photo -->
                                        <div class="gallery_profile_username"><span>닉네임</span></div><!-- .gallery_profile_username -->
                                    </div><!-- .gallery_profile -->
                                    <div class="gallery_footer">
                                        <ul>
                                            <li><i class="xi-eye-o"></i><span>50</span></li>
                                            <li><i class="xi-heart-o"></i><span>40</span></li>
                                            <li><i class="xi-forum-o"></i><span>30</span></li>
                                        </ul>
                                    </div><!-- .gallery_footer -->
                                </a></li><!-- .gallery -->          

                                <li class="gallery"><a href="#" alt="갤러리">
                                    <div class="gallery_thumnail"></div><!-- .gallery_thumnail -->
                                    <div class="gallery_title"><p>제목입니다.</p></div><!-- .gallery_title -->
                                    <div class="gallery_profile">
                                        <div class="gallery_profile_photo"></div><!-- .gallery_profile_photo -->
                                        <div class="gallery_profile_username"><span>닉네임</span></div><!-- .gallery_profile_username -->
                                    </div><!-- .gallery_profile -->
                                    <div class="gallery_footer">
                                        <ul>
                                            <li><i class="xi-eye-o"></i><span>50</span></li>
                                            <li><i class="xi-heart-o"></i><span>40</span></li>
                                            <li><i class="xi-forum-o"></i><span>30</span></li>
                                        </ul>
                                    </div><!-- .gallery_footer -->
                                </a></li><!-- .gallery -->            
                                
                                <li class="gallery"><a href="#" alt="갤러리">
                                    <div class="gallery_thumnail"></div><!-- .gallery_thumnail -->
                                    <div class="gallery_title"><p>제목입니다.</p></div><!-- .gallery_title -->
                                    <div class="gallery_profile">
                                        <div class="gallery_profile_photo"></div><!-- .gallery_profile_photo -->
                                        <div class="gallery_profile_username"><span>닉네임</span></div><!-- .gallery_profile_username -->
                                    </div><!-- .gallery_profile -->
                                    <div class="gallery_footer">
                                        <ul>
                                            <li><i class="xi-eye-o"></i><span>50</span></li>
                                            <li><i class="xi-heart-o"></i><span>40</span></li>
                                            <li><i class="xi-forum-o"></i><span>30</span></li>
                                        </ul>
                                    </div><!-- .gallery_footer -->
                                </a></li><!-- .gallery -->     

                                <li class="gallery"><a href="#" alt="갤러리">
                                    <div class="gallery_thumnail"></div><!-- .gallery_thumnail -->
                                    <div class="gallery_title"><p>제목입니다.</p></div><!-- .gallery_title -->
                                    <div class="gallery_profile">
                                        <div class="gallery_profile_photo"></div><!-- .gallery_profile_photo -->
                                        <div class="gallery_profile_username"><span>닉네임</span></div><!-- .gallery_profile_username -->
                                    </div><!-- .gallery_profile -->
                                    <div class="gallery_footer">
                                        <ul>
                                            <li><i class="xi-eye-o"></i><span>50</span></li>
                                            <li><i class="xi-heart-o"></i><span>40</span></li>
                                            <li><i class="xi-forum-o"></i><span>30</span></li>
                                        </ul>
                                    </div><!-- .gallery_footer -->
                                </a></li><!-- .gallery -->     

                                <li class="gallery"><a href="#" alt="갤러리">
                                    <div class="gallery_thumnail"></div><!-- .gallery_thumnail -->
                                    <div class="gallery_title"><p>제목입니다.</p></div><!-- .gallery_title -->
                                    <div class="gallery_profile">
                                        <div class="gallery_profile_photo"></div><!-- .gallery_profile_photo -->
                                        <div class="gallery_profile_username"><span>닉네임</span></div><!-- .gallery_profile_username -->
                                    </div><!-- .gallery_profile -->
                                    <div class="gallery_footer">
                                        <ul>
                                            <li><i class="xi-eye-o"></i><span>50</span></li>
                                            <li><i class="xi-heart-o"></i><span>40</span></li>
                                            <li><i class="xi-forum-o"></i><span>30</span></li>
                                        </ul>
                                    </div><!-- .gallery_footer -->
                                </a></li><!-- .gallery -->     
                                
                            </ul>
                        </div>
                        
                    </div><!-- .section03_squar0 -->


        </section><!-- #section03 메인갤러리 -->
        


        <footer id="footer"><!-- 풋터 -->
            
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


    </div><!-- #wrap -->
  </body>
</html>