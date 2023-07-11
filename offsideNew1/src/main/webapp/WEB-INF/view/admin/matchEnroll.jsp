<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/view/include/link.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style type="text/css">
.form_section_content select { /* 카테고리 css 설정 */
	width: 92%;
	height: 35px;
	font-size: 20px;
	text-align-last: center;
	margin-left: 5px;
}

.cate_wrap span {
	font-weight: 600;
}

.cate_wrap:not(:first-child) {
	margin-top: 20px;
}

#result_card img {
	max-width: 100%;
	height: auto;
	display: block;
	padding: 5px;
	margin-top: 10px;
	margin: auto;
}

#result_card {
	position: relative;
}

.imgDeleteBtn {
	position: absolute;
	top: 0;
	right: 5%;
	background-color: #ef7d7d;
	color: wheat;
	font-weight: 900;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	line-height: 26px;
	text-align: center;
	border: none;
	display: block;
	cursor: pointer;
}
.admin_content_main {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.form_section {
  display: flex;
  margin-bottom: 20px;
}

.form_section_title {
  width: 120px;
  display: flex;
  align-items: center;
}

.form_section_title label {
  font-weight: bold;
}

.form_section_content {
  flex: 1;
}

.form_section_content input[type="text"],
.form_section_content input[type="number"],
.form_section_content input[type="file"],
.form_section_content textarea {
  width: 100%;
  height: 30px;
  font-size: 16px;
  padding: 5px;
}

.form_section_content select {
  width: 100%;
  height: 35px;
  font-size: 16px;
  padding: 5px;
}

.btn_section {
  margin-top: 20px;
}

.btn {
  padding: 10px 20px;
  font-size: 16px;
}

.enroll_btn {
  background-color: #4caf50;
  color: white;
}

.imgDeleteBtn {
  position: absolute;
  top: 0;
  right: 5%;
  background-color: #ef7d7d;
  color: wheat;
  font-weight: 900;
  width: 30px;
  height: 30px;
  border-radius: 50%;
  line-height: 26px;
  text-align: center;
  border: none;
  display: block;
  cursor: pointer;
}

#uploadResult {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  margin-top: 10px;
}

#result_card {
  position: relative;
  width: 200px;
  margin: 5px;
}

#result_card img {
  max-width: 100%;
  height: auto;
  display: block;
  padding: 5px;
  margin-top: 10px;
}

.cate_wrap span {
  font-weight: 600;
}

.cate_wrap:not(:first-child) {
  margin-top: 20px;
}

</style>
</head>
<body>
	<div class="admin_content_main">
		<form action="/admin/matchEnroll" method="post" id="enrollForm">
			<div class="form_section">
				<div class="form_section_title">
					<label>매치 제목</label>
				</div>
				<div class="form_section_content">
					<input name="matchName">
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>경기장</label>
				</div>
				<div class="form_section_content">
					<input id="groundName_input" readonly="readonly"> <input
						id="groundId_input" name="groundId" type="hidden">
					<button class="groundId_btn">경기장 선택</button>
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>매치 날짜</label>
				</div>
				<div class="form_section_content">
					<input name="matchDate" autocomplete="off" readonly="readonly">
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>매치 관리자</label>
				</div>
				<div class="form_section_content">
					<input name="matchOwner">
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>매치 카테고리</label>
				</div>
				<div class="form_section_content">
					<div class="cate_wrap">
						<span>대분류</span> <select class="cate1">
							<option selected value="none">선택</option>
						</select>
					</div>
					<div class="cate_wrap">
						<span>중분류</span> <select class="cate2">
							<option selected value="none">선택</option>
						</select>
					</div>
					<div class="cate_wrap">
						<span>소분류</span> <select class="cate3" name="cateCode">
							<option selected value="none">선택</option>
						</select>
					</div>
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>매치 가격</label>
				</div>
				<div class="form_section_content">
					<input name="matchPrice" value="0">
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>매치 인원</label>
				</div>
				<div class="form_section_content">
					<input name="matchStock" value="0">
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>매치 할인율</label>
				</div>
				<div class="form_section_content">
					<input name="matchDiscount" value="0">
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>매치 소개</label>
				</div>
				<div class="form_section_content">
					<textarea name="matchIntro" id="matchIntro_textarea"></textarea>
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>매치 목차</label>
				</div>
				<div class="form_section_content">
					<textarea name="matchContents" id="matchContents_textarea"></textarea>
				</div>
			</div>
			
			<div class="form_section">
				<div class="form_section_title">
					<label>주소번호</label>
				</div>
				<div class="form_section_content">
					<input name="address1">
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>주소</label>
				</div>
				<div class="form_section_content">
					<input name="address2">
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>상세주소</label>
				</div>
				<div class="form_section_content">
					<input name="address3">
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>카테고리</label>
				</div>
				<div class="form_section_content">
					<input name="category">
				</div>
			</div>
			
			<div class="form_section">
				<div class="form_section_title">
					<label>상품 이미지</label>
				</div>
				<div class="form_section_content">
					<input type="file" id="fileItem" name='uploadFile'
						style="height: 30px;">
					<div id="uploadResult">
						<!-- 
										<div id="result_card">
											<div class="imgDeleteBtn">x</div>
											<img src="/display?fileName=test.png">
										</div>
										 -->
					</div>
				</div>
			</div>
		</form>
		<div class="btn_section">
			<button id="cancelBtn" class="btn">취 소</button>
			<button id="enrollBtn" class="btn enroll_btn">등 록</button>
		</div>
	</div>

	<script>

	let enrollForm = $("#enrollForm")
	
