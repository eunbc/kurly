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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
		$(document).ready(function() {
			
		    var finalTotal = Number(localStorage.getItem('finalTotal'));
		    document.getElementById('cart-total').innerText = numberWithCommas(finalTotal);
		    document.getElementById('cart-finalTotal').innerText = numberWithCommas(finalTotal);
		    //var Total = finalTotal - cpPRICE - mEMONEY;
		    
			$('.select-option').change(function() {
				var cpPRICE = Number($(this).find(':selected').attr('data-cpPRICE'));
				var cpMINIMUM = Number($(this).find(':selected').attr('data-cpMINIMUM'));
				
			    //주문 금액이 쿠폰 최소 사용 금액에 미치지 못할 경우 사용할 수 없음
			    if(finalTotal < cpMINIMUM) {
			    	alert("쿠폰 사용 최소 주문 금액은 "+cpMINIMUM+"원 입니다.");
			    	$(this).val("0");
				    document.getElementById('cart-coupon').innerText = 0;
			    } else {
				    document.getElementById('cart-coupon').innerText = numberWithCommas(cpPRICE);
				    document.getElementById('coupon').value = cpPRICE;
					var coupon = Number(document.getElementById('coupon').value);
				    var emoney = Number(document.getElementById('emoney').value);
				    
				    document.getElementById('cart-finalTotal').innerText = numberWithCommas(finalTotal-coupon-emoney);
			    }
			});
		});
		
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
				//결제수단,주문금액
				var oPAYMENT = card+"/"+month;
				$('#oPAYMENT').val(oPAYMENT);
				$('#oAMOUNT').val(amount);
				
				//주소
				var tempADDRESS = localStorage.getItem('tempAddress');
				if(tempADDRESS) {
					$('#oADDRESS').val(tempADDRESS);
				    
				} else {
					$('#oADDRESS').val('${mVo.mADDRESS}');
				}
				
				//주문번호 생성
				let today = new Date();
				var ordernumber = String(moment(today).format("YYYYMMDDhhmmss"));
				
				var rand = String(Math.random());
				var randnum = String(rand.substring(2,8));
				ordernumber += "_"+randnum;
				$('#oNVOICE').val(ordernumber);
				
				//주문상세목록 저장
			    var order = localStorage.getItem('order');
				
				var query = {
						ordernumber : ordernumber,
						order : order
					}
					
					$.ajax({
				    	url : "${contextPath}/goods/addtoOrderDetail",
				    	type : "post",
				    	data : query,
				    	success : function(data){
				    		console.log('주문 상세 넘기기 완료');
				    	}
				    });

				orderForm.submit();
				localStorage.clear();
			}
		}
		
	    function numberWithCommas(x) {
	        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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
						<select class="form-control select-option" name="cpIDX">
							<option value="0" data-cpPRICE="0" data-cpMINIMUM="0">쿠폰선택</option>
 							<c:forEach var="cpVo" items="${cpVos}">
								<option value="${cpVo.cpIDX}" data-cpPRICE="${cpVo.cpPRICE}" data-cpMINIMUM="${cpVo.cpMINIMUM}">${cpVo.cpNAME}</option>
							</c:forEach> 
						</select>
					</span>
				</div>
				<div class="row">
					<span class="cell col1">적립금</span>
					<span class="cell col2"><input type="number" name="oEMONEY" id="order-emoney" class="input-box" min='0' value='0' onchange="checkEmoney(this,${mVo.mEMONEY})"/><input type="button" onclick="useAllEmoney(${mVo.mEMONEY})" class="btn btn-secondary" value="전액사용"/><br> (사용 가능 : ${mVo.mEMONEY} )</span>
					<script>
						function useAllEmoney(emoney) {
							if(emoney>finalTotal) {
								
								alert("적립금 사용 금액은 결제 금액을 초과할 수 없습니다. \n최대 금액이 적용됩니다. ");
							    document.getElementById('cart-emoney').innerText = numberWithCommas(finalTotal);
							    var coupon = Number(document.getElementById('coupon').value);
							    document.getElementById('emoney').value = finalTotal;
							    var emoney = Number(document.getElementById('emoney').value);
							    document.getElementById('order-emoney').value = finalTotal;
							    document.getElementById('cart-finalTotal').innerText = numberWithCommas(finalTotal-coupon-emoney);
								return false;
							}							
						    document.getElementById('cart-emoney').innerText = numberWithCommas(emoney);
						    var coupon = Number(document.getElementById('coupon').value);
						    document.getElementById('emoney').value = emoney;
						    var emoney = Number(document.getElementById('emoney').value);
						    document.getElementById('order-emoney').value = emoney;
						    document.getElementById('cart-finalTotal').innerText = numberWithCommas(finalTotal-coupon-emoney);
						}
						function checkEmoney(emoney,max) {
							if(emoney.value > max){
								alert("적립금 사용 금액은 보유 금액을 초과할 수 없습니다.");
								$('#order-emoney').val(0);
							    document.getElementById('cart-emoney').innerText = 0;
							} else {
							    document.getElementById('cart-emoney').innerText = numberWithCommas(emoney.value);
							    
							    var coupon = Number(document.getElementById('coupon').value);
							    document.getElementById('emoney').value = emoney.value;
							    var emoney = Number(document.getElementById('emoney').value);
							    
							    document.getElementById('cart-finalTotal').innerText = numberWithCommas(finalTotal-coupon-emoney);
							}
						}
					</script>
				</div>
			</div>
		</div>
		
		<div class="cart cart-price">
			<div>
				<p>
					주문금액 : <strong id="cart-total">0</strong>
				</p>
				<p>쿠폰할인금액 : <strong id="cart-coupon">0</strong></p>
				<input type="hidden" id="coupon" value="0"/>
				<p>적립금사용 : <strong id="cart-emoney">0</strong></p>
				<input type="hidden" id="emoney" value="0"/>
			</div>
			<div>
	            <div class="cart-total">
	                <strong>최종결제금액 : &nbsp;</strong>
					<strong id="cart-finalTotal">0</strong>원                
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
		<input type="hidden" name="oNVOICE" id="oNVOICE"/>
		
		<div style="text-align: center;"><input type="button" class="button" onclick="goPay()" value="결제하기"/></div>
	</form>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>