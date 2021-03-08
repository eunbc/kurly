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
	<link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/kurly.css?after">
	<style>
		.qna-content-default{
			padding : 10px;
			width: 1000px;
			margin: 0 auto;
		}			
		.qna-list-table {
			width: 1000px;
			border-top: 2px solid #5F0080;
			margin-top: 150px;
			font-size: 13px;
		}
		.qna-list-table tr{
			line-height: 60px;
			vertical-align: middle;	
		}
		.qna-list-table tr:not(:first-child):hover{
			background-color: #f7f7f7;
		}
		.qna-list-table tr th{
			text-align: center;
			font-weight: 600;		
			border-bottom: 1px solid black;
		}
		.qna-list-table tr td{
			text-align: center;
			font-weight: 400;		
			border-bottom: 1px solid #F5F5F5;
		}	
		.qna-list-table tr td:nth-child(3){
			text-align: left;
		}
		.qna-list-table tr td a.title-decoration-none{
			text-decoration: none;
			color: black;
		}	
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
	    .non-item {
	    	text-align: center;
	        height: 30px;
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
        .qNumber {
        	padding: 0 30px;
        }
        .qTitle {
        
        }
        .qName {
        	margin-right: 100px;
        	padding: 0 30px;
        }
        .qWdate {
        	padding: 0 30px;
        }
		#table {display: table; width: 1000px;}
		.table-row {display: table-row; width: 100%;}
		.cell {display: table-cell; padding: 2px;}
		.col1 {width: 70px;text-align: left; padding-left:50px;}
		.col2 {width: 300px;text-align: left;}        
		.col3 {width: 80px;text-align: center;}        
		.col4 {width: 80px;text-align: center;}        
		.col5 {width: 70px;text-align: center;}        
		.col6 {width: 70px;text-align: center;}        
	</style>
	<script>
		$(document).ready(function() {
		    'use strict';
		    $('.item').on("click", function () {
		        $(this).next().slideToggle(100);
		        $('p').not($(this).next()).slideUp('fast');
		    });
		});   
		function deleteReview(rIDX) {
			var ans = confirm("해당 후기를 삭제하시겠습니까?");
			if(!ans) return false;

			var query = {
			        rIDX : rIDX
			    };
			   
		    $.ajax({
		    	url : "${contextPath}/admin/reviewDelete",
		    	type : "post",
		    	data : query,
		    	success : function(data){
		    		alert("후기를 삭제하였습니다.")
		    	}
		    });
		   
			
		}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav_admin.jsp"%>
<div class="qna-content-default">
	<div class="view-title">
		<br>
		<h3>후기 관리</h3>
	</div>
	<table class="qna-list-table">
		<tr> 
			<th style="width:70px">번호</th>
			<th style="width:350px">제목</th>
			<th style="width:80px">작성자</th>
			<th style="width:80px">작성일</th>
			<th style="width:70px">도움</th>
			<th style="width:70px">조회</th>
		</tr>
	</table>
	
    <section class="accordion">
    	<c:if test="${empty vos}">
	        <div class="non-item">
	        	등록된 상품 후기가 없습니다.
			</div>    	
		</c:if>    
    	<c:if test="${!empty vos}">
		    <c:forEach var="rVo" items="${vos}">
				<div id="table">
					<div class="table-row item">
						<span class="cell col1">${curScrNo}</span>
						<span class="cell col2">${rVo.rTITLE}
						</span>
						<span class="cell col3">${rVo.rNAME}</span>
						<span class="cell col4">${fn:substring(rVo.rWDATE,0,10)}</span>
						<span class="cell col5">${rVo.rHELP}</span>
						<span class="cell col6">${rVo.rVIEW}</span>
					</div>
				    <p>
				   	    ${fn:replace(rVo.rCONTENT,newLine, "<br/>")}
			            <br>
			            <!-- 이미지 파일  -->
	  		            <c:set var="orfname" value="${rVo.rRFNAME}"/>
			            <c:set var="rfname" value="${rVo.rRFNAME}"/>
			            <c:set var="rfnameLen" value="${fn:length(rfname)}"/>
			            <c:set var="rfname" value="${fn:substring(rfname, rfnameLen-4, rfnameLen-1)}"/>
			            <c:set var="rfname" value="${fn:toUpperCase(rfname)}"/>
			            <c:if test="${rfname=='JPG' || rfname=='GIF' || rfname=='PNG'}">
				            <c:set var="img" value="${fn:split(orfname,'/')}"/>
				            <c:forEach var="imgItem" items="${img}" varStatus="st">
				                <img src="${contextPath}/resources/review/${imgItem}" width="350px"/><br/>
				            </c:forEach>
			            </c:if>
				   	    <br>
				   	    <input type="button" class="button-outline-small" value="도움이 돼요 ${rVo.rHELP}"/>
				   	    <input type="button" class="btn btn-danger" onclick='deleteReview(${rVo.rIDX})' value="삭제"/>
				    </p>
				</div>
			    <hr/>			
			    <c:set var="curScrNo" value="${curScrNo-1}"/>
	        </c:forEach>			
    	</c:if>
    </section>

    <div class="row">
        <div class="col-12">
			<ul class="pagination justify-content-center" style="margin:20px 0">
			<c:set var="startPageNum" value="${p.pag- (p.pag-1)%(p.blockSize)}"/>
	  			<li class="page-item"><a class="page-link" href="${contextPath}/admin/review?pag=1&pageSize=${p.pageSize}">◀</a></li>
				<c:if test="${p.pag != 1}">
		  			<li class="page-item"><a class="page-link" href="${contextPath}/admin/review?pag=${p.pag-1}&pageSize=${p.pageSize}">◁</a></li>
				</c:if>
				<c:if test="${p.pag == 1}">
		  			<li class="page-item"><a class="page-link" href="${contextPath}/admin/review?pag=1&pageSize=${p.pageSize}">◁</a></li>
				</c:if>
				<c:forEach var="i" begin="0" end="2">
					<c:if test="${(startPageNum + i)<=p.totPage}">
						<c:if test="${(startPageNum + i)==p.pag}">
				  			<li class="page-item active"><b><a class="page-link" href="${contextPath}/admin/review?gIDX=${gIDX}pag=${startPageNum + i}&pageSize=${p.pageSize}">${startPageNum + i }</a></b></li>
						</c:if>
						<c:if test="${(startPageNum + i)!=p.pag}">
							<li class="page-item"><a class="page-link" href="${contextPath}/admin/review?pag=${startPageNum + i}&pageSize=${p.pageSize}">${startPageNum + i }</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${p.pag != p.totPage}">
					<li class="page-item"><a class="page-link" href="${contextPath}/admin/review?pag=${p.pag+1}&pageSize=${p.pageSize}">▷</a></li>
				</c:if>
				<c:if test="${p.pag == p.totPage}">
					<li class="page-item"><a class="page-link" href="${contextPath}/admin/review?pag=${p.totPage}&pageSize=${p.pageSize}">▷</a></li>
				</c:if>
				<li class="page-item"><a class="page-link" href="${contextPath}/admin/review?pag=${p.totPage}&pageSize=${p.pageSize}">▶</a></li>
			</ul>            
           </div>
       </div>
   		
</div>
</body>
</html>