<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head><title>����</title>


   <script language="javascript">
     <!--
       function begin(){
         document.myform.id.focus();
       }
       function checkIt(){
         if(!document.myform.id.value){
           alert("���̵� �Է����� �����̽��ϴ�.");
           document.myform.id.focus();
           return false;
         }
         if(!document.myform.passwd.value){
           alert("��й�ȣ�� �Է����� �����̽��ϴ�.");
           document.myform.passwd.focus();
           return false;
         }
         
       }
     -->
   </script>
</head>
<BODY onload="begin()">
<form name="myform" action="/pet/admin/adminMember.do" method="post" onSubmit="return checkIt()">
<TABLE cellSpacing=1 cellPadding=1 width="260" border=1 align="center" >
  
  <TR height="30">
    <TD colspan="2" align="middle"><STRONG>������ �α���</STRONG></TD></TR>
  
  <TR height="30">
    <TD width="110"  align=center>���̵�</TD>
    <TD width="150" align=center>
       <INPUT type="text" name="id" size="15" maxlength="12"></TD></TR>
  <TR height="30">
    <TD width="110" align=center>��й�ȣ</TD>
    <TD width="150" align=center>
      <INPUT type=password name="passwd"  size="15" maxlength="12"></TD></TR>
  <TR height="30">
    <TD colspan="2" align="middle" >
      <INPUT type=submit value="�α���"> 
      <INPUT type=reset value="�ٽ��Է�">
      <input type="button" value="������������ �̵�" onclick="javascript:window.location='/pet/member/main.do'"></TD></TR>
</TABLE>
</form>

</BODY>
</HTML>