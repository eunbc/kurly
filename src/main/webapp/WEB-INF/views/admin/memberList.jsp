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
		.goodsList-select{
			text-align: center;
			padding-bottom: 5px;
		}		
	</style>
	<script>
		function categoryCheck() {
			var mDROPOUT = categoryForm.mDROPOUT.value;
			location.href="${contextPath}/admin/memberList?mDROPOUT="+mDROPOUT;
		}
		function memberDelete(mIDX) {
			var query = {
					mIDX : mIDX,
			}
			$.ajax({
				url : "${contextPath}/admin/memberDelete",
				type : "post",
				data : query,
				success : function(data) {
					alert("탈퇴처리되었습니다.");	
					location.reload();
				}
			});
			
		}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav_admin.jsp"%>
<div class="content-default">
	<div class="view-title">
		<h3>회원 목록</h3>
	</div>
	<div class="admin-content">
		<p><br/></p>	
		<form name="categoryForm" style="width:200px;" onchange="categoryCheck()">
			<select class="form-control" name="mDROPOUT" style="margin-left: 50px;">
			    <option value="전체" <c:if test="${mDROPOUT=='전체'}">selected</c:if>>전체</option>
			    <option value="탈퇴" <c:if test="${mDROPOUT=='탈퇴'}">selected</c:if>>탈퇴 신청</option>
			</select>
		</form>
	
		<table class="admin-list-table">
			<tr> 
				<th style="width:100px">번호</th>
				<th style="width:200px">회원아이디</th>
				<th style="width:200px">이메일</th>
				<th style="width:200px">가입일자</th>
				<th style="width:100x">회원등급</th>
				<th style="width:100px">회원탈퇴여부</th>
			</tr>
 			<c:forEach var="vo" items="${vos}">
				<tr>
					<td>${curScrNo}</td>
					<td style="text-align: center;">${vo.mMID}</td>
					<td>${vo.mEMAIL}</td>
					<td>${fn:substring(vo.mJOINDAY,0,10)}</td>
					<td>${vo.mLEVEL}</td>
					<td>
						<c:if test="${vo.mDROPOUT=='Y'}">
							<input type="button" class="btn btn-danger" onclick="memberDelete(${vo.mIDX})" value="탈퇴처리"/>
						</c:if>
					</td>
				</tr>
				<c:set var="curScrNo" value="${curScrNo-1}"/>
			</c:forEach>
		</table>
		
		<!-- 페이징 처리 시작 -->
	    <div class="row">
	        <div class="col-12">
				<ul class="pagination justify-content-center" style="margin:20px 0">
				<c:set var="startPageNum" value="${p.pag- (p.pag-1)%(p.blockSize)}"/>
				<c:if test="${p.pag != 1}">
		  			<li class="page-item"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=1">◀</a></li>
		  			<li class="page-item"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=${p.pag-1}">◁</a></li>
				</c:if>
				<c:if test="${p.pag == 1}">
		  			<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=1">◀</a></li>
		  			<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=${p.pag-1}">◁</a></li>
				</c:if>
				<c:forEach var="i" begin="0" end="2">
					<c:if test="${(startPageNum + i)<=p.totPage}">
						<c:if test="${(startPageNum + i)==p.pag}">
				  			<li class="page-item active"><b><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=${startPageNum + i}">${startPageNum + i }</a></b></li>
						</c:if>
						<c:if test="${(startPageNum + i)!=p.pag}">
							<li class="page-item"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=${startPageNum + i}">${startPageNum + i }</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${p.pag != p.totPage}">
					<li class="page-item"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=${p.pag+1}">▷</a></li>
					<li class="page-item"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=${p.totPage}">▶</a></li>
				</c:if>
				<c:if test="${p.pag == p.totPage}">
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=${p.pag+1}">▷</a></li>
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=${p.totPage}">▶</a></li>
				</c:if>
				</ul>            
            </div>
        </div>
        <!-- 페이징 처리 끝 -->		
	</div>
</div>
</body>
</html>