<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*,java.util.*" %> 
<%@ include file="conn_oracle.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UT-8">
<title>DB의 내용을 가져와서 출력 하기 </title>
</head>
<body>



<table width = "600" border="1"> 
	<tr> 
		<th> 회원번호 </th>
		<th> 아이디 </th> 
		<th> 비밀번호 </th> 
		<th> 이름 </th> 
		<th>email</th> 
		<th> city</th>
		<th>phone</th>  
	</tr>
	
	<%
	
	//1. 페이징 처리부분 1 : 벡터 변수, paging 처리변수 선언 블락 
	//=================================================
	Vector idx = new Vector(); 
	Vector id = new Vector();
	Vector passwd = new Vector();
	Vector name = new Vector();
	Vector email = new Vector();
	Vector city = new Vector();	
	Vector phone = new Vector();
	
	
	int where = 1; 	
	
	int totalgroup=0;
	int maxpages = 5; 			
	int startpage = 1; 
	int endpage = startpage + maxpages -1 ; 
	int wheregroup = 1; 	
	
	if(request.getParameter("go") !=null){	//freeboard_list03.jsp?go=
		where = Integer.parseInt(request.getParameter("go")); //go 변수의 값을 where 변수에 할당
		wheregroup = (where-1)/maxpages+1; //현재 내가 속한 그룹을 알 수 있다.
		startpage = (wheregroup-1)*maxpages+1;
		endpage = startpage+maxpages-1;
		
		//gogroup변수를 넘겨받아서 startpage, endpage, where의 정보를 알아낼 수 있다
			//코드 블락
	}else if(request.getParameter("gogroup") !=null){ //freeboard_list03.jsp?gogroup=
	 	wheregroup = Integer.parseInt(request.getParameter("gogroup")); //현재 내가 위치한 그룹
		startpage = (wheregroup-1) * maxpages+1;
	 	where = startpage;
	 	endpage = startpage+maxpages-1;
	}
	
	int nextgroup=wheregroup+1;
	int priorgroup=wheregroup-1;
		
	
	int nextpage = where + 1 ;    // where : 현재 내가 위치한 페이지
	int priorpage = where -1 ; 
	int startrow = 0; 			//하나의 page에서 레코드 시작 번호 
	int endrow = 0; 			//하나의 page에서 레코드 마지막 번호 
	int maxrow = 5; 			//한페이지 내에 출력할 행의 갯수 (row, 행,레코드 갯수)
	int totalrows = 0; 			// DB에서 select 한 총 레코드 갯수 
	int totalpages = 0 ; 	
	//================================================
			
			
			
/*	int id = 0 ; 	// DB의  id 컬럼의 값을 가져오는 변수 
	String em = null ; 	//DB에서 mail 주소를 가져와서 처리하는 변수 
*/
	
	String sql=null;	
	ResultSet rs = null;       //ResultSet 객체는 DB의 테이블을 Select 해서 나온 결과 레코드셋을 담는 객체 
	Statement stmt = null;     //SQL 쿼리를 담아서 실행하는 객체 
				
				
	sql = "select * from mbtbl order by to_number(idx) desc" ;

	
	stmt = conn.createStatement(); 
	rs = stmt.executeQuery(sql); 
		
	if (!(rs.next())){	// rs의 값이 존재하지 않을때 
		out.println ("입력된 개인정보가 없습니다"); 
	}else {		// rs의 값이 존재 할때( 게시판의 글이 존재할때 )
		do {
			idx.addElement(rs.getString("idx")); 	
			id.addElement(rs.getString("id")); 
			passwd.addElement(rs.getString("passwd")); 
			name.addElement(rs.getString("name"));
			email.addElement(rs.getString("email")); 
			city.addElement(rs.getString("city"));
			phone.addElement(rs.getString("phone")); 
			; 
			 
		} while  (rs.next()); 	
	}
	
	
	//2. 페이징처리 2============================================
	totalrows = idx.size(); 		//DB에서 가져온 총 레코드 갯수 
	totalpages = (totalrows-1) / maxrow + 1; 	// 전체 페이지 갯수 출력 
	startrow = (where - 1) * maxrow ; 		//해당 페이지에서 Vector의 방번호 : 시작
	endrow = startrow + maxrow - 1 ; 		//해당 페이지에서 Vector의 방번호 : 마지막
	
	totalgroup = (totalpages -1) / maxpages + 1 ; 
		// 전체 페이지 그룹, 하단에 출력할 페이지 갯수(5개)의 그룹핑   
	
	
	//endrow 가 totalrows보다 크면 totalrows -1로 처리해야함.
	if ( endrow >= totalrows) {
		endrow = totalrows -1 ; 
	}
	if (endpage > totalpages){
		endpage = totalpages; 
	}

		out.println(startrow+"<p/>");
		out.println(endrow+"<p/>");
	//===========2번째 블락 끝=======

	for ( int j = startrow ; j <= endrow ; j++){
		
		
		%>
	  <tr>

	  	<td><a href="read01.jsp?id=<%= idx.elementAt(j) %>&page=<%= where %>"></a></td>
	  	<td><%= id.elementAt(j) %> </td>
	  	<td><%= passwd.elementAt(j)%> </td>
	  	<td><%= name.elementAt(j)%> </td>
	  	<td><%= email.elementAt(j)%> </td>
	  	<td><%= city.elementAt(j)%> </td>
	  	<td><%= phone.elementAt(j)%> </td>
	  </tr>

	  <%
		}
	  
	  %>
