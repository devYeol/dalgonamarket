<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/admin.css" />

	<div class="container">
		<jsp:include page="/WEB-INF/views/admin/adminSidebarForm.jsp">
				<jsp:param name="title" value=""/>
		</jsp:include>
		
	<div class="contents">
			<div class="contentstitle">상품수정</div>
		<form action="${path }/admin/updateProduct.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="productCode" value="<c:out value="${p.productCode }"/>">
			<div class="enrolltablediv">
				<table class="enrolltable">
					<tr>
						<td class="theader">상품명</td>
						<td><input class="adminin" name="productName" type="text" value="<c:out value="${p.productName}"/>"></td>
					</tr>
					<tr>
						<td class="theader">카테고리</td>
						<td style="font-size: 15px; color: #808080;">
							<!-- 프린트로 뽑아서 확인하는용 -->
							<%-- <p><c:out value="${c.categoryCode}"/></p> --%> 
							<label><input type="radio" name="categoryName" value="스낵" ${(p.categoryName).contains("스낵")?"checked":"" }>스낵</label> 
							<label><input type="radio" name="categoryName" value="사탕" ${(p.categoryName).contains("사탕")?"checked":"" }>사탕</label> 
							<label><input type="radio" name="categoryName" value="초코" ${(p.categoryName).contains("초코")?"checked":"" }>초코</label> 
							<label><input type="radio" name="categoryName" value="젤리" ${(p.categoryName).contains("젤리")?"checked":"" }>젤리</label> 
							<label><input type="radio" name="categoryName" value="완구" ${(p.categoryName).contains("완구")?"checked":"" }>완구</label> 
							<label><input type="radio" name="categoryName" value="기타" ${(p.categoryName).contains("기타")?"checked":"" }>기타</label>
						</td>
					</tr>
					<tr>
						<td class="theader">가격</td>
						<td><input class="adminin" type="text" name="productPrice"
							placeholder="내용을 입력해 주세요" value="<c:out value="${p.productPrice}"/>"></td>
					</tr>
					<tr>
						<td class="theader">옵션</td>
						<td>
							<div style="display: flex; margin-top:5; flex-direction: row-reverse;">
								<button id="addOptionBtn" class="adminbt" type="button" style="width: 80">옵션추가</button>
							</div>
							<c:forEach var="option" items="${po }">
							<div style="display:flex;justify-content:left;align-items:center;margin:2%" id="optionInput">
								<div>
										<input type="hidden" name="optionCode" value="<c:out value="${option.optionCode }"/>">
										<input class="adminin" name="optionName" type="text"value="<c:out value="${option.optionName }"/> ">
										<input class="adminin" name="optionPrice" type="number" min="1000"value="${option.optionPrice }">
								</div>
								<div>
									<button class="adminbt" type="button" id="remove"  style="width:50; font-size:13">삭제</button>
								</div>
							</div>
							</c:forEach>
						</td>
					</tr>
					
					<tr>
						<td class="theader">수량</td>
						<td><input class="adminin" type="text" name="productAmount"
							placeholder="내용을 입력해 주세요" value="<c:out value="${p.productAmount}"/>"></td>
					</tr>
					<tr>
						<td class="theader">이미지</td>
						<td style="width: 50%;">
							<input type="hidden" name="beforeThumbnail" value="${p.productThumb}">
							<input type="hidden" name="beforedetailedImage" value="${p.productImage }">
							<img src="${p.productThumb }" width="95" height="100" border="0" />
								<input type="file" name="thumbnail" style="margin-bottom: 5px" >
							<img src="${p.productImage }" width="95" height="100" border="0" />
								<input type="file" name="detailedImage" >
						</td>
					</tr>
					<tr>
						<td class="theader">상품설명</td>
						<td><input class="adminin" type="text" name="productContent"
							placeholder="내용을 입력해 주세요" value="<c:out value="${p.productContent}"/>"></td>
					</tr>
				</table>
				<div style="position: relative; top: 10px; left: 25%;">
					<button class="adminbt" onclick='return adminManage(this.form);'
						style="background-color: #E0E0E0; color: black;">취소</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="adminbt" type="submit" >수정</button>
				</div>
			</div>
		</form>
		</div>
	</div>
	
	<script>
		 //취소
	      function adminManage(frmGo){
	    	  frmGo.action = ${path}"/admin/adminManageProduct.do";
	    	  frmGo.submit();
	    	  return true;
	      }
	</script>