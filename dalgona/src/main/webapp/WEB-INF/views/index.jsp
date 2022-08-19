<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="title" value="" />
</jsp:include>

<style> 

h4 {
   padding-bottom: 20px;
   padding-top: 20px;
}

figure {
   transition: opacity 0.2s; 
   position: relative; 
   margin: 0; 
   max-width: 20%
}

figure img {
   width: 100%
}

figure figcaption {
   color: #fff;
   bottom: 70px; 
   opacity: 0;
   position: absolute; 
   text-align: center; 
   width: 100%;
   transition: all .3s ease;
}

figure .gallery-img {
   opacity: 1;
   transition: all 0.3s ease 0s;
   overflow: hidden;
}

figure:hover .gallery-img {
   background-color: #666666;
   border-radius: 10px;
}

figure:hover img {
   transform: scale(1.1, 1.1);
   transition: all .3s ease;
   opacity: 0.15;
}

figure:hover figcaption {
   opacity: 1;
   transition: all .3s ease; 
}

.category-img {
   border-radius: 10px;
}

.thumbnail-img{
   border-radius: 10px;
}

.price-tag {
   display: flex;
   justify-content: space-between;
   padding-bottom: 40px;
}

</style>
<section id="content">
   <!-- 배너 시작 -->
   <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-indicators">
         <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" 
            class="active" aria-current="true" aria-label="Slide 1"></button>
         <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
         <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
      </div>
      <div class="carousel-inner">
         <div class="carousel-item active">
            <img src="${path }/resources/images/banner/banner1.png"
               style="width: 100%; height: 72%;">
<%--             <img src="${path }/resources/images/mainpage/과자광고.png"
               style="width: 100%; height: 72%;"> --%>
         </div>
         <div class="carousel-item">
            <img src="http://korean.visitseoul.net/comm/getImage?srvcId=MEDIA&parentSn=19242&fileTy=MEDIA&fileNo=2"
               class="d-block w-100" alt="..." height="520">
         </div>
         <div class="carousel-item">
            <img src="https://i.pinimg.com/564x/74/8d/d1/748dd1a5810cfe4393cc90c063df3a49.jpg" 
               class="d-block w-100" alt="..." height="520" width="400 px">
         </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
         <span class="carousel-control-prev-icon" aria-hidden="true"></span> 
         <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
         <span class="carousel-control-next-icon" aria-hidden="true"></span> 
         <span class="visually-hidden">Next</span>
      </button>
   </div>
   <!-- 배너 끝 -->

   <!-- 카테고리 시작-->
   <div class="album py-5">
      <div class="container">
         <h4>카테고리</h4>
         <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <figure class="col">
               <div class="gallery-img">
                  <a href="${path}/product/productList?categoryName=과자">
                     <!-- <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
                     <img class="category-img" src="${path }/resources/images/mainpage/과자일러.png"
                        style="width: 100%; height: 280px;">
                  </a>
               </div>
               <figcaption>
                  <h3 class="text-box">Snack</h3>
               </figcaption>
            </figure>
            <figure class="col">
               <div class="gallery-img">
                  <a href="${path}/product/productList?categoryname=사탕">
                     <!-- <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
                     <img class="category-img" src="${path }/resources/images/mainpage/사탕일러.png"
                        style="width: 100%; height: 280px;">
                  </a>
               </div>
               <figcaption>
                  <h3 class="text-box">Candy</h3>
               </figcaption>
            </figure>
            <figure class="col">
               <div class="gallery-img">
                  <a href="${path}/">
                     <!-- <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
                     <img class="category-img" src="${path }/resources/images/mainpage/초콜렛일러.png"
                        style="width: 100%; height: 280px;">                  
                  </a>
               </div>
               <figcaption>
                  <h3 class="text-box">Chocolate</h3>
               </figcaption>
            </figure>
            <figure class="col">
               <div class="gallery-img">
                  <a href="${path}/">
                     <!-- <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
                     <img class="category-img" src="${path }/resources/images/mainpage/젤리일러.png"
                        style="width: 100%; height: 280px;">
                  </a>
               </div>
               <figcaption>
                  <h3 class="text-box">Jelly</h3>
               </figcaption>
            </figure>
            <figure class="col">
               <div class="gallery-img">
                  <a href="${path}/">
                     <!-- <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/></svg> -->
                     <img class="category-img" src="${path }/resources/images/mainpage/완구일러.png"
                        style="width: 100%; height: 280px;">
                  </a>
               </div>
               <figcaption>
                  <h3 class="text-box">Toy</h3>
               </figcaption>
            </figure>
            <figure class="col">
               <div class="gallery-img">
                  <a href="${path}/">
                     <!-- <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
                     <img class="category-img" src="${path }/resources/images/mainpage/기타일러.png"
                        style="width: 100%; height: 280px;">
                  </a>
               </div>
               <figcaption>
                  <h3 class="text-box">Etc</h3>
               </figcaption>
            </figure>
         </div>
      </div>
   </div>
   <!-- 카테고리 끝-->

   <!-- 추천상품 시작 -->
   <div class="container" style="padding-bottom: 40px;">
      <!-- Carousel items -->
      <h4>인기상품</h4>
      <div class="carousel-inner">
         <div class="item">
            <div class="row">
               <div class="col-3">
                  <a href="#">
                     <img class="thumbnail-img" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width: 100%;" />
                     <div class="price-tag">
                        <div>해바라기</div>
                        <div>1000원</div>
                     </div>
                  </a>
               </div>
               <div class="col-3">
                  <a href="#x" class="thumbnail">
                     <img class="thumbnail-img" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width: 100%;" />
                     <span>해바라기</span>
                  </a>
               </div>
               <div class="col-3">
                  <a href="#x" class="thumbnail">
                     <img class="thumbnail-img" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width: 100%;" />
                     <span>해바라기</span>
                  </a>
               </div>
               <div class="col-3">
                  <a href="#x" class="thumbnail">
                     <img class="thumbnail-img" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width: 100%;" />
                     <span>해바라기</span>
                  </a>
               </div>
            </div>
         </div>
      </div>
      <h4>관심상품</h4>
      <div class="carousel-inner">
         <div class="item">
            <div class="row">
               <div class="col-3">
                  <a href="#x" class="thumbnail">
                     <img class="thumbnail-img" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width: 100%;" />
                     <span>해바라기</span>
                  </a>
               </div>
               <div class="col-3">
                  <a href="#x" class="thumbnail">
                     <img class="thumbnail-img" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width: 100%;" />
                     <span>해바라기</span>
                  </a>
               </div>
               <div class="col-3">
                  <a href="#x" class="thumbnail">
                     <img class="thumbnail-img" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width: 100%;" />
                     <span>해바라기</span>
                  </a>
               </div>
               <div class="col-3">
                  <a href="#x" class="thumbnail">
                     <img class="thumbnail-img" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width: 100%;" />
                     <span>해바라기</span>
                  </a>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- 추천상품 끝 -->
</section>
<script>

   const msg = "${msg}";
   
   if (msg != "") {
      alert(msg);
   }

</script>
<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

