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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${contextPath}/resources/js/join.js"></script>
    <script src="${contextPath}/resources/js/address.js"></script>
	<style>
		.necessary {color: red;}
		#content{margin: 0 auto; width: 620px;}
		tr td:first-child {font-weight:800; width:150px;}
		tr td:nth-child(2) {width: 320px}
		tr td:nth-child(3) {width: 150px}
		tr, td {padding: 7px;}
		.gray {color: gray;}
	</style>
	<script type="text/javascript">
		function memberDelete() {
			var ans = confirm("탈퇴하시겠습니까?");
			if(!ans) return false;
			else location.href="${contextPath}/member/delete";
		}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div class="content-default">
	<div id="content">
		<p><br/></p>
		<h2 style="text-align: center;font-weight: 900;">정보수정</h2>
		<p style="text-align: right;"><span class="necessary">*</span>필수입력사항</p>
		<hr color="black">
		<form name="joinForm" method="post">
			<table>
				<tr>
					<td>아이디<span class="necessary">*</span></td>
					<td>
						<input type="text" name="mMID" id="mMID" value="${smid}" readonly="readonly" class="form-control"/>
	                    <div class="validation" id="id_check"></div>
					</td>
				</tr>
				<tr>
					<td>비밀번호<span class="necessary">*</span></td>
					<td>
						<input type="password" name="mPWD" id="mPWD" class="form-control" />
	                    <div class="validation" id="pwd_check"></div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>비밀번호확인<span class="necessary">*</span></td>
					<td>
						<input type="password" name="pwdCheck" id="pwdCheck" class="form-control" />
	                    <div class="validation" id="pwd_Recheck"></div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>이름<span class="necessary">*</span></td>
					<td><input type="text" name="mNAME" id="mNAME" class="form-control" value="${vo.mNAME}"/></td>
					<td></td>
				</tr>
				<tr>
					<td>이메일<span class="necessary">*</span></td>
					<td><input type="text" name="mEMAIL" id="mEMAIL" class="form-control" value="${vo.mEMAIL}"/></td>
					<td><input type="button" value="중복확인" class="button-outline-join" style="width:140px" id="emailCheck"/></td>
				</tr>
				<tr>
					<td>휴대폰<span class="necessary">*</span></td>
					<td><input type="text" name="mPHONE" id="mPHONE" class="form-control" value="${vo.mPHONE}"/></td>
					<td></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
<%-- 						<input type="radio" value="남자" name="mGENDER" <c:if test=${vo.mGENDER=='남자'}>checked</c:if>/>&nbsp;남자 &nbsp;
						<input type="radio" value="여자" name="mGENDER" <c:if test=${vo.mGENDER=='여자'}>checked</c:if>/>&nbsp;여자 &nbsp;
						<input type="radio" value="-" name="mGENDER" <c:if test=${vo.mGENDER=='-'}>checked</c:if>/>&nbsp;선택안함 
 --%>					</td>
					<td></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="mBDAY" id="mBDAY" class="form-control" value="${fn:substring(vo.mBDAY,0,10)}"/></td>
					<td></td>
				</tr>				
				<tr>
					<td>추가입력 사항</td>
					<td>
						<input type="checkbox" name="mRECEIVEAD" id="term3" value="Y"/>&nbsp;할인쿠폰 등 혜택/정보 수신 동의<span class="gray">(선택)</span>
					</td>
					<td></td>
				</tr>
			</table>
			<hr color="black"/>
			<hr/>
			<p><br/></p>
			<div style="text-align: center;">
				<input type="button" id="fCheck" value="수정하기" class="button" />
				<input type="button" id="fCheck" onclick="memberDelete()" value="회원탈퇴" class="button-outline" />
			</div>
		</form>
	</div>
</div>
</body>
</html>