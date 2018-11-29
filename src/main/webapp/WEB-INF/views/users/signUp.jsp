<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="회원가입" />
<meta name="Description" content="회원가입" />
<link rel="stylesheet" href="../resources/css/resister.css" type="text/css" media="screen" >
<title>회원가입</title>
<script type="text/javascript">
//<![CDATA[
    function check() {
        var form = document.getElementById("signUpForm");
        //TODO 유효성 검사
        return true;
    }
//]]>
</script>          
</head>
<body class="auth">
 
	<div id="auth-wrapper">
		<header id="auth-header">
			<i class="logo" onclick="history.back(); return false;"></i>
		</header>
		<section id="auth-body">
			<form id="signUpForm" action="signUp" method="post" onsubmit="return check()">
				<div class= "biggroup">
					<div id="form-email" class="form-group">
						<input type="text" name="email" value id="email"  maxlength="80" size="45" placeholder="이메일" style="border:none">
						<div class="form-error"></div>
					</div>
					<div id="form-password" class="form-group"> <!-- 비밀번호 -->
						<input type="password" name="passwd" value id="password"  maxlength="20" size="45" placeholder="비밀번호" style="border:none">
						<div class="form-error"></div>
					</div>
					
					<div id="form-confirm-password" class="form-group"> <!-- 비밀번호 확인 --> 
						<input type="password" name="confirm" value id="confirm_password" maxlength="20" size="45" placeholder="비밀번호 확인" style="border:none">
						<div class="form-error"></div>
					</div>
					
					<div id="form-name" class="form-group"> <!-- 이름 -->
						<input type="text" name="name" value id="realname" maxlength="45" size="45" placeholder="이름" style="border:none">
						<div class="form-error"></div>
					</div>
					
					<!-- URL -->
					<p class="url">artpie.kr/
						<span class="example" style="color: palevioletred;font-weight: bold;">URL</span></p>
					<div id="form-url" class="form-group">
						<input type="text" name="url" value id="url" maxlength="20" size="45" placeholder="개인 URL (영문)" style="border:none">
						<div class="form-error"></div>
					</div>
						<div class="suth-sub labeltext2 auth-agree"> 버튼을 클릭함으로써 노트폴리오의 <a href="">약관</a>과 <a href="">개인정보보호정책</a>에 동의합니다.</div>
							<button type="submit" name="resister" class="btn btn-darkgray">회원가입</button>
				</div>
			</form>
		</section>
	 </div>
	 
</body>
</html>
<%--  	    <div id="header">
	        <%@ include file="../inc/header.jsp" %>
	    </div>
	 
	    <div id="main-menu">
	        <%@ include file="../inc/main-menu.jsp" %>
	    </div>
	 
	    <div id="container">
	        <div id="content" style="min-height: 800px;">
	            <div id="url-navi">회원</div>
	 
	<!-- 본문 시작 -->
	<h1>회원가입</h1>
	<form id="signUpForm" action="signUp" method="post" onsubmit="return check()">
		
		<table>
			<tr>
			    <td style="width: 200px;">이름(Full Name)</td>
			    <td style="width: 390px"><input type="text" name="name" style="width: 99%;" /></td>
			</tr>
			<tr>
			    <td>비밀번호(Password)</td>
			    <td><input type="password" name="passwd" style="width: 99%;" /></td>
			</tr>
			<tr>
			    <td colspan="2" style="text-align: center;font-weight: bold;">
			    Email이 아이디로 사용됩니다. 따라서 비밀번호는 Email 계정 비밀번호와 같게 하지 마세요.
			    </td>
			</tr>
			<tr>
			    <td>비밀번호 확인(Confirm)</td>
			    <td><input type="password" name="confirm" style="width: 99%;" /></td>
			</tr>
			<tr>
			    <td>Email</td>
			    <td><input type="text" name="email" style="width: 99%;" /></td>
			</tr>
			<tr>
			    <td>손전화(Mobile)</td>
			    <td><input type="text" name="mobile" style="width: 99%;" /></td>
			</tr>
		</table>
		<div style="text-align: center;padding-bottom: 15px;">
		    <input type="submit" value="확인" />
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
	 
	</div>
	 
</body>
</html> --%>