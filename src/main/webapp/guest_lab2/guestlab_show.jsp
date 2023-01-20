<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "java.sql.* , java.util.*" %>
    <%@ include file="conn_oracle.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 DB 출력</title>
<link href="filegb.css" rel="stylesheet" type="text/css">

<style>
	div{width:600px; margin:0 auto;
	}
	table, tr, td{
	padding : 5px;
	border-collapse:collapse;}
</style>
</head>
<body>
<%


	String sql=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	sql="select * from guestlab order by to_number(idx) desc";
	
	stmt=conn.createStatement();
	
	rs=stmt.executeQuery(sql);
	
	if(rs.next()){
		do{
	
%>

<div>
<table width="600px"  border="1px">
		
		 <tr>
		 	<td>아이디 : <%= rs.getString("idx") %></td>

			<td>이름 : <%= rs.getString("ename") %></td>
		</tr>
		<tr>
			<td>연락처 : <%= rs.getString("phone") %></td>
		
			<td>성별 : <%= rs.getString("gender") %></td>
		</tr>
		<tr>
			<td colspan="2">주소 : <%= rs.getString("addr") %></td>
		</tr>

		</table>
			<p/> <p/> 
</div>
<% 
		}while(rs.next());//커서 위치를 다음레코드로 이동 
	}else{			//레코드 존재하지 않을때
		out.println("데이터가 존재하지 않습니다");
	}
	
	%>
<div>
<a href="guestlab_write.html"><img src="images/write.gif" width="100px"></a>
</div>
</body>
</html>