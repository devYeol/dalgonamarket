<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>

<style>
.cart-form {
	margin-left: 100px;
	margin-right: 100px;
	margin-top: 50px;
	display: flex;
}

.sidebar {
	width: 100%;
	height: 600px;
	width: 200px;
	position: sticky;
	top: 50px;
}

.sidebar ul {
	padding: 0;
	margin-top: 40px;
}

.sidebar ul li {
	list-style: none;
	margin-top: 20px;
}

.sidebar ul li a {
	text-decoration: none;
	color: #999;
}

.sidebar ul li a:hover{
	color: black;
}

.cart-container {
	width: 100%;
	position: relative;
	margin-left: 50px;
}

.zzim-inners {
	margin-top: 40px;
}
</style>



<div class="headcontainer border-top" style="padding-top: 20px"></div>
<section class="cart-form">
	<div>
    	<div class="sidebar">
        	<h4><strong>마이페이지</strong></h4>
               <ul>
                  <li><h5><b>쇼핑정보</b></h5></li>
                  <li><a href="#">구매내역</a></li> 
                  <li><a href="#">장바구니</a></li> 
                  <li><a href="#">찜 목록</a></li>
                  <br>
                  <li><h5><b>내정보</b></h5></li>
                  <li><a href="#">프로필 정보</a></li>
                  <li><a href="#">주소록</a></li>
               </ul>
         </div>
	</div>

	<div class="cart-container">
		<h4>
			<b>찜 목록</b>
		</h4>
		<div class="zzim-inners">
			<div style="display: flex;">
				<h4>♥ 찜 목록</h4>
				<span style="margin-left: 20px; display: inline-block;">총 2개</span>
			</div>
			<div style="display: flex; justify-content: space-between; margin-top: 20px;">
				<div style="display: flex;">
					<input class="form-check-input" type="checkbox"
						id="checkboxNoLabel" value=""
						style="margin-right: 10px; margin-top: 12px;">
					<div id="check3" style="margin-right: 10px; margin-top: 7px;">전체선택</div>
					<button type="button" class="btn btn-outline-primary"
						id="btnDelete">선택삭제</button>
				</div>
			</div>
			<hr>
			<div style="margin-top:30px; justify-content: space-between; ">
				<div class="" style="float:left; margin-right:20px; width:1100px;">
					<input type="checkbox" style="float:left; margin-right:10px;" >
					<div style="display:inline-block;">
						<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340"
						alt="Image" style="width: 250px; margin-bottom:100px; margin-right:30px;" />
					</div>
				<div style="display:inline-block;">
					<p>배송비 2500원</p><br>
					<h3 style="">해바라기 씨 1 개</h3><br>
					<h5 style="">1400원</h5>
				</div>
					<div class="d-grid gap-2 col-6 mx-auto"
						 style="float:right; display:inline-block; width:300px; margin-top:50px;">
					  <button class="btn btn-primary" type="button" >장바구니 담기</button>
					  <button class="btn btn-secondary " type="button">삭제</button>
					</div>
				</div>
			</div>
			
		</div>
		 	

	</div>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />