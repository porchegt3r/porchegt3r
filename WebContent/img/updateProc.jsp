<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/img/ssi.jsp" %>
<jsp:useBean id="dto" class="img.ImgDTO" />
<jsp:setProperty name="dto" property="*"/> 
 
 <%
 	Map map = new HashMap();
 	map.put("imgno", dto.getImgno());
 	map.put("passwd", dto.getPasswd());
 	
 	boolean pflag = dao.passwdCheck(map);
 	boolean flag = false;
 	if(pflag){
 		flag = dao.update(dto);
 	}
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
	var url = "list.jsp";
	url  += "?col=<%=request.getParameter("col")%>"
	url  += "&word=<%=request.getParameter("word")%>"
	location.href=url;
	
}
</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">결과</DIV>
 <div class="content">
 <%
 	if(!pflag){
 		out.print("비밀번호가 맞지 않습니다.");
 	}else if(flag){
 		out.print("수정 완료.");
 	}else{
 		out.print("수정 실패. 시스템 오류.");
 	}
 %>
 
 
 </div>
  
  <DIV class='bottom'>
    <%if(!pflag){ %>
    <input type='button' value='다시시도' onclick="history.back()" class="btn btn-danger">
    <% }else{ %>
    <input type='button' value='리스트' onclick="location.href='list.jsp'" class="btn btn-danger">
	<% } %>
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 