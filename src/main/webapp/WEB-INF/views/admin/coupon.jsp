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
		.add-goods{
			height:180px;
			background-color: #F7F7F7;
			padding: 30px 40px 40px 50px;
			border-radius: 10px;
		}
		label{
			font-weight: 800;
		}
		.add-table{
			height:450px;
			background-color: #F7F7F7;
			padding: 10px 40px 40px 50px;
			border-radius: 10px;
		}
		.add-table-left{
			width:60%;
		}
	</style>
	<script>
		function writeCheck() {
			var mLEVEL = goodsForm.mLEVEL.value;
			var cpNAME = goodsForm.cpNAME.value;
			var cpSTARTDATE = goodsForm.cpSTARTDATE.value;
			var cpENDDATE = goodsForm.cpENDDATE.value;
			
			if(mLEVEL=="") {
				alert("쿠폰 지급 레벨을 선택하세요.");
				return false;
			}
			else if(cpNAME=="") {
				alert("쿠폰 이름을 입력하세요.");
				return false;
			}
			else if(cpSTARTDATE=="") {
				alert("쿠폰 적용 시작일을 선택하세요.");
				return false;
			}
			else if(cpENDDATE=="") {
				alert("쿠폰 적용 마감일을 선택하세요.");
				return false;
			}
			else {
				goodsForm.submit();
			}
		}		
	</script>		
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav_admin.jsp"%>
<div class="content-default">
	<div class="view-title">
		<h3>쿠폰지급</h3>
	</div>
	<div class="admin-content-small">
		<p style="text-align: right;"><span class="necessary">*</span>필수입력사항</p>
		<form name="goodsForm" method="post" action="${contextPath}/admin/coupon">
			<div class="add-goods">
				<label for="mLEVEL">쿠폰지급 레벨 선택<span class="necessary">*</span></label>
				<select class="input-box" id="mLEVEL" name="mLEVEL">
					<option value="">선택하세요</option>
					<option>일반</option>
					<option>화이트</option>
					<option>라벤더</option>
					<option>퍼플</option>
				</select>
				
				<br><br>
				<label for="cpNAME">쿠폰이름<span class="necessary">*</span></label>
				<input type="text" class="form-control" name="cpNAME"/>

			</div>
			<hr/>
			<div class="add-table">
				<div class="add-table-left">
					<br/>	
					<label for="cpSTARTDATE">쿠폰 적용 시작일<span class="necessary">*</span></label>
					<input type="date" class="form-control" name="cpSTARTDATE"/>
					<br/>
					<label for="cpENDDATE">쿠폰 적용 마감일<span class="necessary">*</span></label>
					<input type="date" class="form-control" name="cpENDDATE"/>
					<br/>
					<label for="cpPRICE">할인금액</label>
					<input type="number" name="cpPRICE" min='0' class="form-control"/>
					<br/>
					<label for="cpMINIMUM">최소적용금액</label>
					<input type="number" name="cpMINIMUM" min='0' class="form-control"/>
				</div>
			</div>
			<br/>
			<p style="text-align:center;"><input type="button" onclick="writeCheck()" class="button" value="지급하기"/></p>
		</form>	
	</div>
</div>
</body>
</html>