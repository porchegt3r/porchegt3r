<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/bbs/ssi.jsp"%>
<%@ include file="/bbs/script.jsp" %>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	dao.upViewcnt(bbsno);
	BbsDTO dto = dao.read(bbsno);
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">

	function blist(){
		var url="./list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href=url;
	}
	function bupdate(){
		var url="./updateForm.jsp";
		url += "?bbsno=<%=bbsno%>";
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href=url;
	}
	function bdelete(){
		var url="./deleteForm.jsp";
		url += "?bbsno=<%=bbsno%>";
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href=url;
	}
	function breply(){
		var url= "./replyForm.jsp"
		url += "?bbsno=<%=bbsno%>";
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
				location.href = url;
	}
</script>
<script type="text/javascript">
$(function(){
	/*
	 * AJAX 호출
	 */
	 function cmtCreate(){
		if($("#cmtId").val() == ""){
			alert("ID 를 입력해주세요.");
			return false;
		}
		
		$.ajax({
			url : "./cmtProc.jsp",
			type : "post",
			dataType: "json",
			data : {
				"cbbsNo" : <%=bbsno%>,
				"cmtId" : $("#cmtId").val(),
				"cmtContent" : $("#cmtContent").val(),
				"cmtPasswd" : $("#cmtPassword").val()
			},
			success : function(data){
				console.log(data.result);
				if(data.result == true){
					$("#cmtArea").append(" ID : " + $("#cmtId").val());
					$("#cmtArea").append(" PWD : " + $("#cmtPassword").val());
					$("#cmtArea").append(" Content : " + $("#cmtContent").val());
					
					$("#cmtId").val("");
					$("#cmtPassword").val("");
					$("#cmtContent").val("");
// 					$("#cmtArea").append("<tr><td>1111111111111</td></tr>");
				}else{
					alert("댓글 실패!!!");
				}
			}
		});
	}
	
	$("#cmtRegBtn").on("click", function(e){
		console.log("댓글 등록 클릭!");
		cmtCreate();
	})
});
</script>

</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">조회</DIV>
	<TABLE>
		<TR>
			<TH>제목</TH>
			<TD><%=dto.getTitle()%></TD>
		</TR>

		<TR>
			<TH>내용</TH>
			<TD><%=content%></TD>
		</TR>

		<TR>
			<TH>이름</TH>
			<TD><%=dto.getWname()%></TD>
		</TR>

		<TR>
			<TH>날짜</TH>
			<TD><%=dto.getWdate()%></TD>
		</TR>

		<TR>
			<TH>조회수</TH>
			<TD><%=dto.getViewcnt()%></TD>
		</TR>
	</TABLE>

	<DIV class='bottom'>
		<input type='button' value='등록'
			onclick="location.href='./createForm.jsp'" class="btn btn-danger"> 
			<input type='button' value='목록' onclick="blist()" class="btn btn-danger"> 
			<input type='button' value='수정' onclick="bupdate()" class="btn btn-danger"> 
			<input type='button' value='삭제' onclick="bdelete()" class="btn btn-danger"> 
			<input type='button' value='답변' onclick="breply()" class="btn btn-danger">
		<br><br>
		
			
	<table> 
		<tr>
			<td align="center" width="20" >
				<input type="text" id="cmtId" placeholder="아이디">
				<input type="password" id="cmtPassword" placeholder="비밀번호">
			</td>
			
			<td align="center" width="100">
				<textarea rows="3" cols="50" id="cmtContent" placeholder="내용"></textarea>
			</td>
			<td>
			<button type="button" class="btn btn-primary btn-lg" id="cmtRegBtn">등록</button>
			</td>
		</tr>
	</table>

	<table id="cmtArea"></table>
	</DIV>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
