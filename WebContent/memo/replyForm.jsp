<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/memo/ssi.jsp" %>
 <%
 	int memono = Integer.parseInt(request.getParameter("memono"));
 	MemoDTO dto = dao.replyRead(memono);
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
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">답변</DIV>
 
<FORM name='frm' method='POST' action='./replyProc.jsp'>
<input type="hidden" name="memono" value="<%=memono %>">
<input type="hidden" name="grpno" value="<%=dto.getGrpno() %>">
<input type="hidden" name="indent" value="<%=dto.getIndent() %>">
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum() %>">
<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
<input type="hidden" name="word" value="<%=request.getParameter("word")%>">

  <TABLE>
    <TR>
      <TH>제목</TH>
      <TD>
      <input type="text" name="title" size="30" value="<%=dto.getTitle()%>">
      </TD>
    </TR>
    
    <tr>
	<th>내용</th>
	<td>
	<textarea rows="10" cols="30" name="content"></textarea>
	</td>
</tr>
    
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='답변' class="btn btn-danger">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 