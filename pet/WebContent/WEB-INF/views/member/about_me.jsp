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
 	<table width="900" border="1" align="center">
		<tr>
			<td width="200" rowspan="2"><img src="/pet/save/${member.org_profile}">
				<input type="button" value="프로필 수정" onclick="location.href='/pet/member/member_info.do'">
			</td>
			<td> 
				${member.pen_name}
			</td>
		</tr>
		<tr>
			<td> 
				${member.email}
			</td>
		</tr>
		<tr>
			<td>
			<input type="button" value="나의 리뷰(0개 등록대기중) " onclick="location.href='/pet/member/my_reviews.do'"><br />
			<input type="button" value="찜한 의사 0" onclick="location.href='/pet/member/bookmark_doc_list'"><br />
			<input type="button" value="나의 병원 예약 0" onclick="location.href='/pet/member/reservation_list.do'"><br />
			<input type="button" value="스크랩한 게시글" onclick="location.href='/pet/member/reservation_list.do'"><br />
			</td>
		</tr>
	</table>
		
</c:if>
</body>
</html>