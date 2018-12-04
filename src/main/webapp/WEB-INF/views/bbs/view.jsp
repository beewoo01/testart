<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="게시판 상세보기" />
<meta name="Description" content="게시판 상세보기" />
<link rel="stylesheet" href="../resources/css/screen.css" type="text/css" media="screen" />
<title>Insert title here</title>
<script type="text/javascript">
//<![CDATA[
 
    function goWrite() {
        var form = document.getElementById("writeForm");
        form.submit();
    }
   
    function goView(articleNo) {
        var form = document.getElementById("viewForm");
        form.notice_no.value = notice_no;
        form.submit();
       
    }
//]]>
</script>
</head>
<body>

<div id="wrap">
 
    <div id="header">
        <%@ include file="../inc/header.jsp" %>
    </div>
 
    <div id="main-menu">
        <%@ include file="../inc/main-menu.jsp" %>
    </div>
 
    <div id="container">
        <div id="content" style="min-height: 800px;">
            <div id="url-navi">BBS</div>
            
			<!-- 본문 시작 -->         
			<h1>${boardNm }</h1>
			<div id="bbs">
			    <table>
			    <tr>
			        <th style="width: 50px;">TITLE</th>
			        <th style="text-align: left;color: #555;">${thisNotice.title }</th>
			        <th style="width: 50px;">DATE</th>
			        <th style="width: 130px;color: #555;">${thisNotice.follow_dt }</th>
			    </tr>  
			    </table>
			   
			    <div id="gul-content">
			        <h6>조회수 ${thisNotice.hits }</h6>
			        <p>${thisNotice.htmlContent }</p>
			 
			    </div>
			 
			    <div id="view-menu">
			        <div class="fl">
			            <input type="button" value="수정" onclick="goModify();" />
			            <input type="button" value="삭제" onclick="goDelete()" />
			        </div>
			        <div class="fr">           
			            <input type="button" value="목록" onclick="goList()" />
			            <input type="button" value="새글쓰기" onclick="goWrite()" />
			        </div>     
			    </div>
			     
			    <table>
			    <tr>
			        <th style="width: 60px;">NO</th>
			        <th>TITLE</th>
			        <th style="width: 84px;">DATE</th>
			        <th style="width: 60px;">HIT</th>
			    </tr>
			    <!--  반복 구간 시작 -->
			    <c:forEach var="article" items="${list }" varStatus="status">  
			    <tr>
			        <td style="text-align: center;">${Notice.notice_no }</td>
			        <td>
			            <a href="javascript:goView('${Notice.notice_no }')">${Notice.title }</a>
			        </td>
			        <td style="text-align: center;">${Notice.follow_dt }</td>
			        <td style="text-align: center;">${Notice.hits }</td>
			    </tr>
			    </c:forEach>
			    <!--  반복 구간 끝 -->
			    </table>
			    <div id="list-menu" style="text-align:  right;">
			        <input type="button" value="새글쓰기" onclick="goWrite()" />
			    </div>
			</div>
			<!--  본문 끝 -->
		 
		</div><!-- content 끝 -->
	</div><!--  container 끝 -->
		    
		    <div id="sidebar">
		        <%@ include file="bbs-menu.jsp" %>
		    </div>
		   
		    <div id="extra">
		        <%@ include file="../inc/extra.jsp" %>
		    </div>
		 
		    <div id="footer">
		        <%@ include file="../inc/footer.jsp" %>
		    </div>
		 
		</div>
		 
		<div id="form-group" style="display: none;">
		 
		    <form id="viewForm" action="./view" method="get">
		    <p>
		        <input type="hidden" name="notice_no" />
		    </p>
		    </form>
		</div>

</body>
</html>