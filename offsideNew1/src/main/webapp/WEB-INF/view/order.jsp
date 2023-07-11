
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.member_info_div {
	margin-bottom: 20px;
}

.memberInfo_table {
	width: 100%;
}

.memberInfo_table th {
	width: 25%;
}

.goods_kind_div {
	margin-bottom: 20px;
	font-size: 18px;
	font-weight: bold;
}

.goods_subject_table,
.goods_table {
	width: 100%;
	border-collapse: collapse;
}

.goods_subject_table th,
.goods_table th,
.goods_table td {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
}

.goods_subject_table th {
	width: 15%;
	background-color: #f1f1f1;
}

.goods_table td {
	width: 40%;
}

.goods_table td:nth-child(2) {
	width: 45%;
}

.goods_table_price_td {
	position: relative;
}

.goods_table_price_td .price_label {
	position: absolute;
	bottom: -20px;
	left: 10px;
	font-size: 12px;
	color: #777;
}

.point_div {
	margin-bottom: 20px;
}

.point_table {
	width: 100%;
	border-collapse: collapse;
}

.point_table th {
	width: 25%;
	background-color: #f1f1f1;
}

.point_table td {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
}

.order_btn {
	display: inline-block;
	padding: 10px 20px;
	background-color: #30DA;
	color: white;
	text-decoration: none;
	border-radius: 4px;
}

