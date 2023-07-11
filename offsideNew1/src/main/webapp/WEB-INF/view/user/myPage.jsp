<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp"%>
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/user/myPage.css">

<%@ include file="/WEB-INF/view/include/header.jsp"%>


<div class="wrap">
	<section class="title">
		<h1>my page</h1>
	</section>
</div>
	<!-- 콘텐츠 -->
	<main>
		<div class="container">
			<div class="grid_box">
				<div class="login_box">
					<c:if test="${empty SPRING_SECURITY_CONTEXT }">
						<a href="/login"><span>로그인 해주세요</span></a>
					</c:if>
					
					<c:if test="${!empty SPRING_SECURITY_CONTEXT }">
						<c:set var="ninkname" value="${SPRING_SECURITY_CONTEXT.authentication.principal.user.nickname }" />
						<a href="/user/myInfo"><span class="ninkname" data-nickname=${ninkname}>${ninkname}</span></a>
						<button type="button" class="logout">로그아웃</button>
					</c:if>
				</div>
				
					<div>
		    			<a href="/user/point" onclick="return loginCheck();">
	                       	<span class="img_box">
	                       		<img src="https://plab-football.s3.amazonaws.com/static/img/explore_ball.svg" alt="포인트">
	                       	</span>
	                       	<span>포인트</span>
	                  	</a>
		    		</div>
		    		
		    		
		    		<div>
		    			<a class="updating" href="/myPage/coupon" onclick="return false;">
	               		  	<span class="img_box">
	                			<img src="https://plab-football.s3.amazonaws.com/static/img/explore_ball.svg"alt="쿠폰함">
	               			</span>
	               			<span>쿠폰함</span>
	              		</a>
		    		</div>
		    		
		    		
		    		<div>
		    			<a class="updating" href="/myPage/gift" onclick="return false;">
	                 		<span class="img_box">
	                 			<img src="https://plab-football.s3.amazonaws.com/static/img/explore_ball.svg" alt="선물함">
	                 		</span>
	                        <span>선물함</span>
						</a>
		    		</div>
		    		
		    		
		    		<div>
						<a href="/likes/store">
							<span class="img_box">
								<img src="https://plab-football.s3.amazonaws.com/static/img/explore_ball.svg" alt="찜한가게">
							</span>
							<span>찜한매장</span>
						</a>
		    		</div>
		    		
		    		
		    		<div>
						<a href="/orderList">
							<span class="img_box">
								<img src="https://plab-football.s3.amazonaws.com/static/img/explore_ball.svg" alt="주문내역">
							</span>
							<span>매치내역</span>
						</a>
		    		</div>
		    		
		    		
		    		<div>
						<a href="/user/myReview" onclick="return loginCheck()" >
							<span class="img_box">
								<img src="https://plab-football.s3.amazonaws.com/static/img/explore_ball.svg" alt="리뷰관리">
							</span>
							<span>리뷰관리</span>
						</a>
		    		</div>
				
			</div>
		
		</div>
	</main>
<!-- 하단 메뉴 -->
<%@ include file="/WEB-INF/view/include/nav.jsp"%>
<!-- 하단 메뉴 -->


<script type="text/javascript">
	$(".updation").click(function() {
		swal("업데이트 준비 중 입니다.");
	})
	$(".logout").click(function() {
		location.href= "/logout";
	})
	
	function loginCheck() {
		const ninkname = $(".nickname").data("ninkname");
		if(!ninkname){
			swal("로그인 후 이용 가능합니다.");
			return false;
		}
		return true;
	}
	
	

</script>
</body>

</html>