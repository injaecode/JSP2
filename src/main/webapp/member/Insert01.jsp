<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import = "java.sql.* , java.util.*" %>
<%@ include file="conn_oracle.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력폼</title>

<SCRIPT language="javascript">                              
    function check(){                                         
     with(document.msgwrite){                      
      if(id.value.length == 0){                  
       alert("아이디를 입력해 주세요!!");                       
       id.focus();                           
       return false;                             
      }                                         
      if(passwd.value.length == 0){                   
       alert("암호를 입력해 주세요!!");                  
       passwd.focus();                              
       return false;                                  
      }                                         
      if(name.value.length == 0){              
       alert("이름을 입력해 주세요!!");              
       name.focus();                            
       return false;                               
      }                                        
      if(email.value.length == 0){                    
       alert("이메일을 입력해주세요!!");                   
       email.focus();                         
       return false;                           
      }                                        
      document.msgwrite.submit();                       
     }                                          
    }                                            
    </SCRIPT> 
<link href="filegb.css" rel="stylesheet" type="text/css"> 
</head>
<body>
	<form name="msgwrite" method = "post" action = "insert01_process.jsp"> 
	<center>
	  <table width="400"cellspacing="0" cellpadding="2">           
     <tr>                                        
      <td colspan="2" bgcolor="#1F4F8F" height="1" margin-top="50px"></td>  
     </tr>   
	 <tr>                                        
      <td colspan="2" bgcolor="#DFEDFF" height="20" class="notice">&nbsp;&nbsp;<font size="4">회원 가입</font></td> 
     </tr> 
     <tr>
       <td width="124" height="30" align="center" bgcolor="#f4f4f4">회원번호</td>   
       <td width="494"  style="padding:0 0 0 10"><input type=text name=idx class="input_style1"></td>      
     </tr>  

     <tr>
       <td width="124" height="30" align="center" bgcolor="#f4f4f4">아이디</td>   
       <td width="494"  style="padding:0 0 0 10"><input type=text name=id class="input_style1"></td>      
     </tr>  
     <tr> 
       <td width="124" height="30" align="center" bgcolor="#f4f4f4">패스워드</td>   
       <td width="494"  style="padding:0 0 0 10"><input type=password name=passwd class="input_style1"></td>      
     </tr> 
 	<tr>
       <td width="124" height="30" align="center" bgcolor="#f4f4f4">이름</td>   
       <td width="494"  style="padding:0 0 0 10"><input type=text name=name class="input_style1"></td>      
     </tr> 
     <tr>
       <td width="124" height="30" align="center" bgcolor="#f4f4f4">이메일</td>   
       <td width="494"  style="padding:0 0 0 10"><input type=text name=email class="input_style1"></td>      
     </tr>
     <tr>
       <td width="124" height="30" align="center" bgcolor="#f4f4f4">지역</td>   
       <td width="494"  style="padding:0 0 0 10"><input type=text name=city class="input_style1"></td>      
     </tr> 
     <tr>
       <td width="124" height="30" align="center" bgcolor="#f4f4f4">연락처</td>   
       <td width="494"  style="padding:0 0 0 10"><input type=text name=phone class="input_style1"></td>      
     </tr>  
	<tr>                                        
      <td colspan="2" bgcolor="#DFEDFF" height="20" ><a href="#" onclick="check(this.form)"><input type = "button" value = "전송"> </a> </td> 
     </tr>
	<tr>                                        
      <td colspan="2" bgcolor="#1F4F8F" height="1"></td>  
     </tr>   
		
	</center>
	</form>
	</table>
</body>
</html>

