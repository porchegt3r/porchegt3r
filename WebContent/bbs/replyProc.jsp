<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/bbs/ssi.jsp" %>
<jsp:useBean id="dto" class="bbs.BbsDTO" />
<jsp:setProperty property="*" name="dto"/>
<%
	Map map = new HashMap();
	map.put("grpno", dto.getGrpno());
	map.put("ansnum", dto.getAnsnum());
	
	dao.upAnsnum(map);
	boolean flag = dao.replyCreate(dto);
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
  	if(flag){
  		out.print("글이 등록 되었습니다.");
  	}else{
  		out.print("글 등록이 실패 했습니다.");
  	}
  %>
  
  </div>
  
  <DIV class='bottom'>
    <input type='button' value='계속등록' onclick="location.href='createForm.jsp'" class="btn btn-danger">
    <input type='button' value='목록' onclick="blist()" class="btn btn-danger">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 