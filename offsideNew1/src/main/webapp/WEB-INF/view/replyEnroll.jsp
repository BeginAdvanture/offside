<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper_div">
		<div class="subject_div">리뷰 등록</div>

	</div>
	<div class="input_wrap">
		<div class="matchName_div">
			<h2>${matchInfo.matchName}</h2>
		</div>
		<div class="rating_div">
			<h4>평점</h4>
			<select name="rating">
				<option value="0.5">0.5</option>
				<option value="1.0">1.0</option>
				<option value="1.5">1.5</option>
				<option value="2.0">2.0</option>
				<option value="2.5">2.5</option>
				<option value="3.0">3.0</option>
				<option value="3.5">3.5</option>
				<option value="4.0">4.0</option>
			</select>
		</div>
		<div class="content_div">
			<h4>리뷰</h4>
			<textarea name="content"></textarea>
		</div>
		<div class="btn_wrap">
			<a class="cancel_btn">취소</a><a class="enroll_btn">등록</a>
		</div>
	</div>
<script type="text/javascript">
/* 취소 버튼 */
$(".cancel_btn").on("click", function(e){
	window.close();
});	
/* 등록 버튼 */
$(".enroll_btn").on("click", function(e){
    e.preventDefault();
    const matchId = '${matchInfo.matchId}';
    const id = '${Id}';
    const rating = $("select").val();
    const content = $("textarea").val();

    const data = {
        matchId : matchId,
        id : id,
        rating : rating,
        content : content
    };

    $.ajax({
        data : data,
        type : 'POST',
        url : '/enroll',
        success : function(result){
            /* 댓글 초기화 */
            opener.replyListInit();
            window.close();
        }
    });
});


</script>
</body>
</html>