<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="title" value=""/>
</jsp:include>

 <style>
.button {
  background-color:hotpink; /* Green */
  color: white;
  padding: 15px 32px;
  text-align: center;
  /* text-decoration: none; */
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border: 2px solid black;	
}

.category1 {
	width: 140px;
	margin-right:50px;
}

#cate{
	margin-left:95px;
}
			
#search{
	margin-left: 110px;
}			
	

.chartsoon{
	display:inline-block;
    font-size:1px;
}

.leftbox{
	display:inline-block;
	
}
	        
 .rightbox{
	display:inline-block;
	float:right;
} 
	
.btnnone{
	/* display:none; */
	border:0;
	background-color:white;
} 

</style>

	
<section id="content">
<!-- 배너 시작 -->
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" >
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" class="d-block w-100" alt="..."
	      height="520" width="400 px">
	    </div>
	    <div class="carousel-item">
	      <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" class="d-block w-100" alt="..."
	      height="520">
	    </div>
	    <div class="carousel-item">
	      <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" class="d-block w-100" alt="..."
	      height="520">
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
	
	<br><br>
	
	<div>
		<button class="button category1" id="cate">ALL</button>	
		<button class="button category1" >스낵</button>	
		<button class="button category1">사탕</button>
		<button class="button category1">초코</button>
		<button class="button category1">젤리</button>
		<button class="button category1">기타</button>
		<button class="button category1">완구</button>
	</div>
	
	<br>
		<div style="display:inline-block;">
			<span class="search" id="search">검색 결과:00 건</span>
		</div>
		<div style="display:inline-block; float:right; margin-right:120px;">
			<select>
				<option value="">최신 순</option>
				<option value="">인기 순</option>
				<option value="">가격 순</option>
				<option value="">별점 순</option>
				<option value="">리뷰 순</option>
			</select>
		</div>
		<!-- <div class="chartsoon" >
			<button style="border:none; background-color:white;">올림차 순</button>
			<br>
			<button style="border:none; background-color:white;">내림차 순</button>
		</div>	 -->
	<br><br>

<!--  -->

