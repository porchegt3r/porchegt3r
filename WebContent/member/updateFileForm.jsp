<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp" %>
 
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
 
<DIV class="title">사진수정</DIV>
 
<FORM name='frm' method='POST' 
	action='./updateFileProc.jsp'
	enctype="multipart/form-data"
	onsubmit="return inCheck(this)"	>
<input type="hidden" name="id" value="<%=request.getParameter("id") %>">
<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile") %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
  <TABLE>
    <TR>
      <TH>원본파일</TH>
      <TD>
      <img src="./storage/<%=request.getParameter("oldfile") %>">
     	원본파일명: <%=request.getParameter("oldfile") %>
      </TD>
      <tr>
      	<th>변경파일</th>
      	<td>
      	<input type="file" name="fname"	accept=".png,.gif,.jpg">
      	</td>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 