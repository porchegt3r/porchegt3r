<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/img/ssi.jsp" %>
<jsp:useBean id="dto" class="img.ImgDTO" />
<jsp:setProperty property="*" name="dto" />
<%
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	
	dto.setImgno(Integer.parseInt(upload.getParameter("imgno"))); 		// int
	dto.setWname(UploadSave.encode(upload.getParameter("wname"))); 		// 한글
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));	 	// 한글
	dto.setGrpno(Integer.parseInt(upload.getParameter("grpno")));		// int
	dto.setIndent(Integer.parseInt(upload.getParameter("indent")));		// int
	dto.setAnsnum(Integer.parseInt(upload.getParameter("ansnum")));		// int
	dto.setContent(UploadSave.encode(upload.getParameter("content")));	// 한글
	dto.setPasswd(upload.getParameter("passwd"));

	FileItem fileItem = upload.getFileItem("fname");
	int size = (int)fileItem.getSize();
	
	if(size>0){
		dto.setFname(UploadSave.saveFile(fileItem,upDir));
	}else {
		dto.setFname("member.jpg");
	}
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
<script type="text/javascript">
function ilist(){
	var url = "./list.jsp";
	location.href=url;
}

</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV align="center">처리</DIV>
 
<div class="content">
	<%
		if(flag){
			out.print("답변등록 성공");
		}else{
			out.print("답변등록 실패");
		}
	%>


</div>
  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="ilist()" class="btn btn-danger">
    <input type='button' value='계속등록' onclick="location.href='./createForm.jsp'" class="btn btn-danger">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 