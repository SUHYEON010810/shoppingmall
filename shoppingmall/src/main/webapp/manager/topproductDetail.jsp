<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="boardModify.do" encType="multipart/form-data" method="post">
		<table id="frm_table">
			<div>
				<img src="imgLoad.do?fileName=${topdetail.image }"
			</div>
			<div>
				<h4>${topdetail.name } </h4>
				<p>가격 : ${topdetail.price }</p>
				<p>배송비 : 2500원</p>
				<p>옵션</p>
				<select>
					<option>베이지</option>
					<option>블랙</option>
				</select>
				<p>구매수량</p>
				<select>
					<option>1</option>
					<option>2</option>
				</select>
			</div>

		</table>
	</form>

</body>
</html>