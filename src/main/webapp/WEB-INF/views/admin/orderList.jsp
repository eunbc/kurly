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
	<link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/kurly.css?after">
	<script>
		$(function() {
		    //체크박스 전체 선택
		    $("#checkAll").click(function(){
		        if($("#checkAll").prop("checked")){
		            $(".orderChkbox").prop("checked",true);
		        }else{
		            $(".orderChkbox").prop("checked",false);
		        }
		    });
		    
		    //전체 선택된 상태에서 하나 해제할 때, 전체 선택 해제
		    $(".orderChkbox").click(function(){
	            var check = $('input:checkbox[id="checkAll"]').is(':checked');
		    	if(check){
		            $("#checkAll").prop("checked",false);
		    	}
		    });
			
		    //선택 삭제 버튼 누르면 선택된 항목만 삭제된다
		    $(".selectUpdate_btn").click(function(){
		      	var checkArr = new Array();
		      	var status = statusForm.oSTATUS.value;
		      	
		      	if(status=='') {
		      		alert("변경할 상태를 선택하세요.");
		      		return false;
		      	}
		      
		      	$("input[class='orderChkbox']:checked").each(function(){
		       		checkArr.push($(this).attr("data-oIDX"));
		      	});
		      	
		    	var ans = confirm(""+checkArr.length+"개 항목을 수정하시겠습니까?");
		     	if(!ans) return false;

		     	$.ajax({
		       		url : "${contextPath}/admin/orderUpdate",
		       		type : "post",
		       		data : { chbox : checkArr, oSTATUS : status},
		       		success : function(){
						location.reload();
		       		}
		      	});
		    });
		}); 
	</script>
	<style>
		.orderList-select{
			text-align: center;
			padding-bottom: 5px;			
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav_admin.jsp"%>
<div class="content-default">
	<div class="view-title">
		<h3>주문 관리</h3>
	</div>
	<div class="admin-content">
		<div class="orderList-select">
			<form name="statusForm" method="get">
				<label for="oSTATUS">주문상태 선택  </label>
				<select class="input-box" id="oSTATUS" name="oSTATUS">
					<option value="">선택하세요</option>
					<option value="2">배송중</option>
					<option value="3">배송완료</option>
					<option value="4">구매확정</option>
				</select>
				
				<input type="button" class="button-small selectUpdate_btn" value="주문상태변경"/>
			</form>
		</div>
	
		<table class="admin-list-table">
			<tr> 
				<th style="width:70px"><input type="checkbox" id="checkAll"/>전체</th>
				<th style="width:70px">번호</th>
				<th style="width:200px">주문번호</th>
				<th style="width:200x">주문일시</th>
				<th style="width:120px">주문금액</th>
				<th style="width:100px">결제수단</th>
				<th style="width:150px">주문상태</th>
			</tr>
 			<c:forEach var="vo" items="${vos}">
				<tr>
					<td><input type="checkbox" class="orderChkbox" data-oIDX="${vo.oIDX}" /></td>
					<td style="text-align: center;">${curScrNo}</td>
					<td><a href="${contextPath}/admin/orderDetail?oNVOICE=${vo.oNVOICE}" class="title-decoration-none">${vo.oNVOICE}</a></td>
					<td>${vo.oDATE}</td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.oAMOUNT}" /></td>
					<td>${vo.oPAYMENT}</td>
					<td><b>
						<c:if test="${vo.oSTATUS==1}">
							결제완료
						</c:if>
						<c:if test="${vo.oSTATUS==2}">
							배송중
						</c:if>
						<c:if test="${vo.oSTATUS==3}">
							배송완료
						</c:if>
						<c:if test="${vo.oSTATUS==4}">
							구매확정
						</c:if>
						<c:if test="${vo.oSTATUS==5}">
							<span style="color:red">환불요청</span>
						</c:if>
						<c:if test="${vo.oSTATUS==6}">
							환불완료
						</c:if>
						</b>
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
		  			<li class="page-item"><a class="page-link" href="${contextPath}/admin/orderList?pag=1">◀</a></li>
		  			<li class="page-item"><a class="page-link" href="${contextPath}/admin/orderList?pag=${p.pag-1}">◁</a></li>
				</c:if>
				<c:if test="${p.pag == 1}">
		  			<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/orderList?pag=1">◀</a></li>
		  			<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/orderList?pag=${p.pag-1}">◁</a></li>
				</c:if>
				<c:forEach var="i" begin="0" end="2">
					<c:if test="${(startPageNum + i)<=p.totPage}">
						<c:if test="${(startPageNum + i)==p.pag}">
				  			<li class="page-item active"><b><a class="page-link" href="${contextPath}/admin/orderList?pag=${startPageNum + i}">${startPageNum + i }</a></b></li>
						</c:if>
						<c:if test="${(startPageNum + i)!=p.pag}">
							<li class="page-item"><a class="page-link" href="${contextPath}/admin/orderList?pag=${startPageNum + i}">${startPageNum + i }</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${p.pag != p.totPage}">
					<li class="page-item"><a class="page-link" href="${contextPath}/admin/orderList?pag=${p.pag+1}">▷</a></li>
					<li class="page-item"><a class="page-link" href="${contextPath}/admin/orderList?pag=${p.totPage}">▶</a></li>
				</c:if>
				<c:if test="${p.pag == p.totPage}">
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/orderList?pag=${p.pag+1}">▷</a></li>
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/orderList?pag=${p.totPage}">▶</a></li>
				</c:if>
				</ul>            
            </div>
        </div>
        <!-- 페이징 처리 끝 -->		
	</div>
</div>
</body>
</html>