/* 취소 버튼 */
$("#cancelBtn").click(function(){
	
	location.href="/admin/matchManage"
	
});

/* 등록 버튼 */
$("#enrollBtn").on("click",function(e){
	
	e.preventDefault();
	
	enrollForm.submit();
	
});
/* 위지윅 적용 */

/* 매치 소개 */
ClassicEditor
	.create(document.querySelector('#matchIntro_textarea'))
	.catch(error=>{
		console.error(error);
	});
	
/* 매치 목차 */	
ClassicEditor
.create(document.querySelector('#matchContents_textarea'))
.catch(error=>{
	console.error(error);
});

/* 설정 */
const config = {
	dateFormat: 'yy-mm-dd',
	showOn : "button",
	buttonText:"날짜 선택",
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    yearSuffix: '년',
    changeMonth: true,
    changeYear: true
}
/* 캘린더 */
$(function() {
  $( "input[name='matchDate']" ).datepicker(config);
});

/* 경기장 선택 버튼 */
$('.groundId_btn').on("click",function(e){
	
	e.preventDefault();
	let popUrl = "/admin/groundPop";
	let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
	
	window.open(popUrl,"경기장 찾기",popOption);	
});

$(document).ready(function(){
	console.log('${cateList}');
});


/* 카테고리 */
	let cateList = JSON.parse('${cateList}');

	let cate1Array = new Array();
	let cate2Array = new Array();
	let cate3Array = new Array();
	let cate1Obj = new Object();
	let cate2Obj = new Object();
	let cate3Obj = new Object();
	
	let cateSelect1 = $(".cate1");		
	let cateSelect2 = $(".cate2");
	let cateSelect3 = $(".cate3");
	
	/* 카테고리 배열 초기화 메서드 */
	function makeCateArray(obj,array,cateList, tier){
		for(let i = 0; i < cateList.length; i++){
			if(cateList[i].tier === tier){
				obj = new Object();
				
				obj.cateName = cateList[i].cateName;
				obj.cateCode = cateList[i].cateCode;
				obj.cateParent = cateList[i].cateParent;
				
				array.push(obj);				
				
			}
		}
	}	
	
	/* 배열 초기화 */
	makeCateArray(cate1Obj,cate1Array,cateList,1);
	makeCateArray(cate2Obj,cate2Array,cateList,2);
	makeCateArray(cate3Obj,cate3Array,cateList,3);

	
	/* 대분류 <option> 태그 */
	for(let i = 0; i < cate1Array.length; i++){
		cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
	}
	
	
	/* 중분류 <option> 태그 */
	$(cateSelect1).on("change",function(){
		
		let selectVal1 = $(this).find("option:selected").val();	
		
		cateSelect2.children().remove();
		cateSelect3.children().remove();
		
		cateSelect2.append("<option value='none'>선택</option>");
		cateSelect3.append("<option value='none'>선택</option>");
		
		for(let i = 0; i < cate2Array.length; i++){
			if(selectVal1 === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");	
			}
		}// for
		
	});
	
	/* 소분류 <option>태그 */
	$(cateSelect2).on("change",function(){
		
		let selectVal2 = $(this).find("option:selected").val();
		
		cateSelect3.children().remove();
		
		cateSelect3.append("<option value='none'>선택</option>");		
		
		for(let i = 0; i < cate3Array.length; i++){
			if(selectVal2 === cate3Array[i].cateParent){
				cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");	
			}
		}// for		
		
	});	
	
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		
		/* 이미지 존재시 삭제 */
		if($(".imgDeleteBtn").length > 0){
			deleteFile();
		}
		
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
		formData.append("uploadFile", fileObj);
		
		$.ajax({
			url: '/admin/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadImage(result);
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}
		});		

		
	});
		
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}	
	
	
	/* 이미지 출력 */
	function showUploadImage(uploadResultArr){
		
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#uploadResult");
		
		let obj = uploadResultArr[0];
		
		let str = "";
		
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		//replace 적용 하지 않아도 가능
		//let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<img src='/admin/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";		
		str += "</div>";		
		
   		uploadResult.append(str);     
        
	}	
	
	
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		
		deleteFile();
		
	});
	/* 파일 삭제 메서드 */
	function deleteFile(){
		
		let targetFile = $(".imgDeleteBtn").data("file");
		
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: '/admin/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
				
			},
			error : function(result){
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
	}
</script>
</body>
</html>