<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<style>
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
				<li><h5></h5></li>
				<li><a href="${path }/member/mypage/mypageMain">쇼핑정보</a></li>
				<li><a href="${path }/member/mypage/productOrderList">구매내역</a></li>
				<li><a href="${path }/member/mypage/cart"></a>
					<h5>
						<b>장바구니</b>
					</h5></li>
				<li><a href="${path }/member/mypage/zzim">찜 목록</a></li>
				<br>
				<li><h5>
						<b>내정보</b>
					</h5></li>
				<li><a href="#">프로필 정보</a></li>
				<li><a href="#">주소록</a></li>
			</ul>
		</div>
	</div>
	<div class="cart-container">
		<h4>
			<b>장바구니</b>
		</h4>
		<c:choose>
			<c:when test="${map.count ==0 }">
			장바구니가 비었습니다
			</c:when>
			
			<c:otherwise>
		<div style="margin-top: 20px">
			<div>
				<div style="display: flex; justify-content: space-between;">
					<div style="margin-top: 8px; margin-left: 10; display: flex">
						<input class="form-check-input" type="checkbox" id="selectAll"
							value="selectall" name="selectAll" aria-label="...">
						<div style="margin-left: 10">전체선택</div>
					</div>
					<button type="button" class="btn-delete" id="selectDelete"
						style="margin-right: 10">선택삭제</button>
				</div>
			</div>
		</div>
		<hr>
		<c:forEach var="c" items="${map.cartList}" >
			<br>
			<table style="margin-left: 10; width: 100%;">
				<tbody>
					<tr class="payment-tr" name="selectP">
						<td style="width: 20%;"><input class="check-input"
							type="checkbox" style="margin-top: 40;"> <a href="#"
							style="text-decoration: none;"> <img src=""
								width="150" height="150" border="0" style="margin-left: 10" />
								<!-- src="http://img3.tmon.kr/cdn4/deals/2022/02/15/5164313822/front_cd6a3_671t8.jpg" -->
						</a></td>
						<td style="width: 55%"><a href="#"
							style="color: black; text-decoration: none; font-size: 17"><b><c:out
										value=""/></b></a><br>
							<div style="margin-top: 5; font-size: 15px">
								<c:out value="${c.memberId}원" />
							</div> <!-- 오예오예 오예스~ -->
							<div style="margin-top: 5;">
								<c:out value=" ${c.productPrice}" />
							</div> <%-- 30,000원 --%>
							<div style="margin-top: 5; font-size: 15px">
								<%-- <c:out value="${c.orderDate}" /> --%>
								도착 예정
							</div></td>

						<td style="text-align: center;"><select id="browsers">
								<option>1개</option>
								<option>2개</option>
								<option>3개</option>
								<option>4개</option>
								<option>5개</option>
						</select>
							<div style="margin-top: 5px">1,000원</div></td>
						<td style="width: 100">
							<div style="display: flex; text-alian: center;">
								<button type="button" class="btn btn-danger">구매하기</button>
							</div>
						</td>
						<td style="display: flex;">
							<div class="close"></div>
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
					총 상품가격 <i>29000</i> 원 <span class="all-plus"><img
						src="/resources/images/mypage/img_plus.png" style="width: 14;">
					</span> 총 배송비 <i>2,000</i> 원 <span class="all-plus"><img
						src="/resources/images/mypage/img_equals.png" style="width: 14;"></span>
					총 주문금액 <i class="final-price"><c:out value="31000원" /></i>
				</div>
			</div>
		</div>
		<div class="cartandprice" style="text-align: center;">
			<button class="btn-cart">쇼핑계속하기</button>
			<button type="submit" class="btn-buy">구매하기</button>
		</div>
		</c:otherwise>
		</c:choose>
	</div>
	<div></div>
</section>

<script>
function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('selectAll');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}
	
	
	
$(document).ready(function(){
    //체크박스 전체 선택&해제
    $('#selectAll').click(function(){
         if($("#selectAll").prop("checked")){
            $("input[type=checkbox]").prop("checked",true); 
        }else{
            $("input[type=checkbox]").prop("checked",false); 
        }
    });
    
     
        $('#selectDelete').click(function(){
            if(confirm("삭제하시겠습니까?")){
                $("input[name=selectP]:checked").each(function(){
                    var tr_value =$(this).val();
                    var tr=$("tr[data-tr_value='"+tr_value+"']");
                    tr.remove();
                });
            }else{
                return false;
            }
        });
     
    });

    
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />