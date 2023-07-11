<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/view/include/link.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>경기장 관리</title>
<style type="text/css">
/* 페이지 버튼 인터페이스 */
.pageMaker_wrap {
	text-align: center;
	margin-top: 30px;
	margin-bottom: 40px;
}

.pageMaker_wrap a {
	color: black;
}

.pageMaker {
	list-style: none;
	display: inline-block;
}

.pageMaker_btn {
	float: left;
	width: 40px;
	height: 40px;
	line-height: 40px;
	margin-left: 20px;
}

.next,
.prev {
	border: 1px solid #ccc;
	padding: 0 10px;
}

.next a,
.prev a {
	color: #ccc;
}

.active {
	/* 현재 페이지 버튼 */
	border: 2px solid black;
	font-weight: 400;
}

/* 검색 영역 */
.search_wrap {
	margin-top: 15px;
}

.search_input {
	position: relative;
	text-align: center;
}

.search_input input[name='keyword'] {
	padding: 4px 10px;
	font-size: 15px;
	height: 20px;
	line-height: 20px;
}

.search_btn {
	height: 32px;
	width: 80px;
	font-weight: 600;
	font-size: 18px;
	line-height: 20px;
	position: absolute;
	margin-left: 15px;
	background-color: #c3daf7;
}
</style>

</head>
<body>
	<div>
		<div class="ground_table_wrap" style="display: flex; justify-content: center;">
			<c:if test="${listCheck != 'empty' }">
				<table class="ground_table">
					<thead>
						<tr>
							<td class="th_column_1">경기장 번호</td>
							<td class="th_column_2">경기장 이름</td>
							<td class="th_column_3">경기장 지역</td>
							<td class="th_column_4">등록 날짜</td>
							<td class="th_column_5">수정 날짜</td>
							<td class="th_column_6">삭제</td>
						</tr>
					</thead>
					<c:forEach items="${list}" var="item">
						<tr>
							<td><c:out value="${item.groundId}"></c:out></td>
							<td><c:out value="${item.groundName}"></c:out></td>
							<td><c:out value="${item.nationName}"></c:out></td>
							<td><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${item.updateDate}" pattern="yyyy-MM-dd" /></td>
							<td><button class="btn delete_btn">삭제</button></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${listCheck == 'empty'}">
				<div class="table_empty">등록된 경기장이 없습니다.</div>
			</c:if>
		</div>
		<!-- 검색 영역 -->
		<div class="search_wrap">
			<form id="searchForm" action="/admin/groundManage" method="get">
				<div class="search_input">
					<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
					<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
					<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
					<button class="btn search_btn">검색</button>
				</div>
			</form>
		</div>
		<!-- 페이지 이동 인터페이스 영역 -->
		<div class="pageMaker_wrap">
			<ul class="pageMaker">
				<!-- 이전 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="pageMaker_btn prev"><a href="${pageMaker.pageStart - 1}">이전</a></li>
				</c:if>
				<!-- 페이지 번호 -->
				<c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
					<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active' : ''}">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>
				<!-- 다음 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="pageMaker_btn next"><a href="${pageMaker.pageEnd + 1}">다음</a></li>
				</c:if>
			</ul>
		</div>
		<form id="moveForm" action="/admin/groundManage" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			let result = '${enroll_result}';
			checkResult(result);

			function checkResult(result) {
				if (result === '') {
					return;
				}
				alert("경기장 '" + result + "'을 등록하였습니다.");
			}
		});

		let moveForm = $('#moveForm');
		let searchForm = $('#searchForm');

		/* 페이지 이동 버튼 */
		$(document).on("click", ".pageMaker_btn a", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.submit();
		});

		/* 경기장 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e) {
			e.preventDefault();
			/* 검색 키워드 유효성 검사 */
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하십시오");
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1");
			searchForm.submit();
		});

		/* 삭제 버튼 */
		$(document).on("click", ".delete_btn", function(e) {
			e.preventDefault();
			let groundId = $(this).closest("tr").find("td:first-child").text();
			moveForm.empty();
			moveForm.append('<input type="hidden" name="groundId" value="' + groundId + '">');
			moveForm.attr("action", "/admin/groundDelete");
			moveForm.attr("method", "post");
			moveForm.submit();
		});
	</script>
</body>
</html>
