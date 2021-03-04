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
	<script>
		$(function() {
		    //체크박스 전체 선택
		    $("#wishcheckAll").click(function(){
		        if($("#wishcheckAll").prop("checked")){
		            $(".wishChkbox").prop("checked",true);
		        }else{
		            $(".wishChkbox").prop("checked",false);
		        }
		    });
		    
		    //전체 선택된 상태에서 하나 해제할 때, 전체 선택 해제
		    $(".wishChkbox").click(function(){
	            var check = $('input:checkbox[id="wishcheckAll"]').is(':checked');
		    	if(check){
		            $("#wishcheckAll").prop("checked",false);
		    	}
		    });
			
		    //선택 삭제 버튼 누르면 선택된 항목만 삭제된다
		    $(".wishselectDelete_btn").click(function(){
		    	
		      	var checkArr = new Array();
		      
		      	$("input[class='wishChkbox']:checked").each(function(){
		       		checkArr.push($(this).attr("data-wIDX"));
		      	});
		      	
		      	if(checkArr==""){
					alert("삭제할 항목을 선택해주세요.");
					return false;
		      	}
		      	$.ajax({
		       		url : "${contextPath}/mypage/wishDelete",
		       		type : "post",
		       		data : { chbox : checkArr },
		       		success : function(){
						location.reload();
		       		}
		      	});
		    });
		    		    
		    $(".delete ${vo.wIDX}").click(function(){
		    	
		      	var checkArr = new Array();
		      
	       		checkArr.push($(this).attr("data-wIDX"));
		      	
		      	$.ajax({
		       		url : "${contextPath}/mypage/wishDelete",
		       		type : "post",
		       		data : { chbox : checkArr },
		       		success : function(){
						location.reload();
		       		}
		      	});
		    });
		}); 
		
	</script>
	<style>
		.wishlist-content{
			height: 150px;
		}
		.wishlist-content-info .chkbox{
			padding: 100px 20px;
		}
		.wishlist-content-info .detail{
			width: 300px;
			padding-left: 50px;
		}
		.wishlist-content-info{
			float: left;
		}
		#btn-addToCart{
			background-color: #795B8F;
			border-radius: 0;
			font-size: 13px;
		}
		#btn-Delete{
			color: #5F0080;
			border-radius: 0;
			font-size: 13px;
			width: 108px;
			margin-top: 4px;
		}
		#btn-Delete:hover{
			background-color: white;
		}
		.list-table img{
			width: 100px;
			margin: 25px;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<%@ include file="/WEB-INF/views/include/mypage-box.jsp" %>
<div class="content-default">
	<div class="subNav">
		<h2 style="font-weight: 600">&nbsp;마이컬리</h2>
		<ul class="subNavMenu">
			<li><a href="${contextPath}/mypage/order" >주문 내역</a></li>
			<li><a href="${contextPath}/mypage/wishlist" class="subNavMenuClicked">늘 사는 것</a></li>
			<li><a href="${contextPath}/mypage/review">상품 후기</a></li>
			<li><a href="${contextPath}/mypage/emoney">적립금</a></li>
			<li><a href="${contextPath}/mypage/coupon">쿠폰</a></li>
			<li><a href="${contextPath}/member/update">개인 정보 수정</a></li>
		</ul>
	</div>
	<div class="section">
		<h4>늘 사는 것 <span class="explanation-gray">늘 사는 것으로 등록하신 상품 목록입니다 </span></h4>
		<table class="list-table">
			<tr> 
				<th style="width:50px"><input type="checkbox" id="wishcheckAll"/></th>
				<th style="width:100px"></th>
				<th style="width:550px">상품 정보</th>
				<th style="width:70px">선택</th>
			</tr>
			<c:forEach var="vo" items="${vos}">
			<tr>
				<td><input type="checkbox" class="wishChkbox" data-wIDX="${vo.wIDX}" /></td>
				<td>
			        <img src="${contextPath}/resources/goods/${vo.gIMAGE}" width="100px"/>
				</td>
				<td style="text-align: left;">
					<div><a href="${contextPath}/goods/goodsDetail?gIDX=${vo.gIDX}" style="font-size: medium; text-decoration: none; color: black;">${vo.gNAME}</a></div>
					<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.gPRICE}"/>원</div>
				</td>
				<td>
					<div><input type="button" class="btn btn-outline-secondary delete ${vo.wIDX}" data-wIDX="${vo.wIDX}" id="btn-Delete" value="삭제"></div>
				</td>
			</tr>
			</c:forEach>
		</table>
		<div style="text-align: right;">
			<input type="button" class="button-outline-small wishselectDelete_btn" value="늘 사는 것 비우기"/>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>