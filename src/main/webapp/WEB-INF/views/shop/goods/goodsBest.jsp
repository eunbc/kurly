<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
	<style>
		.content-default-goods{
			width: 1000px;
			margin: 0 auto;
			padding: 50px 0 200px 0;
		}	
		.col-lg-4{
			padding: 20px;
			height: 600px;
			cursor: pointer;
		}
		.goods-image{
			width: 310px;
		}
		.goods-image img{
			width: 100%;
			border: 1px solid #F7F7F7;
		}
		.goods-image img:hover{
			transform: scale(1.03);
			transition: .5s;
		}
		.goods-content .goods-name{
			font-size: 20px;
			font-weight: 600;
		}
		.goods-content .goods-price{
			font-size: 20px;
			font-weight: 600;
		}
		.goods-content .goods-short{
			font-size: small;
			color: #A7A7A7;
		}
		.goods-content{
			margin-top: 10px;
		}
		.goods-content div{
			padding: 5px;
		}
		.font-color-red{
			color: #D66672;
		}
		.price-gray{
			font-size: 20px;
			color: #9D9C9A;
			text-decoration: line-through;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<div class="content-default-goods">
	<div class="row">
		<c:forEach var="vo" items="${vos}">
			<div class="col-4" onclick="location.href='${contextPath}/goods/goodsDetail?gIDX=${vo.gIDX}&pag=${p.pag}';">
				<div class="goods-image">
					<img src="${contextPath}/resources/goods/${vo.gIMAGE}"/>					
				</div>
				<div class="goods-content">
					<div class="goods-name">${vo.gNAME}</div>
					<div class="goods-price">
						<c:if test="${vo.gDISCOUNT==0}">
							<h5><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.gPRICE}" /><span class="small-font">원</span></h5>
						</c:if>
						<c:if test="${vo.gDISCOUNT!=0}">
							<c:set var="price" value="${vo.gPRICE}"/>
							<c:set var="discount" value="${vo.gDISCOUNT}"/>
							<c:set var="discountedPrice" value="${price*(100-discount)*0.01}"/>
							<h5><span class="font-color-red">${discount}%</span>&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${discountedPrice}" /><span class="small-font">원</span></h5>
							<span class="price-gray"><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" /></span>
						</c:if>
					</div>
					<div class="goods-short">${vo.gSHORT}</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- 페이징 처리 시작 -->
    <div class="row">
        <div class="col-12">
			<ul class="pagination justify-content-center" style="margin:20px 0">
			<c:set var="startPageNum" value="${p.pag- (p.pag-1)%(p.blockSize)}"/>
			<c:if test="${p.pag != 1}">
	  			<li class="page-item"><a class="page-link" href="${contextPath}/goods/goodsNew?pag=1&cCODE=${cCODE}&scCODE=${scCODE}">◀</a></li>
	  			<li class="page-item"><a class="page-link" href="${contextPath}/goods/goodsNew?pag=${p.pag-1}&cCODE=${cCODE}&scCODE=${scCODE}">◁</a></li>
			</c:if>
			<c:if test="${p.pag == 1}">
	  			<li class="page-item disabled"><a class="page-link" href="${contextPath}/goods/goodsNew?pag=1&cCODE=${cCODE}&scCODE=${scCODE}">◀</a></li>
	  			<li class="page-item disabled"><a class="page-link" href="${contextPath}/goods/goodsNew?pag=${p.pag-1}&cCODE=${cCODE}&scCODE=${scCODE}">◁</a></li>
			</c:if>
			<c:forEach var="i" begin="0" end="2">
				<c:if test="${(startPageNum + i)<=p.totPage}">
					<c:if test="${(startPageNum + i)==p.pag}">
			  			<li class="page-item active"><b><a class="page-link" href="${contextPath}/goods/goodsNew?pag=${startPageNum + i}&cCODE=${cCODE}&scCODE=${scCODE}">${startPageNum + i }</a></b></li>
					</c:if>
					<c:if test="${(startPageNum + i)!=p.pag}">
						<li class="page-item"><a class="page-link" href="${contextPath}/goods/goodsNew?pag=${startPageNum + i}&cCODE=${cCODE}&scCODE=${scCODE}">${startPageNum + i }</a></li>
					</c:if>
				</c:if>
			</c:forEach>
			<c:if test="${p.pag != p.totPage}">
				<li class="page-item"><a class="page-link" href="${contextPath}/goods/goodsNew?pag=${p.pag+1}&cCODE=${cCODE}&scCODE=${scCODE}">▷</a></li>
				<li class="page-item"><a class="page-link" href="${contextPath}/goods/goodsNew?pag=${p.totPage}&cCODE=${cCODE}&scCODE=${scCODE}">▶</a></li>
			</c:if>
			<c:if test="${p.pag == p.totPage}">
				<li class="page-item disabled"><a class="page-link" href="${contextPath}/goods/goodsNew?pag=${p.pag+1}&cCODE=${cCODE}&scCODE=${scCODE}">▷</a></li>
				<li class="page-item disabled"><a class="page-link" href="${contextPath}/goods/goodsNew?pag=${p.totPage}&cCODE=${cCODE}&scCODE=${scCODE}">▶</a></li>
			</c:if>
			</ul>            
           </div>
       </div>
       <!-- 페이징 처리 끝 -->	
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>