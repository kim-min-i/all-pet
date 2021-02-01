<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "pet.model.dto.MemberDTO" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result == 1 }">
	<script>
		alert("수정되었습니다.");
		history.go(-1)
	</script>
</c:if>
