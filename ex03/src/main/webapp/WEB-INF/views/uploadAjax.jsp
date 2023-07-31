<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>
	<div class="uploadResult">
		<ul>
			
		</ul>
	</div>
	<button id="uploadBtn">업로드</button>
	<script>
		$(document).ready(function(){
			//버튼 클릭할때 실행
			
			//input 초기화를 위한 복사(input이 포함된 div를 복사)
			let cloneobj = $(".uploadDiv").clone();
			
			//등록한 이미지 나타내기
			let uploadResult = $(".uploadResult ul");
			function showUploadFile(uploadResultArr){
				let str = "";
				$(uploadResultArr).each(function(i, obj){
					//str += "<li>"+obj.fileName+"</li>";
					let fileCallpath = encodeURIComponent(obj.uploadPath+"/s_"+obj.fileName);
					str += "<li><img src='/display?fileName="+fileCallpath+"'/>"+
							"<span class='imgDeleteBtn' data-file=\'"+fileCallpath+"\' data-type='image'>X</span>"+"</li>"
				})
				uploadResult.append(str);
			}
			
			//정규 표현식 - 확장자 검사(exe, sh, zip, alz) 검사
			let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			let maxSize = 52428880;	//5MB 지정
			function checkExtension(fileName, fileSize){
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드 할 수 없습니다.");
					return false;
				}
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;
				}
				return true;
			}
			
			//파일 삭제 'X'표시에 대한 이벤트 처리
			$(".uploadResult").on("click","span", function(e){
				let targetFile = $(this).data("file");
				let type = $(this).data("type");
				console.log(targetFile);
				$.ajax({
					url:'/deleteFile',	//요청경로
					data:{fileName: targetFile, type: type},	//전송테이터
					dataType: 'text',	//응답데이터타입
					type: 'POST',		//전송메소드타입
					success: function(result){	//전송성공시 실행
						alert(result);
					}
				})
			})
			
			$("#uploadBtn").on('click', function(){
				let formData = new FormData();
				let inputFile = $("input[name='uploadFile']");
				let files = inputFile[0].files;
				console.log(files);	
				for(var i=0; i<files.length; i++){
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					formData.append("uploadFile", files[i]);	
				}
				$.ajax({
					url: '/uploadAjaxAction',
					data: formData,
					type: 'POST',
					dataType: 'json',
					processData: false,
					contentType: false,
					success: function(result){
						console.log(result);
						showUploadFile(result);
						$(".uploadDiv").html(cloneobj.html());
					}
				});
			});
		})
	</script>
</body>
</html>