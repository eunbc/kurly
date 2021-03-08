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
			margin-top: 10px;
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
		.col1 {width: 400px;text-align: left; padding-left:40px;}
		.col2 {width: 600px;}        
		.col3 {width: 150px;text-align: center;}        
		.col4 {width: 150px;text-align: center;}        
	</style>
	<script>
		$(document).ready(function() {
		    'use strict';
		    $('.item').on("click", function () {
		        $(this).next().slideToggle(100);
		        $('p').not($(this).next()).slideUp('fast');
		    });
		});    
	</script>
</head>
<body>
<div class="qna-content-default">
	<table class="qna-list-table">
		<tr> 
			<th style="width:100px">번호</th>
			<th>제목</th>
			<th style="width:150px">작성자</th>
			<th style="width:150px">작성일자</th>
		</tr>
	</table>
	
    <section class="accordion">
    	<c:if test="${empty qVos}">
	        <div class="non-item">
	        	등록된 상품 문의가 없습니다.
			</div>    	
		</c:if>    
    	<c:if test="${!empty qVos}">
		    <c:forEach var="qVo" items="${qVos}">
				<div id="table">
					<div class="table-row item">
						<span class="cell col1">${curScrNo}</span>
						<span class="cell col2">
			        		<c:if test="${qVo.qSECRET eq 'Y'}"><i class="xi-lock-o"></i></c:if>
			        		<c:if test="${qVo.qLEVEL eq 1}"><i class="xi-subdirectory-arrow"></i></c:if>
			        		${qVo.qTITLE}
						</span>
						<span class="cell col3">${qVo.qNAME}</span>
						<span class="cell col4">${fn:substring(qVo.qWDATE,0,10)}</span>
					</div>
				    <p>
				    	<c:if test="${qVo.qSECRET=='N' || qVo.mMID==smid || sname=='관리자'}">
					   	    ${fn:replace(qVo.qCONTENT,newLine, "<br/>")}
   				    	</c:if>
				    	<c:if test="${qVo.qSECRET=='Y' && qVo.mMID!=smid && sname!='관리자'}">
							비공개
						</c:if>
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
	  			<li class="page-item"><a class="page-link" href="${contextPath}/qna/list?gIDX=${gIDX}&pag=1&pageSize=${p.pageSize}">◀</a></li>
				<c:if test="${p.pag != 1}">
		  			<li class="page-item"><a class="page-link" href="${contextPath}/qna/list?gIDX=${gIDX}&pag=${p.pag-1}&pageSize=${p.pageSize}">◁</a></li>
				</c:if>
				<c:if test="${p.pag == 1}">
		  			<li class="page-item"><a class="page-link" href="${contextPath}/qna/list?gIDX=${gIDX}&pag=1&pageSize=${p.pageSize}">◁</a></li>
				</c:if>
				<c:forEach var="i" begin="0" end="2">
					<c:if test="${(startPageNum + i)<=p.totPage}">
						<c:if test="${(startPageNum + i)==p.pag}">
				  			<li class="page-item active"><b><a class="page-link" href="${contextPath}/qna/list?gIDX=${gIDX}pag=${startPageNum + i}&pageSize=${p.pageSize}">${startPageNum + i }</a></b></li>
						</c:if>
						<c:if test="${(startPageNum + i)!=p.pag}">
							<li class="page-item"><a class="page-link" href="${contextPath}/qna/list?gIDX=${gIDX}&pag=${startPageNum + i}&pageSize=${p.pageSize}">${startPageNum + i }</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${p.pag != p.totPage}">
					<li class="page-item"><a class="page-link" href="${contextPath}/qna/list?gIDX=${gIDX}&pag=${p.pag+1}&pageSize=${p.pageSize}">▷</a></li>
				</c:if>
				<c:if test="${p.pag == p.totPage}">
					<li class="page-item"><a class="page-link" href="${contextPath}/qna/list?gIDX=${gIDX}&pag=${p.totPage}&pageSize=${p.pageSize}">▷</a></li>
				</c:if>
				<li class="page-item"><a class="page-link" href="${contextPath}/qna/list?gIDX=${gIDX}&pag=${p.totPage}&pageSize=${p.pageSize}">▶</a></li>
			</ul>            
           </div>
       </div>
   		
</div>
</body>
</html>