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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<style>
		.goods-detail{
			margin:0 auto;
		}
		.goods-detail-top{
			width: 500px;
			height: 600px;
			float: left;
			padding: 50px;
		}
		.goods-detail-bottom{
			text-align: center;
		}
		.goods-detail-table{
			width: 500px;
			margin-top: 100px;
		}
		.goods-detail-table tr{
			border-bottom: 1px solid #F7F7F7;
		}
		.goods-detail-table tr td:first-child{
			width: 150px;
			padding: 10px;
		}
		.small-font{
			font-size: 15px;
			font-weight: 700;
		}
		.goods-detail-calculate {
			text-align: right;
		}
		.numBox{
			width: 35px;
			padding-left: 12px;
			border: 0;
			margin: 0;
		}
		.font-color-red{
			color: #D66672;
		}
		.price-gray{
			font-size: 18px;
			color: #9D9C9A;
			text-decoration: line-through;
		}
		.plus{
			margin-right: 0;
			background-color: white;
			border: 1px solid #DFDFDF;
			height: 28px;
		}
		.minus{
			margin-left: 0;
			background-color: white;
			border: 1px solid #DFDFDF;
			height: 28px;
		}
		.finalPrice{
  			font-size: 30px;
		    font-weight: bolder;			
		}
		
	</style>
	<script>
		function updateCheck(idx) {
			var ans = confirm("수정하시겠습니까?");
			if(!ans) return false;
			else location.href="${contextPath}/admin/goodsUpdate?gIDX="+idx+"&pag="+${pag};			
		}
		
		function deleteCheck(idx) {
			var ans = confirm("삭제하시겠습니까?");
			if(!ans) return false;
			else location.href="${contextPath}/admin/goodsDelete?gIDX="+idx+"&pag="+${pag};			
		}
		$(function() {
		    $(".plus").click(function(){
			    var num = $(".numBox").val();
			    var plusNum = Number(num) + 1;
			    if(plusNum >= ${vo.gSTOCK}) {
			    	$(".numBox").val(num);
			    } else{
			    	$(".numBox").val(plusNum);
			    }			    
			    $(".finalPrice").text(${vo.gPRICE*(100-vo.gDISCOUNT)*0.01}*($(".numBox").val()));
			    $(".realFinalPrice").text(${vo.gPRICE*(100-vo.gDISCOUNT)*0.01}*($(".numBox").val()));
			});
			  
			$(".minus").click(function(){
			    var num = $(".numBox").val();
			    var minusNum  = Number(num) - 1;
			    if(minusNum  <= 0) {
			    	$(".numBox").val(num);
			    } else{
			    	$(".numBox").val(minusNum);
			    }			    
			    $(".finalPrice").text(${vo.gPRICE*(100-vo.gDISCOUNT)*0.01}*($(".numBox").val()));
			    $(".realFinalPrice").text(${vo.gPRICE*(100-vo.gDISCOUNT)*0.01}*($(".numBox").val()));
			});
			
		    $(".addCart_btn").click(function(){
			    var cQTY = $(".numBox").val();
			    if(cQTY<1) {
			    	alert("수량은 반드시 1 이상이어야 합니다.");
			    	return false;
			    }  
			    var query = {
			        gIDX : ${vo.gIDX},
			        cQTY : cQTY,
			        goIDX: 0
			    };
			    /* 상품옵션번호 */
			   
			    $.ajax({
			    	url : "${contextPath}/goods/addCart",
			    	type : "post",
			    	data : query,
			    	success : function(data){
			    		if(data=='1') {
				     		alert("장바구니 담기 성공");
			    		}else {
			    			alert("로그인 후 이용가능합니다.");
			    		}
			    	}
			    });
		    });
		    
		    $(".addWishlist_btn").click(function(){
			    var query = {
			        gIDX : ${vo.gIDX}
			    };
			   
			    $.ajax({
			    	url : "${contextPath}/goods/addWishlist",
			    	type : "post",
			    	data : query,
			    	success : function(data){
			    		if(data=='1') {
				     		alert("늘 사는 것에 추가하였습니다.");
			    		}else if(data=='2'){
							alert("이미 늘 사는 리스트에 존재하는 상품입니다.");
			    		} else if(data=='0'){
			    			alert("로그인 후 이용가능합니다.");
			    		}
			    	}
			    });
		    });
		});
	</script>
	
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<div class="content-default">
	<div class="goods-detail">
		<div class="goods-detail-top">
	        <img src="${contextPath}/resources/goods/${vo.gIMAGE}" width="400px"/><br/><br/>
		</div>
		
		<div class="goods-detail-top"> 
			<h3>${vo.gNAME}</h3>
			<span class="explanation-gray">${vo.gSHORT}</span>
			<table class="goods-detail-table" >
				<tr>
					<td colspan="2">
						<c:if test="${vo.gDISCOUNT==0}">
							<h3><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.gPRICE}" /><span class="small-font">원</span></h3>
						</c:if>
						<c:if test="${vo.gDISCOUNT!=0}">
							<c:set var="price" value="${vo.gPRICE}"/>
							<c:set var="discount" value="${vo.gDISCOUNT}"/>
							<c:set var="discountedPrice" value="${price*(100-discount)*0.01}"/>
							<h3><fmt:formatNumber type="number" maxFractionDigits="3" value="${discountedPrice}" /><span class="small-font">원</span> <span class="font-color-red">${discount}%</span></h3>
							<span class="price-gray"><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원</span>
						</c:if>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>구매수량</td>
					<td>
						<button type="button" class="plus"><i class="xi-plus"></i></button>
						<input type="text" class="numBox" min="1" max="${vo.gSTOCK}" value="0" readonly="readonly"/>
						<button type="button" class="minus"><i class="xi-minus"></i></button>
					</td>
				</tr>
				<tr >
					<td></td>
					<td colspan="2" style="text-align: right;padding: 200px 10px 0 0;">
						<input type="hidden" class="realFinalPrice"/>
						총 상품금액 : &nbsp;<span class="finalPrice"> 0 </span>&nbsp;원<br/>
						적립 3%
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div style="text-align: right; margin-right: 50px;">
		<input type="button" value="늘 사는 것" class="button-outline addWishlist_btn"/>
		<input type="button" value="장바구니 담기" class="button addCart_btn"/>
	</div>
	
	<hr/>
    <br/>
	<div class="goods-detail-bottom">
	        <p>${fn:replace(vo.gDETAIL,newLine,"<br/>")}<br/></p>
	</div>
    <hr/>

</div>
</body>
</html>