<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${member !=null }">
	<input type="file"><br />
	닉네임 = ${member.pen_name}<br />
	이메일 = ${member.email}<br />
	<br />
	<input type="button" value="프로필 수정" onclick="location.href='/pet/member/mypage.do'">
	<input type="button" value="1+1 앱 초대 이벤트" onclick="">
	<input type="button" value="나의 리뷰(0개 등록대기중) " onclick="">
	<input type="button" value="찜한 의사 0" onclick="">
	<input type="button" value="나의 병원 예약 0" onclick="">
</c:if>
</body>
</html>