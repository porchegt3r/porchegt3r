<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/img/ssi.jsp" %>
<%
	int imgno = Integer.parseInt(request.getParameter("imgno"));
	ImgDTO dto  = dao.read(imgno);
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
 
<DIV class="title">수정</DIV>
 
<FORM name='frm' 
method='POST' 
action='./updateProc.jsp'>
<input type="hidden" name="imgno" value="<%=dto.getImgno() %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">

  <table>
<tr>
	<th>이름</th> 
	<td><input type="text" name="wname" value="<%=dto.getWname() %>"></td> 
</tr>

<tr>
	<th>제목</th>
		<td><input type="text" name="title" value="<%=dto.getTitle() %>"></td> 
</tr>
<tr>
	<th>내용</th>
		<td>
		<textarea rows="10" cols="30" name="content"><%=dto.getContent() %></textarea>
		</td>
</tr>
<tr>
	<th>비밀번호</th>
		<td>
		<input type="password" name="passwd" >
		</td>
</tr>
</table>
  
  <DIV class='bottom'>
    <input type='submit' value='수정' class="btn btn-danger">
    <input type='button' value='뒤로' onclick="history.back()" class="btn btn-danger">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 