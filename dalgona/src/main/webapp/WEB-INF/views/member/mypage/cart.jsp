<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<jsp:useBean id="today" class="java.util.Date" />
<style>

.proName{
font-size:20px;
text-decoration:none;
 color:black;
}

.cart-form {
	margin-left: 100px;
	margin-right: 100px;
	margin-top: 50px;
	display: flex;
}

.sidebar {
	width: 100%;
	height: 600px;
	width: 200px;
	position: sticky;
	top: 50px;
}

.sidebar ul {
	padding: 0;
	margin-top: 40px;
}

.sidebar ul li {
	list-style: none;
	margin-top: 20px;
}

.sidebar ul li a {
	text-decoration: none;
	color: #999;
}

.sidebar ul li a:hover {
	color: black;
}

.cart-container {
	width: 100%;
	position: relative;
	margin-left: 50px;
}

.btn-delete {
	width: 100px;
	height: 35px;
	font-size: 16px;
	background-color: white;
	border: 1px solid #999;
	border-radius: 10px;
}

.btn-delete:hover {
	background-color: black;
	color: #fff;
}

.check-input {
	border-radius: 0.25em;
	width: 16;
	height: 16;
}

/* 드롭다운 css */
#browsers {
	background-color: white;
	border: 1px solid gray;
	border-radius: 6px;
	padding: 0.2em 0.2em 0.2em 0.2em;
}

.close {
	display: inline-block;
	font-weight: bold;
	text-decoration: none;
	color: black;
}

.close:after {
	content: "\00d7";
	font-size: 15pt;
}
/* 선택금액표시 div */
.allprice-container {
	border: 4px solid black;
	text-align: center;
	margin-top: 50;
}

.allprice-content {
	display: inline-block;
	margin: 0 auto;
	vertical-align: top;
}

.allprice-form {
	padding: 20px 15px 18px;
	line-height: 17px;
	color: #555;
	text-align: center;
}

.all-plus {
	margin: 0 11px 0 10px;
	/* vertical-align: -4px; */
}

.allprice-form i {
	padding: 0 4px 0 5px;
	font: 700 17px/17px tahoma;
	color: #111;
}

.allprice-form
.final-price {
	color: red;
	font-size: 20px;
}

.cartandprice button {
	width: 400;
	height: 50;
	margin: 30;
	margin-top: 70;
	border-radius: 6px;
	font-size: 19;
}

.btn-cart {
	background-color: #999;
	color: white;
	border: 1px solid #999;
}

.btn-cart:hover {
	background: black;
}

.btn-buy {
	color: #fff;
	background-color: #dc3545;
	border: 1px solid #dc3545;
}

.btn-buy:hover {
	background-color: #bb2d3b;
}
</style>

