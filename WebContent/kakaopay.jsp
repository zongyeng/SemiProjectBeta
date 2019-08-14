<%@page import="semi.dto.UserInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제진행</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
     <script>
     $( document ).ready( function() {
	 $("#button").click(function(){
	 alert($(this).attr('value'));
 		});
	 });
      </script>
	<div style="width : 30%; margin : 0 auto; text-align: center;">
		<h3 style = "margin : 0 auto;">결제 하기</h3>
	</div>
	<table style=" width : 100%; position:absolute; top:40%; margin : 0 auto; ">
	<colgroup>
		<col width ="20%">
		<col width ="45%">
		<col width ="20%">
	</colgroup>
	<tr>
		<td> 결제금액 : </td>
		<td>
			<form action="kakaopayres.jsp" method="post">
				<select name="keylist" style="width : 100%;">
					<option value="1000" >1000</option>
					<option value="3000" >3000</option>
					<option value="5000" >5000</option>
					<option value="10000" >10000</option>
					<option value="20000" >20000</option>
					<option value="30000" >30000</option>
					<option value="50000" >50000</option>
				</select>
			</form>
		</td>
		<td>
			<input id="button" type="submit" value="결제하기" style="width : 90%;">
		</td>
	</tr>
	</table>
</body>
</html>