<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
	<!-- <style>
		div#board-container{width:400px; margin:0 auto; text-align:center;}
		div#board-container input{margin-bottom:15px;}
	</style> -->
	
	<div class= "container">
    	<div class= "row">
    		<form id="myform" method="post" action="${path }/qna/qnawWriteEnd.do">
    			<table class= "table table-stripped" style= "text-align: center; boarder: 1px solid #dddddd">
	    	    	<thead>
		    	    	<tr>
		    	    		<th colspan= "2" style= "background-color: #eeeeee; text-align: center;">문의</th>
		    	    	</tr>
	    	    	</thead>
			    	<tbody>
			    		<tr>
			    			<td><input type="text" class="form-control" placeholder="문의 제목" id="qnaTitle" name="qnaTitle" maxlength="50" ></td>
			    		</tr>
			    		<tr>
			    			<td><textarea class="form-control" placeholder="문의 내용" id="qnaContent"  name="qnaContent" maxlength="2048" style= "height:350px" ></textarea></td>
			    		</tr>
			    	</tbody>
    	    	</table>
    	    	<input type="hidden" value="${productCode }" name="productCode">
    	    	<!-- <input onclick="closeTabClick()" type="submit" class="btn btn-primary pull-right" value="저장"> -->
    	    	<!-- <button class="btn btn-primary pull-right"  onclick="closeTabClick()" type="submit">저장</button> -->
    	    	<div class="d-grid gap-2 col-6 mx-auto">
    	    		<button id="send" type="button" onclick="submit_data()">저장</button>
    	    	</div>
    		</form>
    	    </div>
    </div>
    
    
<script>

	$(function() {
		var qnaTi = document.getElementById("qnaTitle");
		var qnaCon = document.getElementById("qnaContent");
		
			$("#send").click( function() {
				if(qnaTi.value.length==0){
				    alert("제목을 입력하세요");
				}else if(qnaCon.value.length==0){
					alert("내용을 입력하세요");
				}else{
		         $('#myform').submit();
		         setTimeout(function() { 
		        	 opener.parent.location.reload();
		             window.close();	
		         }, 100);
				}
		
			});			
	
	});
	
</script>

<style>

	#send {
		/* width: 120px; */
		height: 38px;
		background-color: #5E5E5E;
		border: 0;
		outline: 0;
	    border-radius: 0.25rem;
	    color: white;
		font-size: 15px;
		font-weight: bolder;
		cursor: pointer;
	}
	
</style>




</body>
</html>