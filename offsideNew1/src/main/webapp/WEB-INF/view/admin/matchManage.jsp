<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/view/include/link.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.match_list {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 30px;
}

.match_list a,
.match_list button {
  margin-bottom: 10px;
}

.btn.delete_btn {
  background-color: #ff0000;
  color: white;
}

</style>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="match_list">
  <c:forEach items="${matchList}" var="matchItem">
    <a href="#">${matchItem.matchName}</a>
    <button class="btn delete_btn" data-match-id="${matchItem.matchId}">삭제</button>
  </c:forEach>
</div>
	<script>
		$(document)
				.on(
						"click",
						".delete_btn",
						function(e) {
							e.preventDefault();
							let matchId = $(this).data("match-id");

							// 폼 생성 및 데이터 추가
							let moveForm = $("<form>");
							moveForm
									.append('<input type="hidden" name="matchId" value="' + matchId + '">');
							moveForm.attr("action", "/admin/matchDelete");
							moveForm.attr("method", "post");
							moveForm.appendTo("body").submit();
						});
	</script>
</body>
</html>