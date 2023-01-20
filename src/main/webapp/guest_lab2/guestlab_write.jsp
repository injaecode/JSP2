<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "java.sql.* , java.util.*" %>
    <%@ include file="conn_oracle.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 : 클라이언트 폼</title>
<link href="filegb.css" rel="stylesheet" type="text/css">
<style>
	div{
		width:800px; margin-left:0 auto;}
	#write{font-size:20px; color:white;}
</style>
<script>
	function check(){
		with(document.fileglwrite){
			if(idx.value.length==0){
				alert("아이디를 입력해주세요");
				idx.focus();
				return false;
			}
			if (ename.value.length==0){
				alert("이름을 입력해주세요");
				ename.focus();
				return false;
			}
			if (phone.value.length==0){
				alert("연락처를 입력해주세요");
				phone.focus();
				return false;
			}
			if (gender.value.length==0){
				alert("성별을 입력해주세요");
				gender.focus();
				return false;
			}
			if (addr.value.length==0){
				alert("주소를 입력해주세요");
				addr.focus();
				return false;
			}
			document.fileglwrite.submit();
		}
	}
</script>
<link href="filegb.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form name="fileglwrite" method="post" action="guestlab_save.jsp">
	<div>
		<table width="600px" cellspacing="0" cellpadding="2">
		 <tr>
		 	<td colspan="2" bgcolor="#1F4F8F" height="1"></td>
		 </tr>
		 <tr>
		 	<td colspan="2" bgcolor="#1F4F8F" height="1"><span id="write">글쓰기</span></td>
		 </tr>
		 <tr>
		 	<td>아이디 : </td>
		 	<td><input type="text" name="idx" class="input_style1"></td>
		</tr>
		<tr>
			<td>이름 : </td>
		 	<td><input type="text" name="ename" class="input_style1"></td>
		</tr>
		<tr>
			<td>연락처 : </td>
		 	<td><input type="text" name="phone" class="input_style1"></td>
		</tr>
		<tr>
			<td>성별 : </td>
		 	<td><input type="text" name="gender" class="input_style1"></td>
		</tr>
		<tr>
			<td>주소 : </td>
		 	<td><input type="text" name="addr" class="input_style1"></td>
		</tr>

		<tr>                                        
      <td>암호 : </td>                 
       <td><input type=password name=password class="input_style1"><br>(비밀번호를 입력하면 수정 또는 삭제가 가능합니다.)
      </td>                                       
     </tr> 
		<tr>
			<td colspan="2" > <!-- 취소/확인/글쓰기 이미지를 처리 -->
				<table width="100%" border="0" cellspacing="0" cellpading="0">
					<tr>
						<td width="28%">&nbsp;</td>
						<td width="51%">&nbsp;</td>
						<td width="12%"><a href="#"  onClick="history.go(-1)">
						<img src="images/cancle.gif" width="46px" height="20px"></a></td>
						<td width="9%"><a href="#" onclick="check();"> 
						<img src="images/ok.gif" width="46px" height="20px"></a></td>
						
					</tr>
				</table>
			</td>
		</tr>
		</table>
	</div>
	</form>
	
</body>
</html>