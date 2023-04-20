<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/reset.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/topList.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>상품 리스트</title>
</head>
<script >
   function fn_delete(prodnum){
      if( confirm ("정말 삭제하겠습니까? ")){
         location="productDelect.do?prodnum="+prodnum;
      }
      var test = [1,2,3];
   }
</script>
<body>
<%@ include file="../include/topmenu.jsp" %>
	<div id="topListdiv">
		<div id="titlebtn">
			<h2>상품 목록</h2>
			<button onclick="location.href='productinsert.do'" class="bt_css" id="insertproductBTN">상품추가</button>
	 	</div>
	 	<div id="topLiatdiv__items">
			<c:forEach var="result" items="${top}" varStatus="status">
				<div class="topLiatdiv__items__item">
					<img src="imgLoad.do?fileName=${result.image }" class="topimage"/>
					<a href="productDetail.do?prodnum=${result.prodnum}"> ${ result.name } </a>
					<input type="hidden" id="kind" name="kind"  value="${result.kind }">
					<div id="btnDiv">
						<button onclick="location='productModify.do?prodnum=${result.prodnum}'">수정</button>
						<button onclick="fn_delete('${result.prodnum}')">삭제</button>
					</div>
				</div>
			</c:forEach>
		</div>

		<div id="pagediv" style="margin-top:5px; text-align:center; margin-bottom: 30px;" >
			<c:forEach var="i" begin="1" end="${totalPage }">
				<a href="managerClothesTop.do?viewPage=${i }&kindint=${ kindint }">${i }</a>
			</c:forEach>
    	</div>
	</div>
</body>
</html>