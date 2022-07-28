<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<section id="content">
	<div class="form-check">
		  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">
		    Default checkbox
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
		  <label class="form-check-label" for="flexCheckChecked">
		    Checked checkbox
		  </label>
	</div>
</section>
