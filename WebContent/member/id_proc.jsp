<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp" %>
 <%
 	String id = request.getParameter("id");
 	boolean flag = dao.duplicateId(id);
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
<script type="text/javascript">
function use(){
	opener.frm.id.value='<%=id%>'
	window.close();
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">ID 중복확인</DIV>
 
 <div class="content">
입력된 ID: <%=id %><br><br>
<%		
	if(flag){
		out.print("중복 되어서 사용할 수 없습니다.<br><br>");
	}else{
		out.print("사용 가능 합니다.<br><br>");
		out.print("<button type='button' onclick='use()'>사용</button>");
	}
%>

 </div>
  
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="location.href='id_form.jsp'">
    <input type='button' value='닫기' onclick="window.close()">
  </DIV>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 