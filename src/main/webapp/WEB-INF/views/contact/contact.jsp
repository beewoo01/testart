<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/contact.css" type="text/css" rel="stylesheet">
<title>아트파이 문의</title>
</head>
<body>
	<div id="auth-body">
	<div class="container">
		<i class="picon"></i>
		<h1 style="font-size: 24px;">CONTACT US</h1>
		
		<div id="contact_us">	
			
			<div class="selectbox" style="margin-left: 2px;"> 
				<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종류&nbsp;&nbsp;</label>
				<select id="ex_select">
					<option selected></option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
				</select>
			</div>
		
			<div class="name"> 
				<label>&nbsp;　이름&nbsp;*&nbsp;&nbsp;</label>
				<input type="name" class="contact_input" size="80">
			</div>
			
			<div class="email">
				<label>&nbsp;이메일&nbsp;*&nbsp;&nbsp;</label> 
				<input type="email" class="contact_input" size="80">
			</div>
			
			<div class="tel">
				<label>&nbsp;연락처&nbsp;*&nbsp;&nbsp;</label>
				<input type="tel" class="contact_input" size="80">
			</div>
			
			<div class="txt" style="margin-left: 1px;">
				<label style="position: relative; left: 3px; top: -180px;">&nbsp;&nbsp;&nbsp;&nbsp;내용&nbsp;*&nbsp;&nbsp;&nbsp;</label>
				<textarea class="contact_text" rows="50" cols="50"></textarea>
			</div>
				
				<button type="submit" class="btn">보내기</button>
			</div>
	
	</div>
</div>

</body>
</html>