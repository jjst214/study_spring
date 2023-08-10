<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<style>
.id_ok{
color:#008000;
display: none;
}

.id_already{
color:#6A82FB; 
display: none;
}
</style>
<body>
	<label for="address2">아이디</label> 
	<input type="text" id="id" name="mid" oninput = "checkId()" >
								
	<!-- id ajax 중복체크 -->
	<span class="id_ok">사용 가능한 아이디입니다.</span>
	<span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
</body>
<script>
function checkId(){
    var id = $('#id').val(); //id값이 "id"인 입력란의 값을 저장
    $.ajax({
        url:'/member/idCheck', //Controller에서 요청 받을 주소
        type:'post', //POST 방식으로 전달
        data:{id:id},
        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
            if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                $('.id_ok').css("display","inline-block"); 
                $('.id_already').css("display", "none");
            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                $('.id_already').css("display","inline-block");
                $('.id_ok').css("display", "none");
                alert("아이디를 다시 입력해주세요");
                $('#id').val('');
            }
        },
        error:function(){
            alert("에러입니다");
        }
    });
};
</script>
</html>