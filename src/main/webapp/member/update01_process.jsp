<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="java.sql.*, java.util.*" %>
 <%@ include file="conn_oracle.jsp"%>
 <% request.setCharacterEncoding("UTF-8"); %>
 <%
 
	String sql=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	if(!(rs.next())){
		out.println("해당 내용이 database에 존재하지 않습니다.");
		
	}else{
		String DBid=rs.getString("id");
		String DBpw=rs.getString("passwd");
		try{
			if(id.equals(DBid)){
				if(pa.equals(DBpw)){
					sql="update mbtbl set name= '"+name+"', '"+email+"', '"+city+"', '"+phone+"')";
				stmt.executeUpdate(sql);
				out.println("<p/>내용이 수정되었습니다.");
				
				}else{
					out.println("패스워드가 일치하지 않습니다");
				}
			}else{
				out.println("아이디가 일치하지 않습니다");
			}
			}
		
	}
	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>