.order_form {
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="member_info_div">
		<table class="table_text_align_center memberInfo_table">
			<tbody>
				<tr>
					<th style="width: 25%;">플레이어</th>
					<td style="width: *">${memberInfo.nickname}|
						${memberInfo.email}</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="orderGoods_div">
		<!-- 상품 종류 -->
		<div class="goods_kind_div">
			주문상품 <span class="goods_kind_div_kind"></span>종류
		</div>
		<!-- 상품 테이블 -->
		<table class="goods_subject_table">
			<colgroup>
				<col width="15%">
				<col width="45%">
				<col width="40%">
			</colgroup>
			<tbody>
				<tr>
					<!-- <th>이미지</th> -->
					<th style="width: 50%">매치 정보</th>
					<th style="width: 50%">판매가</th>
				</tr>
			</tbody>
		</table>
		<table class="goods_table">
			<colgroup>
				<col width="15%">
				<col width="45%">
				<col width="40%">
			</colgroup>					
			<tbody>
				<c:forEach items="${orderList}" var="ol">
					<tr>
						<!-- <td>
							이미지 <td>
						</td> -->
						<td style="width: 50%">${ol.matchName}</td>
						<td style="width: 50%" class="goods_table_price_td">
							<fmt:formatNumber value="${ol.salePrice}" pattern="#,### 원" /> 
							<br><fmt:formatNumber value="${ol.totalPrice}" pattern="#,### 원" />
							<br>[<fmt:formatNumber value="${ol.totalPoint}" pattern="#,### 원" />P]
							<input type="hidden" class="individual_matchPrice_input" value="${ol.matchPrice}">
							<input type="hidden" class="individual_salePrice_input" value="${ol.salePrice}">
							
							<input type="hidden" class="individual_totalPrice_input" value="${ol.totalPrice}">
							<input type="hidden" class="individual_point_input" value="${ol.point}">
							<input type="hidden" class="individual_totalPoint_input" value="${ol.totalPoint}">
							<input type="hidden" class="individual_matchId_input" value="${ol.matchId}">
						</td>
					</tr>							
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="point_div">
		<div class="point_div_subject">포인트 사용</div>
		<table class="point_table">
			<colgroup>
				<col width="25%">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>포인트 사용</th>
					<td>
						${memberInfo.point} | <input class="order_point_input" value="0">원 
						<a class="order_point_input_btn order_point_input_btn_N" data-state="N">모두사용</a>
						<a class="order_point_input_btn order_point_input_btn_Y" data-state="Y" style="display: none;">사용취소</a>
						
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="total_info_div">
		<!-- 가격 종합 정보 -->
		<div class="total_info_price_div">
			<ul>
				<li>
					<span class="price_span_label">상품 금액</span>
					<span class="totalPrice_span">100000</span>원
				</li>
				
				<li>
					<span class="price_span_label">할인금액</span>
					<span class="usePoint_span">100000</span>원
				</li>
				<li class="price_total_li">
					<strong class="price_span_label total_price_label">최종 결제 금액</strong>
					<strong class="strong_red">
						<span class="total_price_red finalTotalPrice_span">
							1500000
						</span>원
					</strong>
				</li>
				<li class="point_li">
					<span class="price_span_label">적립예정 포인트</span>
					<span class="totalPoint_span">7960원</span>
				</li>
			</ul>
		</div>
		<!-- 버튼 영역 -->
		<div class="total_info_btn_div">
			<a class="order_btn">결제하기</a>
		</div>
			<!-- 주문 요청 form -->
			<form class="order_form" action="/order" method="post">
				<!-- 주문자 회원번호 -->
				<input name="id" value="${memberInfo.id}" type="hidden">
				
				<!-- 사용 포인트 -->
				<input name="usePoint" type="hidden">
				<!-- 상품 정보 -->
			</form>
	</div>
	
	
	<script type="text/javascript">
	/* 포인트 입력 */
	//0 이상 & 최대 포인트 수 이하
	$(".order_point_input").on("propertychange change keyup paste input", function(){

		const maxPoint = parseInt('${memberInfo.point}');	
		
		let inputValue = parseInt($(this).val());	
		
		if(inputValue < 0){
			$(this).val(0);
		} else if(inputValue > maxPoint){
			$(this).val(maxPoint);
		}	
		
	});
	
	/* 포인트 모두사용 취소 버튼 
	 * Y: 모두사용 상태 / N : 모두 취소 상태
	 */
	$(".order_point_input_btn").on("click", function(){

		const maxPoint = parseInt('${memberInfo.point}');	
		
		let state = $(this).data("state");	
		
		if(state == 'N'){
			console.log("n동작");
			/* 모두사용 */
			//값 변경
			$(".order_point_input").val(maxPoint);
			//글 변경
			$(".order_point_input_btn_Y").css("display", "inline-block");
			$(".order_point_input_btn_N").css("display", "none");
		} else if(state == 'Y'){
			console.log("y동작");
			/* 취소 */
			//값 변경
			$(".order_point_input").val(0);
			//글 변경
			$(".order_point_input_btn_Y").css("display", "none");
			$(".order_point_input_btn_N").css("display", "inline-block");		
		}		
		
	});
	
	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	function setTotalInfo(){

		let totalPrice = 0;				// 총 가격
		
		let totalKind = 0;				// 총 종류
		let totalPoint = 0;				// 총 마일리지
		
		let usePoint = 0;				// 사용 포인트(할인가격)
		let finalTotalPrice = 0; 		// 최종 가격
		
		$(".goods_table_price_td").each(function(index, element){
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
			
			// 총 종류
			totalKind += 1;
			// 총 마일리지
			totalPoint += parseInt($(element).find(".individual_totalPoint_input").val());
		});	

		
		finalTotalPrice = totalPrice ;	
		
		/* 사용 포인트 */
		usePoint = $(".order_point_input").val();
		
		finalTotalPrice = totalPrice - usePoint;	
		
		/* 값 삽입 */
		// 총 가격
		$(".totalPrice_span").text(totalPrice.toLocaleString());
		
		// 총 종류
		$(".goods_kind_div_kind").text(totalKind);
		// 총 마일리지
		$(".totalPoint_span").text(totalPoint.toLocaleString());
		
		// 최종 가격(총 가격 )
		$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
		// 할인가(사용 포인트)
		$(".usePoint_span").text(usePoint.toLocaleString()) + 3000;	
		
	}
	
	$(document).ready(function(){
		
		/* 주문 조합정보란 최신화 */
		setTotalInfo();
		
	});
	
	/* 주문 요청 */
	$(".order_btn").on("click", function(){


		
		
		/* 사용 포인트 */
		$("input[name='usePoint']").val($(".order_point_input").val());	
		
		/* 상품정보 */
		let form_contents = ''; 
		$(".goods_table_price_td").each(function(index, element){
			let matchId = $(element).find(".individual_matchId_input").val();
		
			let matchId_input = "<input name='orders[" + index + "].matchId' type='hidden' value='" + matchId + "'>";
			form_contents += matchId_input;
	
		});	
		$(".order_form").append(form_contents);	
		
		/* 서버 전송 */
		$(".order_form").submit();	
		
	});	
	
	
	
	
	</script>
</body>
</html>