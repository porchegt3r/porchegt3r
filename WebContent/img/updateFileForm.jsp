<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/img/ssi.jsp" %>
 
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
	if(f.fname.value==""){
		alert("사진을 선택해주세요.");
		f.fname.focus();
		return false;
	}
}

</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">사진 파일 변경</DIV>
 
<FORM name='frm' 
method='POST' 
action='./updateFileProc.jsp'
enctype="multipart/form-data"
onsubmit="return inCheck(this)">
  <TABLE>
    <TR>
      <TH>원본파일</TH>
      <TD>
      <img src="./storage/<%=request.getParameter("oldfile") %>">
      	원본파일명: <%=request.getParameter("oldfile") %>
      </TD>
    </TR>
    <tr>
    	<th>변경파일</th>
    	<td>
    		<input type="file" name="fname" accept=".png, .jpg, .gif">
    	</td>
    </tr>
    
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경' class="btn btn-danger">
    <input type='button' value='취소' onclick="history.back()" class="btn btn-danger">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 