<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/img/ssi.jsp"%>
<jsp:useBean id="dto" class="img.ImgDTO" />

<%
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(upload.getParameter("passwd"));

	FileItem fileItem = upload.getFileItem("fname");
	int size = (int)fileItem.getSize();

	if (size > 0) {
		dto.setFname(UploadSave.saveFile(fileItem, upDir));
	} else {
		dto.setFname("member.jsp");
	}

	boolean flag = dao.create(dto); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function blist() {

		var url = "./list.jsp";

		location.href = url;

	}
</script>

</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">등록 확인</DIV>

	<div class="content">

		<%
			if (flag) {
				out.print("등록 되었습니다.");

			} else {
				out.print("등록에 실패하였습니다.");
			}
		%>
	</div>

	<div class="bottom">


		<%
			if (flag) {
		%>

		<input type='button' value='계속등록' onclick="location.href='createForm.jsp'" class="btn btn-danger">
		<%
			} else {
		%>
		<input type='button' value='다시시도' onclick="history.back()" class="btn btn-danger">
		<%
			}
		%>
		<input type='button' value='목록' onclick="blist()" class="btn btn-danger">
	</div>





	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
