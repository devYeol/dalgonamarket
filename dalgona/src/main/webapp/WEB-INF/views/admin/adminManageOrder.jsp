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

<style>

.manageorderdiv { /* 임시 */
	width: 1000px;
}

.pay {
	display: flex;
	text-align: center;
	justify-content:center;
	margin-top: 40px;
	font-size: 22px;
}

.pay div {
 	margin-left: 35px;
	margin-right: 35px;
}

.pay a {
	color: black;
	text-decoration: none;
}

.somedate-search {
	display: flex;
	text-align: center;
	align-items: center;
	justify-content: center;
	margin-top: 40px;
	height: 40px;
}

.someDate {
	margin-left: 30px;
	margin-right: 30px;
}

.btn-somedate { 
	width: 60px; 
	height: 30px;
	font-size: 16px;
	background-color: white;
	border: 1px solid #999;
	border-radius: 10px;
}

.btn-somedate:hover {
	background-color: black;
	color: #fff;
}

.manage-table {
	height: 600px;
	width: 1040px;
	text-align: center;
}

.manage-detail {
 	background-color: beige;
 	border-radius: 20px;
	text-align: center;
	width: 800px;
	border-collapse: separate;
  	border-spacing: 0 10px;
  	margin: 0 auto;
}

</style>

</head>
<body>
	<!-- 메인 영역 -->
	<div class="container">
		<!-- 사이드바 영역 -->
		<jsp:include page="/WEB-INF/views/admin/adminSidebarForm.jsp">
			<jsp:param name="title" value=""/>
		</jsp:include>
		<!-- end of sidebar -->
		<!-- 
            컨텐츠 영역 : 
            - 더미 텍스트(Lorem ipsum)을 활용하여 내용 강제로 늘려 테스트
        -->
		<div class="contents">
		
		
			<div class="contentstitle">
				주문관리
			</div>
			
			<div class="manageorderdiv" style="">
		         <div class="pay">
					<div><a href="#">1<br>전체 구매 내역</a></div>
					<div><a href="#">1<br>배송 중</a></div>
					<div><a href="#">1<br>배송 완료</a></div>
					<div><a href="#">1<br>환불 요청</a></div>
					<div><a href="#">1<br>환불 완료</a></div>
				</div>
				<div class="somedate-search">
					<input class="somedate" type="date">
					<b>~</b>
					<input class="somedate" type="date">
					<button class="btn-somedate">조회</button>
				</div>
			</div>
			
			<br>
			<br>
			
			<div class="manage-table-div">
				<table class="manage-table">
					<tr style="background-color:lightgrey;">
						<th>
							<div>
								<input class="" type="checkbox" value="" id="">
								<label>전체선택</label>
							</div>
						</th>
						<th>주문번호</th>
						<th>상품명</th>		
						<th>주문수량</th>
						<th>상품가격</th>
						<th>배송비</th>
						<th>합계</th>
						<th>입금일시</th>
						<th>주문상태</th>
					</tr>
					<tr>
						<td>
							<input class="" type="checkbox" value="" id="">
						</td>
						<td>2312123123</td>
						<td>쫀드기</td>		
						<td>10</td>
						<td>1000</td>
						<td>2500</td>
						<td>12500</td>
						<td>SYSDATE</td>
						<td>구매확정</td>
					</tr>
					<tr>
						<td>
							<input class="" type="checkbox" value="" id="">
						</td>
						<td>2312123123</td>
						<td>쫀드기</td>		
						<td>10</td>
						<td>1000</td>
						<td>무료배송</td>
						<td>12500</td>
						<td>SYSDATE</td>
						<td>결제완료</td>
					</tr>
					<tr>
						<td>
							<input class="" type="checkbox" value="" id="">
						</td>  
						<td>2312123123</td>
						<td>쫀드기</td>		
						<td>10</td>
						<td>1000</td>
						<td>무료배송</td>
						<td>12500</td>
						<td>SYSDATE</td>
						<td>환불요청</td>
					</tr>
					<tr>
						<td>
							<input class="" type="checkbox" value="" id="">
						</td>  
						<td>2312123123</td>
						<td>쫀드기</td>		
						<td>10</td>
						<td>1000</td>
						<td>무료배송</td>
						<td>12500</td>
						<td>SYSDATE</td>
						<td>환불요청</td>
					</tr>
					<tr>
						<td>
							<input class="" type="checkbox" value="" id="">
						</td>  
						<td>2312123123</td>
						<td>쫀드기</td>		
						<td>10</td>
						<td>1000</td>
						<td>무료배송</td>
						<td>12500</td>
						<td>SYSDATE</td>
						<td>환불요청</td>
					</tr>
					<tr>
						<td>
							<input class="" type="checkbox" value="" id="">
						</td>  
						<td>2312123123</td>
						<td>쫀드기</td>		
						<td>10</td>
						<td>1000</td>
						<td>무료배송</td>
						<td>12500</td>
						<td>SYSDATE</td>
						<td>환불요청</td>
					</tr>
					<tr>
						<td>
							<input class="" type="checkbox" value="" id="">
						</td>  
						<td>2312123123</td>
						<td>쫀드기</td>		
						<td>10</td>
						<td>1000</td>
						<td>무료배송</td>
						<td>12500</td>
						<td>SYSDATE</td>
						<td>환불요청</td>
					</tr>
					<tr>
						<td>
							<input class="" type="checkbox" value="" id="">
						</td>  
						<td>2312123123</td>
						<td>쫀드기</td>		
						<td>10</td>
						<td>1000</td>
						<td>무료배송</td>
						<td>12500</td>
						<td>SYSDATE</td>
						<td>환불요청</td>
					</tr>
					<tr>
						<td>
							<input class="" type="checkbox" value="" id="">
						</td>  
						<td>2312123123</td>
						<td>쫀드기</td>		
						<td>10</td>
						<td>1000</td>
						<td>무료배송</td>
						<td>12500</td>
						<td>SYSDATE</td>
						<td>환불요청</td>
					</tr>
					<tr>
						<td>
							<input class="" type="checkbox" value="" id="">
						</td>  
						<td>2312123123</td>
						<td>쫀드기</td>		
						<td>10</td>
						<td>1000</td>
						<td>무료배송</td>
						<td>12500</td>
						<td>SYSDATE</td>
						<td>환불요청</td>
					</tr>
				</table>
				
				<br>
				
				<h2 style="text-align: center;">페이지바 - 1페이지 10개, &lt; 1 2 3 4 5  &gt;</h2>

			</div>
			
			<div style="padding-bottom: 8px;">
				<div style="padding-top: 10px;">
					<h2>2022. 07. 07 결제</h2>
				</div>
				<div style="display: flex;">	
					<h2 style="color: green;">구매확정</h2>
					<h3 style="padding-top: 5px;">&nbsp;(7/25 도착예정)</h3>
				</div>
			</div>

			<table class="" style="width: 1030px; height: 300px; background-color: FAFAFA; border-radius: 10px;">
			
