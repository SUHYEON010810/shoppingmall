<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 추가</title>
</head>
<body>
	<form action="productinsertsave.do" method="post">
		<table>
			<tr>
				<td> <label for="name">상품명 </label></td>
				<td> <input type="text" id="name" name="name" > </td>
			</tr>
			<tr>
				<td> <label for="kind">상품종류 </label></td>
				<td> <select name="kind" id=kind">
						<option value="상의"> 상의 </option>
						<option value="하의"> 하의 </option>
						<option value="원피스"> 원피스 </option>
					</select>
				</td>
			</tr>
			<tr>
				<td> <label for="price">가격 </label></td>
				<td> <input type="text" id="price" name="price" > </td>
			</tr>
			<tr>
				<td> <label for="content">상품설명</label></td>
				<td> <textarea rows="10" cols="50" id="content" name="content" ></textarea></td>
			</tr>
			<tr>
				<td> <label for="image">사진 </label></td>
				<td> <input type="file" id="image" name="image" > </td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">등록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>