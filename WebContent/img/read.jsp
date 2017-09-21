<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/img/ssi.jsp" %>
<%
	int imgno = Integer.parseInt(request.getParameter("imgno"));
	ImgDTO dto = dao.read(imgno);
	String content = dto.getContent();
	content = content.replaceAll("\n\r", "<br>");

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
function alist(){
	
	var url = "./list.jsp";
	url += "?imgno=<%=imgno%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	location.href=url;
}
function aupdate(){
	var url = "./updateForm.jsp";
	url += "?imgno=<%=imgno%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	location.href=url;
}
function areply(){
	var url = "./replyForm.jsp";
	url += "?imgno=<%=imgno%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	 
	location.href = url;
}
function adelete(){
	var url = "./deleteForm.jsp";
	url += "?imgno=<%=imgno%>";
	url += "&oldfile=<%=dto.getFname()%>";
	location.href=url;

}
</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">조회</DIV>
 
  <TABLE>
    <TR>
    	<td rowspan="5">
    	<img src="./storage/<%=dto.getFname() %>" width="180" height="180">
        </td>
    </TR>
    <TR>
      <TH>이름</TH>
      <TD><%=dto.getWname() %></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><%=dto.getContent() %></TD>
    </TR>
    <TR>
      <TH>등록날짜</TH>
      <TD><%=dto.getWdate() %></TD>
    </TR>
    
  </TABLE>
  
 
  
  <DIV class='bottom'>
    <input type='button' value='리스트' onclick="alist()" class="btn btn-danger">
    <input type='button' value='수정' onclick="aupdate()" class="btn btn-danger">
    <input type='button' value='답변' onclick="areply()" class="btn btn-danger">
    <input type='button' value='삭제' onclick="adelete()" class="btn btn-danger">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 