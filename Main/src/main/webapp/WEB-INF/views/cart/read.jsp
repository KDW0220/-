<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div>
	<h1>상품정보</h1>
	<span><a href="/cart/list">목록이동</a></span>



	<h4 class="id"></h4>
	<div class="id">번호:${vo.id}</div>
	<div class="title">${vo.title }</div>
	<div class="price">${vo.price }</div>
	<div class="image">${vo.image}</div>
	<div class="link">${vo.link }</div>
	<img src="/display?fileName=${vo.image}" width=400>


	<div class="pagination"></div>
</div>
<script src="/resources/pagination.js"></script>


