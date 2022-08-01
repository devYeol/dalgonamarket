<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<section id="content">
	<main class="container">

		<div class="row mb-2">


			<div class="row g-5">
				<div class="col-md-6" style="border-right:1px solid; black; padding-right: 10px;">
					<div class="position-sticky" style="top: 2rem;">
						<img
							src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340"
							class="d-block w-100" alt="..." height="500" width="410px">
					</div>
				</div>

				<div class="col-md-6 d-grid gap-5">
					<div class="row border-bottom"> 
						<div class="col-8"><h4>맛있는 초코비</h4></div>
						<div class="col-2">별점</div>
						<div class="col-2"><span><i class="fas fa-heart" ></i> 찜 </span></div>
					</div>
					
					<div class="row border-bottom" >
						<div class="col-9 ">판매가</div>
						
						<div class="col-3 ">
							<div> 1400원</div>
							<div>(재고수량 : 00)</div>
						</div>
					</div>
					
					<div class="row border-bottom">
						<div>배송비 : 2500원</div>	
						<div >도착예정일</div>
					</div>
					
					<div class="row d-grid gap-3	">
						<div>
							맛있는 초코비 1박스
							<select class="form-select" aria-label="Default select example">
							  <option selected>옵션</option>
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
							</select>
						</div>
						<div class="d-md-flex justify-content-md-end">주문수량<input type="number" value="1"></div>
					</div>
					
					<div class="row gap-2">
						<button type="button" class="btn col btn-secondary btn-lg">장바구니</button>
						<button type="button" class="btn col btn-primary btn-lg">결제하기</button>						
					</div>
					
					

				</div>

			</div>
			<div class="offset"></div>
			<ul class="tab ">
				<li class="select">상세</li>
				<li>리뷰</li>
				<li>문의</li>
			</ul>


			<!-- 상세 탭 -->
			<ul>
			</ul>
			<!-- 메뉴 탭 -->


			<!-- 리뷰 탭 -->
			<ul>
			</ul>
			<!-- 리뷰 탭 -->


			<!-- 문의 탭 -->
			<ul>

			</ul>
			<!-- 문의 탭 -->
	</main>
	
	<style>
	ul{
	   list-style:none;
	}
	.fas.fa-heart {
	color: red;	
	}
	main {
	width: 70%;
	}
	
	main ul.tab {
		display: flex;
		background: #fff;
	}
	
	main ul.tab li {
		width: 100%;
		padding: 5px 0;
		border: 1px solid #ddd;
		text-align: center;
		cursor: pointer;
		font-size: 2rem;
	}
	
	main ul.tab li:hover {
		background: #333333;
		color: #fff;
		transition: 0.1s;
	}
	
	main ul.tab li.select {
		background:  #333333;
		color: #fff;		
	}

	</style>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />