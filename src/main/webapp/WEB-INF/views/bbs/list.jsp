<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="게시판 목록" />
<meta name="Description" content="게시판 목록" />
<link rel="stylesheet" href="../resources/css/screen.css" type="text/css" media="screen" />
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
//<![CDATA[
	function goList(page) {
		var form = document.getElementById("listForm");
		form.curPage.value = page;
		form.submit();
	}
	
	function goWrite() {
		var form = document.getElementById("writeForm");
		form.submit();
	}
	
	function goView(articleNo) {
		var form = document.getElementById("viewForm");
		form.articleNo.value = articleNo;
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
		        <th style="width: 60px;">NO</th>
		        <th>TITLE</th>
		        <th style="width: 84px;">DATE</th>
		        <th style="width: 60px;">HIT</th>
		    </tr>
		    <!--  반복 구간 시작 -->
		    <c:forEach var="row" items="${list}" varStatus="status">  
		    <tr>
		       
		        <td style="text-align: center;">${row.notice_no}</td>
		        <td>
		            <a href="javascript:goView('${row.notice_no}')">${row.title}</a>
		        </td>
		        <td style="text-align: center;">${row.follow_dt}</td>
		        <td style="text-align: center;">${row.hits}</td>
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
				<input type="hidden" name="articleNo" />
				<input type="hidden" name="boardCd" value="${boardCd }" />
				<input type="hidden" name="curPage" value="${curPage }" />
				<input type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>
		
		<div id="form-group" style="display: none;">
 
		    <form id="writeForm" action="./write" method="get">
		    </form>
		</div>
		
		
		
	</div>
</body>
</html>