<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="sub1.UserDTO">


</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>전송 데이터 수신</h3>
	<p>
		아이디 : <%= user.getUid() %><br>
		이름 : <%= user.getName() %><br>
		휴대폰 : <%= user.getHp() %><br>
		나이 : <%= user.getAge() %><br>
	</p>
</body>
</html>