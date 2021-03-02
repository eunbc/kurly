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
			var mNAME = idForm.mNAME.value;
			var mEMAIL = idForm.mEMAIL.value;
			if(mNAME=="") {
				alert("이름을 입력하세요.");
				idForm.mNAME.focus();
				return false;
			}
			else if(mEMAIL=="") {
				alert("이메일을 입력하세요.");
				idForm.mEMAIL.focus();
				return false;
			}
			else {
				idForm.submit();
			}
		}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div class="content-default">
	<div class="content">
		<p><br/></p>
		<h4 style="text-align: center;font-weight: 900;">아이디 찾기</h4>
		<form name="idForm" method="post">
			<div>이름 <input type="text" name="mNAME" class="form-control" placeholder="고객님의 이름을 입력해주세요"/></div>
			<p><br/></p>
			<div>이메일 <input type="text" name="mEMAIL" class="form-control" placeholder="가입 시 등록하신 이메일 주소를 입력해주세요"/></div>
			<p><br/></p>
			<input type="button" value="아이디 찾기" class="button" onclick="fCheck()" style="width:320px; height: 50px;"/>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>