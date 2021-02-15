<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
가입회원 현황
	의사
	일반회원
회원 탈퇴 대기 리스트
<BODY onload="begin()">
<form name="myform" action="/pet/admin/adminMember.do" method="post" onSubmit="return checkIt()">
<TABLE cellSpacing=1 cellPadding=1 width="260" border=1 align="center" >
  
  <TR height="30">
    <TD colspan="2" align="middle"><STRONG>회원정보 상세</STRONG></TD></TR>
  
  <TR height="30">
    <TD width="110"  align=center>이메일</TD>
    <!-- 이메일은 수정이 불가능하도록 readonly 속성 추가 -->
    <TD width="150" align=center>
       <INPUT type="text" name="email" value="${dto.email }" ></TD></TR>
  <TR height="30">
    <TD width="110" align=center>비밀번호</TD>
    <TD width="150" align=center>
      <INPUT type=password name="pw" ></TD></TR>
  <TR height="30">
    <TD width="110" align=center>이름</TD>
    <TD width="150" align=center>
      <INPUT type=password name="name" ></TD></TR>
  <TR height="30">
    <TD width="110" align=center>전화번호</TD>
    <TD width="150" align=center>
      <INPUT type=password name="passwd"  size="15" maxlength="12"></TD></TR>
  <TR height="30">
    <TD width="110" align=center>포인트</TD>
    <TD width="150" align=center>
      <INPUT type=password name="passwd"  size="15" maxlength="12"></TD></TR>
  <TR height="30">
    <TD width="110" align=center>회원가입일자</TD>
    <TD width="150" align=center>
      <INPUT type=password name="passwd"  size="15" maxlength="12"></TD></TR>
  <TR height="30">
    <TD width="110" align=center>마지막로그인일자</TD>
    <TD width="150" align=center>
      <INPUT type=password name="passwd"  size="15" maxlength="12"></TD></TR>
  <TR height="30">
    <TD width="110" align=center>마케팅수신동의 여부</TD>
    <TD width="150" align=center>
      <INPUT type=password name="passwd"  size="15" maxlength="12"></TD></TR>
  <TR height="30">
    <TD colspan="2" align="middle" >
      <INPUT type=submit value="로그인"> 
      <INPUT type=reset value="다시입력">
      <input type="button" value="유저페이지로 이동" onclick="javascript:window.location='/pet/member/main.do'"></TD></TR>
</TABLE>
</form>

</BODY>
</body>
</html>