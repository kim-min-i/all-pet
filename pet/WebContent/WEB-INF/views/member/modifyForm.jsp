<%@ page contentType="text/html;charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>ȸ����������</title>
<h1>���� ȸ������</h1>
<c:if test="${member == null}">
		<c:redirect url="/member/main.do"></c:redirect>
</c:if>

<c:if test="${member !=null }">
<input type="button" value="������"  onclick="location.href='/pet/member/about_me.do'">
<input type="button" value="��������" onclick="location.href='/pet/member/about_me.do'">
<input type="button" value="��й�ȣ ����" onclick="location.href='/pet/member/update_pw.do'">
<input type="button" value="���������� ����"  onclick="location.href='/pet/member/about_me.do'">
<form method="post" action="/pet/member/update_mypage.do" name="userinput" onsubmit="return checkIt()">
	<table width="900" border="1" >
		<tr>
			<td width="200" rowspan="2">������ �̹���</td>
			<td width="200" rowspan="2">�����ʻ��� 
				<input type="button" value="����">
			</td>
			<td width="200" rowspan="1">�ʸ�</td>
			<td> 
				<input type="text" value="${member.pen_name}">
			</td>
		</tr>
		<tr>
			<td width="200" rowspan="2">�̸���</td>
			<td> 
				${member.email}
			</td>
		</tr>
	</table>
	<input type="submit" name="modify" value="��   ��" >
	<input type="button" value="��  ��" onclick="javascript:window.location='/pet/member/mypage.do'"> 
</form>
</c:if>
</html>