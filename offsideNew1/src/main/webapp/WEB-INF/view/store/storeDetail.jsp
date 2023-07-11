<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="wrap">
	<nav>
		<c:set var="info" value="${store.storeInfo }" />
		<h1 id="store_name" data-store_name="${info.matchName }">${info.matchName}</h1>

		<div class="inf">
			<c:choose>
				<c:when test="${store.storeInfo.isLikes == 1 }">
					<span><i class="fas fa-heart"></i> 찜 </span>
				</c:when>

				<c:otherwise>
					<span><i class="far fa-heart"></i> 찜 </span>
				</c:otherwise>
			</c:choose>

			<span class="likes_count" data-count=${store.storeInfo.likesCount }>${store.storeInfo.likesCount }</span>

			<div>
				<span class="store_review_count" data-review_count="0"> 리뷰 0</span>
				<span>댓글 0</span>
			</div>

		</div>
	</nav>


	<!-- 모바일 카트 -->
	<div class="m_cart_img">
		<div class="m_cart_img_box">
			<i class="fas fa-shopping-cart"></i> <span class="m_cart_count"></span>
		</div>
	</div>
	<!-- 모바일 카트 -->



	<!-- 장바구니 -->
	<aside id="cart">
		<div class="cart">
			<h2>매치등록</h2>
			<i class="far fa-trash-alt deleteAll"></i>

			<div class="cart_list">
				<ul>

				</ul>
			</div>

			<div class="order_btn_box">
				<div class="total">비었습니다.</div>
				<button class="order_btn" disabled>등록하기</button>
			</div>
		</div>

	</aside>
	<div class="alarm">장바구니에 담았습니다</div>
	<!-- 장바구니 -->


	<main>
		<div class="offset"></div>
		<ul class="tab ">
			<li class="select">매치 정보</li>
			<li>정보</li>
			<li>리뷰</li>
		</ul>


		<!-- 메뉴 탭 -->
		<ul class="menu">
			
			<li>경기장 이름 : ${store.storeInfo.matchName}</li>

			<li>경기 날짜 : ${store.storeInfo.matchDate}</li>
			<li>매니저 이름 : ${store.storeInfo.matchOwner}</li>
			
			
			<li>매치 가격: ${store.storeInfo.matchPrice}</li>
			<li>매치 인원: ${store.storeInfo.matchStock}</li>
			<li>매치 정보: ${store.storeInfo.matchIntro}</li>
			<li>비기너 등급 : ${store.storeInfo.matchContents}</li>
		

			<div class="button_set">
				<a class="btn_buy">바로구매</a>
			</div>

			<!-- 주문 form -->
			<form action="/order/${store.storeInfo.matchId}" method="get"
				class="order_form">
				<input type="hidden" name="orders[0].matchId"
					value="${store.storeInfo.matchId}">

			</form>
		</ul>
		<!-- 메뉴 탭 -->


		<!-- 정보 탭 -->
		<ul class="info">
			<li>
				<div>
					<h2>찾아 오시는 길</h2>

					<div id="map_box">
						<div id="map"></div>

						<div id="position_box">
							<button class="storePosition">
								<i class="far fa-dot-circle"></i> 가게 위치로
							</button>
							<button class="userPosition">
								<i class="far fa-dot-circle"></i> 내 위치로
							</button>
						</div>
					</div>

					<h2>위치안내</h2>
					<div id="store_address" data-address="${info.address2 }">${info.address2 }
						${info.address3 }</div>
				</div>
			</li>

			<li>
				<%-- <div>
					<h2>가게 소개</h2>
					<div>${info.storeDes }</div>
				</div> --%>
			</li>

			<li>
				<div>
					<h2>영업 정보</h2>

					<div class="info_detail_title">
						<div>상호명</div>
						<div>영업시간</div>
						<div>전화번호</div>

					</div>

					<%-- <div class="info_detail">
						<div>${info.storeName }</div>
						<div>
							<span><fm:formatNumber value="${info.openingTime }"
									minIntegerDigits="2" />시 ~</span> <span><fm:formatNumber
									value="${info.closingTime }" minIntegerDigits="2" />시 </span>
						</div>
						<div>${info.storePhone }</div>

					</div> --%>
				</div>
			</li>

			<li>
				<div>
					<h2>가계 통계</h2>
					<div class="info_detail_title">

						<div>전체 리뷰 수</div>
						<div>찜</div>
					</div>

					<div class="info_detail">
						<%-- 
            <div>${info.orderCount }</div>
            <div>${info.reviewCount }</div>
            <div>${info.likesCount }</div> 
            --%>
					</div>
				</div>
			</li>



		</ul>
		<!-- 메뉴 탭 -->



		<!-- 리뷰 탭 -->
		<ul class="comment">
			<div class="reply_button_wrap">
				<button>리뷰 등록</button>
			</div>
			<div class="reply_not_div"></div>
			<ul class="reply_content_ul">

			</ul>
			<div class="repy_pageInfo_div"></div>



		</ul>
	</main>
