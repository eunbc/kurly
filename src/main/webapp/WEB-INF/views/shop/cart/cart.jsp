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
	<script src="${contextPath}/resources/js/cart.js"></script>
    <script src="${contextPath}/resources/js/address2.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style>
		.cart{
			float: left;
		}
		.cart-price{
			float: right;
			width: 280px;
			background-color: #f7f7f7;
		}
		.cart-price div{
			margin:10px;
		}
		.cart-list {
			width: 800px;
			border-top: 1px solid black;
			border-bottom: 1px solid black;
			margin-right: 0px;
			margin-bottom: 100px;
		}
		.cart-list th{
			padding: 10px;
			background-color: #f7f7f7;
		}
		.cart-list td{
			padding: 10px;
		}
		.cart-list tr{
			border-bottom: 1px solid #f7f7f7;
		}
		.cart-list tr:hover{
			background-color: #f7f7f7;
		}
		.cart-quantity-input{
			width: 70px;
			border: 1px solid gray;
			border-radius: 5px;
		}		
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<div class="content-default">
	<div class="view-title">
		<h3>장바구니</h3>
	</div>
	<div style="text-align: left;">
		<input type="button" class="button-outline-small selectDelete_btn" value="선택항목 삭제"/>
	</div>
	<table class="cart cart-list">
		<tr> 
			<th style="width:50px"><input type="checkbox" id="checkAll"/></th>
			<th style="width:100px"></th>
			<th style="width:400px">상품정보</th>
			<th style="width:150px">수량</th>
			<th style="width:70px">가격</th>
			<th style="width:70px"></th>
		</tr>
		<c:forEach var="vo" items="${vos}">
		<tr>
			<td><input type="checkbox" value="값" class="cartChkbox" data-cIDX="${vo.cIDX}" data-gPRICE="${vo.gPRICE}" data-cQTY="${vo.cQTY}" data-gIDX="${vo.gIDX}" data-goIDX="${vo.goIDX}" data-gDISCOUNT="${vo.gDISCOUNT}"/></td>
			<td>
		        <img src="${contextPath}/resources/goods/${vo.gIMAGE}" width="100px"/>
			</td>
			<td style="text-align: left;">
				<div style="font-size: medium;">
					<c:if test="${vo.goIDX!=0}">
						${vo.goNAME}						
					</c:if>
					<c:if test="${vo.goIDX==0}">
						${vo.gNAME}
					</c:if>					
				</div>
			</td>
			<td>
	            <input class="cart-quantity-input" type="number" readonly="readonly" value="${vo.cQTY}" data-cIDX="${vo.cIDX}" data-gPRICE="${vo.gPRICE}" data-cQTY="${vo.cQTY}" data-gIDX="${vo.gIDX}" data-goIDX="${vo.goIDX}" data-gDISCOUNT="${vo.gDISCOUNT}">
			</td>
			<td>
				<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.gPRICE}"/></div>
			</td>
			<td><a class="delete ${vo.cIDX}" data-cIDX="${vo.cIDX}" style="color:black;"><i class='xi-close'></i></a></td>
		</tr>
		</c:forEach>
	</table>
	
	<div class="cart cart-price">
		<div>
			<span class="myAddress">현재 배송지<br/>${fn:replace(mADDRESS,'@','')}</span>
			<input type="button" onclick="sample6_execDaumPostcode()" id="address" class="button-outline-small" value="배송지 변경">
			<span class="updatedAddress">
				<input type="text" id="sample6_postcode" name="address1" placeholder="우편번호" class="form-control">
				<input type="text" id="sample6_address" name="address2" placeholder="주소" class="form-control"><br>
				<input type="text" id="sample6_detailAddress" name="address3" placeholder="상세주소" class="form-control">
				<input type="text" id="sample6_extraAddress" name="address4" placeholder="참고항목" class="form-control">
				<input type="hidden" name="tempADDRESS" id="tempADDRESS"/>
			</span>
		</div>
		<div>
			<p>
				상품금액 : <strong class="cart-total">0</strong>
			</p>
			<p>상품할인금액 : <strong class="cart-discount">0</strong></p>
			<p>배송비 : <strong class="cart-delivery">0</strong></p>
		</div>
		<div>
            <div class="cart-total">
                <strong>총 상품금액 : &nbsp;</strong>
				<strong class="cart-finalTotal">0</strong>원                
            </div>
		</div>
		<input type="button" class="button" id="getOrder" value="주문하기">
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
<script>
	$(function() {
		$("#checkAll").prop("checked",true);
        $(".cartChkbox").prop("checked",true);
        $(".updatedAddress").hide();
        updateMyCartPrice();

        var address = $("#sample6_postcode").val()+"@"+$("#sample6_address").val()+"@"+$("#sample6_detailAddress").val()+"@"+$("#sample6_extraAddress").val();
    	$('#mADDRESS').val(address);
        
	    //체크박스 전체 선택
	    $("#checkAll").click(function(){
	        if($("#checkAll").prop("checked")){
	            $(".cartChkbox").prop("checked",true);
	        }else{
	            $(".cartChkbox").prop("checked",false);
	        }
	    });
	    
	    //전체 선택된 상태에서 하나 해제할 때, 전체 선택 해제
	    $(".cartChkbox").click(function(){
            var check = $('input:checkbox[id="checkAll"]').is(':checked');
	    	if(check){
	            $("#checkAll").prop("checked",false);
	    	}
	    });
		
	    //선택 삭제 버튼 누르면 선택된 항목만 삭제된다
	    $(".selectDelete_btn").click(function(){
	      	var checkArr = new Array();
	      
	      	$("input[class='cartChkbox']:checked").each(function(){
	       		checkArr.push($(this).attr("data-cIDX"));
	      	});
	      	
			var query = {
					chbox : checkArr,
					mMID : '${smid}'
			}
			
	      	if(checkArr==""){
				alert("삭제할 항목을 선택해주세요.");
				return false;
	      	}
	    	var ans = confirm(""+checkArr.length+"개 항목을 삭제하시겠습니까?");
	     	if(!ans) return false;
	     	else if(ans) {
		      	$.ajax({
		       		url : "${contextPath}/goods/cartDelete",
		       		type : "post",
		       		data : query,
		       		success : function(){
						location.reload();
		       		}
		      	});
	     	} 
	    });
	    
	    $(".delete ${vo.cIDX}").click(function(){
	      	var checkArr = new Array();
       		checkArr.push($(this).attr("data-cIDX"));
       		
	      	$.ajax({
	       		url : "${contextPath}/goods/cartDelete",
	       		type : "post",
	       		data : { chbox : checkArr },
	       		success : function(){
					location.reload();
	       		}
	      	});
	    });
	}); 
	
</script>
</html>