<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3.pageContext</title>
</head>
<body>
	<h3>3.pageContext 내장객체</h3>
	
	<h4>include</h4>
	<!-- include = 삽입 -->
	<% 
	   // pageContext 내장객체 동적 include
	      pageContext.include("./inc/header.jsp");
	      pageContext.include("./inc/footer.jsp");
	%>
	
	<h4>forward</h4>
	<a href="./proc/forward1.jsp">포워드1</a>
	<a href="./proc/forward2.jsp">포워드2</a>
	
</body>
</html>