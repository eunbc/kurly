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
		.memberList-select{
			text-align: right;
			margin-right: 20px;
		}		
	</style>
	<script>
		function categoryCheck() {
			var mDROPOUT = categoryForm.mDROPOUT.value;
			location.href="${contextPath}/admin/memberList?mDROPOUT="+mDROPOUT;
		}
		function memberDelete(mIDX) {
			var query = {
					mIDX : mIDX,
			}
			$.ajax({
				url : "${contextPath}/admin/memberDelete",
				type : "post",
				data : query,
				success : function(data) {
					alert("탈퇴처리되었습니다.");	
					location.reload();
				}
			});
			
		}
		$(function() {
		    //체크박스 전체 선택
		    $("#checkAll").click(function(){
		        if($("#checkAll").prop("checked")){
		            $(".memberChkbox").prop("checked",true);
		        }else{
		            $(".memberChkbox").prop("checked",false);
		        }
		    });
		    
		    //전체 선택된 상태에서 하나 해제할 때, 전체 선택 해제
		    $(".memberChkbox").click(function(){
	            var check = $('input:checkbox[id="checkAll"]').is(':checked');
		    	if(check){
		            $("#checkAll").prop("checked",false);
		    	}
		    });
			
		    //선택 삭제 버튼 누르면 선택된 항목만 삭제된다
		    $(".selectUpdate_btn").click(function(){
		      	var checkArr = new Array();
		      	var mLEVEL = levelForm.mLEVEL.value;
		      	
		      	if(mLEVEL=='') {
		      		alert("변경할 상태를 선택하세요.");
		      		return false;
		      	}
		      
		      	$("input[class='memberChkbox']:checked").each(function(){
		       		checkArr.push($(this).attr("data-mIDX"));
		      	});
		      	
		    	var ans = confirm(""+checkArr.length+"명의 등급을 수정하시겠습니까?");
		     	if(!ans) return false;

		     	$.ajax({
		       		url : "${contextPath}/admin/memberLevelUpdate",
		       		type : "post",
		       		data : { chbox : checkArr, mLEVEL : mLEVEL},
		       		success : function(){
						location.reload();
		       		}
		      	});
		    });
		}); 		
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav_admin.jsp"%>
<div class="content-default">
	<div class="view-title">
		<h3>회원 목록</h3>
	</div>
	<div class="admin-content">
		<p><br/></p>	
		<form name="categoryForm" style="width:200px;" onchange="categoryCheck()">
			<select class="form-control" name="mDROPOUT" style="margin-left: 50px;">
			    <option value="전체" <c:if test="${mDROPOUT=='전체'}">selected</c:if>>전체</option>
			    <option value="탈퇴" <c:if test="${mDROPOUT=='탈퇴'}">selected</c:if>>탈퇴 신청</option>
			</select>
		</form>
		
		<div class="memberList-select">
			<form name="levelForm">
				<label for="oSTATUS">회원레벨 선택  </label>
				<select class="input-box" id="mLEVEL" name="mLEVEL">
					<option value="">선택하세요</option>
					<option value="일반">일반</option>
					<option value="화이트">화이트</option>
					<option value="라벤더">라벤더</option>
					<option value="퍼플">퍼플</option>
				</select>
				
				<input type="button" class="button-small selectUpdate_btn" value="회원등급변경"/>
			</form>
		</div>		
	
		<table class="admin-list-table">
			<tr> 
				<th style="width:70px"><input type="checkbox" id="checkAll"/>전체</th>
				<th style="width:100px">번호</th>
				<th style="width:200px">회원아이디</th>
				<th style="width:200px">이메일</th>
				<th style="width:200px">가입일자</th>
				<th style="width:100x">회원등급</th>
				<th style="width:100px">회원탈퇴여부</th>
			</tr>
 			<c:forEach var="vo" items="${vos}">
				<tr>
					<td><input type="checkbox" class="memberChkbox" data-mIDX="${vo.mIDX}" /></td>
					<td  style="text-align: center;">${curScrNo}</td>
					<td>${vo.mMID}</td>
					<td>${vo.mEMAIL}</td>
					<td>${fn:substring(vo.mJOINDAY,0,10)}</td>
					<td>
						<c:if test="${vo.mLEVEL=='일반'}">
							<span class="level general">일반</span>
						</c:if>
						<c:if test="${vo.mLEVEL=='화이트'}">
							<span class="level white">화이트</span>
						</c:if>
						<c:if test="${vo.mLEVEL=='라벤더'}">
							<span class="level lavendar">라벤더</span>
						</c:if>
						<c:if test="${vo.mLEVEL=='퍼플'}">
							<span class="level purple">퍼플</span>
						</c:if>
						<c:if test="${vo.mLEVEL=='관리자'}">
							<span class="level admin">관리자</span>
						</c:if>
					</td>
					<td>
						<c:if test="${vo.mDROPOUT=='Y'}">
							<input type="button" class="btn btn-danger" onclick="memberDelete(${vo.mIDX})" value="탈퇴처리"/>
						</c:if>
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
		  			<li class="page-item"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=1">◀</a></li>
		  			<li class="page-item"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=${p.pag-1}">◁</a></li>
				</c:if>
				<c:if test="${p.pag == 1}">
		  			<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=1">◀</a></li>
		  			<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=${p.pag-1}">◁</a></li>
				</c:if>
				<c:forEach var="i" begin="0" end="2">
					<c:if test="${(startPageNum + i)<=p.totPage}">
						<c:if test="${(startPageNum + i)==p.pag}">
				  			<li class="page-item active"><b><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=${startPageNum + i}">${startPageNum + i }</a></b></li>
						</c:if>
						<c:if test="${(startPageNum + i)!=p.pag}">
							<li class="page-item"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=${startPageNum + i}">${startPageNum + i }</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${p.pag != p.totPage}">
					<li class="page-item"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=${p.pag+1}">▷</a></li>
					<li class="page-item"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=${p.totPage}">▶</a></li>
				</c:if>
				<c:if test="${p.pag == p.totPage}">
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=${p.pag+1}">▷</a></li>
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/memberList?mDROPOUT=${mDROPOUT}&pag=${p.totPage}">▶</a></li>
				</c:if>
				</ul>            
            </div>
        </div>
        <!-- 페이징 처리 끝 -->		
	</div>
</div>
</body>
</html>