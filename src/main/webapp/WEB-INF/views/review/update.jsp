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
	<script>
		function writeCheck() {
			
			var rTITLE = writeForm.rTITLE.value;
			var rCONTENT = writeForm.rCONTENT.value;
			
			if(rTITLE=="") {
				alert("제목을 입력하세요.");
				writeForm.rTITLE.focus();
				return false;
			}
			else if(rCONTENT=="") {
				alert("내용을 입력하세요.");
				writeForm.rCONTENT.focus();
				return false;
			}

			//파일 체크
	        var file = writeForm.file.value;
	        var ext = file.substring(file.lastIndexOf(".")+1);  // 화일의 확장자만 구하기
	        var uExt = ext.toUpperCase();  // 확장자를 대문자로 치환
	        
	        if(file.indexOf(" ") != -1) {
	            alert("파일명 안에는 공백을 포함할 수 없습니다.");
	            return false;
	        }
			else {
				writeForm.submit();
		    }
		}  
		
	    // 동적폼 파일박스 추가
	    var cnt = 1;
	    function fileAdd() {
		    cnt++;
		    var fileIn = "";
		    fileIn += "<div id='dBox"+cnt+"'>";
		    fileIn += "<input type='file' name='file' id='fname"+cnt+"' class='form-control-file border' style='width:80%;float:left;' accept='.zip,.jpg,.gif,.png,.hwp,.ppt,.pptx'/>";
		    fileIn += "<button type='button' onclick='javascript:deleteBox("+cnt+")' id='delBox'"+cnt+"' class='btn' style='width:20%'>삭제</botton>";
		    fileIn += "</div>";
		    $("#fileInsert").append(fileIn);
	    }
  
	    // 동적 파일박스의 삭제버튼을 클릭하면~
	     function deleteBox(cnt) {
		     $("#dBox"+cnt).remove();
	     }	
	    
		// 선택된 첨부파일의 삭제(기존에 업로드된 파일)
		function pdsFileDelCheck(fname,rfname) {
			var ans = confirm("현재 자료 첨부파일("+fname+")을 삭제하시겠습니까?")
			if(!ans) {
				return false;
			}
			  
			var query = {
				rIDX    : ${vo.rIDX},
				fnames : "${vo.rFNAME}",
				rfnames: "${vo.rRFNAME}",
				fname  : fname,
				rfname : rfname
			};
			  
			$.ajax({
				url : "${contextPath}/review/deleteFile",
				type: "get",
				data: query,
				success:function(data) {
					if(data != null) {
				  		alert("삭제 완료되었습니다.");
				  		location.reload();
			  		}
			  		else {
				  		alert("한개 이상의 파일을 업로드 하셔야 합니다.");
			  		}
		  		}
			});
		}	    
	</script>
	<style>
		.qna-section{
			width: 1000px;
			margin: 0 auto;
		}
		.qna-section-title{
			font-size: 20px;
		}
		.qna-write-table {
			width: 1000px;
			border-top: 2px solid black;
			margin-top: 37px;
			font-size: 13px;
		}
		.qna-write-table tr td{
			padding: 10px 10px 10px 20px;
			border-bottom: 1px solid #F6F6F6;
		}
		.qna-write-table tr td:first-child {
			width: 120px;
			text-align: left;
			font-weight: 400;		
			vertical-align: middle;
			background-color: #F7F5F8;
		}
		
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<div class="content-default">
	<div class="qna-section">
		<div class="qna-section-title">PRODUCT REVIEW</div>
		<div>
			상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.
		</div>
		<form name="writeForm" method="post" action="${contextPath}/review/write" enctype="Multipart/form-data">
			<table class="qna-write-table">
				<tr> 
					<td>작성자</td>
					<td><input type="text" name="rNAME" value="${sname}" readonly="readonly" class="input-box" maxlength="100"/></td>
				</tr>
				<tr> 
					<td>주문번호</td>
					<td><input type="text" name="oNVOICE" value="${vo.oNVOICE}" readonly="readonly" class="input-box" maxlength="100"/></td>
				</tr>
				<tr> 
					<td>후기 제목</td>
					<td><input type="text" name="rTITLE" value="${vo.rTITLE}" class="form-control" maxlength="50"/></td>
				</tr>
				<tr> 
					<td>내용</td>
					<td><textarea name="rCONTENT" rows="10" class="form-control">${vo.rCONTENT}</textarea></td>
				</tr>
				<tr> 
					<td>파일첨부</td>
					<td>
						<div class="form-group">
							<label for="fname">파일첨부 :(확장자 gif,jpg,png만 가능, 각각 10MB이내의 파일)</label>
					      	<input type="button" value="파일추가" onclick="fileAdd()"/>
						    
						    <c:set var="fnames" value="${fn:split(vo.rFNAME,'/')}"/>
						    <c:set var="rrFNAMEs" value="${fn:split(vo.rFNAME,'/')}"/>
						    <c:if test="${!empty vo.rFNAME}">
							    <c:forEach var="fname" items="${fnames}" varStatus="st">
							      - ${st.count}. 업로드된 파일명 : ${fname}
							      <input type="button" value="삭제" onclick="pdsFileDelCheck('${fname}','${rfnames[st.index]}')"/>
							      <br/>
							    </c:forEach>
						    </c:if>
							<input type="file" class="form-control-file border" name="file" id="fname1" accept='.gif,.jpg,.png'/>
						</div>
						<div class="form-group"id="fileInsert"></div>
					</td>
				</tr>
			</table>
			<p><br/></p>
			<input type="hidden" name="mMID" value="${smid}"/>
			<input type="hidden" name="gIDX" value="${vo.gIDX}"/>
			<input type="button" onclick="writeCheck()" class="button" style="margin-left: 390px" value="등록"/>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>