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
			<jsp:param name="title" value=""/>
		</jsp:include>
		<!-- end of sidebar -->
		<!-- 
            컨텐츠 영역 : 
            - 더미 텍스트(Lorem ipsum)을 활용하여 내용 강제로 늘려 테스트
        -->
		<div class="contents">
		<div class="contentstitle">상품관리</div>
			<div class="searchdiv">
				<div>
					<img src="${path}/resources/images/glass.png" style="width:24px; height:24px">
				</div>
				&nbsp;
				<div>
					<input class="search" type="text" placeholder="검색하실 상품명을 입력하세요">
				</div>
			</div>
			<div class="listdiv">
				<table class="listtable">
					<tr style="bolder-top: none;">
						<td nowrap>
							<div style="font-size: 11px; color:#2E6BFF; padding-bottom:2px;">
								<b>전체선택</b>
							</div>
							<div style="">
								<input type="checkbox" style="width: 15px; height: 15px;" oninput="selectAll();" id="productEntry">
							</div>
							
						</td>
						<td style="text-align:left;">
							
						</td>
						<td colspan="3">
						</td>
						<td>
							<div style="padding: 5px;">
								<button class="adminbt" style="width: 80px; background-color: #2E6BFF;"
								onclick="location.assign('${path}/admin/adminEnrollProduct.do')">상품등록</button>
							</div>
						</td>
						<td>
							<div style="padding: 5px;">
								<button class="adminbt" style="width: 80px; background-color: #D56B5A;" onclick="adminDeleteSelect();">선택삭제</button>
							</div>
						</td>
					</tr>
					<tr>
						<th style="width: 5%;">체크</th>
						<th style="width: 10%;">상품코드</th>
						<th style="width: 6%%;">이미지</th>
						<th style="">상품명/가격</th>
						<th style="width: 21%;">상품수량</th>
						<th style="width: 9%;" colspan="2">등록/삭제</th>
					</tr>
					<c:if test="${not empty products}">
		            	<c:forEach var="p" items="${products}">
							<tr >
								<td style="width:50px;"><input type="checkbox" style="width: 15px; height: 15px;" id="<c:out value="${p.productCode}"/>" name="check"></td>
								<td style="width:90px;" ><c:out value="${p.productCode}"/></td>
								<td onclick="location.assign('${path}/product/productDetail/${p.productCode}')" style="cursor:pointer;">
									<img src="${p.productThumb }" width="95" height="100" border="0" />
								</td>
								<td style="width:59%; text-align: center; padding-left:30px; cursor:pointer;" 
								onclick="location.assign('${path}/product/productDetail/${p.productCode}')">
									<c:out value="${p.productName}"/>
									<br>
									<c:out value="${p.productPrice}"/>원
								</td>
								<td>
									<input style="width:90px; font-size: 15px; padding-right:10px;" type="number" value="<c:out value="${p.productAmount}"/>">
								</td>
								<td style="padding: 5px;">
									<button class="adminbt" style="width: 80px; background-color: #6FB67F;" onclick="location.assign('${path}/admin/selectUpdateProduct.do?pro=${p.productCode}')">수정</button>
								</td>
								<td style="padding: 5px;">
									<button class="adminbt" id="<c:out value="${p.productCode}"/>" name="<c:out value="${p.productCode}"/>" 
										style="width: 80px; background-color: #D56B5A;" onclick="adminDeleteProduct(event)">삭제</button>
								</td>
							</tr>
						</c:forEach>
		            </c:if>
		            <c:if test="${empty products}">
		            	<tr>
		            		<td colspan="6">조회결과 없음</td>
		            	</tr>
		            </c:if>
				</table>
			</div>
			<div class="pageBar">
				${pageBar}
			</div>
		</div>
	</div>
	<script>
		// 개별 삭제
		const adminDeleteProduct=(e)=>{
			if(confirm("삭제 하시겠습니까?")){
			}else{
			 	return false;
			 }
			$.ajax({
				url:"${path}/admin/adminDeleteProduct.do",
				data:{productCode:$(e.target).attr("name")},
				success:data=>{
					if(data){
						$(e.target).parents("tr").remove();
					}
				}
			});
		}
		
		// 선택 삭제
	    const adminDeleteSelect=()=>{
	    	if(confirm("삭제 하시겠습니까?")){
			}else{
			 	return false;
			 }
	        const cnt = $("input[name='check']:checked").length;
	        const arr = new Array();
	        $("input[name='check']:checked").each(function() {
	            arr.push($(this).attr('id'));
	        });
	        console.log(cnt);
	        console.log(arr);
	        $.ajax({
				url:"${path}/admin/adminDeleteSelect.do",
				data:{deleteArr:arr},
				success:data=>{
					if(data){
						$("input[name='check']:checked").parents("tr").remove();
					}
				}
			});
	    }
		
		// 전체 선택
		const selectAll=()=>{
     	const entry = document.getElementById("productEntry");
	 	const check = document.getElementsByName("check");
	        for (let i = 0; i < check.length; i++) {
	        	check[i].checked = entry.checked;
	        }
	    };
	</script>
</body>
</html>