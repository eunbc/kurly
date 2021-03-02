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
	<style>
		.content {margin:0 auto; width: 320px}
	</style>
	<script type="text/javascript">
		function fCheck() {
			var mNAME = pwForm.mNAME.value;
			var mMID = pwForm.mMID.value;
			var mEMAIL = pwForm.mEMAIL.value;
			if(mNAME=="") {
				alert("이름을 입력하세요.");
				pwForm.mNAME.focus();
				return false;
			}
			else if(mMID=="") {
				alert("아이디를 입력하세요.");
				pwForm.mMID.focus();
				return false;
			}
			else if(mEMAIL=="") {
				alert("이메일을 입력하세요.");
				pwForm.mEMAIL.focus();
				return false;
			}
			else {
				pwForm.submit();
			}
		}
	</script>
	
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div class="content-default">
	<div class="content">
		<p><br/></p>
		<h4 style="text-align: center;font-weight: 900;">비밀번호 찾기</h4>
		<form name="pwForm" method="post">
			<div>이름 <input type="text" name="mNAME" class="form-control" /></div>
			<p><br/></p>
			<div>아이디 <input type="text" name="mMID" class="form-control" /></div>
			<p><br/></p>
			<div>이메일 <input type="text" name="mEMAIL" class="form-control"/></div>
			<p><br/></p>
			<div><input type="button" value="비밀번호 찾기" class="button" onclick="fCheck()" style="width:320px; height: 50px;"/></div>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>