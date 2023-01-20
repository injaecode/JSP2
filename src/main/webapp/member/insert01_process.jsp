<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*,java.util.*,java.text.*" %>


<%@ include file = "conn_oracle.jsp" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
String email = request.getParameter("email");
String city = request.getParameter("city");
String phone = request.getParameter("phone");

int idx;

String sql=null;
Statement stmt=null;
ResultSet rs=null;

try{
	stmt=conn.createStatement();
	sql="select max(idx) from mbtbl";
	rs=stmt.executeQuery(sql);
	
	if(!(rs.next())){
		idx=1;
	}else{
		idx=rs.getInt(1)+1;
	}
	sql="insert into mbtbl (idx, id, passwd, name, email,";
	sql+="city,phone) values ("+idx+", '"+id+"', '"+passwd;
	sql+="', '"+name+"', '"+email+"', '"+city+"', '"+phone+"')";
			

	
	stmt.executeQuery(sql);
	out.println(sql);
	
}catch (Exception e){
		out.println("예상치 못한 오류가 발생했습니다.<p/>");
		out.println("고객센터 : 02-1111-1111 <p/>");
}finally{
		if(conn !=null) conn.close();
		if(stmt !=null) stmt.close();
		if(rs !=null) rs.close();
}

%>
<% response.sendRedirect("list01.jsp"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>