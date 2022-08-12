<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="title" value=""/>
</jsp:include>
<section id="content">
<style>
	div#board-container{width:400px; margin:0 auto; text-align:center;}
	div#board-container input{margin-bottom:15px;}
</style>

<div id="board-container">
        <form name="boardFrm" action="${path }/qna/qnawWriteEnd.do" 
        method="post" enctype="multipart/form-data" >           	 
            <input type="text" class="form-control" placeholder="제목" name="qnaTitle" id="qnaTitle" required>
            <input type="text" class="form-control" placeholder="아이디 (4글자이상)"  value="${loginMember.memberId}" readonly required>           
            <textarea class="form-control" name="qnaContent" placeholder="내용" required></textarea>
            <br />
            <input type="submit" class="btn btn-outline-success" value="저장" >
        </form>
    </div>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>