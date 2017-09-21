<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp" %>
<jsp:useBean id="dto" class="member.MemberDTO"></jsp:useBean> 
 <%
 UploadSave upload = (UploadSave)request.getAttribute("upload");
 dto.setId(upload.getParameter("id"));
 dto.setMname(UploadSave.encode(upload.getParameter("mname")));
 dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
 dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
 dto.setPasswd(upload.getParameter("passwd"));
 dto.setTel(upload.getParameter("tel"));
 dto.setZipcode(upload.getParameter("zipcode"));
 dto.setEmail(upload.getParameter("email"));
 dto.setJob(upload.getParameter("job"));
 
 FileItem fileItem = upload.getFileItem("fname");
	int size = (int)fileItem.getSize();
	String filename = "member.jpg";
	if(size>0){
		filename = UploadSave.saveFile(fileItem, upDir);
	}
	dto.setFname(filename);
	boolean flag = dao.create(dto);

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
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원가입</DIV>
 
<div class="content">
<%
	if(flag){
		out.print("회원가입을 했습니다.");
	}else{
		out.print("회원가입을 실패 했습니다.");
	}
%>

</div>
  
  <DIV class='bottom'>
  <%if(flag){ %>
    <input type='button' value='로그인' onclick="location.href='./loginForm.jsp'">
  <%}else{ %>  
    <input type='button' value='다시시도' onclick="history.back()">
  <% } %>  
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 