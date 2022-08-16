<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/admin.css" />
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
<script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<!-- 메인 영역 -->
	<div class="container">
		<!-- 사이드바 영역 -->
		<jsp:include page="/WEB-INF/views/admin/adminSidebarForm.jsp">
			<jsp:param name="title" value=""/>
		</jsp:include>
	
		<div class="contents">
			<div class="contentstitle">상품등록</div>
		<form action="${path }/admin/insertProduct.do" method="post" enctype="multipart/form-data">
			<div class="enrolltablediv">
				<table class="enrolltable">
					<tr>
						<td class="theader">상품명</td>
						<td><input class="adminin" name="productName" type="text"
							placeholder="내용을 입력해 주세요"></td>
					</tr>
					<tr>
						<td class="theader">카테고리</td>
						<td style="font-size: 15px; color: #808080;">
							<label><input type="radio" name="categoryName" value="스낵">스낵</label> 
							<label><input type="radio" name="categoryName" value="사탕">사탕</label> 
							<label><input type="radio" name="categoryName" value="초코">초코</label> 
							<label><input type="radio" name="categoryName" value="젤리">젤리</label> 
							<label><input type="radio" name="categoryName" value="완구">완구</label> 
							<label><input type="radio" name="categoryName" value="기타">기타</label>
						</td>
					</tr>
					<tr>
						<td class="theader">가격</td>
						<td><input class="adminin" type="text" name="productPrice"
							placeholder="내용을 입력해 주세요"></td>
					</tr>
					<div>
						<tr>
							<td class="theader">옵션</td>
							<td id="optionTD">
								<div style="display: flex; margin-top:5; flex-direction: row-reverse;">
									<button id="addOptionBtn" class="adminbt" type="button" style="width: 80">옵션추가</button>
								</div>
								<div style="display:flex;justify-content:left;align-items:center;margin:2%" id="optionInput">
									<div>
										<input class="adminin" name="optionName" type="text"
										placeholder="옵션이름을 입력해주세요">
										<input class="adminin" name="optionPrice" type="number" min="100"
										placeholder="옵션가격을 입력해주세요">
									</div>
									<div>
										<button class="adminbt" name="optionbtnn"  type="button" id="remove"  style="width:50; font-size:13">삭제</button>
									</div>
								</div>
							</td>
						</tr>
					</div>
					<tr>
						<td class="theader">수량</td>
						<td><input class="adminin" type="text" name="productAmount"
							placeholder="내용을 입력해 주세요"></td>
					</tr>
					<tr>
						<td class="theader">이미지</td>
						<td>
							<input type="file" name="thumbnail" style="margin-bottom: 5px" >
							<input type="file" name="detailedImage">
						</td>
					</tr>
					<tr>
						<td class="theader">상품설명</td>
						<td><input class="adminin" type="text" name="productContent"
							placeholder="내용을 입력해 주세요"></td>
					</tr>
				</table>
				<div style="position: relative; top: 10px; left: 25%;">
					<button class="adminbt" onclick='return adminpageGo(this.form);'
						style="background-color: #E0E0E0; color: black;">취소</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="adminbt">등록</button>
				</div>
			</div>
		</form>
		</div>
		<!-- end of contents -->
	</div>
	<script>
	//추가
  	let num = 0;
      $(function() {
         num++
         $("#addOptionBtn").on("click", function(e) {
            const optionTemplate=$(e.target).parent().next().clone();
              $(e.target).parent().next().after(optionTemplate).prop('id', 'optionInputID'+num ).find("input").val("");
         });
        
      });
      //삭제
      $(document).ready(function () {
          $(document).on("click", "button[name='optionbtnn']", function () {
            const a =  $(this).parents().parents().attr('id');
            console.log(':::' ,$('input:nth-child(2)').length)
            console.log(':::' ,$('input:nth-child(2)')[0])
             if($('input:nth-child(2)').length == 2){
        		return alert("최소 옵션은 1개입니다!");
           }else{
           console.log(':::' , $(this).parents().parents().attr('id'))
              console.log(':::' +'"#'+a+'"')
            $("#"+a).detach()
           }
          });
      });
      
      //취소
      function adminpageGo(frmGo){
    	  frmGo.action = ${path}"/admin/adminMain.do";
    	  frmGo.submit();
    	  return true;
      }

	</script>
</body>
</html>