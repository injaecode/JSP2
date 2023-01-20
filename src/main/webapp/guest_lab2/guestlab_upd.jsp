<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="java.sql.*, java.util.*" %>
 <%@ include file="conn_oracle.jsp"%>
 
 <%
 
 	String sql=null;
 	Statement stmt=null;
 	PreparedStatement pstmt=null;
 	ResultSet rs=null;
 	
 	int id=Integer.parseInt(request.getParameter("id"));
 	String p = request.getParameter("page");
 	
 	try{
 		sql="select * from guestlab where idx=?";
 		pstmt=conn.prepareStatement(sql);
 		pstmt.setInt(1,id);
 		rs=pstmt.executeQuery();
 		
 		if(!(rs.next())){
 			out.println("해당 내용이 database에 존재하지 않습니다.");
 			
 		}else{
 			
 		}
 	}catch (Exception e){
 		
 	}finally{
 		if(conn !=null) conn.close();
 		if (stmt !=null) stmt.close();
 		if (pstmt !=null) pstmt.close();
 		if (rs!=null) rs.close();
 		
 	}
 %>
<!DOCTYPE html>
<html>
<head>
<SCRIPT language="javascript">
function check() {
 with(document.msgwrite){			
  if(subject.value.length == 0){
   alert("제목을 입력해 주세요!!");
   subject.focus();
   return false;
  }
  if(name.value.length == 0){
   alert("이름을 입력해 주세요!!");
   name.focus();
   return false;
  }
  if(password.value.length == 0){
   alert("비밀번호를 입력해 주세요!!");
   password.focus();
   return false;
  }
  if(content.value.length == 0){
   alert("내용을 입력해주세요!!");
   content.focus();
   return false;
  }
  document.msgwrite.submit();
 }
}
</SCRIPT> 
<link href="filegb.css" rel="stylesheet" type="text/css">
<P>

<FORM name="msgwrite" method=POST action="guestlab_upddb.jsp">

<input type="hidden" name="id" value="<%= id %>">
<input type="hidden" name="p" value="<%= p %>">

 <table width="600" cellspacing="0" cellpadding="2" align = "center">
</head>
<body>
<FORM name="msgwrite" method=POST action="freeboard_upddb.jsp">

<input type="hidden" name="id" value="<%= id %>">
<input type="hidden" name="p" value="<%= p %>">

 <table width="600" cellspacing="0" cellpadding="2" align = "center">
  <tr> 
	   <td colspan="2" bgcolor="#1F4F8F" height="1"></td>
  </tr>
	  <tr> 
	   <td colspan="2" bgcolor="#DFEDFF" height="20" class="notice">&nbsp;&nbsp;<font size="2">글 수정하기</font></td>
	</tr>
	<tr> 
	   <td colspan="2" bgcolor="#1F4F8F" height="1"></td>
	</tr>
	<tr> 
		   <td width="124" height="30" align="center" bgcolor="#f4f4f4">이 름</td>
		   <td width="494"  style="padding:0 0 0 10"> 
		    <input type=text name=ename value="" class="input_style1">
		   </td>
  </tr>
  <tr> 
   <td width="124" align="center"  bgcolor="#f4f4f4">연락처</td>
   <td width="494" style="padding:0 0 0 10" height="25"> 
    <input type=text name=phone value="" class="input_style1">
   </td>
  </tr>
  <tr> 
   <td width="124" align="center"  bgcolor="#f4f4f4">성 별</td>
   <td width="494" style="padding:0 0 0 10" height="25"> 
    <input type=text name=gender value="" class="input_style1">
   </td>
  </tr>
  <tr> 
   <td width="124" align="center" valign="top" bgcolor="#f4f4f4">주 소</td>
   <td  style="padding:0 0 0 10" height="25"> 
    <input width="206" type=text name=addr value="" class="input_style1">
   </td>

  </tr>
  <tr> 
   <td width="124" align="center"  bgcolor="#f4f4f4">암 호</td>
   <td width="494" style="padding:0 0 0 10" height="25"> 
    <input type='password' name='password'  class="input_style1"><br>(정확한 비밀번호를 입력해야만 수정이 됩니다.)
   </td>
  </tr>
  <tr> 
   <td colspan="2" height="1" class='button'></td>
  </tr>
  <tr> 
   <td colspan="2" height="1" bgcolor="#1F4F8F"></td>
  </tr>
  <tr> 
   <td colspan="2" height="10"></td>
  </tr>
  <tr> 
   <td colspan="2" align="right"> 
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
     <tr> 
      <td width="64%">&nbsp;</td>
      <td width="12%"><a href="#" onClick="check();"><img src="images/ok.gif" border="0"></a></td>
      <td width="12%"><a href="#" onClick="history.go(-1)"><img src="images/cancle.gif"  border="0"></td>
      <td width="12%"><A href="freeboard_list.jsp"> <img src="images/list.jpg" border=0></a></td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</FORM>
</body>
</html>