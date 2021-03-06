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
		.order-content-default{
			width: 900px;
			margin: 0 auto;
			padding: 50px 0 200px 0;
		}
		.order-content{
			margin-bottom: 50px;
			width: 100%;
		}
		.order-content > .title{
			border-bottom: 1px solid black;
			font-weight: bold;
			font-size: 15px;
			padding: 10px;
		}
		
		#table {display: table; width: 100%;}
		.row {display: table-row; width: 100%;}
		.cell {display: table-cell; padding: 10px; border-bottom: 1px solid #DDD;}
		.col1 {width: 30%;text-align: center;}
		.col2 {width: 70%;}
		.cart{
			float: left;
			width: 400px;
		}
		.cart-price{
			float: right;
			background-color: #f7f7f7;
		}
		.cart-price div{
			margin:10px;
		}
		
	</style>
	<script>
		function goPay() {
			var card = orderForm.card.value;
			var month = orderForm.month.value;
		    var amount = Number(localStorage.getItem('finalTotal'));
			
			if(card==''){
				alert('결제카드를 선택해주세요.');
				return false;
			}else if(month==''){
				alert('할부 개월 수를 선택해주세요.');
				return false;
			} else {
				var oPAYMENT = card+"/"+month;
				$('#oPAYMENT').val(oPAYMENT);
				$('#oAMOUNT').val(amount);
				
				var tempADDRESS = localStorage.getItem('tempAddress');
				if(tempADDRESS) {
					$('#oADDRESS').val(tempADDRESS);
				    
				} else {
					$('#oADDRESS').val('${mVo.mADDRESS}');
				}
				orderForm.submit();
			}
		}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<div class="order-content-default">
	<div class="view-title">
		<h3>주문서</h3>
	</div>
	
	<form name="orderForm" method="post">
		<div class="order-content">
			<div class="title">주문상품</div>
			<div style="text-align: center; padding:10px;">총 <span id='orderQuantity'>n</span>개 상품을 주문합니다. 결제금액 : <span id='finalTotal'>0</span>원</div>
			<script>
				var order = localStorage.getItem('order');
				order = JSON.parse(order);
			    document.getElementById('orderQuantity').innerText = order.length;
	
			    var finalTotal = localStorage.getItem('finalTotal');
			    document.getElementById('finalTotal').innerText = numberWithCommas(finalTotal);
	
			    function numberWithCommas(x) {
			        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			    }
			    </script>
		</div>
	
		<div class="order-content">
			<div class="title">주문자 정보</div>
			<div class="table">
				<div class="row">
					<span class="cell col1">주문자</span>
					<span class="cell col2">${sname}</span>
				</div>
				<div class="row">
					<span class="cell col1">휴대폰</span>
					<span class="cell col2">${mVo.mPHONE}</span>
				</div>
				<div class="row">
					<span class="cell col1">이메일</span>
					<span class="cell col2">${mVo.mEMAIL}</span>
				</div>
			</div>
		</div>
		
		<div class="order-content">
			<div class="title">배송 정보</div>
			<div class="table">
				<div class="row">
					<span class="cell col1">배송지</span>
					<span class="cell col2" id="address">
						<script>
							var tempADDRESS = localStorage.getItem('tempAddress');
							if(tempADDRESS) {
							    document.getElementById('address').innerText = tempADDRESS;
							    
							} else {
							    document.getElementById('address').innerText = '${fn:replace(mVo.mADDRESS,'@',' ')}';
							}
						</script>
					</span>
				</div>
			</div>
		</div>
	
		<div class="cart order-content">
			<div class="title">쿠폰/적립금</div>
			<div class="table">
				<div class="row">
					<span class="cell col1">쿠폰</span>
					<span class="cell col2">
						<select class="form-control select-option">
							<option value="">쿠폰선택</option>
<%-- 							<c:forEach var="goVo" items="${goVos}">
								<option value="${goVo.goIDX}" data-gIDX="${goVo.gIDX}" data-goNAME="${goVo.goNAME}" data-goPRICE="${goVo.goPRICE}">${goVo.goNAME} (${goVo.goPRICE}원)</option>
							</c:forEach> --%>
						</select>
					</span>
				</div>
				<div class="row">
					<span class="cell col1">적립금</span>
					<span class="cell col2">${mVo.mEMONEY}</span>
				</div>
			</div>
		</div>
		
		<div class="cart cart-price">
			<div>
				<p>
					주문금액 : <strong class="cart-total">0</strong>
				</p>
				<p>쿠폰할인금액 : <strong class="cart-discount">0</strong></p>
				<p>적립금사용 : <strong class="cart-delivery">0</strong></p>
			</div>
			<div>
	            <div class="cart-total">
	                <strong>최종결제금액 : &nbsp;</strong>
					<strong class="cart-finalTotal">0</strong>원                
	            </div>
			</div>
		</div>
			
		
		<div class="order-content" style="margin-top:300px;">
			<div class="title">결제수단</div>
			<div class="table">
				<div class="row">
					<span class="cell col1">일반 결제</span>
					<span class="cell col2">
						<select name="card" class="input-box">
							<option value="">카드선택</option>
							<option>신한</option>
							<option>현대</option>
							<option>하나</option>
							<option>국민</option>
							<option>우리</option>
							<option>농협</option>
						</select>
						<select name="month" class="input-box">
							<option value="">할부선택</option>
							<option>일시불</option>
							<option>2개월</option>
							<option>3개월</option>
							<option>4개월</option>
							<option>6개월</option>
						</select>
					</span>
				</div>
			</div>
		</div>
		
		<input type="hidden" name="mMID" value="${mVo.mMID}"/>
		<input type="hidden" name="oNAME" value="${mVo.mNAME}"/>
		<input type="hidden" name="oPHONE" value="${mVo.mPHONE}"/>
		<input type="hidden" name="oADDRESS" id="oADDRESS"/>
		<input type="hidden" name="oAMOUNT" id="oAMOUNT"/>
		<input type="hidden" name="oPAYMENT" id="oPAYMENT"/>
		
		<div style="text-align: center;"><input type="button" class="button" onclick="goPay()" value="결제하기"/></div>
	</form>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>