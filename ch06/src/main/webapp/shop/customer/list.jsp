<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.CustomerVO"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	List<CustomerVO> customers = new ArrayList<>();	

	try{
	//1단계 - JNDI 서비스 객체 생성
	Context initCtx = new InitialContext();
	Context ctx = (Context) initCtx.lookup("java:comp/env"); // 자바 환경 이름
	
	//2단계 - 커넥션 풀에서 커넥션 객체 가져오기
	DataSource ds = (DataSource) ctx.lookup("jdbc/shop");	
	Connection conn = ds.getConnection();
	
	//3단계 - SQL실행 객체 생성
	Stmtement stmt = conn.createStatement();
	
	//4단계 - SQL 실행
	ResultSet rs = stmt.executeQuery("select * from customer"); 
	
	//5단계 - 결과처리
	while(rs.next()){
		CustomerVO vo = new CustomerVO();
		vo.setCustId(rs.getString);
		vo.setName(rs.getString);
		vo.setHp(rs.getString);
		vo.setAddr(rs.getString);
		vo.setRdate(rs.getString);
		customerd.add(vo);
	}
	
	//6단계 - 커넥션 반납
	}catch(Exception e) {
	



%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>customer::list</title>
</head>
<body>

 	<h3>고객목록</h3>
   
   		<a href="/ch06/2.DBCPTest.jsp">처음으로</a>
   		<a href="/ch06/shop/register.jsp">등록</a>
   		
   	<table border="1">
      <tr>
         <th>고객아이디</th>
         <th>고객명</th>
         <th>휴대폰</th>
         <th>주소</th>
         <th>가입일</th>
         <th>관리</th>
      </tr>
      
      <%for(CustomerVO vo : customers){ %>
       <tr>
         <th><%= vo.getCustId() %></th>
         <th><%= vo.getName() %></th>
         <th><%= vo.getHp() %></th>
         <th><%= vo.getAddr() %></th>
         <th><%= vo.getRdaste() %></th>
         <th>
         <a href="#">수정</a>
         <a href="##">삭제</a>
         </th>
      </tr>
      <% } %>
      </table>
</body>
</html>