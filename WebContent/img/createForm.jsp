<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/bbs/ssi.jsp" %>
 
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
function inCheck(f){
	if(f.wname.value==""){
		alert("이름을 입력하세요.");
		f.wname.focus();
		return false;
	}
	if (f.title.value == "") {
		alert("제목을 입력하세요");
		f.title.focus();
		return false;
	}
	if (f.content.value == "") {
		alert("내용을 입력하세요");
		f.content.focus();
		return false;
	}
	if (f.passwd.value == "") {
		alert("비밀번호를 입력하세요");
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
 
<DIV class="title">이미지 등록</DIV>
 
<FORM name='frm' 
method='POST' 
enctype="multipart/form-data"
action='./createProc.jsp'
onsubmit='return inCheck(this)'>
  <TABLE>
    <TR>
      <TH>파일</TH>
      <TD>
      <input type="file" name="fname" accept=".jpg,.png,.gif">
      </TD>
    </TR>
    
    <TR>
		<TH>이름</TH>
		<TD><input type="text" name="wname"></TD>
	</TR>
    
    <TR>
		<TH>제목</TH>
		<TD><input type="text" name="title"></TD>
	</TR>
	<TR>
		<TH>내용</TH>
		<td><textarea rows="10" cols="45" name="content">내용을 입력하세요.</textarea>
		</TD>
	</TR>
			
	<TR>
		<TH>비밀번호</TH>
		<TD><input type="password" name="passwd"></TD>
	</TR>
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록' class="btn btn-danger">
    <input type='reset' value='재입력' class="btn btn-danger">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 