<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 사용할 클래스를 해당 패키지에서 import  -->
<%@ page import ="java.sql.*, java.util.*" %>
<!-- 클라이언트에서 유니코드를 UTF-8로 처리해야함 (MVC Model 1) -->
<!-- JSP에서 내장객체 : import없이 사용가능한 객체
	request 객체 : 클라이언트에서 넘겨주는 정보를 서버에서 받아서 처리,
	response 객체 : 서버에서 클라이언트에게 정보를 처리하는 객체 -->
<% request.setCharacterEncoding("UTF-8"); %>
<!-- DB접속 파일을 include해서 사용 -->
<%@ include file="conn_oracle.jsp" %>

<!-- 폼에서 넘겨주는 변수와 값을 받아서 저장: request.getParameter("변수명); -->
<% 
 	String id=request.getParameter("idx");
	String en=request.getParameter("ename");
 	String ph=request.getParameter("phone");
 	String ge=request.getParameter("gender");
 	String ad=request.getParameter("addr");
 	

	String sql=null;	//sql = SQL 쿼리를 담는 변수
	Statement stmt=null;	//SQL 쿼리를 DB에 적용하는 객체
	stmt=conn.createStatement();
	try{
	sql="insert into guestlab (idx,ename,phone,gender,addr) ";
  	sql=sql+"values('"+id+"', '"+en+"', '"+ph+"','"+ge+"','"+ad+"')";
  	
	int cnt=0;
 	stmt.executeQuery(sql);
 	
	}catch (Exception e){
		out.println ("DataBase Insert 중 문제가 발생 되었습니다. <p/>"); 
		out.println ("고객센터 : 02-1111-1111 로 문의 바랍니다"); 
		//e.printStackTrace();
	}finally{
		//사용한 객체를 close()// connction, statment 객체 메모리에서 제거
		if( conn != null) conn.close();
		if( stmt != null) stmt.close();

	}
  	%>
<% response.sendRedirect("guestlab_list.jsp"); %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>