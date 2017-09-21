<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/img/ssi.jsp" %>
<jsp:useBean id="dto" class="img.ImgDTO" />
<jsp:setProperty name="dto" property="*" />

<%
	int imgno = Integer.parseInt(request.getParameter("imgno"));
	String passwd = request.getParameter("passwd");
	Map map = new HashMap();
	map.put("imgno", imgno);
	map.put("passwd", passwd);
	
	boolean pflag = dao.passwdCheck(map);
	boolean flag = false;
	if(pflag){
		flag = dao.delete(imgno);
	}
	String oldfile = request.getParameter("oldfile");
	if(flag && oldfile!=null && !oldfile.equals("member.jpg"));
	UploadSave.deleteFile(upDir, oldfile);
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
 
<DIV class="title">결과</DIV>
 
<div class="content">
<%
	if(!pflag){
		out.print("비밀번호가 일치하지 않습니다.");
	}else if(flag){
		out.print("정보가 정상적으로 삭제 되었습니다.");
	}else{
		out.print("정보삭제 실패. 시스템 오류.");
	}
%>

</div>

  
  <DIV class='bottom'>
  <% if(!pflag){ %>
    <input type='button' value='다시 시도' onclick="history.back()" class="btn btn-danger">
   <%}else{ %> 
    <input type='button' value='리스트' onclick="location.href='list.jsp'" class="btn btn-danger">
  <% } %>
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 