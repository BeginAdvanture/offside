<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3fe0c2eaecb263f09df91a81c2ec64a0&libraries=services,clusterer,drawing"></script>

<link rel="stylesheet" href="/css/modal.css">
<link rel="stylesheet" href="/css/store/detail.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<%-- <%@ include file="/WEB-INF/view/include/header.jsp"%>  --%>


<!-- 메인 -->
<%@ include file="/WEB-INF/view/store/storeDetail.jsp"%>
<!-- 메인 -->

 <!-- 푸터 -->
<%-- <%@ include file="/WEB-INF/view/include/footer.jsp"%> --%>
<!-- 푸터 -->

<!-- 메뉴 모달 -->
 <%@ include file="/WEB-INF/view/modal/modal_food.jsp"%>
<!-- 메뉴 모달 -->




<script type="text/javascript" src="/js/store/storeDetail.js"></script> 
</body>
</html>