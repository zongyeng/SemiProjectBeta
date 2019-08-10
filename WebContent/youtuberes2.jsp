<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<%
	String videoid = request.getParameter("videoid");
%>
</head>

<script type="text/javascript">
	
	window.onload = function(){
			var videoid = '<%=videoid%>';
			alert(videoid);
			window.opener.selectyoutubeid(videoid);
			self.close();
		}
	
</script>
  <body>
  </body>
</html>