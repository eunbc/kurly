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
	<style>
		.list-table tr td:first-child{
			width: 300px;
		}
		.list-table tr td:last-child{
			width: 300px;
		}
	</style>
	<script>
		function loginCheck() {
			var mid = loginForm.mMID.value;
			var pwd = loginForm.mPWD.value;
			
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
<div class="content-default">
	<div class="subNav">
		<h2 style="font-weight: 600">&nbsp;마이컬리</h2>
		<ul class="subNavMenu">
			<li><a href="${contextPath}/mypage/order">주문 내역</a></li>
			<li><a href="${contextPath}/mypage/wishlist">늘 사는 것</a></li>
			<li><a href="${contextPath}/mypage/review">상품 후기</a></li>
			<li><a href="${contextPath}/mypage/emoney">적립금</a></li>
			<li><a href="${contextPath}/mypage/coupon">쿠폰</a></li>
			<li><a href="${contextPath}/member/update" class="subNavMenuClicked">개인 정보 수정</a></li>
		</ul>
	</div>
	<div class="section">
		<div>
			<span class="section-title">개인 정보 수정 </span><span class="explanation-gray">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</span>
		</div>
		<form name="loginForm" method="post">
			<table class="list-table">
				<tr> 
					<td>
						아이디
					</td>
					<td>
						<input type="text" value="${smid}" name="mMID" class="form-control"/>
					</td>
					<td></td>
				</tr>
				<tr> 
					<td>
						비밀번호
					</td>
					<td>
						<input type="password" name="mPWD" class="form-control"/>
					</td>
					<td></td>
				</tr>
			</table>
			<input type="button" onclick="loginCheck()" class="button" style="margin-left: 290px" value="확인"/>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>