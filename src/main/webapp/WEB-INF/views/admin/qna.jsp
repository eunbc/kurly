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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>
	<style>
		.admin-list-table {
			width: 1100px;
			border-top: 2px solid #5F0080;
			margin: 0 auto;
		}
		.admin-list-table tr{
			line-height: 60px;
			vertical-align: middle;	
		}
		.admin-list-table tr:not(:first-child):hover{
			background-color: #F7F7F7;
		}
		.admin-list-table tr th{
			text-align: center;
			font-weight: 400;		
			border-bottom: 1px solid black;
		}
		.admin-list-table tr td{
			text-align: center;
			font-weight: 400;		
			border-bottom: 1px solid #F5F5F5;
		}	
		.admin-list-table tr td:nth-child(2){
			text-align: left;
		}
		.admin-list-table tr td a.title-decoration-none{
			text-decoration: none;
			color: black;
		}	
	</style>
	<script>
		
		$(document).ready(function() {
			
			var qWDATE = document.getElementsByClassName('qWDATE');
			for(var i=0; i<qWDATE.length; i++) {
				var fromNow = moment(qWDATE[i].value).fromNow();
			    document.getElementsByClassName('inputDate')[i].innerText = fromNow;
			}

		});
		
		function categoryCheck() {
			var qREPLY = categoryForm.qREPLY.value;
			location.href="${contextPath}/admin/qna?qREPLY="+qREPLY;
		}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav_admin.jsp"%>
<div class="content-default">
	<div class="view-title">
		<h3>상품문의 관리</h3>
	</div>
	<div class="admin-content">
		<p><br/></p>
		<form name="categoryForm" style="width:200px;" onchange="categoryCheck()">
			<select class="form-control" name="qREPLY" style="margin-left: 50px;">
			    <option value="전체" <c:if test="${qREPLY=='전체'}">selected</c:if>>전체</option>
			    <option value="답변대기중" <c:if test="${qREPLY=='답변대기중'}">selected</c:if>>답변대기중</option>
			    <option value="답변완료" <c:if test="${qREPLY=='답변완료'}">selected</c:if>>답변완료</option>
			</select>
		</form>
	
		<table class="admin-list-table">
			<tr> 
				<th style="width:100px">번호</th>
				<th style="width:600px">제목</th>
				<th style="width:100x">작성자</th>
				<th style="width:100px">작성일</th>
				<th style="width:100px">답변상태</th>
			</tr>
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td>${curScrNo}</td>
					<td><a href="${contextPath}/admin/qnaReply?qIDX=${vo.qIDX}&pag=${p.pag}" class="title-decoration-none">${vo.qTITLE}</a></td>
					<td>${vo.qNAME}</td>
					<td>
						<span class="inputDate"></span>
						<input type="hidden" class="qWDATE" value="${vo.qWDATE}"/>
					</td>
					<td>
						<c:if test="${vo.qREPLY=='답변대기중'}">
							<span class="badge badge-pill badge-secondary">${vo.qREPLY}</span>						
						</c:if>
						<c:if test="${vo.qREPLY=='답변완료'}">
							<span class="badge badge-pill badge-danger">${vo.qREPLY}</span>						
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
		  			<li class="page-item"><a class="page-link" href="${contextPath}/admin/qna?pag=1&pageSize=${p.pageSize}">◀</a></li>
		  			<li class="page-item"><a class="page-link" href="${contextPath}/admin/qna?pag=${p.pag-1}&pageSize=${p.pageSize}">◁</a></li>
				</c:if>
				<c:if test="${p.pag == 1}">
		  			<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/qna?pag=1&pageSize=${p.pageSize}">◀</a></li>
		  			<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/qna?pag=${p.pag-1}&pageSize=${p.pageSize}">◁</a></li>
				</c:if>
				<c:forEach var="i" begin="0" end="2">
					<c:if test="${(startPageNum + i)<=p.totPage}">
						<c:if test="${(startPageNum + i)==p.pag}">
				  			<li class="page-item active"><b><a class="page-link" href="${contextPath}/admin/qna?pag=${startPageNum + i}&pageSize=${p.pageSize}">${startPageNum + i }</a></b></li>
						</c:if>
						<c:if test="${(startPageNum + i)!=p.pag}">
							<li class="page-item"><a class="page-link" href="${contextPath}/admin/qna?pag=${startPageNum + i}&pageSize=${p.pageSize}">${startPageNum + i }</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${p.pag != p.totPage}">
					<li class="page-item"><a class="page-link" href="${contextPath}/admin/qna?pag=${p.pag+1}&pageSize=${p.pageSize}">▷</a></li>
					<li class="page-item"><a class="page-link" href="${contextPath}/admin/qna?pag=${p.totPage}&pageSize=${p.pageSize}">▶</a></li>
				</c:if>
				<c:if test="${p.pag == p.totPage}">
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/qna?pag=${p.pag+1}&pageSize=${p.pageSize}">▷</a></li>
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/qna?pag=${p.totPage}&pageSize=${p.pageSize}">▶</a></li>
				</c:if>
				</ul>            
            </div>
        </div>
      <!-- 페이징 처리 끝 -->		
	</div>
</div>
</body>
</html>