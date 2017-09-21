<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/img/ssi.jsp" %>

<% 
	int imgno = Integer.parseInt(request.getParameter("imgno"));
	ImgDTO dto = dao.replyRead(imgno);
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
function inputCheck(f){
	if(f.wname.value==""){
		alert("이름을 입력하세요.");
		f.wname.focus();
		return false;
	}
	if(f.title.value == "") {
		alert("제목을 입력해주세요.");
		f.title.focus();
		
		return false;
	}
	if(f.content.value == "") {
		alert("내용을 입력해주세요.");
		f.content.focus();
		
		return false;
	}
	if(f.passwd.value == "") {
		alert("패스워드를 입력해주세요.");
		f.passwd.focus();
		
		return false;
	}
}

</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">답변</DIV>
 
<FORM name='frm' 
method='POST' 
action='./replyProc.jsp'
enctype='multipart/form-data'
onsubmit = 'return inputCheck(this)'>
<input type="hidden" name="imgno" value="<%=dto.getImgno() %>">
<input type="hidden" name="grpno" value="<%=dto.getGrpno() %>">
<input type="hidden" name="indent" value="<%=dto.getIndent() %>">
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum() %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
  
  
  <TABLE>
    <TR>
      <TH>사진</TH>
      <TD>
      <input type="file" name="fname" accept=".jpg,.png,.gif">
      </TD>
    </TR>
    <TR>
      <TH>이름</TH>
      <TD>
      <input type="text" name="wname" >
      </TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD>
      <input type="text" name="title">
      </TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD>
      <textarea rows="10" cols="30" name="content"></textarea>
      </TD>
    </TR>
    <TR>
      <TH>패스워드</TH>
      <TD>
      <input type="password" name="passwd">
     </TD>
    </TR>
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='답변등록' class="btn btn-danger">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 