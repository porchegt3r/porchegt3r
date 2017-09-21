<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp" %>
 <%
 	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
 	
 	String id = upload.getParameter("id");
 	String email = upload.getParameter("email");
 	
 	String str = ""; 
 	if(dao.duplicateId(id)){
 		str = "중복된 아이디 입니다.";
 	}else if(dao.duplicateEmail(email)){
 		str = "중복된 아이디 입니다.";
 	}else{
 		request.setAttribute("upload", upload);
 		
 %>
 <jsp:forward page="/member/createProc.jsp" /> <!-- 일반적으로 request하고 응답 받으면 사라짐, request했을 때 다른 개체에게서 응답받을 때까지 사라지지 않는다. -->
 <% return; } %> 
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
 
<DIV class="title">아이디 및 이메일 중복확인</DIV>
 
<div class="content">
<%= str %>
</div>
<div class="bottom">
 <button type="button" onclick="history.back()">다시시도</button>
 </div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 