<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/memo/ssi.jsp" %>
<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	boolean flag = dao.getRefnum(memono);

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
div {
	text-align:center;
	margin-top:20px;
	margin-bottom:20px;
}
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
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
 
<DIV class="title">삭제 확인</DIV>
<%
	if(flag){
%>
 <div class="content">
 답글이 존재하여 삭제 할 수 없습니다.
 </div>
 <div class="bottom">
 	<button type="button" onclick="history.back()" class="btn btn-danger">뒤로가기</button>
 	<button type="button" onclick="mlist()" class="btn btn-danger">목록</button>
 </div>
 <% }else{ %>
<FORM name='frm' method='POST' action='deleteProc.jsp'>
<input type="hidden" name="memono" value="<%=memono %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">

<div>
	삭제를 하면 복구를 할 수 없습니다.<br><br>
	그래도 삭제 하시겠습니까?<br><br>

</div>
  
  <DIV class='bottom'>
    <button type='submit' class="btn btn-danger">삭제</button>
    <button type='button' onclick="mlist()" class="btn btn-danger">목록</button>
    
  </DIV>
</FORM>
<%} %>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 