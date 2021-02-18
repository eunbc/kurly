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
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<%@ include file="/WEB-INF/views/include/mypage-box.jsp" %>
<div class="content-default">
	<div class="subNav">
		<h2 style="font-weight: 600">&nbsp;마이컬리</h2>
		<ul class="subNavMenu">
			<li><a href="${contextPath}/mypage/order" >주문 내역</a></li>
			<li><a href="${contextPath}/mypage/destination" class="subNavMenuClicked">배송지 관리</a></li>
			<li><a href="${contextPath}/mypage/wishlist">늘 사는 것</a></li>
			<li><a href="${contextPath}/mypage/review">상품 후기</a></li>
			<li><a href="${contextPath}/mypage/emoney">적립금</a></li>
			<li><a href="${contextPath}/mypage/coupon">쿠폰</a></li>
			<li><a href="${contextPath}/member/update">개인 정보 수정</a></li>
		</ul>
	</div>
	<div class="section">
		<h4>주문 내역 <span class="explanation-gray">지난 3년간의 주문 내역 조회가 가능합니다 </span>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="button-outline-join" onclick="location.href='${contextPath}/board/write'" value="공지작성"/></h4>
		<table class="list-table">
			<tr> 
				<th style="width:50px">번호</th>
				<th style="width:550px">제목</th>
				<th style="width:70px">작성자</th>
				<th style="width:70px">작성일</th>
				<th style="width:50px">조회</th>
			</tr>
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td>${curScrNo}</td>
					<td><a href="${contextPath}/board/view?board_idx=${vo.board_idx}&pag=${p.pag}" class="title-decoration-none">${vo.title}</a></td>
					<td>${vo.name}</td>
					<td>${fn:substring(vo.wdate,0,10)}</td>
					<td>${vo.viewCnt}</td>
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
		  			<li class="page-item"><a class="page-link" href="${contextPath}/board/list?pag=1&pageSize=${p.pageSize}">◀</a></li>
		  			<li class="page-item"><a class="page-link" href="${contextPath}/board/list?pag=${p.pag-1}&pageSize=${p.pageSize}">◁</a></li>
				</c:if>
				<c:if test="${p.pag == 1}">
		  			<li class="page-item disabled"><a class="page-link" href="${contextPath}/board/list?pag=1&pageSize=${p.pageSize}">◀</a></li>
		  			<li class="page-item disabled"><a class="page-link" href="${contextPath}/board/list?pag=${p.pag-1}&pageSize=${p.pageSize}">◁</a></li>
				</c:if>
				<c:forEach var="i" begin="0" end="2">
					<c:if test="${(startPageNum + i)<=p.totPage}">
						<c:if test="${(startPageNum + i)==p.pag}">
				  			<li class="page-item active"><b><a class="page-link" href="${contextPath}/board/list?pag=${startPageNum + i}&pageSize=${p.pageSize}">${startPageNum + i }</a></b></li>
						</c:if>
						<c:if test="${(startPageNum + i)!=p.pag}">
							<li class="page-item"><a class="page-link" href="${contextPath}/board/list?pag=${startPageNum + i}&pageSize=${p.pageSize}">${startPageNum + i }</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${p.pag != p.totPage}">
					<li class="page-item"><a class="page-link" href="${contextPath}/board/list?pag=${p.pag+1}&pageSize=${p.pageSize}">▷</a></li>
					<li class="page-item"><a class="page-link" href="${contextPath}/board/list?pag=${p.totPage}&pageSize=${p.pageSize}">▶</a></li>
				</c:if>
				<c:if test="${p.pag == p.totPage}">
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/board/list?pag=${p.pag+1}&pageSize=${p.pageSize}">▷</a></li>
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/board/list?pag=${p.totPage}&pageSize=${p.pageSize}">▶</a></li>
				</c:if>
				</ul>            
            </div>
        </div>
      <!-- 페이징 처리 끝 -->		
	</div>
</div>
</body>
</html>