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
	<link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/kurly.css?after">
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>
	<style>
		.add-goods{
			height:300px;
			background-color: #F7F7F7;
			padding: 30px 40px 40px 50px;
			border-radius: 10px;
		}
		label{
			font-weight: 800;
		}
		.add-table{
			height:350px;
			background-color: #F7F7F7;
			padding: 10px 40px 40px 50px;
			border-radius: 10px;
		}
		.add-table-left{
			width:60%;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav_admin.jsp"%>
<div class="content-default">
	<div class="view-title">
		<h3>상품 등록</h3>
	</div>
	<div class="admin-content-small">
		<p style="text-align: right;"><span class="necessary">*</span>필수입력사항</p>
		<form name="goodsForm" method="post" enctype="Multipart/form-data">
			<div class="add-goods">
				<label for="cCODE">대분류 선택<span class="necessary">*</span></label>
				<select class="input-box" id="category" name="cCODE">
					<option value="">선택하세요</option>
					<c:forEach var="cVo" items="${cVos}">
						<option value="${cVo.cCODE}">[${cVo.cCODE}]${cVo.cNAME}</option>
					</c:forEach>
				</select>
				
				<label for="scCODE">중분류 선택	<span class="necessary">*</span></label>
				<select class="input-box" id="subcategory" name="scCODE">
					<option value="">선택하세요</option>
				</select>	
						
				<br/><br/>	
				<label for="gNAME">상품이름<span class="necessary">*</span></label>
				<input type="text" class="form-control" name="gNAME"/>

				<label for="gSHORT">간단상품설명<span class="necessary">*</span></label>
				<input type="text" class="form-control" name="gSHORT"/>
				
				<br/>
				<label for="gIMAGE">썸네일 이미지<span class="necessary">*</span></label>
				<input type="file" name="file"/>
			</div>
			<hr/>
			<div class="add-table">
				<div class="add-table-left">
					<br/>	
					<label for="gSTOCK">재고(개)<span class="necessary">*</span></label>
					<input type="text" class="form-control" name="gSTOCK"/>
					
					<label for="gPRICE">상품원가<span class="necessary">*</span></label>
					<input type="text" class="form-control" onkeyup="numberWithCommas(this.value)" id="gPRICE"/>
					<input type="hidden" name="gPRICE" id="realgPRICE"/>
					
					<label for="gNAME">할인율(%)<span class="necessary">*</span></label>
					<input type="radio" name="gDISCOUNT" class="gDISCOUNTrdbtn" value="0"/>&nbsp;없음
					<input type="radio" name="gDISCOUNT" class="gDISCOUNTrdbtn" value="10"/>&nbsp;10%
					<input type="radio" name="gDISCOUNT" class="gDISCOUNTrdbtn" value="20"/>&nbsp;20%
					<input type="radio" name="gDISCOUNT" class="gDISCOUNTrdbtn" value="30"/>&nbsp;30%
					<input type="checkbox" id="writeDirectly" name="gDISCOUNTchkbox"/>직접입력
					<input type="text" class="form-control" name="gDISCOUNT" id="gDISCOUNTtxtbox" onkeyup="calculate(this.value)" readonly="readonly"/>
					
					<label for="gNAME">할인 후 가격</label>
					<input type="text" class="form-control" id="PRICEafterDISCOUNT" readonly="readonly"/>
				</div>
			</div>
			<div>
				<label for="gDETAIL">상세정보<span class="necessary">*</span></label>
				<textarea name="gDETAIL" class="form-control" id="CKEDITOR"></textarea>
				<script type="text/javascript">
					CKEDITOR.replace("gDETAIL", {
						uploadUrl:"${contextPath}/imageUpload",	//드래그 앤 드롭					
						filebrowserUploadUrl: "${contextPath}/imageUpload", //파일은 이 경로로 업로드
						height : 400
					});
				</script>
			</div>
			<br/>
			<p style="text-align:center;"><input type="button" onclick="writeCheck()" class="button" value="등록하기"/></p>
		</form>	
	</div>
</div>
</body>
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
			
			//할인율 선택시
	        $('.gDISCOUNTrdbtn').click(function() {
	            var check = $('input:checkbox[id="writeDirectly"]').is(':checked');
				if(check) {
	            	$("input:checkbox[name='gDISCOUNTchkbox']").prop("checked",false);
	            	$("#gDISCOUNTtxtbox").val('');
	            	$("#gDISCOUNTtxtbox").attr('readonly','readonly');
				}	
				//할인율 적용후의 가격,백원 단위로 절삭 
				$("#PRICEafterDISCOUNT").val(Math.floor(($("#gPRICE").val().replace(/,/g,"") - $("#gPRICE").val().replace(/,/g,"") * this.value * 0.01)/100)*100);
	        });
			
			//할인율 직접입력 클릭시
	        $('#writeDirectly').click(function () {
	            var check = $('input:checkbox[id="writeDirectly"]').is(':checked');
	            if(check)  {
	            	$('#gDISCOUNTtxtbox').removeAttr('readonly');
	            	$("input:radio[name='gDISCOUNT']").prop("checked",false);
	            }
	            else if(!check) $('#gDISCOUNTtxtbox').attr('readonly','readonly');
	        });		
	        
		});
		
		//상품 가격 입력시 콤마 처리
		function numberWithCommas(x) {
			x = x.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
			x = x.replace(/,/g,'');          // ,값 공백처리
			$("#gPRICE").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ",")); // 정규식을 이용해서 3자리 마다 , 추가 
			$("#realgPRICE").val(x);  
		}

		//할인율 직접입력시 입력하는 값에 따라 계산하는 함수
		function calculate(x) {
			x = x.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
			x = x.replace(/,/g,'');          // ,값 공백처리
			if(x>100) {
				alert("100미만의 수를 입력해주세요!");
				$("#gDISCOUNTtxtbox").val('');
				return;
			}
			$("#PRICEafterDISCOUNT").val(Math.floor(($("#gPRICE").val().replace(/,/g,"") - $("#gPRICE").val().replace(/,/g,"") * x * 0.01)/10)*10);  
		}
		
		function writeCheck() {
			var cCODE = goodsForm.cCODE.value;
			var scCODE = goodsForm.scCODE.value;
			var gNAME = goodsForm.gNAME.value;
			var gSHORT = goodsForm.gSHORT.value;
			var gSTOCK = goodsForm.gSTOCK.value;
			
			if(cCODE=="") {
				alert("대분류를 선택하세요.");
				return false;
			}
			else if(scCODE=="") {
				alert("중분류를 선택하세요.");
				return false;
			}
			else if(gNAME=="") {
				alert("상품명을 입력하세요.");
				return false;
			}
			else if(gSHORT=="") {
				alert("간단 설명을 입력하세요.");
				return false;
			}
			else if(gSTOCK=="") {
				alert("재고를 입력하세요.");
				return false;
			}
			else {
				goodsForm.submit();
			}
		}
	</script>
</html>