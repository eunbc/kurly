<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
	<link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/kurly.css?after">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
	<style type="text/css">
		.content-default{
			width: 1100px;
			margin: 0 auto;
			padding: 50px 0 200px 0;
		}	
		.login-content{margin: 0 auto; width: 320px;}
		.login-table tr, td {padding: 7px;}
		.login-table tr td div {
			font-size: 13px;
			margin-bottom: 10px;
		}
		.login-table tr td div a {
			color : black;
			text-decoration: none;
			text-align: right;
		}
		.button {
		    width:250px;
		    background-color: #5F0080;
		    border: none;
		    color:#fff;
		    padding: 15px 0;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    font-size: 15px;
		    margin: 4px;
		    cursor: pointer;
		    border-radius: 3px;
		    font-weight: 700;
		}		
		.button-outline {
		    width:250px;
		    background-color: white;
		    border: 1.5px solid #5F0080;
		    color:#5F0080;
		    padding: 15px 0;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    font-size: 15px;
		    margin: 4px;
		    cursor: pointer;
		    border-radius: 3px;
		    font-weight: 700;
		}
	</style>
	<script>
		function loginCheck() {
			var mid = loginForm.mMID.value;
			var pwd = loginForm.mPWD.value;
			
	        var check = $('input:checkbox[id="rememberIdchkbox"]').is(':checked');
	    	if(!check) {
	            $('#rememberId').val('NO');
	    	}
	    	else if(check){
	            $('#rememberId').val("YES");
	    	}

			if(mid==''){
				alert("아이디를 입력해주세요.");
				loginForm.mMID.focus();
				return false;
			}
			else if(pwd==''){
				alert("비밀번호를 입력해주세요.");
				loginForm.mPWD.focus();
				return false;
			}
			else {
				loginForm.submit();
			}
		}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<c:if test="${not empty cmid}"> <!-- 쿠키가 비어있지 않다면 체크박스 checked 속성 줌 -->
    <c:set value="checked" var="checked"/>
</c:if>
<div class="content-default">
	<div class="login-content">
		<p><br/></p>
		<h4 style="text-align: center;font-weight: 900;">로그인</h4>
		<p><br/></p>
		<form name="loginForm" method="post" action="${contextPath}/member/login">
			<table class="login-table">
				<tr>
					<td><input type="text" class="form-control" value="${cmid}" name="mMID" id="mMID" placeholder="아이디를 입력해주세요"/></td>
				</tr>
				<tr>
					<td><input type="password" class="form-control" name="mPWD" id="mPWD" placeholder="비밀번호를 입력해주세요"/></td>
				</tr>
				<tr>
					<td>
						<div>
							<input type="checkbox" id="rememberIdchkbox" ${checked} style="text-align: left;"/>&nbsp;아이디 기억하기 
							<input type="hidden" name="rememberId" id="rememberId"/>
							<a href="${contextPath}/member/find_id" style="margin-left: 50px; ">아이디 찾기 </a> | <a href="${contextPath}/member/find_pwd">비밀번호 찾기</a>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" class="button" style="width:320px" onclick="loginCheck()" value="로그인"/>
						<input type="button" class="button-outline" style="width:320px" onclick="location.href='${contextPath}/member/join'" value="회원가입"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>