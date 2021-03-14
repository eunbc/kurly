<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
	<link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/kurly.css?after">
	<style>
		/* Make the image fully responsive */
		.carousel-inner img {
	    	width: 1900px;
	    	height: 400px;
	    }
		.main-goods-new{
			width: 1100px;
			margin: 0 auto;
			padding: 50px 0;
		}	
		.col-lg-3{
			padding: 20px;
			height: 500px;
			cursor: pointer;
			/* border: 1px solid black; */
		}
		.goods-image{
			width: 250px;
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
			font-size: 18px;
			font-weight: 600;
		}
		.goods-content .goods-price{
			font-size: 18px;
			font-weight: 600;
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
			font-size: 18px;
			color: #9D9C9A;
			text-decoration: line-through;
		}
		.main-title{
			text-align: center;
			font-size: 27px;
			font-weight: 600;
		}
		.main-goods-bgcolor-gray{
			background-color: #f7f7f7;
		}
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div id="demo" class="carousel slide" data-ride="carousel">
    <ul class="carousel-indicators">
	    <li data-target="#demo" data-slide-to="0" class="active"></li>
	    <li data-target="#demo" data-slide-to="1"></li>
	    <li data-target="#demo" data-slide-to="2"></li>
    </ul>
    <div class="carousel-inner">
    	<div class="carousel-item active">
        	<img src="${contextPath}/resources/images/carousel1.JPG" >
    	</div>
	    <div class="carousel-item">
	        <img src="${contextPath}/resources/images/carousel4.JPG" >
	    </div>
	    <div class="carousel-item">
	        <img src="${contextPath}/resources/images/carousel3.JPG" >
	    </div>
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
      <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
      <span class="carousel-control-next-icon"></span>
  </a>
</div>
<div class="main-goods-new">
	<div class="main-title">오늘의 신상품</div>
	<div class="row">
		<c:forEach var="nVo" items="${newVos}">
			<div class="col-3" onclick="location.href='${contextPath}/goods/goodsDetail?gIDX=${nVo.gIDX}';">
				<div class="goods-image">
					<img src="${contextPath}/resources/goods/${nVo.gIMAGE}"/>					
				</div>
				<div class="goods-content">
					<div class="goods-name">${nVo.gNAME}</div>
					<div class="goods-price">
						<c:if test="${nVo.gDISCOUNT==0}">
							<h5><fmt:formatNumber type="number" maxFractionDigits="3" value="${nVo.gPRICE}" /><span class="small-font">원</span></h5>
						</c:if>
						<c:if test="${nVo.gDISCOUNT!=0}">
							<c:set var="price" value="${nVo.gPRICE}"/>
							<c:set var="discount" value="${nVo.gDISCOUNT}"/>
							<c:set var="discountedPrice" value="${price*(100-discount)*0.01}"/>
							<h5><span class="font-color-red">${discount}%</span>&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${discountedPrice}" /><span class="small-font">원</span></h5>
							<span class="price-gray"><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원</span>
						</c:if>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<div class="main-goods-bgcolor-gray">
	<div class="main-goods-new">
		<div class="main-title">지금 가장 핫한 상품</div>
		<div class="row">
			<c:forEach var="hVo" items="${hotVos}">
				<div class="col-3" onclick="location.href='${contextPath}/goods/goodsDetail?gIDX=${hVo.gIDX}';">
					<div class="goods-image">
						<img src="${contextPath}/resources/goods/${hVo.gIMAGE}"/>					
					</div>
					<div class="goods-content">
						<div class="goods-name">${hVo.gNAME}</div>
						<div class="goods-price">
							<c:if test="${hVo.gDISCOUNT==0}">
								<h5><fmt:formatNumber type="number" maxFractionDigits="3" value="${hVo.gPRICE}" /><span class="small-font">원</span></h5>
							</c:if>
							<c:if test="${hVo.gDISCOUNT!=0}">
								<c:set var="price" value="${hVo.gPRICE}"/>
								<c:set var="discount" value="${hVo.gDISCOUNT}"/>
								<c:set var="discountedPrice" value="${price*(100-discount)*0.01}"/>
								<h5><span class="font-color-red">${discount}%</span>&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${discountedPrice}" /><span class="small-font">원</span></h5>
								<span class="price-gray"><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" /></span>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<div class="main-goods-new">
	<div class="main-title">알뜰 상품</div>
	<div class="row">
		<c:forEach var="sVo" items="${saleVos}">
			<div class="col-3" onclick="location.href='${contextPath}/goods/goodsDetail?gIDX=${sVo.gIDX}';">
				<div class="goods-image">
					<img src="${contextPath}/resources/goods/${sVo.gIMAGE}"/>					
				</div>
				<div class="goods-content">
					<div class="goods-name">${sVo.gNAME}</div>
					<div class="goods-price">
						<c:if test="${sVo.gDISCOUNT==0}">
							<h5><fmt:formatNumber type="number" maxFractionDigits="3" value="${sVo.gPRICE}" /><span class="small-font">원</span></h5>
						</c:if>
						<c:if test="${sVo.gDISCOUNT!=0}">
							<c:set var="price" value="${sVo.gPRICE}"/>
							<c:set var="discount" value="${sVo.gDISCOUNT}"/>
							<c:set var="discountedPrice" value="${price*(100-discount)*0.01}"/>
							<h5><span class="font-color-red">${discount}%</span>&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${discountedPrice}" /><span class="small-font">원</span></h5>
							<span class="price-gray"><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" /></span>
						</c:if>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>



<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
