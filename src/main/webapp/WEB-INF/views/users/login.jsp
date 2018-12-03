<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="로그인" />
<meta name="Description" content="로그인" />
<link href="../resources/css/login.css" rel="stylesheet" type="text/css">
<title>로그인</title>
<script type="text/javascript">
//<![CDATA[
function login() {
    var form = document.getElementById("loginForm");
    //TODO 유효성 검사
    return true;
}        
//]]>
</script>
</head>
<body class= "auth">
	<div id="auth-wrapper">
 		<header id="auth-header"><i class="logo"></i>
 		</header>
 		<section id="auth-body">
	 		<form action="login" method="post" accept-charset="UTF-8" role="form" id="login-form" onsubmit="return login()">
			<div class="biggroup">
				<div id="form-email" class="form-group"> <!-- 이메일칸 -->
					<input type="text" name="email" value id="email" class="form-control" maxlength="80" size="50" placeholder="이메일" style="border:none">
						<div class="form-error"></div>
				</div>
				
				<div id="form-password" class="form-group"> <!-- 비밀번호 -->
					<input type="password" name="passwd" value id="password" class="form-control" maxlength="20" size="50" placeholder="비밀번호" style="border:none">
						<div class="form-error"></div>
				</div>
				<input type="checkbox" name="remember" value="1" id="remember" style="margin: 0; padding: 0;">
				<label for="remember">로그인상태 유지</label>
			</div>
				<button type="submit" name="login" class="btn">로그인</button>
				<div class="form-group auth-sub">
					<a href=""><p class="password" style="font-size: 12px">비밀번호를 잊으셨나요?</p></a>
					<a href="signUp"><p class="join" style="font-size: 12px">회원가입</p></a>
				</div>
			</form>
		</section>
	</div>
    <%-- <div id="header">
        <%@ include file="../inc/header.jsp" %>
    </div>
 
    <div id="main-menu">
        <%@ include file="../inc/main-menu.jsp" %>
    </div>
    
 
    <div id="container">
        <div id="content" style="min-height: 800px;">
            <div id="url-navi">회원</div>
            <!-- 본문 시작 -->
	<h1>로그인</h1>
	<form id="loginForm" action="login" method="post" onsubmit="return login()">
	<table>
	<tr>
	    <td style="width: 200px;">Email</td>
	    <td style="width: 390px"><input type="text" name="email" style="width: 99%;" /></td>
	</tr>
	<tr>
	    <td>비밀번호(Password)</td>
	    <td><input type="password" name="passwd" style="width: 99%;" /></td>
	</tr>
	</table>
	<div style="text-align: center;padding-bottom: 15px;">
	    <input type="submit" value="확인" />
	    <input type="button" value="회원가입" onclick="location.href='signUp'" />
	    <a href="signUp.jsp"><p class="join" style="font-size: 12px">회원가입</p></a>
	</div>
	</form>
<!--  본문 끝 -->
	</div><!-- content 끝 -->
    </div><!--  container 끝 -->
    
    <div id="sidebar">
        <%@ include file="notLoginUsers-menu.jsp" %>
    </div>
   
    <div id="extra">
        <%@ include file="../inc/extra.jsp" %>
    </div>
 
    <div id="footer">
        <%@ include file="../inc/footer.jsp" %>
    </div>
 
</div> --%>


</body>
</html>