<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/img/ssi.jsp" %>
 <%
 	int imgno = Integer.parseInt(request.getParameter("imgno"));
 	boolean flag = dao.getRefnum(imgno);
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
 
<DIV class="title">삭제</DIV>
 <%
 	if(flag){
 %>
 <div class="content">답글이 존재하여 삭제할 수 없습니다.</div>

  
  <DIV class='bottom'>
    <input type='submit' value='확인' onclick="alist()">
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
 <%
 	}else{
 %>
 <form name="frm" method="post"
action="./deleteProc.jsp"
onsubmit="return inputCheck(this)">
<input type="hidden" name="imgno" value="<%=imgno %>">
<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile") %>">
 
 <div class="content">
 삭제하면 복구할 수 없습니다.
 
 </div><br><br>
 <table>
 <tr>
 	<th>비밀번호</th>
 	<td><input type="password" name="passwd"></td>
 </tr>
 
 </table>

<div class="bottom">
<input type="submit" value="확인" class="btn btn-danger">
<input type="button" value="취소" onclick="history.back()" class="btn btn-danger">
</div>
</form>
<%
 	}
%>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 