<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/reset.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/productinsert.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>상품 등록</title>
</head>

<body>

	<%@ include file="../include/topmenu.jsp" %>

	<form action="productinsertsave.do" method="post" id="frm" encType="multipart/form-data">
		<h2>상품 등록</h2>
		<table id="ProdInsertTable">
			<tr>
				<td> <label for="name">상품명 </label></td>
				<td> <input type="text" id="name" name="name" class="L_input_text"> </td>
			</tr>
			<tr>
				<td> <label for="kind">상품종류 </label></td>
				<td> <select name="kind" id="kind" >
						<option value="상의"> 상의 </option>
						<option value="하의"> 하의 </option>
						<option value="원피스"> 원피스 </option>
					</select>
				</td>
			</tr>
			<tr>
				<td> <label for="price">가격 </label></td>
				<td> <input type="number" id="price" name="price" class="L_input_text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" > </td>
			</tr>
			<tr>
				<td> <label for="content">상품설명</label></td>
				<td> <textarea rows="10" cols="53" id="content" name="content" ></textarea></td>
			</tr>
			<tr>
				<td> <label for="uploadFile">사진 </label></td>
				<td> <input type="file" id="uploadFile" name="uploadFile" > </td>
			</tr>

			<tr>
				<td colspan="2" id="prodInsertbutTd">
					<button type="submit"  class="bt_css" >등록</button>
					<button type="reset" class="bt_css" onclick="location.href='managerClothesTop.do'" >취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>