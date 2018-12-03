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
</body>
</html>