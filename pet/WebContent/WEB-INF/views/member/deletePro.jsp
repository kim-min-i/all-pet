<%@ page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>ȸ��Ż��</title>

</head>

<body>
	<c:if test="${check == 1}" >
	<form method="post" action="/pet/member/main.do" name="userinput" >
	<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
	  <tr> 
	    <td height="39" align="center">
		  <font size="+1" ><b>ȸ�������� �����Ǿ����ϴ�.</b></font>
		 </td>
	  </tr>
	  <tr>
	    <td align="center"> 
	      <p>����.... �����մϴ�. �ȳ��� ������.</p>
	      <meta http-equiv="Refresh" content="5;url=/pet/member/main.do" >
	    </td>
	  </tr>
	  <tr>
	    <td align="center"> 
	      <input type="submit" value="Ȯ��" />
	    </td>
	  </tr>
	</table>
	</form>
	</c:if>



	<c:if test="${check != 1 }">
	<script> 
	  alert("��й�ȣ�� ���� �ʽ��ϴ�.");
	     history.go(-1);
	</script>
	</c:if>
</body>
</html>