</TABLE>
	  <%
	  
	  //===========3. 페이징 처리 출력 블락============
//  [처음][이전]
if (wheregroup > 1){ 	//현재 나의 그룹이 1 이상일때 처음
	out.println ("[<a href='list01.jsp?gogroup=1'>처음</a>]");
	out.println ("[<a href='list01.jsp?gogroup="+priorgroup +"'>이전</a>]");
}else {			// 현재 나의 페이지 그룹이 1일때는 
	out.println ("[처음]"); 
	out.println ("[이전]"); 
}
//페이징 갯수를 출력 : 1 2 3 4 5 

if (idx.size() != 0 ) {		//name.size() : 총 레코드의 갯수 가 0이 아니라면  
	for ( int jj = startpage; jj <= endpage ; jj++){
		if (jj == where) {		//jj 가 자신의 페이지 번호라면 링크 없이 출력
			out.println ("["+jj+"]"); 
		}else {		//jj가 현재 자신의 페이지 번호가 아니라면 링크를 걸어서 출력
			out.println ("[<a href=list01.jsp?go="+ jj + ">" +jj+ "</a>]");
		}
	}
}

// [다음][마지막]
if (wheregroup < totalgroup ) {  //링크를 처리
	out.println ("[<A href=list01.jsp?gogroup="+ nextgroup + ">다음</A>]"); 
	out.println ("[<A href=list01.jsp?gogroup="+ totalgroup + ">마지막</A>"); 
}else {  // 마지막 페이지에 왔을때 링크를 해지 
	out.println ("[다음]"); 
	out.println ("[마지막]"); 
}

out.println("전체 글수 : " + totalrows); 
		//=====3. 페이징 출력============
%>

<FORM method="post" name="msgsearch" action="freeboard_search.jsp">
<TABLE border=0 width=600 cellpadding=0 cellspacing=0>
<TR>
<TD align=right width="241"> 
<SELECT name=stype >

<OPTION value=1 >이름</OPTION>
<OPTION value=2 >제목</OPTION>
<OPTION value=3 >내용</OPTION>
<OPTION value=4 >이름+제목</OPTION>
<OPTION value=5 >이름+내용</OPTION>
<OPTION value=6 >제목+내용</OPTION>
<OPTION value=7 >이름+제목+내용</OPTION>

</SELECT>
</TD>
<TD width="127" align="center">
<INPUT type=text size="17" name="sval" >
</TD>
<TD width="115">&nbsp;<a href="#" onClick="check();"><img src="image/serach.gif" border="0" align='absmiddle'></A></TD>
<TD align=right valign=bottom width="117"><A href="Insert01.jsp"><img src="image/write.gif" border="0"></TD>
</TR>
</TABLE>
</FORM>
</BODY>
</HTML>