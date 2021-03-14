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
	<script src="${contextPath}/resources/js/goodsDetail.js"></script>
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
        #menu-container {            
            height: 55px; 
            width: 1000px; 
            margin: 20px auto;
        }
        
		#menu-container ul,li {list-style:none; margin:0; padding:0;}
		
		ul.goodsMenu > li {
			text-align: center;
            float: left;                
            line-height: 50px;         
            vertical-align: middle;   
            position : relative;    
            border-top : 1px solid #C2C0C3;                           
            border-left : 1px solid #C2C0C3;                           
            border-right : 1px solid #C2C0C3;                           
			background-color: #F0EEF1;
		}
		ul.goodsMenu > li a {
            width: 180px;                            
            display: inline-block;
            text-decoration:none; 
            color: #383838;                        
            font-size: 13px;     
            font-weight: normal;                      
		}
		
		ul.goodsMenu > li #menuSelected{
			background-color: white;
			font-weight: 800;
		}
		.cart-quantity-input{
			width: 70px;
			border: 1px solid gray;
			border-radius: 5px;
		}
		.cart-price{
			color: white;
			font-size: 0px;
		}
	</style>

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
				
				<!-- 상품옵션이 없을 경우(단일 품목) -->
				<c:if test="${empty goVos}">
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
							총 상품금액 : &nbsp;<span class="finalPrice"> 0 </span>&nbsp;원<br/>
						</td>
					</tr>
				</c:if>

				<!-- 상품옵션이 있을 경우 -->
				<c:if test="${!empty goVos}">
					<tr>
						<td>상품 선택</td>
						<td>
							<select class="form-control select-option">
								<option value="">상품선택</option>
								<c:forEach var="goVo" items="${goVos}">
									<option value="${goVo.goIDX}" data-gIDX="${goVo.gIDX}" data-goNAME="${goVo.goNAME}" data-goPRICE="${goVo.goPRICE}">${goVo.goNAME} (${goVo.goPRICE}원)</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<script>
						let optionSelect = document.querySelector('.select-option');
						let selectEvent = function(){
							
							//select 안의 value, data 받아오기
							let goIDX = optionSelect.options[optionSelect.selectedIndex].value;  
						    let gIDX = optionSelect.options[optionSelect.selectedIndex].getAttribute('data-gIDX') 
						    let goNAME = optionSelect.options[optionSelect.selectedIndex].getAttribute('data-goNAME')
						    let goPRICE = optionSelect.options[optionSelect.selectedIndex].getAttribute('data-goPRICE') 
						  
						    if(goIDX=="") {
						    	return false;
						    }
						    addItemToCart(goIDX, goNAME, goPRICE) //새로운 객체 생성
						    updateCartTotal() //합계 변경
						}
						optionSelect.addEventListener("change", selectEvent);	
					</script>
					<tr>
						<td></td>
						<td>
				            <div class="cart-items">
				            </div>
				            <div class="cart-total">
				                <strong class="cart-total-title">총 상품금액 : &nbsp;</strong>
				                <span class="cart-total-price finalPrice">0</span>원
				            </div>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>
	
	<div style="text-align: right; margin-right: 50px;">
		<input type="button" value="늘 사는 것" class="button-outline addWishlist_btn"/>
		<input type="button" value="장바구니 담기" class="button btn-addToCart"/>
	</div>
	
	<div id="menu-container" class="div1">
		<ul class="goodsMenu">
			<li><a href="javascript:move('1')" id="menuSelected">상품설명</a></li>
			<li><a href="javascript:move('2')">고객후기</a></li>
			<li><a href="javascript:move('3')">상품문의</a></li>
		</ul>
	</div>
	
    <br/>
	<div class="goods-detail-bottom">
        <p>${fn:replace(vo.gDETAIL,newLine,"<br/>")}<br/></p>
	</div>

	<div id="menu-container" class="div2">
		<ul class="goodsMenu">
			<li><a href="javascript:move('1')">상품설명</a></li>
			<li><a href="javascript:move('2')" id="menuSelected">고객후기</a></li>
			<li><a href="javascript:move('3')">상품문의</a></li>
		</ul>
	</div>
    <div style="text-align: right; padding-right:50px;"><input type="button" class="button-small" value="후기쓰기" onclick="location.href='${contextPath}/review/write?gIDX=${vo.gIDX}';"/></div>
	<div id="goods-review">
 		<iframe id="inreview" src="${contextPath}/review/list?gIDX=${vo.gIDX}" frameborder="0" height="600" width="1100"></iframe> 
	</div>

	<div id="menu-container" class="div3">
		<ul class="goodsMenu">
			<li><a href="javascript:move('1')">상품설명</a></li>
			<li><a href="javascript:move('2')">고객후기</a></li>
			<li><a href="javascript:move('3')" id="menuSelected">상품문의</a></li>
		</ul>
	</div>

    <div style="text-align: right; padding-right:50px;"><input type="button" class="button-small" value="상품문의" onclick="location.href='${contextPath}/qna/write?gIDX=${vo.gIDX}';"/></div>
	<div id="goods-qna">
 		<iframe id="inqna" src="${contextPath}/qna/list?gIDX=${vo.gIDX}" frameborder="0" height="600" width="1100"></iframe> 
	</div>
	
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
	<script>
		$(function() {
			//--------------------------------------------단일 옵션일 때 - 시작
			
		    $(".plus").click(function(){
			    var num = $(".numBox").val();
			    var plusNum = Number(num) + 1;
			    if(plusNum >= ${vo.gSTOCK}) {
			    	$(".numBox").val(num);
			    } else{
			    	$(".numBox").val(plusNum);
			    }			    
			    $(".finalPrice").text(numberWithCommas(${vo.gPRICE*(100-vo.gDISCOUNT)*0.01}*($(".numBox").val())));

			    //만약 이미 객체를 생성하였다면 수량만 증가시키고, 없다면 객체 생성
		        if (cart!='') {
		    		cart[0].cQTY = Number($(".numBox").val());
		        } else {
		        	//객체 생성
		        	var item = new Item(0, ${vo.gPRICE}, 1);
		        	cart.push(item);
		        }
			
		    });
			  
			$(".minus").click(function(){
			    var num = $(".numBox").val();
			    var minusNum  = Number(num) - 1;
			    if(minusNum  <= 0) {
			    	$(".numBox").val(num);
			    } else{
			    	$(".numBox").val(minusNum);
			    }			    
			    $(".finalPrice").text(numberWithCommas(${vo.gPRICE*(100-vo.gDISCOUNT)*0.01}*($(".numBox").val())));
			    
		        if (cart!='') {
		    		cart[0].cQTY = Number($(".numBox").val());
		        }
			});
			
			//------------------------------------------------------단일 옵션일 때 - 끝
			
		    $(".btn-addToCart").click(function(){
				console.log(cart);		   
			    jQuery.ajaxSettings.traditional = true;
				if(cart=='') {
					alert("옵션이나 수량을 선택해주세요!");
					return false;
				}
				var query = {
					cart : JSON.stringify(cart),
					gIDX : ${vo.gIDX}
				}
				
				$.ajax({
			    	url : "${contextPath}/goods/addtoCart",
			    	type : "post",
			    	data : query,
			    	success : function(data){
			    		if(data=="0"){
			    			alert("로그인 후 이용가능합니다.");
			    		} else if(data=="1"){
				    		alert("장바구니에 추가하였습니다.");
							purchaseClicked();
			    		} else if(data=="2"){
				    		alert("이미 존재하는 상품으로,장바구니에 수량 추가하였습니다.");
							purchaseClicked();
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
			    		}else if(data=='0'){
			    			alert("로그인 후 이용가능합니다.");
			    		}
			    	}
			    });
		    });
		});
	</script>
</html>