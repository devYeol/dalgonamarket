<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/productDetail.css" />
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
							<div class="col-2">★
							<c:if test="${not empty star }">
							 ${star}
							 </c:if></div>
							<div class="col-3 inf">
								<c:choose>
								    <c:when test="${likesCheck == 1 }">
								        <span><i class="fas fa-heart" ></i> 찜 </span>
								    </c:when>
								    
								    <c:otherwise>
								        <span><i class="far fa-heart" ></i> 찜 </span>
								    </c:otherwise>
								</c:choose>  	
    
								<span class="likes_count" data-count=${likesCount } >${likesCount }</span>
															
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
							id="upFile1">
					</div>
					<br>
					<div class="row">
						<div class="col-10">
							<textarea class="col-auto form-control" type="text"
								id="reviewContent" name="reviewContent" placeholder="내용을 입력해주세요"></textarea>
						</div>
						<div class="col-2">
							<button  id="" type="submit">작성완료</button>
						</div>
					</div>
					<input type="hidden" value="${pro.productCode }" name="productCode">
				</form>

			</li>

			<hr>
			<c:if test="${not empty review }">
				<c:forEach var="re" items="${review }">
					<table style="margin-left: 10; width: 98%; height:150px;">
						<tbody>
							<tr class="payment-tr">

								<td style="width: 70%"><a href="#"
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
								</td >
								<td style="width: 10%;">
								<c:if test="${re.memberId==loginMember.memberId }">
								<button class="adminbt" style="width: 80px; padding: 5px; background-color: #6FB67F;" onclick="javascript:window.open('${path}/product/selectUpdateReview.do?reviewCode=${re.reviewCode}','new','left=50, top=50, width=520, height=500')">수정</button>
						
								<button class="adminbt" id="<c:out value="${re.reviewCode}"/>" name="<c:out value="${re.reviewCode}"/>" 
										style="width: 80px;background-color: #D56B5A;" onclick="adminDeleteProduct(event)">삭제</button>
								</c:if>
								<c:if test="${loginMember.memberId=='admin' }">
								<button class="onDisplay" id="onDisplay">답글</button>
								</c:if>
								</td>									
													
							</tr>
							
						<hr>
						</tbody>
						
					</table>
						<!-- <br>
						<div class="row noneDiv"  id="noneDiv" style="display: none;">
								<div class="col-10">
									<textarea class="col-auto form-control" type="text"
										id="reviewContent" name="reviewContent" placeholder="내용을 입력해주세요"></textarea>
								</div>
								<div class="col-2">
									<button type="submit">등록</button>
								</div>
						</div> -->
				</c:forEach>
			</c:if>
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
	
	//주문
	function info_chk() {
		return true;
	}
	
	//장바구니
	function info_chk2(frm) {
		frm.action = ${path}"/member/mypage/cartInsert";
		frm.submit();
		return true;
	}
	
	
	
	$(document).ready(function() {
		//찜
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
		
		//수량 가격계산
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
	
	const adminDeleteProduct=(e)=>{
		if(confirm("삭제 하시겠습니까?")){
		}else{
		 	return false;
		 }
		$.ajax({
			url:"${path}/product/reviewDelete.do",
			data:{reviewCode:$(e.target).attr("name")},
			success:data=>{
				if(data){
					$(e.target).parents("table").remove();
				}
			}
		});
	}
	</script>
	
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />