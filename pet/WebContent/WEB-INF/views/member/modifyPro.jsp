<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "pet.model.dto.MemberDTO" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result == 1 }">
	<script>
		alert("�����Ǿ����ϴ�.");
		history.go(-1)
	</script>
</c:if>