<!-- 			<thead>
				<tr>
					<th style="padding-top: 20px;">
						<b style="font-size: 25px; color: green;">구매확정</b> <br>
						(7/25 도착예정)
					</th>
				</tr>
			</thead> -->
			
			<tbody>
				<tr>
<!-- 					<td style="width:50px;"><input type="checkbox" style="width: 15px; height: 15px;"></td> -->
					<td style="width:150px; padding-left: 50px; padding-right: 50px;">
						20142504
					</td>
					<td>
						<img src="http://img3.tmon.kr/cdn4/deals/2022/02/15/5164313822/front_cd6a3_671t8.jpg"
						width="180" height="200" border="0" style="beige; border-radius: 10px;"/>
					</td>
					<td style="width:59%; text-align: left; padding-left:60px;">달고나@@@@@@@, 10개입<br>
					옵션 (선택안함)<br>
					배송비 무료<br>
					10,000원 / 1개<br><br>
					<b>합계 : 10,000원</b>
					</td>
					<td style="padding-right: 40px;">
						<button class="adminbt" style="width: 80px; background-color: #6FB67F; margin-bottom: 20px;">리뷰확인</button>
						<button class="adminbt" style="width: 80px; background-color: #D56B5A;">삭제</button>
					</td>
				</tr>
			</tbody>
			
			</table>
			
			<br><br><br>
			
			<!-- <table class="manage-detail" id="">
				
				<thead>
					<tr>
						<th>
							배송중
							7/25 도착예정
						</th>
					</tr>
				</thead>
			
				<tbody>
					<tr class="manage-detail-tr">
						<td class="">
							<a href="#" style="text-decoration: none;">
								<img src="https://newsimg.hankookilbo.com/cms/articlerelease/2021/10/09/15c135f1-1ac3-43dd-89c3-b91a1be39bb2.png" width="85" height="90" border="0" />
							</a>
						</td>
						<td>
							<a href="#">상품타이틀</a><br>
							수량 N 개
						</td>
						<td>
							배송비 N 원
						</td>
					</tr>
				</tbody>
			</table> -->
			
			
			
		</div>
		
		</div>
		<!-- end of contents -->
		
</body>
</html>