
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	
	/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/
	
	
	var birthJ = false;
	
	var address = $('#mem_detailaddress');
	
	var idKey = 0;
	var emailKey = 0;

$(document).ready(function() {
    var address = $('#mem_detailaddress');

    $('#mid').blur(function() {
        if (idJ.test($('#mid').val())) {
            console.log('true');
            $('#id_check').text('');
        } else {
            console.log('false');
            $('#id_check').text('6자 이상의 영문 혹은 영문과 숫자를 조합');
            $('#id_check').css('font-size', '12px');
    		$('#id_check').css('color', 'black');
            
        }
    });
    
    $('#pwd').blur(function() {
        if (pwJ.test($('#pwd').val())) {
            console.log('true');
            $('#pwd_check').text('');
        } else {
            console.log('false');
            $('#pwd_check').text('10자 이상 영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합');
            $('#pwd_check').css('font-size', '12px');
        }
    });

    //1~2 패스워드 일치 확인
    $('#pwdCheck').blur(function() {
    	if ($('#pwd').val() != $(this).val()) {
    		$('#pwd_Recheck').text('비밀번호가 일치하지 않습니다.');
    		$('#pwd_Recheck').css('color', 'black');
            $('#pwd_Recheck').css('font-size', '12px');
    	} else {
    		$('#pwd_Recheck').text('');
    	}
    });
    
    //아이디 중복확인    
    $("#idCheck").click(function() {
    	if($("#mid").val().trim() == "") {
    		alert("아이디를 입력하세요");
    		$("#mid").focus();
    		return false;
    	}
    	else if($("#mid").val().length<6) {
    		alert("아이디는 6자 이상만 허용합니다");
    		$("#mid").focus();
    		return false;
    	}
    	
    	var query = {mid : $("#mid").val()}
    	
    	$.ajax({
    		url : "idCheck",
    		type : "get",
    		data : query,
    		success : function(data) {
    			if(data == "1") {
    				alert("이미 사용중인 아이디입니다");
    				$("#mid").focus();
    			}
    			else {
    			 	alert("사용 가능한 아이디입니다");
    			 	idKey = 1;
    			 	$("#mid").attr("readonly", true);
    			 	$("#pwd").focus();
    			}
    		}
    	}); 
    });
    
    //이메일 중복확인    
    $("#emailCheck").click(function() {
    	if($("#email").val().trim() == "") {
    		alert("이메일을 입력하세요");
    		$("#email").focus();
    		return false;
    	}
    	
    	var query = {email : $("#email").val()}
    	
    	$.ajax({
    		url : "emailCheck",
    		type : "get",
    		data : query,
    		success : function(data) {
    			if(data == "1") {
    				alert("이미 등록된 이메일입니다. 다시 작성해 주십시요!");
    				$("#email").focus();
    			}
    			else {
    			 	alert("사용이 가능합니다");
    			 	emailKey = 1;
    			 	$("#email").attr("readonly", true);
    			}
    		}
    	});
    });
    
    
    
    
    
    //제출할 때
    
    
    $('form').on('submit',function(){
        var inval_Arr = new Array(8).fill(false);
        if (idJ.test($('#mid').val())) {
            inval_Arr[0] = true;   
        } else {
            inval_Arr[0] = false;
            alert('아이디를 확인하세요.');
            return false;
        }
        // 비밀번호가 같은 경우 && 비밀번호 정규식
        if (($('#pwd').val() == ($('#pwdCheck').val()))
               && pwJ.test($('#pwd').val())) {
            inval_Arr[1] = true;
        } else {
            inval_Arr[1] = false;
            alert('비밀번호를 확인하세요.');
            return false;
        }
        // 이름 정규식
        if (nameJ.test($('#name').val())) {
            inval_Arr[2] = true;   
        } else {
            inval_Arr[2] = false;
            alert('이름을 확인하세요.');
            return false;
        }
        // 생년월일 정규식
        if (birthJ) {
            console.log(birthJ);
            inval_Arr[3] = true; 
        } else {
            inval_Arr[3] = false;
            alert('생년월일을 확인하세요.');
            return false;
        } 
        // 이메일 정규식
        if (mailJ.test($('#email').val())){
            console.log(mailJ.test($('#email').val()));
            inval_Arr[4] = true;
        } else {
            inval_Arr[4] = false;
            alert('이메일을 확인하세요.');
            return false;
        }
        // 휴대폰번호 정규식
        if (phoneJ.test($('#tel').val())) {
            console.log(phoneJ.test($('#tel').val()));
            inval_Arr[5] = true;
        } else {
            inval_Arr[5] = false;
            alert('휴대폰 번호를 확인하세요.');
            return false;
        }
   
        //주소확인
        if(address.val() == ''){
            inval_Arr[7] = false;
            alert('주소를 확인하세요.');
            return false;
        }else
            inval_Arr[7] = true;
      
         //전체 유효성 검사
         var validAll = true;
         for(var i = 0; i < inval_Arr.length; i++){
             if(inval_Arr[i] == false){
                validAll = false;
             }
         }
         if(validAll == true){ // 유효성 모두 통과
            alert('유효성 체크 완료');      
         } else{
            alert('정보를 다시 확인하세요.')
         }
    });




    //이름에 특수문자 들어가지 않도록 설정
    $("#name").blur(function() {
        if (nameJ.test($(this).val())) {
            console.log(nameJ.test($(this).val()));
            $("#name_check").text('');
        } else {
            $('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
            $('#name_check').css('color', 'red');
        }
    });
    
    $("#email").blur(function() {
    	if (mailJ.test($(this).val())) {
    		$("#email_check").text('');
    	} else {
    		$('#email_check').text('이메일 양식을 확인해주세요.');
    		$('#email_check').css('color', 'red');
    	}
    });
   

    // 생일 유효성 검사
    var birthJ = false;
          
    // 생년월일   birthJ 유효성 검사
    $('#birthday').blur(function(){
        var dateStr = $(this).val();      
        var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
        var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
        var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
        var today = new Date(); // 날짜 변수 선언
        var yearNow = today.getFullYear(); // 올해 연도 가져옴
        
        if (dateStr.length <=8) {
          // 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
            if (year > yearNow || year < 1900 ){
        	    $('#birth_check').text('생년월일을 확인해주세요');
        	    $('#birth_check').css('color', 'red');
            }  
            else if (month < 1 || month > 12) {
                
            	$('#birth_check').text('생년월일을 확인해주세요 ');
            	$('#birth_check').css('color', 'red'); 
          
            }else if (day < 1 || day > 31) {
             
            	$('#birth_check').text('생년월일을 확인해주세요 ');
            	$('#birth_check').css('color', 'red'); 
             
            }else if ((month==4 || month==6 || month==9 || month==11) && day==31) { 
            	$('#birth_check').text('생년월일을 확인해주세요 ');
            	$('#birth_check').css('color', 'red'); 
            }else if (month == 2) {
            	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
                
            	if (day>29 || (day==29 && !isleap)) {
                 
            		$('#birth_check').text('생년월일을 확인해주세요 ');
            		$('#birth_check').css('color', 'red'); 
             
            	}else{
            		$('#birth_check').text('');
            		birthJ = true;
            	}
            }else{
            	$('#birth_check').text(''); 
            	birthJ = true;
            }//end of if
     	}else{
            //1.입력된 생년월일이 8자 초과할때 :  auth:false
            $('#birth_check').text('생년월일을 확인해주세요 ');
            $('#birth_check').css('color', 'red');  
     	}
    }); //End of method /*
 
    // 휴대전화
    $('#tel').blur(function(){
    	if(phoneJ.test($(this).val())){
    		console.log(nameJ.test($(this).val()));
    		$("#phone_check").text('');
    	} else {
    		$('#phone_check').text('휴대폰번호를 확인해주세요 ');
    		$('#phone_check').css('color', 'red');
    	}
    });
    
    //체크박스 전체 선택
    $("#termsCheckALl").click(function(){
        if($("#termsCheckALl").prop("checked")){
            $("input[name=terms]").prop("checked",true);
        }else{
            $("input[name=terms]").prop("checked",false);
        }
    })


});

//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
/*	                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
*/	                
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
/*	                if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
*/	            }
    }).open();
}

