<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
 <link rel="stylesheet" href="../resources/css/join.css">
 <%@ include file="../includes/header.jsp" %>
</head>
<body>
	<div class="container-md sign-up">
		<h1 class="sub">회원가입</h1>
		<div class="inner">
		<form action="/member/join" method="post" id="joinForm">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
			<table>
				<tr>
					<th><label class="sign-up txt">아이디</label></th>
					<td>
						<div class="sign-up id form">
						<input type="text" id="id" name="mid" onkeyup="checkReg(event)"/>
						<input type="hidden" name="id_chk" value="false"/>
						<!-- id ajax 중복체크 -->
						<span class="id_ok">사용 가능한 아이디입니다.</span>
						<span class="id_already">이미 사용중인 아이디입니다.</span>
						</div>
					</td>
				</tr>
				<tr>
					<th><label class="sign-up txt">비밀번호</label> </th>
					<td>
						<div class="sign-up pw form">
							<input type="password" name="mpw"/>
						</div>
					</td>
				</tr>
				<tr>
					<th><label class="sign-up txt">비밀번호 확인</label> </th>
					<td>
						<div class="sign-up pw form">
							<input type="password" name="mpwChk"/>
							<label class="pw_ok">비밀번호가 일치합니다.</label>
							<label class="pw_mismatch">비밀번호가 일치하지않습니다.</label>
						</div>
					</td>
				</tr>
				<tr>
					<th><label class="sign-up txt">이름</label> </th>
					<td>
						<div class="sign-up name form">
							<input type="text" name="mname"/>
						</div>
					</td>
				</tr>
				<tr>
					<th><label class="sign-up txt">연락처</label> </th>
					<td>
						<div class="sign-up phone form">
							<select name="phone1">
								<option value="010" selected>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
							</select>&nbsp;-
							<input type="text" name="phone2" maxlength="4" onkeyup="phoneCheckReg(event)"/>&nbsp;-
							<input type="text" name="phone3" maxlength="4" onkeyup="phoneCheckReg(event)"/>
						</div>
					</td>
				</tr>
				<tr>
					<th><label class="sign-up txt">이메일</label> </th>
					<td>
						<div class="sign-up email form">
							<input type="text" name="email1"/>&nbsp;@ 
							<select name="email2" onchange="email_chk(this.value)">
								<option value="google.com" selected>google.com</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.com">daum.com</option>
								<option value="etc">직접입력</option>
							</select>
							<input type="text" name="email3" disabled/>
						</div>
					</td>
				</tr>
				<tr>
					<th><label class="sign-up txt">주소</label></th>
					<td>
						<div class="sign-up address form">
							<input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호">
							<input class="Btn" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" name="address" id="sample6_address" placeholder="주소"><br>
							<input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소">
							<input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit" id="formsubmit">회원가입</button>
						<button type="reset">지우기</button>
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

