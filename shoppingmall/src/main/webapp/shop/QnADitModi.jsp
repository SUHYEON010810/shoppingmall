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
<title>문의</title>
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/index.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/reset.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/b_List.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<%
	String session_uid = (String) session.getAttribute("SessionUserID");
%>
<script>

	function QnAanswer(){
		$("#QnA_an").css("display","block");
	}

	 /* 글 수정 */
	 function QnAModify(){
	 	$("#QnA_write").css("display","none");
	 	var qseq =  $("#qseq").val();

	 	$.ajax({
	 		url : "QnAModify.do",
	 		type: "get",
	 		data : { "qseq" : qseq },
	 		success : function(responseData){
	 			$("#ajax").remove();
	 			$("#detailbtn").remove();
	 			$("#modifybtn").remove();
	 			var data = JSON.parse(responseData);

	 			var html = ''

	 				html += '<form action="" id="ajax" method="post" >';
	 				html += '<table id="frm_table">';
	 				html += '<h2>수 정</h2>';


	 				html += '<tr>';
	 				html += '<td style="width:14%;" class="tabletitle"><label >상품명</label></td>';
	 				html += '<td><input type="text" id="name" name="name"  value="'+data.name+'"  style="width:96%;" readonly></td>';
	 				html += '</tr>';

	 				html += '<tr>';
	 				html += '<td class="tabletitle"> <label for="title" >제목</label> </td>'
	 				html += '<td><input style="width:96%;" type="text" id="title" name="title"  value="'+data.title+'"></td>';
	 				html += '</tr>';

	 				html += '<tr style="height:178px;">';
	 				html += '<td class="tabletitle"> <label for="content" >내용</label> </td>';
	 				html += '<td ><textarea cols="50" rows="10" name="content" id="content"  style="width:96%;" >'+data.content+'</textarea></td>';
	 				html += '</tr>';

	 				html += '<input type="hidden" id="qseq" name="qseq"  value="'+data.qseq+'">';

	 				html += '</table>';
	 				html += '</form>';

	 				html += '<div  id="modifybtn"  style="text-align:center; margin-top:10px;">';
	 				html += '<button type="submit" onclick="QnAModifySave()" id="btn_Submit" name="signUpSubmit" class="bt_css" style="margin-right:8px;">수정</button>';
	 				html += '<button class="bt_css" onclick="cancell()">취소</button>';
	 				html += '</div>';

	 				$("#user_board_data").after(html);
	 		}
	 	})
	 }

	 /* 수정 데이터 저장 */
	  function QnAModifySave(){
	 	$.ajax({
	 		url : "QnAModifysave.do",
	 		type: "get",
	 		data : $('#ajax').serialize(),
	 		success : function(responseData){
	 			$("#ajax").remove();
	 			$("#detailbtn").remove();
	 			$("#modifybtn").remove();
	 			var data = JSON.parse(responseData);
	 		}
	 	})
	 	location.reload();

	 }
	 /* 수정 취소를 누를 경우 */
	  function cancell(){
			location.reload();
	}

	  /* 삭제 */
	   function QnAdelete(qseq){
		      if( confirm ("정말 삭제하겠습니까? ")){
		         location="QnADelect.do?qseq="+qseq;
		      }
		   }

	   function  QnAanswersave(){
			$.ajax({
				url : "QnAanswersave.do",
				type: "post",
				data : $('#an').serialize(),
				success : function(responseData){
					/* $("#ajax").remove();
					$("#detailbtn").remove(); */
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

	<div id = "QnA_Detail">
		<form name="frm" action="" id="frm" method="post">
			<table id="frm_table">
				<h2 style="display: inline-block;"> 문의 상세보기 </h2>
				<div id="detailbtn" style=" text-align:center; margin-top:18px; display: inline-block; float: right;">
			 		<button type="button" onclick="QnAanswer()" id="btn_Submit" class="bt_css" style="margin-right:8px;">답변하기</button>
			 		<button type="button" onclick="QnAModify()" id="btn_Submit" name="signUpSubmit" class="bt_css" style="margin-right:8px;">수정</button>
			 		<button class="bt_css" onclick="QnAdelete(${vo.qseq})">삭제</button>
			 	</div>
				<tr>
					<td style="width:14%;" class="tabletitle"><label >상품명</label></td>
					<td style="">${ vo.name } </td>
				</tr>
				<tr>
					<td class="tabletitle"> <label for="title" >제목</label> </td>
					<td style="">${ vo.title } </td>
				</tr>
				<tr style="height:178px;">
					<td class="tabletitle"> <label for="content" >내용</label> </td>
					<td style="">${ vo.content } </td>
					<input type="hidden" id="qseq" name="qseq"  value="${ vo.qseq }">
				</tr>
			</table>
		</form>

      </div>

       <div id="user_board_data">
       	<!-- 상세보기 데이터 들어갈 곳 -->
      </div>

      <c:if test="${vo.rep eq 0}">
				<div style="border: 1px solid #cccccc; padding: 5px; margin-top:20px; text-align: center;">
				 	등록된 답변이 없습니다.
				</div>
		</c:if>
		<c:if test="${vo.rep eq 1}">
				<div style="border: 1px solid #cccccc; padding: 5px; margin-top:20px; text-align: center;">
				 	<table id="frm_table">
						<tr>
							<td style="width:14%;" class="tabletitle"><label >상품명</label></td>
							<td style="">${ vo.name } </td>
						</tr>
						<tr style="height:178px;">
							<td class="tabletitle"> <label for="reply" >내용</label> </td>
							<td>${ vo.reply }</textarea></td>
							<input type="hidden" id="qseq" name="qseq"  value="${ vo.qseq }">
						</tr>
					</table>
				</div>
		</c:if>

      <div id = "QnA_an" style="display: none;">
		<form name="an" action="" id="an" method="post">
			<table id="frm_table">
				<h2 style="display: inline-block;"> 답변 하기 </h2>

				<tr>
					<td style="width:14%;" class="tabletitle"><label >상품명</label></td>
					<td style="">${ vo.name } </td>
				</tr>
				<tr style="height:178px;">
					<td class="tabletitle"> <label for="reply" >내용</label> </td>
					<td><textarea cols="50" rows="10" name="reply" id="reply" style="width:96%;" maxlength="333"></textarea></td>
					<input type="hidden" id="qseq" name="qseq"  value="${ vo.qseq }">
				</tr>
			</table>
			<div id="detailbtn" style=" text-align:center; margin-top:18px; display: inline-block; float: right;">
			 		<button type="button" onclick="QnAanswersave()" id="btn_Submit" name="signUpSubmit" class="bt_css" style="margin-right:8px;">등록</button>
			 		<button class="bt_css" onclick="QnAdelete(${vo.qseq})">취소</button>
			 	</div>
		</form>

      </div>
   </div>



</body>
</html>