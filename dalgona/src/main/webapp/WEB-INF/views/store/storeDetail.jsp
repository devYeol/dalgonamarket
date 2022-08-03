<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<section id="content">
	<main class="container" style="width: 1050px;">

		<div class="row mb-2 d-grid gap-4">


			<div class="row g-5">
				<div class="col-md border-end">
					<div class="position-sticky" style="top: 2rem;">
						<img
							src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340"
							class="d-block w-100" alt="..." height="410" width="410px">
					</div>
				</div>

				<div class="col-md d-grid gap-5" style="margin-left	: 10px;">
					<div class="row border-bottom"> 
						<div class="col-8"><h4>맛있는 초코비</h4></div>
						<div class="col-2">별점</div>
						<div class="col-2"><span><i class="fas fa-heart" ></i> 찜 </span></div>
					</div>
					
					<div class="row border-bottom " >
						<div class="col-8 ">판매가</div>
						
						<div class="col-4 ">
							<div> 1400원</div>
							<div>(재고수량 : 00)</div>
						</div>
					</div>
					
					<div class="row border-bottom ">
						<div >배송비 : 2500원</div>	
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
			<!-- 상세 탭 -->


			<!-- 리뷰 탭 -->
			<ul class="comment">	
			
				<li>			 
				    <div class="client">	        
				        <div class="review_header">
				            <div>

				                <div><span class="nickname">김창렬</span> <span>(2022-08-03) </span></div>
			   
				                <div>			                    
				                    <div class="star-rating space-x-4 ">
										<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
										<label for="5-stars" class="star pr-4">★</label>
										<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
										<label for="4-stars" class="star">★</label>
										<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
										<label for="3-stars" class="star">★</label>
										<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
										<label for="2-stars" class="star">★</label>
										<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
										<label for="1-star" class="star">★</label>
									</div>
										                    			                   
				                </div>
				            </div>
				        </div> 				            
				        <div>				           
				            <div class="reviewcommeont"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340"" alt="이미지" class="review_img"></div>			            
				            <div>리뷰내용 개노맛 노맛 안머겅 개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅</div>
				        </div>
				    </div>		   
				</li>
				
				
				
				 <div class="boss">			       
			            <div class="boss_comment_box">
			                <div class="nickname">사장님</div>
			                <div class="boss_comment">리뷰내용</div>
			            </div>			       
			    </div>
				

				<div class="boss input">
					<div class="boss_comment_box">
						<div class="nickname">사장님</div>
						<div class="boss_comment">
							<textarea class="comment_area" spellcheck="false">여기다 작성</textarea>
						</div>

						<div>
							<button class="boss_comment_btn reply">댓글 달기</button>
						</div>
					</div>
				</div>
			</ul>
			<!-- 리뷰 탭 -->


			<!-- 문의 탭 -->
			<ul>

			</ul>
			<!-- 문의 탭 -->
	</main>
	
	<style>


/* -------------- 메인 -------------- */
ul{
   list-style:none;
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
	font-size: 30px;
}

main ul.tab li:hover {
	background: #333333;
	color: #fff;
	transition: 0.1s;
}

main ul.tab li.select {
	background:  #333333;
	color: #fff;
	/* 메뉴탭 클릭시 색 바뀜 */
}
/* -------------- 메인 -------------- */


main .comment {
	display: none;
}


main .comment .boss_comment {
	margin-bottom: 10px;
}

main .comment li {
	border-radius: 10px;
	width: 100%;
	margin: 15px auto 30px;
	font-size: 20px;
}

main .comment li .nickname {
	font-weight: bold;
}

main .comment li .client {
	border: 1px solid #ddd;
	border-radius: 10px;
	padding: 15px;
}

.review_header {
	display: flex;
	justify-content: space-between;
	margin-bottom: 15px;
}

.review_header div div:last-child {
	font-size: 30px;
}

main .comment li .boss_comment_box {
	background: #ddd;
	width: 90%;
	border-radius: 10px;
	padding: 15px;
	position: relative;
	left: 6%;
	margin-top: 15px;
}

.review_btn, .boss_comment_btn {
	background: #fff;
	border-radius: 5px;
	padding: 5px;
}

.boss_comment .comment_area {
	width: 90%;
	height: 100px;
	padding: 10px;
	border-radius: 5px;
	margin-top: 5px;
}

.boss.input {
	display: none;
}

.review_img {
	width:200;
	height:200;
	cursor: pointer;
}
/* 리뷰탭 */




/* 별찍기 */
.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}

/* 별찍기 */

</style>

<script>




$(document).ready(function() {
	
	
	$("main ul.info").hide();
	// 탭 눌렀을때 색변경 콘텐츠 변경
	$("ul.tab > li").click(function() {

		const index = $(this).index() + 1;

		$("ul.tab > li").removeClass("select");
		$(this).addClass("select");

		$("main  ul").eq(1).hide();
		$("main  ul").eq(2).hide();
		$("main  ul").eq(3).hide();
		$("main  ul").eq(index).show();

		const offset = $(".offset").offset();
		const scrollPosition = $(document).scrollTop();

		if (offset["top"] < scrollPosition) {
			$("html").animate({ scrollTop: offset.top }, 100);
		}
	});	
});


</script>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />