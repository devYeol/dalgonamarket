<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/shop.css" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>

<section id="content">
	<!-- 카테고리배너 -->
	<hr style="background: lightgray;">
	<div style="margin: auto 0;">
		<div style="diplay: block;">
			<div style="display: flex; margin: 0 auto; max-width: 1200px; justify-content: space-between;">
				<div class="category11">
					<a class="button1 category11" id="cate1" href="${path}/product/productList">ALL</a>
				</div>
				<div class="category11">
					<a class="button1 category11" href="${path}/product/productList?categoryName=스낵">스낵</a>
				</div>
				<div class="category11">
					<a class="button1 category11" href="${path}/product/productList?categoryName=사탕">사탕</a>
				</div>
				<div class="category11">
					<a class="button1 category11" href="${path}/product/productList?categoryName=초코">초코</a>
				</div>
				<div class="category11">
					<a class="button1 category11" href="${path}/product/productList?categoryName=젤리">젤리</a>
				</div>
				<div class="category11">
					<a class="button1 category11" href="${path}/product/productList?categoryName=완구">완구</a>
				</div>
				<div class="category11">
					<a class="button1 category11" href="${path}/product/productList?categoryName=기타">기타</a>
				</div>
			</div>
		</div>
	</div>
	<hr style="background: lightgray;">
	<!-- 카테고리배너 끝 -->

	<!-- 광고배너 시작 -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<!--
					<img src="/resources/images/msw/digivice.png" class="d-block w-100" alt="..." height="150" width="400 px">
 				-->
				<img src="https://kream-phinf.pstatic.net/MjAyMjA0MDVfMjg3/MDAxNjQ5MTQxNDQ2MzE5.KmWw8NmaqtTEZQUwNB-qnk94UoRvQjTBz6HE-wcsUPwg.uKnTAOmBZVasnEheK77-WjBLVGkrxaev02tgaOLhqz0g.JPEG/a_e84bc8e4c55041b29479627fc78a2469.jpg" class="d-block w-100" alt="..." height="150" width="400 px">
			</div>
			<div class="carousel-item">
				<img src="https://kream-phinf.pstatic.net/MjAyMjA0MDVfMjg3/MDAxNjQ5MTQxNDQ2MzE5.KmWw8NmaqtTEZQUwNB-qnk94UoRvQjTBz6HE-wcsUPwg.uKnTAOmBZVasnEheK77-WjBLVGkrxaev02tgaOLhqz0g.JPEG/a_e84bc8e4c55041b29479627fc78a2469.jpg" class="d-block w-100" alt="..." height="150">
			</div>
			<div class="carousel-item">
				<img
					src="https://kream-phinf.pstatic.net/MjAyMjA0MDVfMjg3/MDAxNjQ5MTQxNDQ2MzE5.KmWw8NmaqtTEZQUwNB-qnk94UoRvQjTBz6HE-wcsUPwg.uKnTAOmBZVasnEheK77-WjBLVGkrxaev02tgaOLhqz0g.JPEG/a_e84bc8e4c55041b29479627fc78a2469.jpg" class="d-block w-100" alt="..." height="150">
			</div>
		</div>
		
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
			<span class="visually-hidden">Previous</span>
		</button>
		
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> 
			<span class="visually-hidden">Next</span>
		</button>
	</div>
	<!-- 배너 끝 -->

	<br> <br>
	
	<div class="shopHeader">
		<div style="font-size: 24px;">
			<span>검색 결과: ${listCounts} 건</span>
		</div>
		<div style="diplay:flex;">
			<table>
				<tr>
					<td>
						<div style="">
							<select style="text-align: center; font-size: 15px;" onchange="selectBoxChange(this.value)" id="searchSeq">
								<option value="최신순">최신순</option>
								<option value="가격순">가격순</option>
								<option value="인기순">인기순</option>
								<option value="별점순">별점순</option>
								<option value="리뷰순">리뷰순</option>
							</select>
						</div>
					</td>
					<td>
						<div style="font-size: 12px;">
							<button style="border: none; background-color: white;" onclick="orderChange(this.value);" value="ASC">오름차순</button>
							<br>
							<button style="border: none; background-color: white;" onclick="orderChange(this.value);" value="DESC">내림차순</button>
						</div>
					</td>
				</tr>
			</table>
		</div>
		
	</div>
	
	<br>
	
	<div class="container">
		<!-- Carousel items -->
		<div class="carousel-inner">
			<div class="item">
				<div class="row">
					<c:if test="${not empty products}">
						<c:forEach var="p" items="${products}">
							<!-- 상품 1개 -->
							<div class="col-3" type="button" onclick="location.assign('${path}/product/productDetail/${p.productCode}')">
								<div class="">
									<div style="position: relative;">
										<img src="${p.productThumb}" alt="Image" height="305" width="305" />
									</div>
									<!-- <div class="zzim">
										<img class="fullheart" src="/resources/images/msw/fullheart.png">
										<img class="beanheart" src="/resources/images/msw/beanheart.png">
									</div> -->
								</div>
								<div>
									<div class="leftbox" style="font-size:20px;">
										<span>${p.productName}</span>
									</div>
									<div class="rightbox">
										<span>★4.8/5</span>
									</div>
									<hr style="margin: 4px 0px 4px 0px">
									<div>
										<div class="leftbox">
											<span class="">${p.productContent}</span>
										</div>
										<div class="rightbox">
											<h4>${p.productPrice}원</h4>
										</div>
									</div>
								</div>
							</div>
							<!-- 상품 1개 끝 -->
						</c:forEach>
					</c:if>
					<c:if test="${empty products}">
						<div style="padding-left: 42%;">
							조회된 상품이 없습니다ㅠㅠ
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<!-- Carousel items End -->
	</div>
	
	<br> <br>
	
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>

	const ppp=()=>{
		console.log('상세페이지');
	}
		
 $(document).ready(function(){
     /*웹페이지 열었을 때*/
     $(".beanheart").show();
     $(".fullheart").hide();
     console.log('클릭 이벤트 처리');

     /*img1을 클릭했을 때 img2를 보여줌*/
     $(".beanheart").click(function(){
    	 $(".beanheart").hide();
         $(".fullheart").show();
    	 event.stopPropagation();
    	 console.log('클릭 이벤트 처리');
     });

     /*img2를 클릭했을 때 img1을 보여줌*/
     $(".fullheart").click(function(){
         $(".beanheart").show();
         $(".fullheart").hide();
    	 event.stopPropagation();
    	 console.log('클릭 이벤트 처리');
     });
 });
 
 const selectBoxChange = function(value) {
	 console.log(value);
	 location.assign('${path}/product/productList?categoryName=${categoryName}&searchSeq='+value);
 }
 
 const orderChange = function(value) {
	 console.log(value);
	 location.assign('${path}/product/productList?categoryName=${categoryName}&searchSeq=${searchSeq}&searchOrder='+value);
 } 
 
 $("#searchSeq").val('${searchSeq}').prop('selected',true);
</script>


