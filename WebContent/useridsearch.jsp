<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="login.do">
	<input type="hidden" name="command" value="searchid" />
	<table>
		<tr>
			<td>등록이름 : </td>
			<td><input type="text" name="name" value="" /></td>
		</tr>
		<tr>
			<td>등록 핸드폰 번호 : </td>
			<td><input type="text" name="phone" value="" /></td>
		</tr>
		<tr>
			<td><input type="submit" value="찾기" /></td>
		</tr>
	</table>
</form>

</body>
</html>