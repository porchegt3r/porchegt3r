<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/memo/ssi.jsp" %>
<% 
	int memono = Integer.parseInt(request.getParameter("memono"));
	boolean flag = dao.delete(memono);
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
function mlist(){
	var url = "./list.jsp";
	url += "?col=<%=request.getParameter("col")%>"
	url += "&word=<%=request.getParameter("word")%>"
	location.href=url;
	
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="content">
	<% 
		if(flag){
			out.print("글을 삭제 했습니다.");
		}else{
			out.print("글 삭제를 실패 했습니다. 관리자에게 문의하세요.");
		}
	%> 

</DIV>
 
  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="mlist()" class="btn btn-danger">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 