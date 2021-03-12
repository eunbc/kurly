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
    <style type="text/css">
        .imgs_wrap {
            width: 600px;
            margin-top: 50px;
        }
        .imgs_wrap img {
            max-width: 200px;
        }
    </style>	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        var sel_files = [];
 
        $(document).ready(function() {
            $("#file").on("change", handleImgsFilesSelect);
        }); 
 
        function handleImgsFilesSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
 
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
 
                sel_files.push(f);
 
                var reader = new FileReader();
                reader.onload = function(e) {
                    var img_html = "<img src=\"" + e.target.result + "\" />";
                    $(".imgs_wrap").append(img_html);
                }
                reader.readAsDataURL(f);
            });
        }
 
		function writeCheck() {
			var iTITLE = writeForm.iTITLE.value;
			var iCATEGORY = writeForm.iCATEGORY.value;
			var iCONTENT = writeForm.iCONTENT.value;
			
			if(iTITLE=="") {
				alert("제목을 입력하세요.");
				writeForm.iTITLE.focus();
				return false;
			}
			else if(iCATEGORY=="") {
				alert("분류를 선택하세요.");
				return false;
			}
			else if(iCONTENT=="") {
				alert("내용을 입력하세요.");
				writeForm.iCONTENT.focus();
				return false;
			}
			else {
				writeForm.submit();
			}
		}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<div class="content-default">
	<div class="subNav">
		<h2 style="font-weight: 600">&nbsp;고객센터</h2>
		<ul class="subNavMenu">
			<li><a href="${contextPath}/board/list">공지사항</a></li>
			<li><a href="${contextPath}/faq/list">자주하는 질문</a></li>
			<li><a href="${contextPath}/inquiry/list" class="subNavMenuClicked">1:1문의</a></li>
		</ul>
	</div>
	<div class="section">
		<span class="section-title">1:1문의 작성</span>
		<form name="writeForm" method="post" action="${contextPath}/inquiry/write" enctype="Multipart/form-data">
			<table class="write-table">
				<tr> 
					<td>제목</td>
					<td><input type="text" name="iTITLE" class="form-control" maxlength="100"/></td>
				</tr>
				<tr> 
					<td>분류</td>
					<td>
						<select name="iCATEGORY" class="form-control" style="width: 200px;">
							<option value="">선택해주세요.</option>
							<option value="배송지연/불만">배송지연/불만</option>
							<option value="반품문의">반품문의</option>
							<option value="환불문의">환불문의</option>
							<option value="회원정보문의">회원정보문의</option>
							<option value="기타문의">기타문의</option>
						</select>
					</td>
				</tr>
				<tr> 
					<td>주문번호</td>
					<td><input type="text" name="oNVOICE" value="${oNVOICE}" class="form-control" maxlength="100"/></td>
				</tr>
				<tr> 
					<td>내용</td>
					<td>
						<b>1:1문의 작성 전 확인해주세요!</b><p><br/></p>
						현재 문의량이 많아 답변이 지연되고 있습니다. 문의 남겨주시면 2일 이내 순차적으로 답변 드리겠습니다.<br/>
						제품 하자 혹은 이상으로 반품(환불)이 필요한 경우 사진과 함께 구체적인 내용을 남겨주세요.<p><br/></p>
						<textarea name="iCONTENT" rows="10" class="form-control"></textarea>
					</td>
				</tr>
				<tr> 
					<td>이미지</td>
					<td>
						<input type="file" multiple="multiple" name="file" id="file" accept=".zip,.jpg,.gif,.png"/><p><br/></p>
						<p>-파일 형식은 .zip,.jpg,.gif,.png만 허용합니다.</p>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<div class="imgs_wrap">

						</div>
					</td>
				</tr>
			</table>
			<p><br/></p>
			<input type="hidden" name="mMID" value="${smid}"/>
			<input type="button" onclick="writeCheck()" class="button" style="margin-left: 290px" value="등록"/>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>