$("#formsubmit").on("click",function(e){
	e.preventDefault();
	let form = $("#joinForm");
	
	//전부 제대로 입력되었을 때
	let pw_chk = $('input[name="mpwChk"]');
	let phone1 = $('select[name="phone1"]');
	let phone2 = $('input[name="phone2"]');
	let phone3 = $('input[name="phone3"]');
	let email1 = $('input[name="email1"]');
	let email2 = $('select[name="email2"]');
	let email3 = $('input[name="email3"]');
	let addr1 = $('input[name="postcode"]');
	let addr2 = $('input[name="address"]');
	let addr3 = $('input[name="detailAddress"]');
	let addr4 = $('input[name="extraAddress"]');
	
	let str = "<input type='hidden' name='phone' value='"+phone1.val()+phone2.val()+phone3.val()+"'/>";
	
	if(email2.val() == "etc"){
		str += "<input type='hidden' name='email' value='"+email1.val()+"@"+email3.val()+"'/>";	
	}else if(email2.val() != "etc"){
		str += "<input type='hidden' name='email' value='"+email1.val()+"@"+email2.val()+"'/>";
	}
	str += "<input type='hidden' name='address' value='("+addr1.val()+") "+addr2.val()+"/"+addr3.val()+"'/>";
	
	

	console.log(str);
	if($("input[name='mid']").val() == "") {
		alert("아이디를 입력하세요");
		$("input[name='mid']").focus();
		return false;
	}			
	if($("input[name='mpw']").val() == "" || $("input[name='mpw']").val() != $("input[name='mpwChk']").val()) {
		alert("비밀번호를 확인해주세요");
		$("input[name='mpw']").focus();
		return false;
	}
	if($("input[name='mname']").val() == "") {
		alert("이름을 입력하세요");
		$("input[name='mname']").focus();
		return false;
	}		
	if($("select[name='phone1']").val() == "" || $("input[name='phone2']").val() == "" || $("input[name='phone3']").val() == "") {
		alert("연락처를 입력하세요");
		$("input[name='phone2']").focus();
		return false;
	}
	if(email2.val()=="etc"){
		if(email1.val() == "" || email3.val() == "") {
			alert("이메일을 입력하세요");
			email1.focus();
			return false;
		}
	}else if(email2.val() != "etc"){
		if(email1.val() == "") {
			alert("이메일을 입력하세요");
			email1.focus();
			return false;
		}
	}
	if($("input[name='postcode']").val() == "" || $("input[name='address']").val() == "") {
		alert("주소를 입력하세요");
		$("input[name='postcode']").focus();
		return false;
	}
	if($("input[name='detailAddress']").val() == "") {
		alert("상세주소를 입력하세요");
		$("input[name='detailAddress']").focus();
		return false;
	}
	if($("input[name='id_chk']").val() == "false"){
		alert("아이디를 확인해주세요");
		$("input[name='mid']").focus();
		return false;
	}

	form.append(str).submit();
})
function checkReg(event){
	const idRegExp = /[^0-9a-zA-Z]/g;
	const del = event.target;
	if(idRegExp.test(del.value)){
		del.value = del.value.replace(idRegExp, '');
	}
}
function phoneCheckReg(event){
	const RegExp = /[^0-9]/g;
	const del = event.target;
	if(RegExp.test(del.value)){
		del.value = del.value.replace(RegExp, '');
	}
}
function email_chk(val){
	let einput = document.querySelector('input[name="email3"]');
	if(val == "etc"){
		einput.value = "";
		einput.disabled = false;
	}else{
		einput.value = "";
		einput.disabled = true;
	}
}

$(document).ready(function(){
	//요소의 변경이 있으면 콜백함수실행 
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";
	//비밀번호 재확인 함수
	$("input[name='mpwChk']").change(function(){
		const value = $('input[name="mpwChk"]').val();
		const pw = $('input[name="mpw"]').val();
		if(value == "" || pw == "" || value == null || pw == null){
			$('.pw_ok').css('display', 'none');
			$('.pw_mismatch').css('display', 'none');	
		}else{
			if(value == pw){
				$('.pw_ok').css('display', 'block');
				$('.pw_mismatch').css('display', 'none');
			}else if(value != pw){
				$('.pw_ok').css('display', 'none');
				$('.pw_mismatch').css('display', 'block');
			}	
		}
	});
	$("input[name='mpw']").change(function(){
		const value = $('input[name="mpwChk"]').val();
		const pw = $('input[name="mpw"]').val();
		
		if(value == "" || pw == "" || value == null || pw == null){
			$('.pw_ok').css('display', 'none');
			$('.pw_mismatch').css('display', 'none');	
		}else{
			if(value == pw){
				$('.pw_ok').css('display', 'block');
				$('.pw_mismatch').css('display', 'none');
			}else if(value != pw){
				$('.pw_ok').css('display', 'none');
				$('.pw_mismatch').css('display', 'block');
			}	
		}
	});
	$("input[name='mid']").change(function(){
		//가상의 폼을 생성(폼태그)
		let formData = new FormData();
		let inputFile = $("input[name='mid']");
		formData.append("mid", $(this).val());
		
		$.ajax({
			url: '/member/idCheck',
			processData : false,
			contentType: false,
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			data: formData,
			type: 'POST',
			dataType: 'json',
			success : function(result){
				if(inputFile.val() == "" || inputFile.val() == null){
					$('.id_ok').css('display', 'none');
					$('.id_already').css('display', 'none');
					$('input[name="id_chk"]').attr("value", "false");
				}else{
					if(result.result == 'true'){
						$('.id_ok').css('display', 'block');
						$('.id_already').css('display', 'none');
						$('input[name="id_chk"]').attr("value", "true");
					}else if(result.result == 'false'){
						$('.id_ok').css('display', 'none');
						$('.id_already').css('display', 'block');
						$('input[name="id_chk"]').attr("value", "false");
					}	
				}
			}
		})
	});
});
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
<%@ include file="../includes/footer.jsp" %>