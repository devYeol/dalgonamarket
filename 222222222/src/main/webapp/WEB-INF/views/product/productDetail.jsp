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

				<div class="col-md d-grid gap-5" style="margin-left: 10px;">
					<div class="row border-bottom">
						<div class="col-8">
							<h4>
								<c:out value="${pro.productName}" />
							</h4>
						</div>
						<div class="col-2">별점</div>
						<div class="col-2">
							<span><i class="fas fa-heart"></i> 찜 </span>
						</div>
					</div>

					<div class="row border-bottom ">
						<div class="col-8 ">판매가</div>

						<div class="col-4 ">
							<div>
								<c:out value="${pro.productPrice}" />
							</div>
							<div>
								(재고수량 :
								<c:out value="${pro.productAmount}" />
								)
							</div>
						</div>
					</div>

					<div class="row border-bottom ">
						<div>배송비 : 2500원</div>
						<div>도착예정일</div>
					</div>

					<div class="row d-grid gap-3	">
						<div>
							맛있는 초코비 1박스 <select class="form-select"
								aria-label="Default select example">
								<option selected>옵션</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</div>
						<div class="d-md-flex justify-content-md-end">
							주문수량<input type="number" value="1">
						</div>
					</div>

					<div class="row gap-2">
						<button type="button" class="btn col btn-secondary btn-lg">장바구니</button>
						<button type="button" class="btn col btn-primary btn-lg">결제하기</button>
					</div>

					<!-- 	<table >
					<tr>
						<td>맛있는 초코비</td>
						<td>별점</td>
						<td>하트</td>												
					</tr>
					<tr>
						<td>판매가</td>	
						<td>1400원</td>	
						<td>재고수량</td>						
					</tr>
					<tr>
						<td>배송비 :2500원</td>
						<td>도착예정일</td>						
					</tr>
					<tr>
						<td>한줄설명 맛있는 초코비 1박스</td>
						<td> 
							<select class="form-select"
								aria-label="Default select example">
								<option selected>옵션</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</td>
						<td>주문수량  <input type="number" value="1"></td>						
					</tr>
					
					
				</table>
				<div class="row gap-2">
						<button type="button" class="btn col btn-secondary btn-lg">장바구니</button>
						<button type="button" class="btn col btn-primary btn-lg">결제하기</button>
				</div> -->




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
					<form class="mb-3" name="myform" id="myform" method="post" action="${path }/review/insertreview.do">
						<fieldset>
							<span class="text-bold">별점을 선택해주세요</span> <input type="radio"
								name="reviewStar" value="5" id="rate1"><label
								for="rate1">★</label> <input type="radio" name="reviewStar"
								value="4" id="rate2"> <label for="rate2">★</label> <input
								type="radio" name="reviewStar" value="3" id="rate3"> <label
								for="rate3">★</label> <input type="radio" name="reviewStar"
								value="2" id="rate4"><label for="rate4">★</label> <input
								type="radio" name="reviewStar" value="1" id="rate5"><label
								for="rate5">★</label>
						</fieldset>
						<div class="row">
							<div class="col-10">
								<textarea class="col-auto form-control" type="text"
									id="reviewContents" placeholder="내용을 입력해주세요"></textarea>
							</div>
							<div class="col-2">
								<button type="submit">작성완료</button>
							</div>
						</div>
					</form>

				</li>

				<!-- <li>
					<div class="client">
						<div class="review_header">
							<div>

								<div>
									<span class="nickname">김창렬</span> <span>(2022-08-03) </span>
								
								</div>
								<div>별점</div>
																
							</div>
						</div>
						<div>
							<div class="reviewcommeont">
								<img
									src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fthumb2.gettyimageskorea.com%2Fimage_preview%2F700%2F202002%2FFKF%2F1204740366.jpg&type=a340"
									" alt="이미지" class="review_img">
							</div>
							<div>리뷰내용 개노맛 노맛 안머겅 개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛
								안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛
								안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅개노맛 노맛 안머겅</div>
						</div>
					</div>
				</li> -->



				<hr>
				<c:if test="${not empty reivew }">
					<c:forEach var="re" items="${reivew }">
						<table style="margin-left: 10; width: 98%;">
							<tbody>
								<tr class="payment-tr">

									<td style="width: 55%"><a href="#"
										style="color: black; text-decoration: none; font-size: 17"><b><c:out
													value="${re.memberId }" /></b></a><br>
										<div style="margin-top: 5; font-size: 15px">
											<c:out value="${re.reviewDate }" />
										</div>
										<div style="margin-top: 5;">
											<c:out value="${re.reviewStar }" />
										</div>
										<div style="margin-top: 5; font-size: 15px">
											<c:out value="${re.reviewContent }" />
										</div></td>


									<td style="width: 20%;"><a href="#"
										style="text-decoration: none;"> <img src="http://img3.tmon.kr/cdn4/deals/2022/02/15/5164313822/front_cd6a3_671t8.jpg"
											width="150" height="150" border="1" />
									</a></td>
								</tr>
							</tbody>
						</table>
						<hr>
					</c:forEach>
				</c:if>

			</ul>
			<!-- 리뷰 탭 -->


			<!-- 문의 탭 -->
			<ul>

			</ul>
			<!-- 문의 탭 -->
	</main>

	<style>

/* -------------- 메인 -------------- */
ul {
	list-style: none;
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
	background: #333333;
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

/* 리뷰탭 */

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

#reviewContents {
	width: 100%;
	height: 150px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}
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
					$("html").animate({
						scrollTop : offset.top
					}, 100);
				}
			});
		});
	</script>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />