<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">

    <title>ARTPIE</title><!--김탱'ㅅ'-->

    <link rel="stylesheet" type="text/css" href="../resources/css/main_style.css"> 
    <link rel="stylesheet" type="text/css" href="../resources/css/sub/upload_style.css"> 
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">

    <link href="../resources/css/sub/upload_jquery.multiselect.css" rel="stylesheet" />
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="../resources/js/upload.jquery.multiselect.js"></script>

  </head>



  <body>
    <div id="wrap">



        <header id="header"><!-- 헤더 -->
                <nav>     

                        <div class="inwrap">
                            <div id="logo"><a href="../../../artpie/html/main.html"><img src="../../../artpie/img/logo.png" alt="로고"></a></div><!-- 로고 -->
        
        
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
                                        <li><a href="#">LOGIN</a></li>
                                        <li><a href="#">JOIN US</a></li>
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
                                                <li><a href="#"><img src="../resources/images/alarm_gr.png" alt="알람"></a><div class="main_alarm"></div></li>
                                                <li class="main_profile"><a href="#" class="main_profile_photo"><img src="../../../artpie/img/user_profile.png"></a>
                                                    <ul>
                                                        <li><a href="#">마이페이지</a></li>
                                                        <li><a href="#">회원정보수정</a></li>
                                                        <li><a href="#">서포트 내역</a></li>
                                                        <li><a href="#">로그아웃</a></li>
                                                    </ul>
                                                </li>
                                                <li class="header_upload"><a href="../../../artpie/html/sub/upload.html"><span>UPLOAD</span><i class="xi-cloud-upload-o"></i></a></li>
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
                        <div class="cover_before"><a href="#"><p><span>커버업로드</span></p></a></div>
                        <div class="cover_after" style="display:none;"><img src="../../../artpie/img/img_sample.jpg"></div>
                    </li>

                    <script>
                            $(function (){

                            $(".cover_before").click(function (){
                            $(".cover_before").hide();
                            $(".cover_after").show();
                            });

                            });
                    </script>



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
                        <input type="text" name="upload_title" maxlength="100" value="제목을 입력해주세요." onfocus="this.value=''">
                    </div><!-- .upload_right_title -->


                    <div class="upload_right_cont"><!-- 내용 -->
                            

                            <div class="upload_right_cont_enter"><!-- 입력후 -->
                            <form method="post" action="upload" enctype="multipart/form-data">
                                <div class="upload_img_upload" type="file" id="uploadFile" name="uploadFile" style="display: none;">
                                    <img src="../resources/images/img_sample.jpg" alt="이미지샘플">
                                
                                    <div id="upload_img_clear"><i class="xi-close"></i></div>
                                </div>
                            </form>

    
    
                                <div class="upload_txt_upload" style="display: none;">
                                        <ul>
                                            <li><img src="../resources/images/txt_1.png" alt="굵게"></li>
                                            <li><img src="../resources/images/txt_2.png" alt="기울기"></li>
                                            <li><img src="../resources/images/txt_3.png" alt="밑줄"></li>
                                            <li><img src="../resources/images/txt_4.png" alt="왼쪽정렬"></li>
                                            <li><img src="../resources/images/txt_5.png" alt="가운데정렬"></li>
                                            <li><img src="../resources/images/txt_6.png" alt="오른쪽정렬"></li>
                                            <li><img src="../resources/images/txt_7.png" alt="취소선"></li>
                                        </ul>
                                        <textarea onkeyup="autoTextarea(this,100);"  row="100%" cols="auto" style="resize: none;"></textarea>
                                        
                                        <script type="text/javascript">
                                            /**
                                            * 내용 라인수에 맞추어 자동으로 textarea의 높이를 결정한다
                                            * @ obj                <textarea>의 object : this
                                            * @ limit                      최대 높이 제한(픽셀)
                                            */
                                            function autoTextarea(obj,limit) {
                                                    obj.style.height = "1px";
                                                    if (limit >= obj.scrollHeight) obj.style.height = (20+obj.scrollHeight)+"px";
                                                    else obj.style.height = (20+limit)+"px";
                                            }
                                        </script>

                                        <div id="upload_txt_clear"><i class="xi-close"></i></div>
                                </div><!-- .upload_txt_upload -->
                            </div><!-- .upload_right_cont_enter -->


                            <div class="upload_right_cont_btn"><!-- 입력전 -->
                                <p class="upload_img_btn"><i class="xi-library-image-o xi-2x"></i></p>
                                <p class="upload_txt_btn"><i class="xi-pen-o xi-2x"></i></p>
                            </div><!-- .upload_right_cont_btn -->                

                            <script>
                                    $(function (){


                                    $(".upload_img_btn").click(function (){
                                    $(".upload_img_upload").show();
                                    });

                                    $("#upload_img_clear").click(function (){
                                    $(".upload_img_upload").hide();
                                    });

                                    $(".upload_txt_btn").click(function (){
                                    $(".upload_txt_upload").show();
                                    });

                                    $("#upload_txt_clear").click(function (){
                                    $(".upload_txt_upload").hide();
                                    });


                                    });
                            </script>
                    </div><!-- .upload_right_cont -->


                    <div class="upload_right_btn"><!-- 업로드 버튼 -->
                                업로드
                    </div><!-- .upload_right_btn -->


                </div><!--.upload_right-->


            </div><!--.inwrap-->
        </section>



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


    </div><!-- #wrap -->
  </body>


  </html>

