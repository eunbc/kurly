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
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<script>
		function categoryCheck() {
			var fCATEGORY = categoryForm.fCATEGORY.value;
			location.href="${contextPath}/faq/list?fCATEGORY="+fCATEGORY;
		}
		
		function faqDelete(fIDX,fCATEGORY) {
			var query = {
					fIDX : fIDX,
					pag : ${p.pag},
					fCATEGORY : fCATEGORY
			}
			
			$.ajax({
				url : "${contextPath}/faq/delete",
				type : "get",
				data : query,
				success : function(data) {
					if(data ==1) {
						location.reload();
					}
				}
			});
		}
		$(document).ready(function() {
		    'use strict';
		    $('.item').on("click", function () {
		        $(this).next().slideToggle(100);
		        $('p').not($(this).next()).slideUp('fast');
		    });
		});    
	</script>
	<style>
		.accordion{
			margin-top:20px;
		    width: 830px;
		    cursor: pointer;
		    background-color: white;
		}    
		.accordion p{
	        padding: 30px;
	        display: none;
	        color: gray;
	    }
	    .item{
	        height: 30px;
	    }   
	    .item h6{
	        display: inline-block;
	        vertical-align: middle;
	        height: 100%;
	        padding-left: 5px;
		}
        .item h6:before{
            content: "";
            display: inline-block;
            vertical-align: middle;
            height: 100%;
        } 
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div class="content-default">
	<div class="subNav">
		<h2 style="font-weight: 600">&nbsp;고객센터</h2>
		<ul class="subNavMenu">
			<li><a href="${contextPath}/board/list">공지사항</a></li>
			<li><a href="${contextPath}/faq/list"  class="subNavMenuClicked">자주하는 질문</a></li>
			<li><a href="${contextPath}/inquiry/list">1:1문의</a></li>
		</ul>
	</div>
	<div class="section">
		<div>
			<span class="section-title">자주하는 질문 </span><span class="explanation-gray">고객님들께서 가장 자주하시는 질문을 모두 모았습니다. </span>
			<p><br/></p>
			<form name="categoryForm" style="width:200px;" onchange="categoryCheck()">
				<select class="form-control" name="fCATEGORY">
				    <option value="">선택</option>
				    <option value="회원문의" <c:if test="${fCATEGORY=='회원문의'}">selected</c:if>>회원문의</option>
				    <option value="주문/결제" <c:if test="${fCATEGORY=='주문/결제'}">selected</c:if>>주문/결제</option>
				    <option value="취소/교환/반품" <c:if test="${fCATEGORY=='취소/교환/반품'}">selected</c:if>>취소/교환/반품</option>
				    <option value="배송문의" <c:if test="${fCATEGORY=='배송문의'}">selected</c:if>>배송문의</option>
				    <option value="서비스 이용 및 기타" <c:if test="${fCATEGORY=='서비스 이용 및 기타'}">selected</c:if>>서비스 이용 및 기타</option>
				</select>
			</form>
		</div>
		<table class="list-table">
			<tr> 
				<th style="width:100px">번호</th>
				<th style="width:600px">제목</th>
			</tr>
		</table>
	    <section class="accordion">
		    <c:forEach var="vo" items="${vos}">
		        <div class="item">
			        <h6><span style="margin: 0 30px 0 50px;font-weight: 400;">${curScrNo}</span><span style="margin-left: 50px;">${vo.fTITLE}</span></h6>
			    </div>
			    <p>
			   	    <i class="xi-font"></i>${fn:replace(vo.fCONTENT,newLine, "<br/>")}
			        <c:if test="${sname=='관리자'}">
				        <a href="javascript:faqDelete('${vo.fIDX}','${vo.fCATEGORY}');">삭제</a>
				    </c:if>	   
			    </p>
			    <hr/>			
			    <c:set var="curScrNo" value="${curScrNo-1}"/>
	        </c:forEach>			
	    </section>
		
		<c:if test="${sname=='관리자'}">
			<div style="text-align: right;">
				<input type="button" class="button-small" onclick="location.href='${contextPath}/faq/write'" value="글쓰기"/>
			</div>
		</c:if>
		
		<!-- 페이징 처리 시작 -->
	    <div class="row">
	        <div class="col-12">
				<ul class="pagination justify-content-center" style="margin:20px 0">
				<c:set var="startPageNum" value="${p.pag- (p.pag-1)%(p.blockSize)}"/>
				<c:if test="${p.pag != 1}">
		  			<li class="page-item"><a class="page-link" href="${contextPath}/faq/list?pag=1&fCATEGORY=${fCATEGORY}">◀</a></li>
		  			<li class="page-item"><a class="page-link" href="${contextPath}/faq/list?pag=${p.pag-1}&fCATEGORY=${fCATEGORY}">◁</a></li>
				</c:if>
				<c:if test="${p.pag == 1}">
		  			<li class="page-item disabled"><a class="page-link" href="${contextPath}/faq/list?pag=1&fCATEGORY=${fCATEGORY}">◀</a></li>
		  			<li class="page-item disabled"><a class="page-link" href="${contextPath}/faq/list?pag=${p.pag-1}&fCATEGORY=${fCATEGORY}">◁</a></li>
				</c:if>
				<c:forEach var="i" begin="0" end="2">
					<c:if test="${(startPageNum + i)<=p.totPage}">
						<c:if test="${(startPageNum + i)==p.pag}">
				  			<li class="page-item active"><b><a class="page-link" href="${contextPath}/faq/list?pag=${startPageNum + i}&fCATEGORY=${fCATEGORY}">${startPageNum + i }</a></b></li>
						</c:if>
						<c:if test="${(startPageNum + i)!=p.pag}">
							<li class="page-item"><a class="page-link" href="${contextPath}/faq/list?pag=${startPageNum + i}&fCATEGORY=${fCATEGORY}">${startPageNum + i }</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${p.pag != p.totPage}">
					<li class="page-item"><a class="page-link" href="${contextPath}/faq/list?pag=${p.pag+1}&fCATEGORY=${fCATEGORY}">▷</a></li>
					<li class="page-item"><a class="page-link" href="${contextPath}/faq/list?pag=${p.totPage}&fCATEGORY=${fCATEGORY}">▶</a></li>
				</c:if>
				<c:if test="${p.pag == p.totPage}">
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/faq/list?pag=${p.pag+1}&fCATEGORY=${fCATEGORY}">▷</a></li>
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/faq/list?pag=${p.totPage}&fCATEGORY=${fCATEGORY}">▶</a></li>
				</c:if>
				</ul>            
            </div>
        </div>
      <!-- 페이징 처리 끝 -->		
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>