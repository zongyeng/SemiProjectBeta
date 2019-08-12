<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h1>답변 추가 </h1>
	
	<form action="board.do" method="post">
	<input type="hidden" name="command" value="answerres"/>
	<input type="hidden" name="parentboardno" value="${dto.boardno }" />
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" value="${dto.writer }"/></td>
			</tr>
			<tr>
				<th>제   목</th>
				<td><input type="text" name="title" value="RE:${dto.title }" /></td>
			</tr>
			<tr>
				<th>내   용</th>
				<td><textarea rows="10" cols="60" name="content">${dto.content } -------</textarea></td> 
			</tr>
			<tr>
				<td>
					<input type="submit" value="답변등록" />
					<input type="button" value="취소" onclick="location.href='board.do?command=detail&boardno=&{dto.boardno}'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>