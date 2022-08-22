<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<style>
.proName {
	font-size: 20px;
	text-decoration: none;
	color: black;
}

.close {
	display: inline-block;
	font-weight: bold;
	text-decoration: none;
	color: black;
	float: right;
	 margin-bottom: 10px;
}

.close:after {
	content: "\00d7";
	font-size: 15pt;
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

	<div class="cart-container">
		<h4>
			<b>찜 목록</b>
		</h4>
		<c:choose>
			<c:when test="${count==0}">
				<span>찜 한 상품이 없습니다</span>
				<br>
				<br>
				<button type="button" class="btn btn-danger" name="productListMove">찜 하러가기</button>
			</c:when>
			<c:otherwise>
				<div style="margin-top: 20px">
					<div>
						<div style="display: flex; justify-content: space-between;">
							<div style="margin-top: 8px; margin-left: 10; display: flex">
								<input class="form-check-input" type="checkbox" id="selectAll"
									value="" aria-label="...">
								<div style="margin-left: 10">전체선택</div>
							</div>
							<button type="button" class="btn btn-danger" id="selectDelete"
								style="font-size: 14px; height: 4 0px; margin-right: 1%;">선택삭제</button>
						</div>
					</div>
				</div>
				<hr>
				<form action="${path }/member/mypage/cartInsert" onsubmit="return cartMoved()"id="cartMoved">
					<c:forEach var="z" items="${zzimList }">
					<%-- <input type="hidden" name="zzimList" value="${zzimList }"> --%>
						<br>
						<table style="margin-left: 10; width: 98%;">
							<tbody>
								<tr class="payment-tr">
									<td style="width: 20%;">
										<input type="hidden" name="likesCode" value="${z.likesCode }">
										<input type="hidden" name="productCode" value="${z.product.productCode}">
										<input type="hidden" name="productName" value="${z.product.productName}">
										<input type="hidden" name="productThumb" value="${z.product.productThumb}">
										<input type="hidden" name="categoryName" value="${z.product.categoryName}">
										<input type="hidden" name="productPrice" value="${z.product.productPrice}">
										<input type="hidden" id="" name="selAmount"	value="1"> 
										<input class="check-input"
										name="check" id="${z.likesCode }" type="checkbox"
										style="margin-top: 40;" onclick="getCheckboxValues();"> <a href="#"
										style="text-decoration: none;"> <img
											src="${z.product.productThumb }" width="150" height="150"
											 style="margin-left: 10" />
										</a></td>
									<td style="width: 55%"><a
										href="${path}/product/productList" class="proName"><c:out
												value="${z.product.productName }" /></a><br>
									<br>
										<div style="margin-top: 5; font-size: 15px">
											<c:out value=" ${z.product.categoryName }"/>
										</div>
										<br>
										<div style="margin-top: 5;">
											<c:out value="${z.product.productPrice }원" />
										</div></td>
									<td style="padding-left: 120px;">
										<button type="button" onclick="return cartMoved(this.form)" class="btn btn-danger" id="jang"
											style="font-size: 14px; width:100%;height: 47%;">장바구니 담기</button>
									</td>
									<td style="float:right;">
									<a href="${path }/member/zzimDelete.do?likesCode=${z.likesCode}"
										class="close" id="close"></a>
									</td>
								</tr>
							</tbody>
						</table>
						<br>
						<hr>
					</c:forEach>
					<div class="cartandprice" style="text-align: center;">
						<button class="btn-buy" id="cartMoves">장바구니에 담기</button>
					</div>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
</section>

<script>

function getCheckboxValues(){
	/* 선택된 목록 가져오기 */
	const query ='input [name="check"]:checked';
	const selecteEls= document.queryselectorAll(query);
	
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
  $('#selectAll').click(function(){
	if($("#selectAll").prop("checked")){
        $(".check-input").prop("checked",true); 
    }else{
        $(".check-input").prop("checked",false); 
    }
});

$(".check-input").click(function(){
	$("#selectAll").prop("chcked",false);
})

$(".check-input").click(function(){
	$("#selectAll").prop("checked",false)
})

 // 선택 삭제
  $("#selectDelete").click(function(){
        const cnt = $("input[name='check']:checked").length;
        const arr = new Array();
    	if(confirm("삭제 하시겠습니까?")){
        $("input[name='check']:checked").each(function() {
            arr.push($(this).attr('id'));
        });
        console.log(cnt);
        console.log(arr);
        $.ajax({
			url:"${path}/member/zzimSelectDelete.do",
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
    });
    	
    
       /*  $("#close").click(function(){ //개별 삭제(1개 row만 삭제)
       	if(confirm("삭제 하시겠습니까?")){
        	}else{
        		return false
        	}
       		
       }); */
        
	$("#cartMoves").click(function(){
	      var qwe =$("input[name='check']:checked");
		if(data){
			$("input[name='check']:checked").parents("tr").$('#cartMoved').submit();
			console.log(qwe);
				
		}else{
			alert('상품을 선택하세요');
			return false
		}
	})    
	
	function cartMoved(frm){
		 action = ${path}"/member/mypage/cartInsert";
			frm.submit();
			return true;
	 };
		
        
</script>







<jsp:include page="/WEB-INF/views/common/footer.jsp" />