<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/view/include/link.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<meta charset="UTF-8">
<title>경기장 등록</title>
<style type="text/css">
/* 전체 페이지 스타일 */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f7f7f7;
}

.admin_content_main {
    max-width: 500px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #30DA;
}

/* 폼 섹션 스타일 */
.form_section {
    margin-bottom: 20px;
}

.form_section_title {
    margin-bottom: 10px;
}

.form_section_title label {
    font-weight: bold;
    color: #333;
}

.form_section_content {
    position: relative;
}

.form_section_content input[type="text"],
.form_section_content select {
    width: 100%;
    height: 40px;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.form_section_content span {
    position: absolute;
    left: 0;
    right: 0;
    bottom: -20px;
    display: none;
    text-align: center;
    color: #e05757;
    font-size: 12px;
}

/* 버튼 섹션 스타일 */
.btn_section {
    text-align: center;
}

.btn {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    font-weight: bold;
    color: #fff;
    background-color: #30DA;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.btn:hover {
    background-color: #1C9DFF;
}

.enroll_btn {
    margin-left: 10px;
    background-color: #2ED76B;
}

.enroll_btn:hover {
    background-color: #1BB055;
}
</style>
</head>
<body>
	<div class="admin_content_main">
		<form action="/admin/groundEnroll.do" method="post" id="enrollForm">
			<div class="form_section">
				<div class="form_section_title">
					<label>경기장 이름</label>
				</div>
				<div class="form_section_content">
					<input name="groundName">
					 <span id="warn_groundName">경기장 이름을 입력 해주세요.</span>
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>매치 지역</label>
				</div>
				<div class="form_section_content">
					<select name="nationId">
						<option value="none" selected>=== 선택 ===</option>
						<option value="01">서울</option>
						<option value="02">경기</option>
						<option value="02">인천</option>
					</select> <span id="warn_nationId">소속 지역을 선택해주세요.</span>
				</div>
			</div>
		</form>
		<div class="btn_section">
			<button id="cancelBtn" class="btn">취 소</button>
			<button id="enrollBtn" class="btn enroll_btn">등 록</button>
		</div>
	</div>
	<script type="text/javascript">
		/* 등록 버튼 */
		$("#enrollBtn").click(function() {
			/* 검사 통과 유무 변수 */
			let nameCheck = false; // 경기장 이름
			let nationCheck = false; // 소속 국가

			/* 입력값 변수 */
			let groundName = $('input[name=groundName]').val(); // 경기장 이름
			let nationId = $('select[name=nationId]').val(); // 소속 국가

			/* 공란 경고 span태그 */
			let wAuthorName = $('#warn_groundName');
			let wNationId = $('#warn_nationId');

			/* 작기 이름 공란 체크 */
			if (groundName === '') {
				wAuthorName.css('display', 'block');
				nameCheck = false;
			} else {
				wAuthorName.css('display', 'none');
				nameCheck = true;
			}

			/* 소속 국가 공란 체크 */
			if (nationId === 'none') {
				wNationId.css('display', 'block');
				nationCheck = false;
			} else {
				wNationId.css('display', 'none');
				nationCheck = true;
			}

			/* 최종 검사 */
			if (nameCheck && nationCheck) {
				$("#enrollForm").submit();
			} else {
				return;
			}

		});

		$("#cancelBtn").click(function() {
			location.href = "/admin/groundManage";
		});
	</script>
</body>
</html>