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
	<link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/kurly.css?after">
	<style>
		.goodsList-select{
			text-align: center;
			padding-bottom: 5px;
		}		
	</style>
	<script>
		$(function() {
			//대분류 선택시 수행
			$("#category").change(function() {
				var cCODE = $(this).val();
				var query = {cCODE : cCODE};
				$.ajax({
					url : "${contextPath}/admin/getSubcategory",
					type : "POST",
					data : query,
					success : function(data) {
						var str = "";
						str += "<option value=''>선택하세요</option>";
						for(var i=0; i<data.length; i++) {
							str += "<option value='"+data[i].scCODE+"'>"+data[i].scNAME+"</option>";
						}
						$("#subcategory").html(str);
					}
				});
			});
		    //체크박스 전체 선택
		    $("#checkAll").click(function(){
		        if($("#checkAll").prop("checked")){
		            $(".goodsChkbox").prop("checked",true);
		        }else{
		            $(".goodsChkbox").prop("checked",false);
		        }
		    });
		    
		    //전체 선택된 상태에서 하나 해제할 때, 전체 선택 해제
		    $(".goodsChkbox").click(function(){
	            var check = $('input:checkbox[id="checkAll"]').is(':checked');
		    	if(check){
		            $("#checkAll").prop("checked",false);
		    	}
		    });
			
		    //선택 삭제 버튼 누르면 선택된 항목만 삭제된다
		    $(".selectDelete_btn").click(function(){
		      	var checkArr = new Array();
		      
		      	$("input[class='goodsChkbox']:checked").each(function(){
		       		checkArr.push($(this).attr("data-gIDX"));
		      	});
		      	
		    	var ans = confirm(""+checkArr.length+"개 항목을 삭제하시겠습니까?");
		     	if(!ans) return false;
		     	else if(ans) {
			      	$.ajax({
			       		url : "${contextPath}/admin/goodsDelete",
			       		type : "post",
			       		data : { chbox : checkArr },
			       		success : function(){
							location.reload();
			       		}
			      	});
		     	} 
		    });
		}); 
		
		function selectCategory() {
			var cCODE = document.getElementById("category").value;
			var scCODE = document.getElementById("subcategory").value;
			if(cCODE=="") {
				alert("대분류를 선택하세요");
				return false;
			}
			else if(scCODE=="") {
				alert("중분류를 선택하세요");
				return false;
			}
			location.href='${contextPath}/admin/goodsList?cCODE='+cCODE+'&scCODE='+scCODE;
		}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav_admin.jsp"%>
<div class="content-default">
	<div class="view-title">
		<h3>상품 목록</h3>
	</div>
	<div class="admin-content">
		<div class="goodsList-select">
			<form name="categoryForm" method="get">
				<label for="cCODE">대분류 선택</label>
				<select class="input-box" id="category" name="cCODE">
					<option value="">선택하세요</option>
					<c:forEach var="cVo" items="${cVos}">
						<option value="${cVo.cCODE}" <c:if test="${cCODE==cVo.cCODE}">selected</c:if>>[${cVo.cCODE}]${cVo.cNAME}</option>
					</c:forEach>
				</select>
				
				<label for="scCODE">중분류 선택	</label>
				<select class="input-box" id="subcategory" name="scCODE">
					<option value="">선택하세요</option>
					<c:forEach var="scVo" items="${scVos}">
						<option value="${scVo.scCODE}" ${scCODE==scVo.scCODE? 'selected':''}>${scVo.scNAME}</option>
					</c:forEach>
				</select>	
				
				<input type="button" class="button-small" onclick="selectCategory()"value="분류별 조회"/>
				<input type="button" class="button-outline-small selectDelete_btn" value="선택삭제"/>
			</form>
		</div>
		
	
		<table class="admin-list-table">
			<tr> 
				<th style="width:100px"><input type="checkbox" id="checkAll"/>전체</th>
				<th style="width:500px">상품명</th>
				<th style="width:200px">할인율</th>
				<th style="width:100x">재고</th>
				<th style="width:100px">판매량</th>
			</tr>
 			<c:forEach var="gVo" items="${gVos}">
				<tr>
					<td><input type="checkbox" class="goodsChkbox" data-gIDX="${gVo.gIDX}" /></td>
					<td><a href="${contextPath}/admin/goodsDetail?gIDX=${gVo.gIDX}&pag=${p.pag}" class="title-decoration-none">${gVo.gNAME}</a></td>
					<td>${gVo.gDISCOUNT}</td>
					<td>${gVo.gSTOCK}</td>
					<td>${gVo.gSALES}</td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- 페이징 처리 시작 -->
	    <div class="row">
	        <div class="col-12">
				<ul class="pagination justify-content-center" style="margin:20px 0">
				<c:set var="startPageNum" value="${p.pag- (p.pag-1)%(p.blockSize)}"/>
				<c:if test="${p.pag != 1}">
		  			<li class="page-item"><a class="page-link" href="${contextPath}/admin/goodsList?pag=1&cCODE=${cCODE}&scCODE=${scCODE}">◀</a></li>
		  			<li class="page-item"><a class="page-link" href="${contextPath}/admin/goodsList?pag=${p.pag-1}&cCODE=${cCODE}&scCODE=${scCODE}">◁</a></li>
				</c:if>
				<c:if test="${p.pag == 1}">
		  			<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/goodsList?pag=1&cCODE=${cCODE}&scCODE=${scCODE}">◀</a></li>
		  			<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/goodsList?pag=${p.pag-1}&cCODE=${cCODE}&scCODE=${scCODE}">◁</a></li>
				</c:if>
				<c:forEach var="i" begin="0" end="2">
					<c:if test="${(startPageNum + i)<=p.totPage}">
						<c:if test="${(startPageNum + i)==p.pag}">
				  			<li class="page-item active"><b><a class="page-link" href="${contextPath}/admin/goodsList?pag=${startPageNum + i}&cCODE=${cCODE}&scCODE=${scCODE}">${startPageNum + i }</a></b></li>
						</c:if>
						<c:if test="${(startPageNum + i)!=p.pag}">
							<li class="page-item"><a class="page-link" href="${contextPath}/admin/goodsList?pag=${startPageNum + i}&cCODE=${cCODE}&scCODE=${scCODE}">${startPageNum + i }</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${p.pag != p.totPage}">
					<li class="page-item"><a class="page-link" href="${contextPath}/admin/goodsList?pag=${p.pag+1}&cCODE=${cCODE}&scCODE=${scCODE}">▷</a></li>
					<li class="page-item"><a class="page-link" href="${contextPath}/admin/goodsList?pag=${p.totPage}&cCODE=${cCODE}&scCODE=${scCODE}">▶</a></li>
				</c:if>
				<c:if test="${p.pag == p.totPage}">
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/goodsList?pag=${p.pag+1}&cCODE=${cCODE}&scCODE=${scCODE}">▷</a></li>
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/goodsList?pag=${p.totPage}&cCODE=${cCODE}&scCODE=${scCODE}">▶</a></li>
				</c:if>
				</ul>            
            </div>
        </div>
        <!-- 페이징 처리 끝 -->		
	</div>
</div>
</body>
</html>