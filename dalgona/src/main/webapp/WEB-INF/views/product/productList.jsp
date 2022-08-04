<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>

<style>

.category11{
padding:12px 10px;
text-decoration:none;
color:black;
font-size:18px;

}

#search {
	margin-left: 110px;
}

.chartsoon {
	display: inline-block;
	font-size: 1px;
}

.leftbox {
	display: inline-block;
}

.rightbox {
	display: inline-block;
	float: right;
}

.btnnone {
	/* display:none; */
	border: 0;
	background-color: white;
}

.zzim {
	float: right;
	position: absolute;
	top: 1;
	width: 24%;
	margin-left: -8px;
}

.fullheart {
	width: 55;
	height: 40;
	float: right;
}

.beanheart {
	width: 50;
	height: 40;
	float: right;
}
</style>


<section id="content">

	<hr style="background:lightgray;">
	<div style="margin:auto 0; ">
		<div style="diplay:block; ">
			<div style="display: flex; margin:0 auto; max-width:1200px; justify-content: space-between;">
				<div class="category11"  >
					<a class="button1 category11" id="cate1">ALL</a>
				</div>
				<div class="category11">
					<a class="button1 category11">과자</a>
				</div>
				<div class="category11">
					<a class="button1 category11">사탕</a>
				</div>
				<div class="category11">
					<a class="button1 category11">초코</a>
				</div>
				<div class="category11">
					<a class="button1 category11">젤리</a>
				</div>
				<div class="category11">
					<a class="button1 category11">완구</a>
				</div>
				<div class="category11">
					<a class="button1 category11">기타</a>
				</div>
			</div>
		</div>




	</div>
<hr style="background:lightgray;">
	<!-- 배너 시작 -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<!-- 				<img src="/resources/images/msw/digivice.png" class="d-block w-100"
					alt="..." height="150" width="400 px">
 -->
				<img
					src="https://kream-phinf.pstatic.net/MjAyMjA0MDVfMjg3/MDAxNjQ5MTQxNDQ2MzE5.KmWw8NmaqtTEZQUwNB-qnk94UoRvQjTBz6HE-wcsUPwg.uKnTAOmBZVasnEheK77-WjBLVGkrxaev02tgaOLhqz0g.JPEG/a_e84bc8e4c55041b29479627fc78a2469.jpg"
					class="d-block w-100" alt="..." height="150" width="400 px">
			</div>
			<div class="carousel-item">
				<img src="/resources/images/msw/snackcollection.png"
					class="d-block w-100" alt="..." height="150">
			</div>
			<div class="carousel-item">
				<img
					src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340"
					class="d-block w-100" alt="..." height="150">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<!-- 배너 끝 -->

	<br> <br>
	
	<div style="position:absolute; font-size:25px; top:70%;">
		<span class="search" id="search">검색 결과:00 건</span>
	</div>
	<br>
	<div style="display:flex;float: right; margin-right:6%;">
	<div style="display: inline-block; margin-top:5%; padding-bottom:10%;">
		<select style=" text-align:center; font-size:15px;">
			<option value="">최신 순</option>
			<option value="">인기 순</option>
			<option value="">가격 순</option>
			<option value="">별점 순</option>e
			<option value="">리뷰 순</option>
		</select>
	</div>
	&nbsp;
	<div class="chartsoon">
		<button style="border: none; background-color: white;">올림차 순</button>
		<br>
		<button style="border: none; background-color: white;">내림차 순</button>
	</div>
	</div>
	<br> <br>

	<!--  -->

	<div class="container">
		<!-- Carousel items -->
		<div class="carousel-inner">
			<div class="item">
				<div class="row">
					<div class="col-3" type="button" onclick="ppp();">
						<!-- 상품1개 -->
						<div class="">
							<div style="position: relative;">
								<img
									src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340"
									alt="Image" style="max-width: 100%;" />
							</div>
							<div class="zzim">
								<img class="fullheart" src="/resources/images/msw/fullheart.png">
								<img class="beanheart" src="/resources/images/msw/beanheart.png">
							</div>
						</div>
						<div class="leftbox">
							<span> 해바라기 씨</span>
						</div>
						<div class="rightbox">
							<span>★4.8/5</span>
						</div>
						<hr class="line">

						<div>
							<div class="leftbox">
								<span class="">&nbsp;컨텐츠</span>
							</div>
							<div class="rightbox">
								<h4>1400원</h4>
							</div>
						</div>

					</div>
					<!-- 상품1개끝 -->
					<div class="col-3" type="button" onclick="ppp();">
						<!-- 상품1개 -->
						<div class="">
							<div style="position: relative;">
								<img
									src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340"
									alt="Image" style="max-width: 100%;" />
							</div>
							<div class="zzim">
								<img class="fullheart" src="/resources/images/msw/fullheart.png">
								<img class="beanheart" src="/resources/images/msw/beanheart.png">
							</div>
						</div>
						<div class="leftbox">
							<span> 해바라기 씨</span>
						</div>
						<div class="rightbox">
							<span>★4.8/5</span>
						</div>
						<hr class="line">

						<div>
							<div class="leftbox">
								<span class="">&nbsp;컨텐츠</span>
							</div>
							<div class="rightbox">
								<h4>1400원</h4>
							</div>
						</div>

					</div>
					<!-- 상품1개끝 -->
					<div class="col-3" type="button" onclick="ppp();">
						<!-- 상품1개 -->
						<div class="">
							<div style="position: relative;">
								<img
									src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340"
									alt="Image" style="max-width: 100%;" />
							</div>
							<div class="zzim">
								<img class="fullheart" src="/resources/images/msw/fullheart.png">
								<img class="beanheart" src="/resources/images/msw/beanheart.png">
							</div>
						</div>
						<div class="leftbox">
							<span> 해바라기 씨</span>
						</div>
						<div class="rightbox">
							<span>★4.8/5</span>
						</div>
						<hr class="line">

						<div>
							<div class="leftbox">
								<span class="">&nbsp;컨텐츠</span>
							</div>
							<div class="rightbox">
								<h4>1400원</h4>
							</div>
						</div>

					</div>
					<!-- 상품1개끝 -->
					<div class="col-3" type="button" onclick="ppp();">
						<!-- 상품1개 -->
						<div class="">
							<div style="position: relative;">
								<img
									src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340"
									alt="Image" style="max-width: 100%;" />
							</div>
							<div class="zzim">
								<img class="fullheart" src="/resources/images/msw/fullheart.png">
								<img class="beanheart" src="/resources/images/msw/beanheart.png">
							</div>
						</div>
						<div class="leftbox">
							<span> 해바라기 씨</span>
						</div>
						<div class="rightbox">
							<span>★4.8/5</span>
						</div>
						<hr class="line">

						<div>
							<div class="leftbox">
								<span class="">&nbsp;컨텐츠</span>
							</div>
							<div class="rightbox">
								<h4>1400원</h4>
							</div>
						</div>

					</div>
					<!-- 상품1개끝 -->


				</div>
				<br> <br>
			</div>
		</div>
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
 
</script>


