<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/bbs/ssi.jsp" %>
<jsp:useBean id="dto" class="bbs.BbsDTO" />
<jsp:setProperty name="dto" property="*" />

<%
	Map map = new HashMap();
	map.put("bbsno", dto.getBbsno());
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
function blist(){
	var url = "list.jsp";
	url = url + "?col=<%=request.getParameter("col")%>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
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
 		out.print("비밀번호가 일치하지 않습니다.");
 	}else if(flag){
 		out.print("정상적으로 수정 되었습니다.");
 	}else{
 		out.print("수정을 실패 했습니다.");
 	}
 %>
 
 </div>
  <DIV class='bottom'>
    <input type='button' value='다시 시도' onclick="history.back()" class="btn btn-danger">
    <input type='button' value='계속 등록' onclick="location.href='createForm.jsp'" class="btn btn-danger">
    <input type='button' value='목록' onclick="blist()" class="btn btn-danger">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 