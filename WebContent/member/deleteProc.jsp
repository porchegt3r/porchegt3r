<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp" %>
<%
	String id = request.getParameter("id");
	String oldfile = request.getParameter("oldfile");
	boolean flag = dao.delete(id);
	if(flag && oldfile!=null && !oldfile.equals("memeber.jpg")){
		UploadSave.deleteFile(upDir, oldfile);
		session.invalidate();
		//안될경우 if(flag){
		//if(oldfile!=null && !oldfile.equals("member.jpg")){
		//UploadSave.deleteFile(upDir, oldfile);
		//}
		//session.invalidate();
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
<link href="<%=root %>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원 탈퇴</DIV>
 
<div class="content">

<%
	if(flag){
		out.print("삭제 성공~ 자동 로그아웃됩니다.");
	}else{
		out.print("삭제 실패~ 오류를 잘 찾아보세요.");
	}
%>  
  
</div> 
  <DIV class='bottom'>
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 