<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>

<section id="content">
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
				<img src="https://kream-phinf.pstatic.net/MjAyMjA0MDVfMjg3/MDAxNjQ5MTQxNDQ2MzE5.KmWw8NmaqtTEZQUwNB-qnk94UoRvQjTBz6HE-wcsUPwg.uKnTAOmBZVasnEheK77-WjBLVGkrxaev02tgaOLhqz0g.JPEG/a_e84bc8e4c55041b29479627fc78a2469.jpg"
					style="width: 100%; height: 72%;">
<%-- 				<img src="${path }/resources/images/mainpage/과자광고.png"
					style="width: 100%; height: 72%;"> --%>
			</div>
			<div class="carousel-item">
				<img
					src="http://korean.visitseoul.net/comm/getImage?srvcId=MEDIA&parentSn=19242&fileTy=MEDIA&fileNo=2"
					class="d-block w-100" alt="..." height="520">
			</div>
			<div class="carousel-item">
				<img
					src="https://i.pinimg.com/564x/74/8d/d1/748dd1a5810cfe4393cc90c063df3a49.jpg"
					class="d-block w-100" alt="..." height="520" width="400 px">
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

	<!-- 카테고리 시작-->
	<div class="album py-5">
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<div class="col">
					<div class="card shadow-sm">
						<!-- <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
						<img src="${path }/resources/images/mainpage/과자일러.png"
							style="width: 420px; height: 225px;">
					</div>
				</div>
				<div class="col">
					<div class="card shadow-sm">
						<!-- <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
						<img src="${path }/resources/images/mainpage/사탕일러.png"
							style="width: 420px; height: 225px;">
					</div>
				</div>
				<div class="col">
					<div class="card shadow-sm">
						<!-- <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
						<img src="${path }/resources/images/mainpage/초콜렛일러.png"
							style="width: 420px; height: 225px;">
					</div>
				</div>
				<div class="col">
					<div class="card shadow-sm">
						<!-- <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
						<img src="${path }/resources/images/mainpage/젤리일러.png"
							style="width: 420px; height: 225px;">
					</div>
				</div>
				<div class="col">
					<div class="card shadow-sm">
						<!-- <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/></svg> -->
						<img src="${path }/resources/images/mainpage/완구일러.png"
							style="width: 420px; height: 225px;">
					</div>
				</div>
				<div class="col">
					<div class="card shadow-sm">
						<!-- <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
						<img src="${path }/resources/images/mainpage/기타일러.png"
							style="width: 420px; height: 225px;">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 카테고리 끝-->

	<!-- 추천상품 시작 -->
	<div class="container">
		<!-- Carousel items -->
		<div class="carousel-inner">
			<div class="item">
				<div class="row">
					<div class="col-3">
						<a href="${path}/msw/msw" class="thumbnail"><img
							src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340"
							alt="Image" style="max-width: 100%;" /></a>
					</div>
					<div class="col-3">
						<a href="#x" class="thumbnail"><img
							src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340"
							alt="Image" style="max-width: 100%;" /></a>
					</div>
					<div class="col-3">
						<a href="#x" class="thumbnail"><img
							src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340"
							alt="Image" style="max-width: 100%;" /></a>
					</div>
					<div class="col-3">
						<a href="#x" class="thumbnail"><img
							src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340"
							alt="Image" style="max-width: 100%;" /></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 추천상품 끝 -->
</section>

<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<div class="container">
	<footer
		class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
		<div class="col-md-4 d-flex align-items-center">
			<a href="/"
				class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
				<svg class="bi" width="30" height="24">
					<use xlink:href="#bootstrap" /></svg>
			</a> <span class="text-muted">&copy; 2022 Company, Inc</span>
		</div>

		<ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
			<li class="ms-3"><a class="text-muted" href="#"><svg
						class="bi" width="24" height="24">
						<use xlink:href="#twitter" /></svg></a></li>
			<li class="ms-3"><a class="text-muted" href="#"><svg
						class="bi" width="24" height="24">
						<use xlink:href="#instagram" /></svg></a></li>
			<li class="ms-3"><a class="text-muted" href="#"><svg
						class="bi" width="24" height="24">
						<use xlink:href="#facebook" /></svg></a></li>
		</ul>
	</footer>
</div>


