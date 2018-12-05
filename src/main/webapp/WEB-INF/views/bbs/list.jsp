<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="게시판 목록" />
<meta name="Description" content="게시판 목록" />
<link rel="stylesheet" type="text/css" href="../resources/css/header.css">
<link rel="stylesheet" type="text/css" href="../resources/css/notice.css">
<meta charset="UTF-8">
<title>ARTPIE</title>

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
	
	function goView(notice_no) {
		var form = document.getElementById("viewForm");
		form.notice_no.value = notice_no;
		form.submit();
		
	}
//]]>
</script>  
</head>
<body>
	<!-- <div id="wrap">
	 
	    <div id="header"> -->
	        <%@ include file="../inc/header.jsp" %>
	    <!-- </div>
	</div> -->
	
	
	 
	    
	 
				<!-- 본문 시작 -->
	<div id="auth-body">
		<div class="container">
			<i class="picon" onclick="href='/ShotPlace'"></i>
			<h1>NOTICE</h1>
			<table class="table table-hover">
				<thead style="border-top: 3px solid #555; border-bottom: 3px solid #555;">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>날짜</th>
					</tr>
				</thead>
				<c:forEach var="row" items="${list}" varStatus="status">  
				    <tr class="pnt" onclick="javascript:goView('${row.notice_no}')">
				        <th style="text-align: center;">${row.notice_no}</th>
				        <td style="text-align: center;">${row.title}</td>
				        <td style="text-align: center;">${row.follow_dt}</td>
				        <%-- <td style="text-align: center;">${row.hits}</td> --%>
				    </tr>
			    </c:forEach>
			</table>
		    <button type="submit" id="btnSubmit" class="btn btn-orange" onclick="goWrite()">업로드</button>
		</div>
	</div>
				
	<div id="form-group" style="display: none;">
 
	    <form id="writeForm" action="./write" method="get">
	    </form>
	    <form id="viewForm" action="./view" method="get">
		    <p>
    			<input type="hidden" name="notice_no"/>
		    </p>
		</form>
	</div>

</body>
</html>