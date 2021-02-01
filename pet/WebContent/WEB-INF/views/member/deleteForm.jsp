<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="myform" action="/pet/member/deletePro.do" method="post" onSubmit="return checkIt()">
	<TABLE cellSpacing=1 cellPadding=1 width="260" border=1 align="center" >
	  
	  <TR height="30">
	    <TD colspan="2" align="middle" >
		  <font size="+1" ><b>회원 탈퇴</b></font></TD></TR>
	  
	  <TR height="30">
	    <TD width="110" align=center>비밀번호</TD>
	    <TD width="150" align=center>
	      <INPUT type=password name="passwd"  size="15" maxlength="12"></TD></TR>
	  <TR height="30">
	    <TD colspan="2" align="middle"  >
	      <INPUT type=submit value="회원탈퇴"> 
	      <input type="button" value="취  소" onclick="javascript:window.location='main.do"></TD></TR>
	</TABLE>
</body>
</html>