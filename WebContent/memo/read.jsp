<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/memo/ssi.jsp" %>
<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	
	dao.upviewcnt(memono);
	
	MemoDTO dto = dao.read(memono);
	String content = dto.getContent();
	content = content.replaceAll("\r\n","<br>");
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function mupdate(memono){
	var url = "./updateForm.jsp";
	url += "?memono=" + memono;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	location.href = url;
	
}
function mreply(memono){
	var url = "./replyForm.jsp";
	url += "?memono=" +memono;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	location.href = url;
}

function mdelete(memono){
	var url = "./deleteForm.jsp";
	url += "?memono="+memono;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	location.href=url;
}

function mlist(){
	var url = "./list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	location.href=url;
}

</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
 
<DIV class="title">조회</DIV>
<table>
	<tr>
		<th>제목</th>
		<td><%=dto.getTitle() %></td>
	</tr>
	
	<tr>
			<th>내용</th>
			<td><%=content%></td>
	</tr>
	
	<tr>
			<th>조회수</th>
			<td><%=dto.getViewcnt()%>
	</tr>
	
	<tr>
			<th>등록일</th>
			<td><%=dto.getWdate()%>
	</tr>

</table>

 
  
  <DIV class='bottom'>
    <input type='button' value='등록' onclick="location.href='./createFrom.jsp'" class="btn btn-danger">
    <input type='button' value='수정' onclick="mupdate('<%=memono%>')" class="btn btn-danger">
    <input type='button' value='삭제' onclick="mdelete('<%=memono%>')" class="btn btn-danger">
    <input type='button' value='답변' onclick="mreply('<%=memono%>')" class="btn btn-danger">
    <input type='button' value='목록' onclick="mlist()" class="btn btn-danger">
    
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 