<div class="headcontainer border-top" style="padding-top: 20px"></div>
<section class="cart-form">
	<div>
		<div class="sidebar">
			<h4>
				<strong>마이페이지</strong>
			</h4>
			<ul>
				<li><a href="${path }/member/mypage/mypageMain">쇼핑정보</a></li>
				<li><a href="${path }/member/mypage/productOrderList">구매내역</a></li>
				<li><a href="${path }/member/mypage/cart">장바구니</a>
				<li><a href="${path }/member/mypage/zzim">찜 목록</a></li>
				<br>
				<br>
				<li><h5><b>내정보</b></h5></li>
				<li><a href="${path }/member/mypage/changePage">프로필 정보</a></li>
				<li><a href="${path }/member/mypage/pwUpdate">비밀번호 변경</a></li>
				<li><a href="${path }/member/mypage/address">주소록</a></li>
			</ul>
		</div>
	</div>
	<form action="${path }/payment/paymentMove.do" name="paymentMoves" id="paymentMove">
		<div class="cart-container">
			<h4>
				<b>장바구니</b>
			</h4>
			<c:choose>
				<c:when test="${map.count ==0 }">
			장바구니가 비었습니다
				<br>
					<br>
					<button type="button" class="btn btn-danger" name="productListMove">상품
						페이지로 이동</button>
				</c:when>

				<c:otherwise>
					<div style="margin-top: 20px">
						<div>
							<div style="display: flex; justify-content: space-between;">
								<div style="margin-top: 8px; margin-left: 10; display: flex">
									<input class="form-check-input" type="checkbox" id="checkAll"
										value="selectall" name="selectAll" aria-label="...">
									<div style="margin-left: 10">전체선택</div>
								</div>
								<button type="button" class="btn-delete" id="selectDelete"
									name="" onclick="" style="margin-right: 10">선택삭제</button>
							</div>
						</div>
					</div>

					<hr>
					<c:forEach var="c" items="${map.cartList}" varStatus="i">

						<table style="margin-left: 10; width: 100%;">
							<tbody>
								<tr class="payment-tr" name="selectP">
									<td style="width: 20%;"><input type="hidden" id="cartCode"
										name="cartCode" value="${c.cartCode}"> <input
										type="hidden" id="product.productCode"
										name="product.productCode" value="${c.product.productCode}">
										<input type="hidden" id="member.memberId"
										name="member.memberId" value="${c.member.memberId}">
										<input type="hidden" id="cartAmount" name="cartAmount"
										value="${c.cartAmount}"> 
										<input class="check-input" name="check" id="${c.cartCode}" type="checkbox"
										style="margin-top: 40;" onclick="getCheckboxValues();"> <a href="#"
										style="text-decoration: none;"> <img
											src="${c.product.productThumb }" width="150" height="150"
											border="0" style="margin-left: 10" /> <!-- src="http://img3.tmon.kr/cdn4/deals/2022/02/15/5164313822/front_cd6a3_671t8.jpg" -->
									</a></td>
									<td style="width: 55%"><a href="#"
										style="color: black; text-decoration: none; font-size: 17"><b>
												<input type="hidden" name="" value="${c.cartCode}">
										</b></a>
										<div style="margin-top: 5; font-size: 15px">
											<c:out value=" ${c.product.categoryName}" />
										</div> <!-- 오예오예 오예스~ --> <br>
										<div style="margin-top: 5; font-size: 15px">
											<c:out value=" ${c.product.productName}" />
										</div> <!-- 오예오예 오예스~ --> <br>
										<div style="margin-top: 5;">	
											<p>
												<fmt:formatNumber pattern="###,###,###"
													value="${c.product.productPrice}" />
												&nbsp;원
											</p>
										</div> <br>
										<div style="margin-top: 5; font-size: 15px">도착 예정</div></td>

									<td style="text-align: center;"><c:out
											value="${c.cartAmount} 개" />

										<div style="margin-top: 5px">
											<p>

												<fmt:formatNumber pattern="###,###,###"
													value="${c.product.productPrice*c.cartAmount}" />
												&nbsp;원
											</p>
										</div></td>
									<td style="width: 100">
										<div style="display: flex; text-alian: center;">
											<button type="submit" id="paymentMoves" class="btn btn-danger">구매하기</button>
										</div>
									</td>
									<td style="display: flex;">
										<div>
											<a class="close" id="close"
												href="${path }/member/delete.do?cartCode=${c.cartCode}"></a>
										</div>
									</td>
								</tr>

							</tbody>
						</table>
						<br>
						<hr>
					</c:forEach>


					<div class="allprice-container">
						<div class="allrprice-content">
							<div class="allprice-form">
								<b>총 상품 가격</b> :<i> <fmt:formatNumber pattern="###,###,###"
										value="${map.sumMoney}" /></i><span class="all-plus"><img
									src="/resources/images/mypage/img_plus.png" style="width: 14;">
								</span> 배송비 <i>${map.fee}</i> 원 <span class="all-plus"> <img
									src="/resources/images/mypage/img_equals.png"
									style="width: 14;"></span> 총 주문금액 <i class="final-price"><fmt:formatNumber
										pattern="###,###,###" value="${map.allSum}" /></i>
							</div>
						</div>
					</div>
					<div class="cartandprice" style="text-align: center;">
						<button type="reset" name="productListMove" class="btn-cart">쇼핑계속하기</button>
						<button type="submit"name="paymentMove" class="btn-buy">구매하기</button>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</form>
	<div></div>
</section>

<script>

function getCheckboxValues(){
	/* 선택된 목록 가져오기 */
	const query ='input [name="check"]:checked';
	const selecteEls= document.queryselectAll(query);
	
	/* 선택된 목록에서 value 찾기 */
	let result = '';
	selecteEls.forEach((el)=>{
		result +=el.value+' ';
	});
	document.getElementById('result') =result;
}


$("button[name= productListMove]").click(function(){
	  location.assign("${path}/product/productList");
})


    //체크박스 전체 선택&해제
    $('#checkAll').click(function(){
    	if($("#checkAll").prop("checked")){
            $(".check-input").prop("checked",true); 
        }else{
            $(".check-input").prop("checked",false); 
        }
    });
    
    $(".check-input").click(function(){
    	$("#checkAll").prop("chcked",false);
    })
    
    $(".check-input").click(function(){
    	$("#checkAll").prop("checked",false)
    })
    
    
  // 선택 삭제
    	$("#selectDelete").click(function(){
    	if(confirm("삭제 하시겠습니까?")){
        const cnt = $("input[name='check']:checked").length;
        const arr = new Array();
        $("input[name='check']:checked").each(function() {
            arr.push($(this).attr('id'));
        });
        console.log(cnt);
        console.log(arr);
        $.ajax({
			url:"${path}/member/selectDelete.do",
			data:{deleteArr:arr},
			success:data=>{
				if(data){
					$("input[name='check']:checked").parents("tr").remove();
				}
			}
		});
    	}else{
    		return false;
    	}
    })
    
    
        $("#close").click(function(){ //개별 삭제(1개 row만 삭제)
        	if(confirm("삭제 하시겠습니까?")){
        	}else{
        		return false
        	}
        		
        })
    
		$("#paymentMoves").click(function(){
			if(confirm('상품을 구매하시겠습니까?')){
			}else{
				return false
			}
		})
		/* var test = confirm("상품을 구매 하시겠습니까?");
		$("button[name=paymentMove]").click(function(){
        var tdCheck =$("input[name='check']:checked");
			if(tdCheck.length >= 1){
				$('#paymentMove').submit() ;
			}else(!tdCheck.length >= 1){
					alert('상품을 선택하세요');
			}
				
				
		})     */
		
		
		
	$("input[name='check']:checked").prop("checked",true);
	$("input[name='check']:checked").prop("checked",false);
		
		
		
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />