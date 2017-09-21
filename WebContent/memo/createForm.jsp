<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
 
 
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
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">등록</DIV>
 
<FORM name='frm' method='POST' action='./createProc.jsp'>
 <table>
<tr>
	<th>제목</th>
	<td>
	<input type="text" name="title" size="30" value="두시 회의">
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
	<textarea rows="10" cols="30" name="content">SQL관련</textarea>
	</td>
</tr>
</table>
  
  <DIV class='bottom'>
    <input type='submit' value='전송' class="btn btn-danger">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 