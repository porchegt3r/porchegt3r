<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/img/ssi.jsp" %>
<%
	UploadSave upload = new UploadSave(request, -1, -1, tempDir );
	int imgno = Integer.parseInt(upload.getParameter("imgno"));
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int) fileItem.getSize();
	String filename = null;
	if(size<0){
		if(oldfile !=null && !oldfile.equals("member.jpg")){
			UploadSave.deleteFile(upDir, oldfile);
		}
		filename = UploadSave.saveFile(fileItem, oldfile);
	}
	Map map = new HashMap();
	
	map.put("imgno", imgno);
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
function tread(imgno){
	var url = "./read.jsp";
	url += "?imgno="+imgno;
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
 		out.print("사진 변경 성공");
 	}else{
 		out.print("사진 변경 실패");
 	}
 %>
 
 </div>
 
  
  <DIV class='bottom'>
    <input type='button' value='나의 정보' onclick="tread.jsp" class="btn btn-danger">
    <input type='button' value='다시 시도' onclick="history.back()" class="btn btn-danger">
    <input type='button' value='목록' onclick="location.href='list.jsp'" class="btn btn-danger">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 