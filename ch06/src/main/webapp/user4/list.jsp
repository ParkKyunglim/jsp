<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="user4.User4VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";

	List<User4VO> users = new ArrayList<>();
	
	try{
		// 1단계 - JDBC 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2단계 - 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// 3단계 - SQL실행 객체 생성
		Statement stmt = conn.createStatement();
		
		// 4단계 - SQL실행
		String sql = "select * from `User4`";
		ResultSet rs = stmt.executeQuery(sql);
		
		// 5단계 - 결과처리
		while(rs.next()){
			User4VO vo = new User4VO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setGender(rs.getString(3));
			vo.setAge(rs.getInt(4));
			vo.setHp(rs.getString(5));
			vo.setAddr(rs.getString(6));
			
			users.add(vo);
		}
		
		// 6단계 - 데이터베이스 종료
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>User4::list</title>
</head>
<body>
	<h3>User4 목록</h3>
	
	<a href="/ch06/1.JDBCTest.jsp">처음으로</a>
	<a href="/ch06/user4/register.jsp">등록</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>나이</th>
			<th>휴대폰</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
		
		<% for(User4VO vo : users){ %>
		<tr>
			<td><%= vo.getUid() %></td>
			<td><%= vo.getName() %></td>
			<td><%= vo.getGender() %></td>
			<td><%= vo.getAge() %></td>
			<td><%= vo.getHp() %></td>
			<td><%= vo.getAddr() %></td>
			<td>
				<a href="/ch06/User4/modify.jsp?uid=<%= vo.getUid() %>">수정</a>
				<a href="/ch06/User4/delete.jsp?uid=<%= vo.getUid() %>" class="del">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
</body>
</html>




