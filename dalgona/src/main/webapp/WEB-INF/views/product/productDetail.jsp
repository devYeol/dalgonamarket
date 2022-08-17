<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<section>
	<main class="container" style="width: 70%;">
		<form action="${path }/product/payment.do" method="post" onsubmit='return info_chk()'>
			<div class="row mb-2 d-grid gap-4">
				<div class="row g-5">
					<div class="col-md border-end">
						<div class="positionl-sticky" style="top: 2rem;">
							<img alt="productPhoto" src="${pro.productThumb }" height="510"
								width="560px">

						</div>
					</div>

					<input type="hidden" value="${pro.productCode}" id="productId">



					<div class="col-md d-grid gap-5" style="margin-left: 10px;">
						<div class="row border-bottom">
							<div class="col form-group " style="text-align: left;">
								<h3 class="page-header">
									<span>${pro.productName}</span>
								</h3>
							</div>
							<div class="col-2">★</div>
							<div class="col-3 inf">
								<c:choose>
								    <c:when test="<%-- ${info.isLikes == 1 } --%>${pro.productCode == 1}">
								        <span><i class="fas fa-heart" ></i> 찜 </span>
								    </c:when>
								    
								    <c:otherwise>
								        <span><i class="far fa-heart" ></i> 찜 </span>
								    </c:otherwise>
								</c:choose>  	
    
								<span class="likes_count" data-count=<%-- ${info.likesCount } --%> ><%-- ${info.likesCount } --%></span>
															
								<!-- <span><i id="likes"class="fas fa-heart"></i> 찜 </span> -->
							</div>
						</div>
							
							<div class="form-group" style="text-align: left;">
								<label>가격 : </label><span>&nbsp;<fmt:formatNumber
										value="${pro.productPrice}" type="number" /></span><span>&nbsp;원</span>
								<input type="hidden" value="${pro.productPrice}" id="price">
							</div>
							<div class="form-group" style="text-align: left;">
								<label>배송비 : </label><span>&nbsp;2500원</span>
								
							</div>


							<c:if test="${not empty op }">
								<div class="form-horizontal" style="text-align: left;">
									<label>옵션 </label> 
									<select class="form-control opt_select" name="selectedOpt">
										<c:forEach var="o" items="${op}">
											<option value="${o.optionPrice }">${o.optionName }
												${o.optionPrice }원</option>
										</c:forEach>
									</select>
								</div>
							</c:if>

							<div class="form-horizontal" style="text-align: left;">
								<label>구매수량 : <input type="number" name="selAmount"
									value="1" id="select_count"></label>
							</div>
							<hr>

							<input type="hidden" value="${pro.productCode }"
								name="productCode" id="productCode"> <input type="hidden"
								value="${pro.productName }" name="productName"> <input
								type="hidden" value="${pro.productPrice }" name="productPrice">
							<input type="hidden" value="${pro.productContent }"
								name="productContent"> <input type="hidden"
								value="${pro.productAmount }" name="productAmount"> <input
								type="hidden" value="${pro.productThumb }" name="productThumb">
							<input type="hidden" value="${pro.productImage }"
								name="productImage"> <input type="hidden"
								value="${pro.categoryName }" name="categoryName">

							<div class="row">
								<div class="selected_option" style="text-align: right;"></div>
								<div style="text-align: center;">

									<input type='button' value='장바구니' onclick='return info_chk2(this.form);'> 
									<input type='submit' value='결제하기'>

									<!-- <button class="btn btn-default btn-cart"  onclick='return info_chk2(this.form);'>장바구니</button>
									<button class="btn btn-default btn-order" type="submit">주문하기</button> -->
								</div>
							</div>
							<hr>
						</div>
					</div>
				</div>
			</div>
		</form>

		<div class="offset"></div>
		<ul class="tab ">
			<li class="select">상세</li>
			<li>리뷰</li>
			<li>문의</li>
		</ul>


		<!-- 상세 탭 -->
		<ul>
			<li><img src="${pro.productImage }" class="d-block w-100"
				alt="..." height="410" width="410px"></li>




		</ul>
		<!-- 상세 탭 -->


		<!-- 리뷰 탭 -->
		<ul class="comment">
			<li>
				<form class="mb-3" name="myform" id="myform" enctype="multipart/form-data" method="post"action="${path }/review/reviewWrite.do">
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
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="reviewImage"
							id="upFile1"> <label class="custom-file-label"
							for="upFile1">파일을 선택하세요</label>
					</div>
					<div class="row">
						<div class="col-10">
							<textarea class="col-auto form-control" type="text"
								id="reviewContent" name="reviewContent" placeholder="내용을 입력해주세요"></textarea>
						</div>
						<div class="col-2">
							<button type="submit">작성완료</button>
						</div>
					</div>
					<input type="hidden" value="${pro.productCode }" name="productCode">
				</form>

			</li>

			<hr>
			<c:if test="${not empty review }">
				<c:forEach var="re" items="${review }">
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
										<c:out value="★ ${re.reviewStar }" />
									</div>
									<div style="margin-top: 5; font-size: 15px">
										<c:out value="${re.reviewContent }" />
									</div></td>


								<td style="width: 20%;">
								<c:if test="${not empty re.reviewImage }">
									<img src="${re.reviewImage }" width="150" height="150" border="1" />
								</c:if>
								</td>
							</tr>
						</tbody>
					</table>
					<hr>
				</c:forEach>
			</c:if>




			<%-- <c:forEach items="${store.reviewList }" var="reviewList">
		<li>
		    <div class="client">
		        
		        <div class="review_header">
		            <div>
		                <div class="nickname">${reviewList.nickname }</div>
		                <div>
		                    
		                    <c:forEach begin="0" end="4" var="i">
		                        <c:choose>
		                               <c:when test="${Math.round(reviewList.score) > i }">
		                                   <i class="far fas fa-star"></i>
		                               </c:when>
		                               <c:otherwise>
		                                   <i class="far fa-star"></i>
		                               </c:otherwise>
		                         </c:choose>
		                    </c:forEach>
		                    
		                    <span><fm:formatDate value="${reviewList.regiDate }" pattern="yyyy-MM-dd" /> </span>
		                </div>
		            </div>
		        </div> 
		            
		        <div>
		            <c:if test="${!empty reviewList.reviewImg }">
		                <div><img src="${reviewList.reviewImg }" alt="이미지" class="review_img"></div>
		            </c:if>
		            <div>${reviewList.reviewContent } </div>
        </div>
    </div>
    
    
    <div class="boss">
        <c:if test="${!empty reviewList.bossComment }">	
            <div class="boss_comment_box">
                <div class="nickname">사장님</div>
                <div class="boss_comment">${reviewList.bossComment }</div>
            </div>
        </c:if>
    </div>
    
    
     <div class="boss input">
            <div class="boss_comment_box">
             <div class="nickname">사장님</div>
            <div class="boss_comment">
                <textarea class="comment_area" spellcheck="false"></textarea>
            </div>
            
            <div>
                <button class="boss_comment_btn reply" >댓글 달기</button>
                <input type="hidden" value="${reviewList.orderNum }" class="order_num">
            </div>
        </div>
       </div>
