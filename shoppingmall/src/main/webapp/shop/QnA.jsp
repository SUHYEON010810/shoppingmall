<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/index.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/reset.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/b_List.css">
<title>QnA</title>
</head>
<body>
<%@ include file="../include/topmenu.jsp" %>


<div id = "user_write">
<!-- <div id = "user_write" style="display:none;"> -->
		<form name="frm" action="" enctype="multipart/form-data" id="frm" method="post">
			<table id="frm_table">
				<h2>문의하기</h2>
				<tr>
					<td> <label for="uID" >작성자</label> </td>
					<td> <input type="text" name="userID" class="input_text" id="uID" style="width:96%;" readonly/> </td>
				</tr>
				<tr>
					<td> <label for="title" >제목</label> </td>
					<td> <input type="text" name="title" class="input_text" id="title" maxlength="10"  style="width:96%;"/> </td>
				</tr>
				<tr>
					<td> <label for="content" >내용</label> </td>
					<td><textarea cols="50" rows="10" name="content" id="content" style="width:96%;" maxlength="333"></textarea></td>
				</tr>

				<tr>
					<td colspan="2" id="frm_button" style="text-align:center;">
						<button type="submit" id="btn_Submit" name="signUpSubmit" class="bt_css" onclick="userwirte()">등록</button>
						<button type="reset" class="bt_css" onclick = "location='boardList.do'">취소</button>
					</td>
				</tr>
			</table>
		</form>
      </div>
   </div>
</body>
</html>