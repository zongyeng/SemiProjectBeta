<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function formCheck(){
	
	//var writer = document.forms[0].writer.value;
	//var title = document.forms[0].title.value;
	//var content = document.forms[0].content.value;
	
	// if (login writer) return true;
	// else              return false;
	
	// submit을 제외한 모든 input태그의 갯수를 가져옴
	var length = document.forms[0].length-1; 
	
	for(var i = 0; i < length; i++){
	 
	    if(document.forms[0][i].value == null || document.forms[0][i].value == ""){
	        alert(document.forms[0][i].name + "을/를 입력하세요.");
	        document.forms[0][i].focus();           
	        return false;
	    }
	 
	}
	return true;
}

</script>

</head>
<body>

	<h1>글 수정 페이지</h1>
	
	<form action="board.do" method="post" onsubmit="return formCheck();">
		<input type="hidden" name="command" value="updateres"/>
		<input type="hidden" name="boardno" value="${dto.boardno }" />
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" readonly="readonly" value="${dto.writer }"/></td>
			</tr>
			<tr>
				<th>제   목</th>
				<td><input type="text" name="title" value="${dto.title }"/></td>
			</tr>
			<tr>
				<th>제   목</th>
				<td><textarea rows="10" cols="60" name="content" >${dto.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="제출"/>
				<input type="button" value="목록" onclick="location.href='board.do?command=list'"/>
				</td>
			</tr>
		</table>
	
	</form>

</body>
</html>