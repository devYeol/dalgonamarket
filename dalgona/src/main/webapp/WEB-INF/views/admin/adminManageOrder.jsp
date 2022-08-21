<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/admin.css" />
<%-- <script type="text/javascript" src="${path}/resources/js/admin.js"></script> --%>
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script> -->
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<!-- 메인 영역 -->
	<div class="container">
		<!-- 사이드바 영역 -->
		<jsp:include page="/WEB-INF/views/admin/adminSidebarForm.jsp">
			<jsp:param name="title" value="" />
		</jsp:include>
		<!-- end of sidebar -->
		<!-- 
            컨텐츠 영역 : 
            - 더미 텍스트(Lorem ipsum)을 활용하여 내용 강제로 늘려 테스트
        -->
		<div class="contents">

			<div class="contentstitle">주문관리</div>

			<div class="manageorderdiv" style="">
				<div class="manageorderdata">
					<div>
						<a href="#">${orderCount}<br>전체 구매 내역
						</a>
					</div>
					<div>
						<a href="#">${standbyCount}<br>주문 대기
						</a>
					</div>
					<div>
						<a href="#">${cancelCount}<br>주문 취소
						</a>
					</div>
					<div>
						<a href="#">${shippingCount}<br>배송 중
						</a>
					</div>
					<div>
						<a href="#">${arrivalCount}<br>배송 완료
						</a>
					</div>
					<%-- <div>
						<a href="#">${refundReq}<br>환불 요청
						</a>
					</div>
					<div>
						<a href="#">${refuntOver}<br>환불 완료
						</a>
					</div> --%>
				</div>
				<div class="somedate-search">
					<input class="somedate" type="date"> <b>~</b> <input
						class="somedate" type="date">
					<button class="btn-somedate">조회</button>
				</div>
			</div>

			<div class="listdiv">
				<table class="listtable">
					<tr>
						<td colspan="8" style="text-align: left; padding: 7px;">
							<button class="btn-somedate" onclick="location.assign('${path}/admin/adminManageOrder.do?cPage=${cPage}&orderStatus=전체')">전체</button>
							<button class="btn-somedate" onclick="location.assign('${path}/admin/adminManageOrder.do?cPage=${cPage}&orderStatus=주문대기')">주문대기</button>
							<button class="btn-somedate" onclick="location.assign('${path}/admin/adminManageOrder.do?cPage=${cPage}&orderStatus=주문취소')">주문취소</button>
							<button class="btn-somedate" onclick="location.assign('${path}/admin/adminManageOrder.do?cPage=${cPage}&orderStatus=배송중')">배송중</button>
							<button class="btn-somedate" onclick="location.assign('${path}/admin/adminManageOrder.do?cPage=${cPage}&orderStatus=배송완료')">배송완료</button>
						</td>
					</tr>
					<tr style="background-color: lightgrey; height: 50px;">
						<th style="width: 5%;">
							<div>
								<label style="font-size: 12px;">전체선택</label><br><input class="" type="checkbox" value="" id=""> 
							</div>
						</th>
						<th>주문번호</th>
						<th>주문내용</th>
						<th>배송비</th>
						<th>주문금액</th>
						<th>입금일시</th>
						<th>주문상태</th>
						<th style="width: 5%;" colspan="2">주문<br>승인 / 취소<th>
					</tr>
					<c:if test="${not empty productOrders}">
						<c:forEach var="po" items="${productOrders}">
						<tr>
							<td><input class="" type="checkbox" value="" id=""></td>
							<td>${po.orderCode}</td>
							<td><button class="btn-somedate" onclick="location.assign('${path}/admin/adminManageOrder.do?cPage=${cPage}&orderCode=${po.orderCode}')">상세보기</button></td>
							<td>2,500</td>
							<td>${po.totalPrice}</td>
							<td>${po.orderDate}</td>
							<td>${po.orderStatus}</td>
							<td style="padding: 5px 5px 5px 0px;">
								<button class="adminbt" style="width: 80px; background-color: #6FB67F;"
								name="${po.orderCode}" onclick="adminOrderPermit(event)">승인</button>
							</td>
							<td style="padding: 5px 0px 5px 0px;">
								<button class="adminbt" style="width: 80px; background-color: #D56B5A;"
								name="${po.orderCode}" onclick="adminOrderCancel(event)">취소</button>
							</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty productOrders}">
						<tr>
							<td colspan="8">조회결과 없음</td>
						</tr>
					</c:if>
				</table>
				
				<br>
				
				<div class="pagebar">
					${pageBar}
				</div>
			</div>
			
			<c:if test="${not empty orderDetails}">
				<div class="orderdetailsdiv">
					<div class="orderdetailshead">
						<h1>${order.orderDate} 결제완료</h1>
						<label style="paddin-top: 20px; font-size: 25px; font-weight:bolder;">주문번호 : ${order.orderCode}</label>
						<div style="display:flex; margin:0px; align-items:center;">
							<h2 style="color: green;">${order.orderStatus}</h2>
							<h3 style="">(${order.orderDate} 도착예정)</h3>
						</div>
					</div>
					<div class="orderdetailstable">
						<table class="" style="background-color: FAFAFA; border-radius: 10px;">
							<!-- <thead>
								<tr>
									<th colspan="4" style="padding-top: 20px;">
										<b style="font-size: 25px; color: green;">구매확정</b> (7/25 도착예정)
									</th>
								</tr>
							</thead> -->
							<tbody>
								<c:forEach var="od" items="${orderDetails}">
									<tr>
										<!-- <td style="width:50px;"><input type="checkbox" style="width: 15px; height: 15px;"></td> -->
										<td style="width: 150px; padding-left: 50px; padding-right: 50px;"><b>${od.product.productCode}</b></td>
										<td><img
											src="${od.product.productThumb}" width="180" height="200" border="0" style="border-radius: 10px;" />
										</td>
										<td style="width: 59%; text-align: left; padding-left: 60px;">
											<label style="font-size: 22px; font-weight: bolder">${od.product.productName}</label><br> 
											<label style="font-size: 18px;">옵션(선택안함)</label><br> 
											<label style="font-size: 18px;"> ${od.product.productPrice} 원 / ${od.orderAmount}개</label><br><br>
											<b>합계 : ${od.product.productPrice * od.orderAmount} 원</b>
										</td>
										<td style="padding-right: 40px;">
											<button class="adminbt" style="width: 80px; background-color: #6FB67F; margin-bottom: 20px;"
											onClick="location.assign('${path}/product/productDetail/${od.product.productCode}')">리뷰확인</button>
											<button class="adminbt" style="width: 80px; background-color: #D56B5A;">삭제</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:if>
			<!-- end of orderdetailsdiv -->
		</div>
		<!-- end of contents -->
	</div>
	<!-- end of container -->
	
	<script>
		const adminOrderPermit=(e)=>{
			const returnVal=confirm("주문을 승인하시겠습니까?")
			if(returnVal==true) {
				$.ajax({
					url:"${path}/admin/adminOrderPermit.do",
					data:{orderCode:$(e.target).attr("name")},
					success:data=>{
						console.log(data);
						if(data!=null) {
							$(e.target).parent().prev().text(data);
						}
					}
				});
			}
		}
		
		const adminOrderCancel=(e)=>{
			const returnVal=confirm("주문을 취소하시겠습니까?")
			if(returnVal==true) {
				$.ajax({
					url:"${path}/admin/adminOrderCancel.do",
					data:{orderCode:$(e.target).attr("name")},
					success:data=>{
						console.log(data);
						$(e.target).parent().prev().prev().text(data);
					}
				});
			}
		}
	</script>

</body>
</html>