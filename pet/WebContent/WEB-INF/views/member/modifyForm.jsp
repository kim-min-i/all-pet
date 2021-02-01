<%@ page contentType="text/html;charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>회원정보수정</title>
<h1>나의 회원정보</h1>
<c:if test="${member == null}">
		<c:redirect url="/member/main.do"></c:redirect>
</c:if>

<c:if test="${member !=null }">
<input type="button" value="프로필"  onclick="location.href='/pet/member/about_me.do'">
<input type="button" value="본인인증" onclick="location.href='/pet/member/about_me.do'">
<input type="button" value="비밀번호 변경" onclick="location.href='/pet/member/update_pw.do'">
<input type="button" value="마케팅정보 설정"  onclick="location.href='/pet/member/about_me.do'">
<form method="post" action="/pet/member/update_mypage.do" name="userinput" onsubmit="return checkIt()">
	<table width="900" border="1" >
		<tr>
			<td width="200" rowspan="2">프로필 이미지</td>
			<td width="200" rowspan="2">프로필사진 
				<input type="button" value="편집">
			</td>
			<td width="200" rowspan="1">필명</td>
			<td> 
				<input type="text" value="${member.pen_name}">
			</td>
		</tr>
		<tr>
			<td width="200" rowspan="2">이메일</td>
			<td> 
				${member.email}
			</td>
		</tr>
	</table>
	<input type="submit" name="modify" value="수   정" >
	<input type="button" value="취  소" onclick="javascript:window.location='/pet/member/mypage.do'"> 
</form>
</c:if>
</html>