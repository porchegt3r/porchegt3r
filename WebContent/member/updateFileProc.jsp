<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp" %>
<%
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	String id = upload.getParameter("id");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int)fileItem.getSize();
	String filename = null;
	if(size>0){
		if(oldfile!=null && !oldfile.equals("member.jpg"))
		UploadSave.deleteFile(upDir, oldfile);
		filename= UploadSave.saveFile(fileItem, upDir);
	}

		Map map = new HashMap();
		map.put("id", id);
		map.put("fname", filename);
		boolean flag = dao.updateFile(map);
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
function read(){
	var url="read.jsp?id=<%=id%>";
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">사진 변경</DIV>
 
 <div class="content">
 <%
 	if(flag){
 		out.print("사진을 변경 했습니다.");
 	}else{
 		out.print("사진 변경을 실패 했습니다.");
 	}
 %>
 
 </div>
  
  <DIV class='bottom'>
  <%if(flag){ %>
    <input type='button' value='나의 정보' onclick="read()">
  <%}else{ %>
    <input type='button' value='다시 시도' onclick="history.back()">
  <%} %>
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 