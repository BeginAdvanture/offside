<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/view/include/link.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 콘텐츠 컨테이너 스타일 */
.container {
  padding: 20px;
}

/* 카테고리 스타일 */
.category ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.category ul li {
  display: inline-block;
  margin-right: 10px;
  cursor: pointer;
}

/* 박스 스타일 */
.box {
  background: #F6F6F6;
  max-width: 100%;
  padding: 20px;
  margin-top: 20px;
}

/* 가게 스타일 */
.store li {
  list-style: none;
  margin-bottom: 20px;
  display: flex;
  align-items: center;
}

.store .img_box {
  flex: 0 0 120px;
  margin-right: 20px;
}

.store .img_box img {
  width: 100%;
  height: auto;
}

.store .info_box {
  flex: 1;
}

.store .info_box h2 {
  margin: 0;
  font-size: 18px;
}

/* is_open 스타일 */
.is_open {
  margin-top: 20px;
}

.is_open a {
  display: inline-block;
  background-color: #FF0000;
  color: #FFFFFF;
  padding: 10px 20px;
  text-decoration: none;
}
.category ul li {
  display: inline-block;
  margin-right: 10px;
  cursor: pointer;
  padding: 10px 20px;
  background-color: #EFEFEF;
  color: #333333;
  border: 1px solid #CCCCCC;
  border-radius: 4px;
  transition: background-color 0.3s ease, color 0.3s ease;
}

.category ul li:hover {
  background-color: #333333;
  color: #FFFFFF;
}
</style>
</head>
<body>
	<!-- 콘텐츠 -->
	<main>
		<div class="container">
			<div class="category" data-category="${category}">
				<ul>
					<li data-category="100"
						onclick="location.href='/store/100/${address1}'"><span>루키</span></li>
					<li data-category="101"
						onclick="location.href='/store/101/${address1}'"><span>비기너</span></li>
					<li data-category="102"
						onclick="location.href='/store/102/${address1}'"><span>세미프로</span></li>
					<li data-category="103"
						onclick="location.href='/store/103/${address1}'"><span>프로</span></li>
				</ul>
			</div>
			<input type="hidden" value="${address1}" class="address1">

			<div class="box">
				<c:if test="${empty storeList}">
					<img class="temp_img" alt="이미지" src="/img/ex.jpg">
					<style>
						main .box {
							background: #F6F6F6;
							max-width: 100%;
						}
					</style>
				</c:if>
				<ul class="store">
					<c:set var="store_admin" value="/store" />
					<c:forEach items="${storeList}" var="storeItem">
						<c:choose>
							<c:when test="${storeItem.category == 100}">
    <c:if test="${category == 100}">
        <h2><a href="${store_admin }/detail/${storeItem.matchId }">${storeItem.matchName }</a></h2>
        <p>경기 시간 : ${storeItem.matchDate}</p>
        <p>경기 요금 : ${storeItem.matchPrice }</p>
        <p>경기 인원 : ${storeItem.matchStock }</p>
    </c:if>
</c:when>
<c:when test="${storeItem.category == 101}">
    <c:if test="${category == 101}">
        <h2><a href="${store_admin }/detail/${storeItem.matchId }">${storeItem.matchName }</a></h2>
        <p>경기 시간 : ${storeItem.matchDate}</p>
        <p>경기 요금 : ${storeItem.matchPrice }</p>
        <p>경기 인원 : ${storeItem.matchStock }</p>
    </c:if>
</c:when>
<c:when test="${storeItem.category == 102}">
    <c:if test="${category == 102}">
        <h2><a href="${store_admin }/detail/${storeItem.matchId }">${storeItem.matchName }</a></h2>
        <p>경기 시간 : ${storeItem.matchDate}</p>
        <p>경기 요금 : ${storeItem.matchPrice }</p>
        <p>경기 인원 : ${storeItem.matchStock }</p>
    </c:if>
</c:when>
<c:when test="${storeItem.category == 103}">
    <c:if test="${category == 103}">
        <h2><a href="${store_admin }/detail/${storeItem.matchId }">${storeItem.matchName }</a></h2>
        <p>경기 시간 : ${storeItem.matchDate}</p>
        <p>경기 요금 : ${storeItem.matchPrice }</p>
        <p>경기 인원 : ${storeItem.matchStock }</p>
    </c:if>
</c:when>

						</c:choose>
					</c:forEach>
				</ul>
			</div>
		</div>
	</main>
</body>
</html>
