<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ include file="conn_oracle.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<% 
	int id = Integer.parseInt(request.getParameter("id"));
	String p = request.getParameter("page");
	
	String idx = request.getParameter("idx");
	String ena = request.getParameter("ename");
	String pho = request.getParameter("phone");
	String gen = request.getParameter("gender");
	String add = request.getParameter("addr");
	String pw = request.getParameter("password");
	
		
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
[ <a href="guestlab_list.jsp?go<%= p %>">게시판 목록으로</a>]

<% 

	String sql=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		sql="select * from freeboard where idx=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,id);
		rs=pstmt.executeQuery();
		
		if (!(rs.next())){ //rs의 값이 존재 하지 않을때
			out.println ( "DB에 해당 내용이 존재하지 않습니다"); 
		}else { //rs의 값이 존재 할때 
			String pwd = rs.getString("password"); 
			if (pwd.equals(pw)){
				//update 진행 
				sql = "update guestlab set ename=?, phone=?,"; 
				sql += "gender=?, addr=? where idx =?"; 
				pstmt = conn.prepareStatement(sql); 
				pstmt.setString(1, ena); 
				pstmt.setString(2, pho); 
				pstmt.setString(3, gen); 
				pstmt.setString(4, add); 
				pstmt.setString(5, idx); 
				
				pstmt.executeUpdate(); 
				
				out.println ("<p/> 내용이 잘 수정 되었습니다."); 
				
			} else {
				//패스워드가 다릅니다 출력 
				out.println ("패스워드가 일치 하지 않습니다."); 
			}
	}
	
	}catch(Exception e){
		out.println("DB 저장 시 오류가 발생했습니다.");
		e.printStackTrace();
	}finally{
		if(conn !=null) conn.close();
		if(pstmt !=null) pstmt.close();
		if(rs !=null) rs.close();
	}
%>
</body>
</html>