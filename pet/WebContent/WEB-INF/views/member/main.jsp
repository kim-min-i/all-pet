<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
<h1>메인페이지 입니다</h1>
	<c:if test="${member == null}">
		<input type="button" value="로그인" onclick="location.href='/pet/member/login.do'">
		<input type="button" value="회원가입" onclick="location.href='/pet/member/register.do'">
	</c:if>
	<c:if test="${member !=null }">닉네임= ${member.pen_name}<br />
		<input type="button" value="로그아웃" onclick="location.href='/pet/member/logout.do'">
		<input type="button" value="마이페이지" onclick="location.href='/pet/member/mypage.do'">
		<input type="button" value="나의 활동" onclick="location.href='/pet/member/about_me.do'">
		<input type="button" value="나의 포인트" onclick="location.href='/pet/member/point.do'">
		<input type="button" value="계정설정" onclick="location.href='/pet/member/member_info.do'">
	</c:if>
	
</body>
</html>