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
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/index.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/reset.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/b_List.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>QnA</title>
</head>
<%
	String session_uid = (String) session.getAttribute("SessionUserID");
%>
<script>
	/* 문의 등록 */
	function QnAwrite(){
		$("#ajax").remove();
		$("#detailbtn").remove();
		$("#modifybtn").remove();
		$("#QnA_write").css("display","block");
	}

	/* 문의 등록 저장 */
	 function QnAwirte(){
		 $("#QnA_write").css("display","none");
		$.ajax({
			url : "QnAsave.do",
			type: "post",
			data : $('#frm').serialize(),
			success : function(responseData){
				$("#ajax").remove();
				$("#detailbtn").remove();
				/*
				$("#modifybtn").remove(); */
				var data = JSON.parse(responseData);
			}
		})
		location.reload();
	}

</script>

<body>
<%@ include file="../include/topmenu.jsp" %>
<div id="listDiv" >

<h2 style="display:inline-block; ">Q & A</h2>
     <button class="bt_css" id="nemuButton" onclick = "QnAwrite()"> 문의 하기 </button>


	<table style="overflow:auto; width:98.6%;" id="Listtitletable">
   	  	 <tr style="font-weight: 550">
            <th></th>
            <th style="width: 45%;">제목</th>
            <th style="width: 20%;">작성자</th>
            <th style="width: 20%;">등록날짜</th>
            <th style="width: 10%;">답변 여부</th>
         </tr>
  	  </table>
      <div style="overflow:auto; width:100%; height:172px; text-align:center; margin-bottom:40px;">
          <table>

             <!-- 반복문 -->
             <!-- items : controller에서 지정한 addAttribute메소드의 이름과 같아야 함. -->
             <c:forEach var="result" items="${qnalist}" varStatus="status">

                <tr>
                   <td > ${ status.count }</td>
                   <td style="width: 45%;"><a href="QnADetail.do?qseq=${result.qseq}" class="atag"  > ${ result.title } </a> </td>
                   <td style="width: 20%;">${ result.uId }  </td>
                   <td style="width: 20%;">${ result.indate }  </td>
                   <td style="width: 10%;">${ result.rep }  </td>
                </tr>
             </c:forEach>
          </table>
      </div>

      <div id="user_board_data">
       	<!-- 상세보기 데이터 들어갈 곳 -->
      </div>

	<div id = "QnA_write" style="display:none;">
		<form name="frm" action="" id="frm" method="post">
			<table id="frm_table">
				<h2>문 의 하 기</h2>
				<tr>
					<td class="tabletitle"> <label for="prodnum" >상품명</label> </td>
					<td>
						<select style="width:96%;" id="prodnum" name="prodnum">
							<c:forEach var="result" items="${product}" varStatus="status">
								<option value="${ result.prodnum } " > ${ result.name } </option>
							</c:forEach>
							<option></option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="tabletitle"> <label for="title" >제목</label> </td>
					<td> <input type="text" name="title" class="input_text" id="title" maxlength="10"  style="width:96%;"/> </td>
						<input type="hidden" name="u_id" class="input_text" id="u_id" value="<%= session_uid %>" readonly/>
				</tr>
				<tr>
					<td class="tabletitle"> <label for="content" >내용</label> </td>
					<td><textarea cols="50" rows="10" name="content" id="content" style="width:96%;" maxlength="333"></textarea></td>
				</tr>
			</table>
		</form>
		<div  style=" text-align:center; margin-top:10px;">
			<button type="submit" id="btn_Submit" name="signUpSubmit" class="bt_css" onclick="QnAwirte()">등록</button>
			<button type="reset" class="bt_css" onclick = "location='boardList.do'">취소</button>
		</div>
      </div>
   </div>

</body>
</html>