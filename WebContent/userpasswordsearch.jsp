<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<style type="text/css">
	#codeform{
		display: none;
	}
</style>
</head>
<body>

<form action="login.do">
	<input type="hidden" name="command" value="searchpassword" />
	<table>
		<tr>
			<td>등록ID : </td>
			<td><input type="text" name="ID" value="" /></td>
		</tr>
		<tr>
			<td>등록 이메일 번호 : </td>
			<td><input type="text" name="email" value="" /></td>
		</tr>
		<tr>
			<td><input type="button" value="찾기" onclick="search()" id="searchbutton" /></td>
		</tr>
	</table>
	<table id="codeform">
		<tr>
			<td>인증번호</td>
			<td><input type="text" name="code" value="" /></td>
		</tr>
		<tr>
			<td><input type="button" value="인증" onclick="confrom()" /></td>
		</tr>
	</table>
</form>

</body>

<script type="text/javascript">

function search(){
	$("#searchbutton").val("확인중");
	$("#chk2").attr('disabled', true);
	ID = $("input[name='ID']").val();
	email = $("input[name='email']").val();
	$.ajax({
		type : "post",
		url : "login.do?command=searchpassword",
		data:{"ID":ID,"email":email},
		datatype : "int",
		success : function(data) {
			if(data.indexOf("false")==0){
				alert("실패. 입력값을 재확인 하세요.");
			} else{
				
				email = data.substring(6,data.indexOf("password:")-1);
				password = data.substring(data.indexOf("password:")+9);
				EmailCheckgo(email);
			}
		}
	});
}

function EmailCheckgo(emailchk) {
	var email = $("#email").val();
	 $.ajax({
         type : "post",
         url : "emailCheck.do?command=SendMail",
        data:{"email":emailchk},
         datatype : "int",
         success : function(data) {
			alert("확인 완료. 입력하신 이메일을 확인하고 인증번호를 입력해 주세요.");
            $("#codeform").show();
			codenum=data;
			$("#searchbutton").val("찾기");
			$("#chk2").attr('disabled', false);
         },
		error:function(request,status,error){
			alert("이메일 보내기 실패했습니다. 챗봇에 문의해 보세요.");
			$("#searchbutton").val("찾기");
			$("#chk2").attr('disabled', false);
		}
     });
}
function confrom(){
	var code = $("input[name='code']").val();
	if(codenum.indexOf(code)==0){
		alert("인증되었습니다. 비밀번호는 : '"+password+"' 입니다.");
	} else {
		alert("문자가 다릅니다.");
	}
}


</script>
</html>