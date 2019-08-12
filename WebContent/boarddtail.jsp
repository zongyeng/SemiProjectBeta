<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<h1>글 상세 페이지</h1>
	
	<table border="1">
		<tr>
			<th>번   호</th>
			<td>${dto.boardno }</td>
		</tr>
		<tr>
			<th>제   목</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
		</tr>
		<tr>
			<th>내   용</th>
			<td><textarea rows="10" cols="60">${dto.content }</textarea></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${dto.regdate }</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="location.href='board.do?command=update&boardno=${dto.boardno}'"/>
				<input type="button" value="삭제" onclick="location.href='board.do?command=delete&boardno=${dto.boardno}'"/>
				<input type="button" value="답변" onclick="location.href='board.do?command=answer&boardno=${dto.boardno}'"/>
				<input type="button" value="목록" onclick="location.href='board.do?command=list'"/>
			</td>
		</tr>
	</table>

</body>
</html>