</li>
</c:forEach> --%>


		</ul>
		<!-- 리뷰 탭 -->


		<!-- 문의 탭 -->
		<ul>
			<%-- <p>총 ${totalContents }건의 게시물이 있습니다.</p> --%>
			<button
				onclick="location.assign('${path}/qna/qnawWrite.do/${pro.productCode}')">글쓰기</button>
			<table id="tbl-board" class="table table-striped table-hover">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:if test="${not empty qna }">
					<c:forEach var="q" items="${qna }">
						<tr>
							<td><c:out value="${q.qnaCode }" /></td>
							<td><a href="${path }/qna/qnaView.do?qnaCode=${q.qnaCode}">
									<c:out value="${q.qnaTitle }" />
							</a></td>
							<td><c:out value="${q.member.memberId }" /></td>
							<td><c:out value="${q.qnaDate }" /></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty qna }">
					<tr>
						<td colspan="4">조회결과 없음</td>
					</tr>
				</c:if>
			</table>
			<%--  <div id="pageBar">
			        	${pageBar }
			        </div>	 --%>


		</ul>
		<!-- 문의 탭 -->
	</main>


	</main>


	<script>
		$(document).ready(function() {
			
			$(".inf i").click(function(){
				let likes ="";
				
				if($(this).hasClass("far")) {
					$(this).removeClass("far").addClass("fas");
					likes = "on";
				} else {
					$(this).removeClass("fas").addClass("far");
					likes = "off";
				}
				
				const data = {
					productCode : $("#productCode").val(),
					likes : likes
				}
				$.ajax({
					url: "/product/likes",
					type: "POST",
					data: data
				})
				.done(function(result){
					if(result == 0) {
					} else {
						
						let likesCount = $(".likes_count").data("count");
						
						if(likes == "on") {
							$(".likes_count").text(likesCount+1);
							$(".likes_count").data("count", likesCount+1 );
						} else {
							$(".likes_count").text(likesCount-1);
							$(".likes_count").data("count", likesCount-1 );
						}
					}
				})
			}) // 찜

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
			
			$("#select_count").on('blur',function() {
						var count = $(this).val();
						var price = $("#price").val();
						var opt = $(".opt_select")
								.val();
						var shipping = 2500;

						if (opt == null) {
							var opPrice = price;
						} else {
							var opPrice = Number(price)
									+ Number(opt);
						}

						var finalPrice = (count * opPrice)
								+ shipping;

						var str = '';

						str += '<p><label>수량 : </label><span>&nbsp;'
								+ count
								+ '</span>&nbsp;&nbsp;&nbsp;';

						if (opt == null) {
							str += '<lable></lable>';
						} else {
							str += '<label>옵션 : </label><span>&nbsp;'
									+ opt
									+ '</span>&nbsp;&nbsp;&nbsp;';
						}
						str += '<label>배송비 : </label><span>&nbsp;'
								+ shipping
								+ '</span>&nbsp;&nbsp;&nbsp;';
						str += '<label>가격 : </label><span>&nbsp;'
								+ opPrice
								+ ' 원</span></p>';
						str += '<h4><label>결제금액 : </label><span>&nbsp;'
								+ finalPrice
								+ ' 원</span></h4>';
						str += '<span class="glyphicon glyphicon-exclamation-remove"></span>';

						$(".selected_option").html(str);
					});
		});
		//주문
		function info_chk() {
			return true;
		}
		//장바구니
		function info_chk2(frm) {
			frm.action = ${path}"/member/mypage/cart";
			frm.submit();
			return true;
		}

		$(document)
				.ready(
						function() {

							$("#select_count")
									.on(
											'blur',
											function() {
												var count = $(this).val();
												var price = $("#price").val();
												var opt = $(".opt_select")
														.val();
												var shipping = 2500;

												if (opt == null) {
													var opPrice = price;
												} else {
													var opPrice = Number(price)
															+ Number(opt);
												}

												var finalPrice = (count * opPrice)
														+ shipping;

												var str = '';

												str += '<p><label>수량 : </label><span>&nbsp;'
														+ count
														+ '</span>&nbsp;&nbsp;&nbsp;';

												if (opt == null) {
													str += '<lable></lable>';
												} else {
													str += '<label>옵션 : </label><span>&nbsp;'
															+ opt
															+ '</span>&nbsp;&nbsp;&nbsp;';
												}
												str += '<label>배송비 : </label><span>&nbsp;'
														+ shipping
														+ '</span>&nbsp;&nbsp;&nbsp;';
												str += '<label>가격 : </label><span>&nbsp;'
														+ opPrice
														+ ' 원</span></p>';
												str += '<h4><label>결제금액 : </label><span>&nbsp;'
														+ finalPrice
														+ ' 원</span></h4>';
												str += '<span class="glyphicon glyphicon-exclamation-remove"></span>';

												$(".selected_option").html(str);
											});

						});
						
						
						
					
						
	</script>

	<style>

/* 찜하기 */
.fas.fa-heart {
	color: red;
}

.score_box .fas {
	color: gold;
}

.comment .fas {
	color: gold;
}
/* 찜하기 */

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
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />