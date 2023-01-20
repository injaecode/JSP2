<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import ="java.sql.*, java.util.*, java.text.*"%>
 <%@ include file="conn_oracle.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컬럼의 특정 레코드를 읽는 페이지</title>
</head>
<body>
<!--  JSP 코드블락 -->
<% 
	//SQL쿼리를 사용할 변수 선언
	String sql=null;
	Statement stmt=null;
	PreparedStatement pstmt=null; //변수를 ?로 처리함
	ResultSet rs=null;
	
	int id=Integer.parseInt(request.getParameter("id"));
	String p=request.getParameter("page");

	sql="Select * from mbtbl where idx = ?";
	pstmt=conn.prepareStatement(sql);	//pstmt 객체 생성시 sql문을 넣는다
	pstmt.setInt(1,id); //1 첫번째 물음표, 들어갈변수	
	rs = pstmt.executeQuery(); //select문인 경우 executeQuery();
								//insert, update, delete문인 경우: executeUpdate();
	

	if(rs.next()){
		

%>

	<table width='600' cellspacing='0' cellpadding='2' align='center'>
			   <tr>
			   <td height='22'>&nbsp;</td></tr>
			   <tr align='center'>
			   <td height='1' bgcolor='#1F4F8F'></td>
			   </tr>
			   <tr align='center' bgcolor='#DFEDFF'>
			   <td class='button' bgcolor='#DFEDFF'> 
			   <div align='center'><font size='4'><strong><%= "회원정보" %></strong></font>
			   </div> </td>
			   </tr>
			   <tr align='center' bgcolor='#FFFFFF'>
			   <td align='center' bgcolor='#F4F4F4'>
			   
			   <table width='100%' border='0' cellpadding='0' cellspacing='4' height='1'>
			   <tr bgcolor='#F4F4F4'>
			   <td width='13%' height='7'></td>
			   <td width='51%' height='7'>NO : <%= rs.getString("idx") %> </td>
			   <td width='13%' height='7'></td>
			   </tr>
			   <tr bgcolor='#F4F4F4'>
			   <td width='13%'></td>
			   <td width='51%'>아이디 : <%= rs.getString("id") %></td>
			   <td width='13%'></td>
			   </tr>
			   <tr>
			   <td width='13%'></td>
			   <td width='25%'>비밀번호 : <%= rs.getString("passwd") %></td>
			   <td width='11%'></td>
			   </tr>
			    <tr bgcolor='#F4F4F4'>
			   <td width='13%' height='7'></td>
			   <td width='51%' height='7'>이름 : <%= rs.getString("name") %> </td>
			   <td width='13%' height='7'></td>
			   </tr>
			   <tr bgcolor='#F4F4F4'>
			   <td width='13%'></td>
			   <td width='51%'>이메일 : <%= rs.getString("email") %></td>
			   <td width='13%'></td>
			   </tr>
			   <tr>
			   <td width='13%'></td>
			   <td width='25%'>지역 : <%= rs.getString("city") %></td>
			   <td width='11%'></td>
			   </tr>
			   <tr>
			   <td width='13%'></td>
			   <td width='25%'>연락처 : <%= rs.getString("phone") %></td>
			   <td width='11%'></td>
			   </tr>
			   </table>
			   
			   
			   </td>
			   </tr>
			   </table>
	<%
		}else{ 
			out.println("해당 레코드는 존재하지 않습니다");
		}
	%>	
		
   <table width="600" border="0" cellpadding="0" cellspacing="5">
	<tr> 
		<td align="right" width="1850"><A href="list01.jsp?go=<%= request.getParameter("page")%>"><img src="image/list.jpg" border=0></a></td>
		<td width="100" align="right"><A href="update01.jsp?id=<%= id %>&page=<%= request.getParameter("page") %>"><img src="image/edit.jpg" border=0></A></td>

		<td width="100" align="right"><A href="delete01.jsp?id=<%= id %>&page=<%= request.getParameter("page") %>"><img src="image/del.jpg" border=0></A></td>
	</tr>
  </table>

</BODY>
</HTML>

<%--
	//읽기 페이지 마지막에서 글 조회수 늘리기
	sql="update freeboard set readcount=readcount+1 where id="+ id;
	//statement 객체의 select/insert/update 쿼리인 경우 executeUpdate()를 실행
	//statement 객체의 select 쿼리인 경우 executeQuery(sql)를 설명, ResultSet 객체로 리턴
	stmt=con.createStatement();
	stmt.executeUpdate(sql);
--%>