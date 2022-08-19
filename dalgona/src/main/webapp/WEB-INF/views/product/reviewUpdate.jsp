<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<div name="reviewbox" id="reviewbox">
	<form class="mb-3" name="myform" id="myform" enctype="multipart/form-data" method="post" action="${path }/product/updateReview.do">
		<fieldset>
			<span class="text-bold">별점을 선택해주세요</span> 
			<input type="radio" name="reviewStar" value="5" id="rate1" checked>
			<label for="rate1">★</label>
			<input type="radio" name="reviewStar" value="4" id="rate2">
			<label for="rate2">★</label> 
			<input type="radio" name="reviewStar"value="3" id="rate3"> 
			<label for="rate3">★</label> 
			<input type="radio" name="reviewStar" value="2" id="rate4">
			<label for="rate4">★</label> 
			<input type="radio" name="reviewStar" value="1" id="rate5">
			<label for="rate5">★</label>
		</fieldset>
		
		<div class="row">
			<div class="col">
				<textarea class="col-auto form-control" type="text"
					id="reviewContent" name="reviewContent" placeholder="내용을 입력해주세요">${r.reviewContent }</textarea>
			</div>
			
		</div>
		<br>
		<div class="custom-file">
			<input type="file" class="custom-file-input" name="reviewImage"id="image" accept="image/*" onchange="setThumbnail(event);"/> 
		</div>
		<br>
		<div  class="col" id="image_container">
				<c:if test="${not empty r.reviewImage }">
					<img id="reviewImage" name="reviewImage"src="${r.reviewImage }" width="300" height="300" border="1" />
				</c:if>
		</div>
		<br>	
		<div class="align-items-center">
				<button type="submit">리뷰수정</button>
		</div>
		
		<input type="hidden" value="${r.productCode }" name="productCode">
		<input type="hidden" value="${r.memberId }" name="memberId">		
		<input type="hidden" value="${r.reviewCode }" name="reviewCode">		
		<input type="hidden" value="${r.reviewImage }" name="beforReviewImage">		
	</form>
</div>
<script>
      function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.getElementById('reviewImage');
          /* var img = document.createElement("img"); */
          img.setAttribute("src", event.target.result);
          /* document.querySelector("div#image_container").appendChild(img); */
        };

        reader.readAsDataURL(event.target.files[0]);
      }
</script>			
				
<style>

#reviewbox{
  display: flex;
  justify-content: center;
}


				/* 별찍기 */
#myform fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#myform fieldset legend {
	text-align: right;
}

#myform input[type=radio] {
	display: none;
}

#myform label {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#myform label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContent {
	width: 100%;
	height: 100px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}
</style>


</body>
</html>