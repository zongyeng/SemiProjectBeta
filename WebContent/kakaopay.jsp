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
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
</script>

</head>

<body>
	
	<%@ include file="./form/header.jsp" %>
	 
	 
	        <script>
             
            $( document ).ready( function() {
                 
                $("#button").click(function(){
 
                        alert($(this).attr('value'));
 
                });
         
            });
 
        </script>
	
	
<h1>결제 목록</h1>
	<form action="kakaopayres.jsp" method="post">
		<select name="keylist">
			<option value="1000" >1000</option>
			<option value="3000" >3000</option>
			<option value="5000" >5000</option>
			<option value="10000" >10000</option>
			<option value="20000" >20000</option>
			<option value="30000" >30000</option>
			<option value="50000" >50000</option>
		</select>
		<input id="button" type="submit" value="go">
	</form>
	
	
	<%@ include file="./form/footer.jsp" %>
	
	
</body>
</html>