</div>


<input type="hidden" value="${memberInfo.id}" id="store_id">
<input type="hidden" value="${store.storeInfo.matchId}" id="match_id">
<input type="hidden" value="${info.category }" id="store_category">
<%-- <input type="hidden" value="${info.openingTime }"
	id="store_opening_time">
<input type="hidden" value="${info.closingTime }"
	id="store_closing_time"> --%>

<input type="hidden" value="${info.address2 }" id="delevery_address">




<script>
	$(document)
			.ready(
					function() {

						var storeAddress = $("#store_address").data("address");

						var matchName = $("#store_name").data("store_name");

						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

						mapOption = {
							center : new kakao.maps.LatLng(33.25110701,
									126.570667), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};

						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption);

						// 주소-좌표 변환 객체를 생성합니다	
						var geocoder = new kakao.maps.services.Geocoder();

						// 주소로 좌표를 검색합니다
						geocoder
								.addressSearch(
										storeAddress,
										function(result, status) {

											// 정상적으로 검색이 완료됐으면 
											if (status === kakao.maps.services.Status.OK) {

												var coords = new kakao.maps.LatLng(
														result[0].y,
														result[0].x);

												// 결과값으로 받은 위치를 마커로 표시합니다
												var marker = new kakao.maps.Marker(
														{
															map : map,
															position : coords
														});

												// 인포윈도우로 장소에 대한 설명을 표시합니다
												var infowindow = new kakao.maps.InfoWindow(
														{
															content : '<div style="width:150px;text-align:center;padding:3px 0;">'
																	+ matchName
																	+ '</div>'
														});
												infowindow.open(map, marker);

												// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
												map.setCenter(coords);

												$(".storePosition").click(
														function() {
															map.panTo(coords);
														})

											}

										});

						var userAddress = $("#delevery_address").val();

						if (userAddress != "") {
							$(".userPosition").css("display", "inline");

							// 주소로 좌표를 검색합니다
							geocoder
									.addressSearch(
											userAddress,
											function(result, status) {

												// 정상적으로 검색이 완료됐으면 
												if (status === kakao.maps.services.Status.OK) {

													coords = new kakao.maps.LatLng(
															result[0].y,
															result[0].x);

													// 결과값으로 받은 위치를 마커로 표시합니다
													var marker = new kakao.maps.Marker(
															{
																map : map,
																position : coords
															});

													// 인포윈도우로 장소에 대한 설명을 표시합니다
													var infowindow = new kakao.maps.InfoWindow(
															{
																content : '<div style="width:150px;text-align:center;padding:3px 0;">'
																		+ "위치"
																		+ '</div>'
															});
													infowindow
															.open(map, marker);

													$(".userPosition")
															.click(
																	function() {
																		map
																				.panTo(coords);
																	})
												}
											});

						}

					})
					

	/* 바로구매 버튼 */
	$(".btn_buy").on("click", function() {
		$(".order_form").submit();
	});
	
	/* 리뷰 리스트 출력 */
	$(document).ready(function(){
		
		const matchId = '${store.storeInfo.matchId}';

		$.getJSON("/list", {matchId : matchId}, function(obj){
			
			makeReplyContent(obj);

		});
	});
	
	/* 리뷰쓰기 */
	$(".reply_button_wrap").on("click", function(e){
		
		e.preventDefault();
		
		const id = '${memberInfo.id}';
		const matchId = '${store.storeInfo.matchId}';

		$.ajax({
			data : {
				matchId : matchId,
				id : id
			},
			url : '/check',
			type : 'POST',
		
			success : function(result){

				if(result === '1'){
					alert("이미 등록된 리뷰가 존재 합니다.")
				} else if(result === '0'){
					let popUrl = "/replyEnroll/" + id + "?matchId=" + matchId;
					console.log(popUrl);
					let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
					
					window.open(popUrl,"리뷰 쓰기",popOption);							
				}				
				
			}
		});			

		
	});	
	
	
	/* 댓글 페이지 정보*/
	 const cri = {
		matchId : '${store.storeInfo.matchId}',
		pageNum : 1,
		amount : 10
	} 
	/* 댓글 페이지 이동 버튼 동작 */
	$(document).on('click', '.pageMaker_btn a', function(e){
			
		e.preventDefault();
		
		let page = $(this).attr("href");	
		cri.pageNum = page;		
		
		replyListInit();
			
	 });
	/* 댓글 데이터 서버 요청 및 댓글 동적 생성 메서드 */
	let replyListInit = function(){
		$.getJSON("/list", cri , function(obj){
			
			makeReplyContent(obj);
			
		});		
	}	

	
		/* 댓글(리뷰) 동적 생성 메서드 */
		function makeReplyContent(obj){
			
			if(obj.list.length === 0){
				$(".reply_not_div").html('<span>리뷰가 없습니다.</span>');
				$(".reply_content_ul").html('');
				$(".pageMaker").html('');
			} else{
				
				$(".reply_not_div").html('');
				
				const list = obj.list;
				const pf = obj.pageInfo;
				const userId = '${memberInfo.id}';		
				
				/* list */
				
				let reply_list = '';			
				
				$(list).each(function(i,obj){
					reply_list += '<li>';
					reply_list += '<div class="comment_wrap">';
					reply_list += '<div class="reply_top">';
					/* 아이디 */
					reply_list += '<span class="id_span">'+ obj.id+'</span>';
					/* 날짜 */
					// userId 출력
				
					reply_list += '<span class="date_span">'+ obj.regDate +'</span>';
					/* 평점 */
					reply_list += '<span class="rating_span">평점 : <span class="rating_value_span">'+ obj.rating +'</span>점</span>';
					if (obj.id == userId) {
					    reply_list += '<a class="delete_reply_btn" href="' + obj.replyId + '">삭제</a>';
					}

					reply_list += '</div>'; //<div class="reply_top">
					reply_list += '<div class="reply_bottom">';
					reply_list += '<div class="reply_bottom_txt">'+ obj.content +'</div>';
					reply_list += '</div>';//<div class="reply_bottom">
					reply_list += '</div>';//<div class="comment_wrap">
					reply_list += '</li>';
				});		
				
				$(".reply_content_ul").html(reply_list);			
				
				/* 페이지 버튼 */
				
				let reply_pageMaker = '';	
				
					/* prev */
					if(pf.prev){
						let prev_num = pf.pageStart -1;
						reply_pageMaker += '<li class="pageMaker_btn prev">';
						reply_pageMaker += '<a href="'+ prev_num +'">이전</a>';
						reply_pageMaker += '</li>';	
					}
					/* numbre btn */
					for(let i = pf.pageStart; i < pf.pageEnd+1; i++){
						reply_pageMaker += '<li class="pageMaker_btn ';
						if(pf.cri.pageNum === i){
							reply_pageMaker += 'active';
						}
						reply_pageMaker += '">';
						reply_pageMaker += '<a href="'+i+'">'+i+'</a>';
						reply_pageMaker += '</li>';
					}
					/* next */
					if(pf.next){
						let next_num = pf.pageEnd +1;
						reply_pageMaker += '<li class="pageMaker_btn next">';
						reply_pageMaker += '<a href="'+ next_num +'">다음</a>';
						reply_pageMaker += '</li>';	
					}	
					
					console.log(reply_pageMaker);
				$(".pageMaker").html(reply_pageMaker);				
				
			}		
			
		}
		/* 댓글 페이지 이동 버튼 동작 */
		$(document).on('click', '.pageMaker_btn a', function(e){
				
			e.preventDefault();
			
			let page = $(this).attr("href");	
			cri.pageNum = page;		
			
			replyListInit();
		 });
		/* 리뷰 삭제 버튼 */
		 $(document).on('click', '.delete_reply_btn', function(e){

			e.preventDefault();
			let replyId = $(this).attr("href");	
			
			$.ajax({
				data : {
					replyId : replyId,
					matchId : '${store.storeInfo.matchId}'
				},
				url : '/delete',
				type : 'POST',
				success : function(result){
					replyListInit();
					alert('삭제가 완료되엇습니다.');
				}
			});		
				
		 });
		
		// 찜하기
		 $(".inf i").click(function() {
		   let likes = "";
		   
		   if ($(this).hasClass("far")) {
		     $(this).removeClass("far").addClass("fas");
		     likes = "on";
		   } else {
		     $(this).removeClass("fas").addClass("far");
		     likes = "off";
		   }
		  
		   const id = $("#store_id").val();
		   const matchId = $("#match_id").val();
		   console.log("ID 값:", id);
		   console.log("matchId 값:", matchId);
		   const data = {
		     id: id,
		     matchId : matchId,
		     likes: likes
		   };
		   
		   $.ajax({
		     url: "/store/likes",
		     type: "POST",
		     data: data
		   })
		   .done(function(result) {
		     if (result == 0) {
		       // 처리 코드
		     } else {
		       let likesCount = $(".likes_count").data("count");
		       
		       if (likes == "on") {
		         $(".likes_count").text(likesCount + 1);
		         $(".likes_count").data("count", likesCount + 1);
		       } else {
		         $(".likes_count").text(likesCount - 1);
		         $(".likes_count").data("count", likesCount - 1);
		       }
		     }
		   });
		 });


</script>
</html>
