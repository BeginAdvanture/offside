<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp"%>
<style>
/* 공통 스타일 */
.wrap {
	margin: 0 auto;
	max-width: 1200px;
	padding: 20px;
}

/* 헤더 스타일 */
#header {
	background-color: #f1f1f1;
	padding: 10px;
}

.menu_tab_box {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 10px;
}

.menu_tab {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 30px;
	height: 30px;
	background-color: #ccc;
	border-radius: 50%;
	margin-right: 10px;
	cursor: pointer;
}

.menu_tab span {
	display: block;
	width: 10px;
	height: 2px;
	background-color: #fff;
}

#menu {
	display: none;
	background-color: #f1f1f1;
	padding: 10px;
}

#menu.active {
	display: block;
}

#menu_bg {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

/* 주소 검색 스타일 */
.address_search {
	margin-bottom: 20px;
}

#search_box {
	display: flex;
	align-items: center;
}

#MatchAddress1 {
	width: 100px;
	margin-right: 10px;
}

#MatchAddress2 {
	flex: 1;
	margin-top: 30px;
	text-align: center;
}

/* 카테고리 스타일 */
.category_box {
	margin-bottom: 20px;
}

.category {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.category li {
	width: 200px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
	padding: 10px;
}

.category li .img_box {
	text-align: center;
	margin-bottom: 10px;
}

.category li .name {
	text-align: center;
	font-weight: bold;
}

.category li .img_box {
	text-align: center;
	margin-bottom: 10px;
	width: 200px; /* 이미지 박스의 너비 */
	height: 200px; /* 이미지 박스의 높이 */
	overflow: hidden; /* 이미지가 박스를 넘어갈 경우 숨김 처리 */
}

.category li .img_box img {
	width: 100%; /* 이미지의 너비를 이미지 박스에 맞게 조정 */
	height: 100%; /* 이미지의 높이를 이미지 박스에 맞게 조정 */
	object-fit: cover; /* 이미지 비율 유지하며 이미지를 확대 또는 축소하여 채움 */
}

div.wrap {
	margin: 20px auto;
	max-width: 1200px;
	padding: 20px;
	box-sizing: border-box;
}

section {
	margin-top: 40px;
	margin-bottom: 40px;

}

section h1 {
	text-align: center;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	border: 1px solid #ccc;
}

th {
	background-color: #f1f1f1;
}

tbody tr:nth-child(even) {
	background-color: #f9f9f9;
}

tbody tr:hover {
	background-color: #eaeaea;
}

table a {
	color: #0066cc;
	text-decoration: none;
}

table a:hover {
	text-decoration: underline;
}
</style>
<!-- 콘텐츠 -->
<div class="wrap">
	<main>
		<h3>오프사이드</h3>
		<div>
			<ul class="list">
				<div id="header">
					<div class="auth-buttons" style="text-align: right;">
						<a href="/login" class="auth-button" >로그인</a> <a href="/signup"
							class="auth-button">회원가입</a>
					</div>
					<c:set var="ROLE"
						value="${SPRING_SECURITY_CONTEXT.authentication.principal.user.role }" />
					<c:if test="${ROLE == 'ROLE_ADMIN' }">
						<c:set var="uri"
							value="${requestScope['javax.servlet.forward.request_uri']}" />

						
						<div class="menu_tab_box">
							<div class="menu_tab">
								<span> </span> <span> </span> <span> </span>
							</div>
						</div>

						<div id="menu">
							<div class="box">
								<c:choose>
									<c:when test="${fn:contains(uri, '/admin/management') }">

				
										<div>
											<a href="/admin/myStore">운영중인 경기장</a>
										</div>
										<div>
											<a href="/admin/main">주문접수</a>
										</div>
										<div>
											<a href="/admin/storeManagement">매장 관리</a>
										</div>
										<div>
											<a href="/admin/salesManagement">매출 확인</a>
										</div>
									</c:when>

									<c:otherwise>
										<div>
											<a href="/admin/main">관리자 페이지</a>
										</div>
										<div>
											<a href="/admin/myStore">운영중인 경기장</a>
										</div>

										<div>
											<a href="/admin/storeManagement">매장 관리</a>
										</div>
										<div>
											<a href="/admin/salesManagement">매출 확인</a>
										</div>
									</c:otherwise>

								</c:choose>

								<div>
									<a href="/">홈으로</a>
								</div>
							</div>
						</div>
						<div id="menu_bg"></div>

					</c:if>
				</div>

			</ul>
		</div>
		<section class="address_search">
			<div id="search_box">
				<div>
					<input type="hidden" id="MatchAddress1" placeholder="우편번호"
						value="${Offaddress.address1 }" name="address1" readonly>
					<input type="text" value="${Offaddress.address2 }"
						onclick="modifyAddress()" id="MatchAddress2" readonly
						placeholder="주소를 입력해 주세요" name="address2"><br>
				</div>


				<%@ include file="/WEB-INF/view/include/modifyAddress.jsp"%>
			</div>
		</section>
		<section class="category_box">
			<div class="box">
				<ul class="category">

				</ul>
			</div>
		</section>
		<section class="category_box">
			<div class="box">
				<ul class="category">

					<li>
						<div>
							<div class="img_box">
								<img
									src="https://plab-football.s3.amazonaws.com/static/img/explore_earlybird.svg"
									alt="이미지">
							</div>
						</div>
						<div class="name">루키</div>
					</li>

					<li>
						<div>
							<div class="img_box">
								<img
									src="https://plab-football.s3.amazonaws.com/static/img/explore_seeding.svg"
									alt="이미지">
							</div>
						</div>
						<div class="name">비기너</div>
					</li>

					<li>
						<div>
							<div class="img_box">
								<img
									src="https://plab-football.s3.amazonaws.com/static/img/explore_semipro.svg"
									alt="이미지">
							</div>
						</div>
						<div class="name">세미프로</div>
					</li>

					<li>
						<div>
							<div class="img_box">
								<img
									src="https://plab-football.s3.amazonaws.com/static/img/explore_fire.svg"
									alt="이미지">
							</div>
						</div>
						<div class="name">프로</div>
					</li>
			</div>
		</section>
	</main>
</div>
<section style="	margin: 90px">
	<h1>Football News</h1>
	<table>
		<thead>
			<tr>
				<th>Article</th>
				<th>Summary</th>
				<th>Link</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${gisa1}" varStatus="status">
				<tr>
					<td>${i}</td>
					<td>${gisa2[status.index]}</td>
					<td><a href="${link[status.index]}">Read more</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<h1>Team Ranking</h1>
	<table>
		<thead>
			<tr>
				<th>Rank</th>
				<th>Team</th>
				<th>Points</th>
				<th>Logo</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${rank}" varStatus="status">
				<tr>
					<td>${i}</td>
					<td>${teamname[status.index]}</td>
					<td>${image[status.index]}</td>
					<td><img src="${image[status.index]}"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>
<!-- 콘텐츠 -->
<section></section>

<!-- 하단 메뉴 -->
<%@ include file="/WEB-INF/view/include/nav.jsp"%>
<!-- 하단 메뉴 -->

<!-- 푸터 -->

<!-- 푸터 -->

<script>
    $(".category li").click(function() {
        let address1 = $("#MatchAddress1").val();
        if (!address1) {
            swal("주소를 입력해 주세요");
            return false;
        }

        const index = $(this).index();

        location.href = "/store/" + (100 + index) + "/" + address1;
    });

    console.log("data.zonecode = " + data.zonecode);
    console.log("addr = " + addr);

    $.ajax({
        url: "/addressModify",
        data: {
            address1: data.zonecode,
            address2: addr
        },
        type: "post"
    }).done(function() {
        $(".address1").text(addr);
        address1 = data.zonecode;
    }).fail(function() {
        alert("실패");
    });

    $(".menu_tab").click(function() {
        const menuTab = $(this);
        const menu = $("#menu");
        const menuBg = $("#menu_bg");

        function hide() {
            menuTab.removeClass("active");
            menu.removeClass("active");
            menuBg.hide();
        }

        function show() {
            menuTab.addClass("active");
            menu.addClass("active");
            menuBg.show();
        }

        if ($(this).hasClass("active")) {
            hide();
        } else {
            show();
        }

        if (menuBg.css("display") != "none") {
            menuBg.click(function() {
                hide();
            });
        }
    });
</script>

</body>

</html>