<div class="container">
    <!-- Carousel items -->
    <div class="carousel-inner">
    	<div class="item">
	        <div class="row">
	          <div class="col-3"> <!-- 상품1개 -->
	          		<div>
			          <a href="#x" class="thumbnail"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width:100%;" /></a>
		          </div>

		          	<div class="leftbox">
							<button class="btnnone" style="padding-top:10px;"> 해바라기 씨</button>
						</div>
						<div class="rightbox" style="padding-top:10px;">		         
							<span >★4.8/5</span>
						</div>
		         	 <hr class="line">
		          
		          	<div class="leftbox">
						<span class="">&nbsp;해바라기 씨</span>
					</div>
					<div class="rightbox" >
						<span class="">♡(1,227)</span>
					</div><br><br>
		          
		          <div>
		          	<button class="btnnone" style="font-size:7px;">&gt;&gt;상세보기</button>
					<h4 style="float:right;">1400원</h4> 
		          </div>
        		
	          </div> <!-- 상품1개끝 -->
	          <div class="col-3"> <!-- 상품1개 -->
	          	
	         
	          		<div>
			          <a href="#x" class="thumbnail"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width:100%;" /></a>
		          </div>

		          	<div class="leftbox">
							<button class="btnnone" style="padding-top:10px;"> 해바라기 씨</button>
						</div>
						<div class="rightbox" style="padding-top:10px;">		         
							<span >★4.8/5</span>
						</div>
		         	 <hr class="line">
		          
		          	<div class="leftbox">
						<span class="">&nbsp;해바라기 씨</span>
					</div>
					<div class="rightbox" >
						<span class="">♡(1,227)</span>
					</div><br><br>
		          
		          <div>
		          	<button class="btnnone" style="font-size:7px;">&gt;&gt;상세보기</button>
					<h4 style="float:right;"><strong>1400원</strong></h4> 
		          </div>
        		
	          </div> <!-- 상품1개끝 -->
	          <div class="col-3"> <!-- 상품1개 -->
	          	
	         
	          		<div>
			          <a href="#x" class="thumbnail"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width:100%;" /></a>
		          </div>

		          	<div class="leftbox">
							<button class="btnnone" style="padding-top:10px;"> 해바라기 씨</button>
						</div>
						<div class="rightbox" style="padding-top:10px;">		         
							<span >★4.8/5</span>
						</div>
		         	 <hr class="line">
		          
		          	<div class="leftbox">
						<span class="">&nbsp;해바라기 씨</span>
					</div>
					<div class="rightbox" >
						<span class="">♡(1,227)</span>
					</div><br><br>
		          
		          <div>
		          	<button class="btnnone" style="font-size:7px;">&gt;&gt;상세보기</button>
					<h4 style="float:right;"><strong>1400원</strong></h4> 
		          </div>
        		
	          </div> <!-- 상품1개끝 -->
	          <div class="col-3"> <!-- 상품1개 -->
	          	
	         
	          		<div>
			          <a href="#x" class="thumbnail"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width:100%;" /></a>
		          </div>

		          	<div class="leftbox">
							<button class="btnnone" style="padding-top:10px;"> 해바라기 씨</button>
						</div>
						<div class="rightbox" style="padding-top:10px;">		         
							<span >★4.8/5</span>
						</div>
		         	 <hr class="line">
		          
		          	<div class="leftbox">
						<span class="">&nbsp;해바라기 씨</span>
					</div>
					<div class="rightbox" >
						<span class="">♡(1,227)</span>
					</div><br><br>
		          
		          <div>
		          	<button class="btnnone" style="font-size:7px;">&gt;&gt;상세보기</button>
					<h4 style="float:right;"><strong>1400원</strong></h4> 
		          </div>
        		
	          </div> <!-- 상품1개끝 -->
	          
	          
	        </div>
	        <br><br>
	        
	        <div class="row">
	          <div class="col-3"> <!-- 상품1개 -->
	          		<div>
			          <a href="#x" class="thumbnail"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width:100%;" /></a>
		          </div>

		          	<div class="leftbox">
							<button class="btnnone" style="padding-top:10px;"> 해바라기 씨</button>
						</div>
						<div class="rightbox" style="padding-top:10px;">		         
							<span >★4.8/5</span>
						</div>
		         	 <hr class="line">
		          
		          	<div class="leftbox">
						<span class="">&nbsp;해바라기 씨</span>
					</div>
					<div class="rightbox" >
						<span class="">♡(1,227)</span>
					</div><br><br>
		          
		          <div>
		          	<button class="btnnone" style="font-size:7px;">&gt;&gt;상세보기</button>
					<h4 style="float:right;"><strong>1400원</strong></h4> 
		          </div>
        		
	          </div> <!-- 상품1개끝 -->
	          <div class="col-3"> <!-- 상품1개 -->
	          	
	         
	          		<div>
			          <a href="#x" class="thumbnail"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width:100%;" /></a>
		          </div>

		          	<div class="leftbox">
							<button class="btnnone" style="padding-top:10px;"> 해바라기 씨</button>
						</div>
						<div class="rightbox" style="padding-top:10px;">		         
							<span >★4.8/5</span>
						</div>
		         	 <hr class="line">
		          
		          	<div class="leftbox">
						<span class="">&nbsp;해바라기 씨</span>
					</div>
					<div class="rightbox" >
						<span class="">♡(1,227)</span>
					</div><br><br>
		          
		          <div>
		          	<button class="btnnone" style="font-size:7px;">&gt;&gt;상세보기</button>
					<h4 style="float:right;"><strong>1400원</strong></h4> 
		          </div>
        		
	          </div> <!-- 상품1개끝 -->
	          <div class="col-3"> <!-- 상품1개 -->
	          	
	         
	          		<div>
			          <a href="#x" class="thumbnail"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width:100%;" /></a>
		          </div>

		          	<div class="leftbox">
							<button class="btnnone" style="padding-top:10px;"> 해바라기 씨</button>
						</div>
						<div class="rightbox" style="padding-top:10px;">		         
							<span >★4.8/5</span>
						</div>
		         	 <hr class="line">
		          
		          	<div class="leftbox">
						<span class="">&nbsp;해바라기 씨</span>
					</div>
					<div class="rightbox" >
						<span class="">♡(1,227)</span>
					</div><br><br>
		          
		          <div>
		          	<button class="btnnone" style="font-size:7px;">&gt;&gt;상세보기</button>
					<h4 style="float:right;"><strong>1400원</strong></h4> 
		          </div>
        		
	          </div> <!-- 상품1개끝 -->
	          
	          <div class="col-3"> <!-- 상품1개 -->
	          	
	          		<div>
			          <a href="#x" class="thumbnail"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width:100%;" /></a>
		          </div>

		          	<div class="leftbox">
							<button class="btnnone" style="padding-top:10px;"> 해바라기 씨</button>
						</div>
						<div class="rightbox" style="padding-top:10px;">		         
							<span >★4.8/5</span>
						</div>
		         	 <hr class="line">
		          
		          	<div class="leftbox">
						<span class="">&nbsp;해바라기 씨</span>
					</div>
					<div class="rightbox" >
						<span class="">♡(1,227)</span>
					</div><br><br>
		          
		          <div>
		          	<button class="btnnone" style="font-size:7px;">&gt;&gt;상세보기</button>
					<h4 style="float:right;"><strong>1400원</strong></h4> 
		          </div>
        		
	          </div> <!-- 상품1개끝 -->
	          
	          
	        </div> 
	        
	         <br><br>
	        
	        <div class="row">
	          <div class="col-3"> <!-- 상품1개 -->
	          		<div>
			          <a href="#x" class="thumbnail"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width:100%;" /></a>
		          </div>

		          	<div class="leftbox">
							<button class="btnnone" style="padding-top:10px;"> 해바라기 씨</button>
						</div>
						<div class="rightbox" style="padding-top:10px;">		         
							<span >★4.8/5</span>
						</div>
		         	 <hr class="line">
		          
		          	<div class="leftbox">
						<span class="">&nbsp;해바라기 씨</span>
					</div>
					<div class="rightbox" >
						<span class="">♡(1,227)</span>
					</div><br><br>
		          
		          <div>
		          	<button class="btnnone" style="font-size:7px;">&gt;&gt;상세보기</button>
					<h4 style="float:right;"><strong>1400원</strong></h4> 
		          </div>
        		
	          </div> <!-- 상품1개끝 -->
	          
	          <br><br><br>
	          
	          <div class="col-3"> <!-- 상품1개 -->
          		<div>
		          <a href="#x" class="thumbnail"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width:100%;" /></a>
		          </div>

		          	<div class="leftbox">
							<button class="btnnone" style="padding-top:10px;"> 해바라기 씨</button>
						</div>
						<div class="rightbox" style="padding-top:10px;">		         
							<span >★4.8/5</span>
						</div>
		         	 <hr class="line">
		          
		          	<div class="leftbox">
						<span class="">&nbsp;해바라기 씨</span>
					</div>
					<div class="rightbox" >
						<span class="">♡(1,227)</span>
					</div><br><br>
		          
		          <div>
		          	<button class="btnnone" style="font-size:7px;">&gt;&gt;상세보기</button>
					<h4 style="float:right;"><strong>1400원</strong></h4> 
		          </div>
        		
	          </div> <!-- 상품1개끝 -->
	           <br><br>
	          <div class="col-3"> <!-- 상품1개 -->
	          	
	         
	          		<div>
			          <a href="#x" class="thumbnail"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width:100%;" /></a>
		          </div>

		          	<div class="leftbox">
							<button class="btnnone" style="padding-top:10px;"> 해바라기 씨</button>
						</div>
						<div class="rightbox" style="padding-top:10px;">		         
							<span >★4.8/5</span>
						</div>
		         	 <hr class="line">
		          
		          	<div class="leftbox">
						<span class="">&nbsp;해바라기 씨</span>
					</div>
					<div class="rightbox" >
						<span class="">♡(1,227)</span>
					</div><br><br>
		          
		          <div>
		          	<button class="btnnone" style="font-size:7px;">&gt;&gt;상세보기</button>
					<h4 style="float:right;"><strong>1400원</strong></h4> 
		          </div>
        		
	          </div> <!-- 상품1개끝 -->
	           <br><br>
	          
	          <div class="col-3"> <!-- 상품1개 -->
	          		<div>
			          <a href="#x" class="thumbnail"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340" alt="Image" style="max-width:100%;" /></a>
		          </div>

		          	<div class="leftbox">
							<button class="btnnone" style="padding-top:10px;"> 해바라기 씨</button>
						</div>
						<div class="rightbox" style="padding-top:10px;">		         
							<span >★4.8/5</span>
						</div>
		         	 <hr class="line">
		          
		          	<div class="leftbox">
						<span class="">&nbsp;해바라기 씨</span>
					</div>
					<div class="rightbox" >
						<span class="">♡(1,227)</span>
					</div><br><br>
		          
		          <div>
		          	<button class="btnnone" style="font-size:7px;">&gt;&gt;상세보기</button>
					<h4 style="float:right;"><strong>1400원</strong></h4> 
		          </div>
        		
	          </div> <!-- 상품1개끝 -->
	        </div> <!-- 1열 끝 -->
	        
    	</div>
    </div>
  </div> 	
  <br><br>

		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
</section>
   	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
   	