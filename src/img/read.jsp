<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/img/ssi.jsp" %>
<%
	int imgno = Integer.parseInt(request.getParameter("imgno"));
	ImgDTO dto = dao.read(imgno);
	
	String content = dto.getContent();
	content = content.replaceAll("\r\n" , "<br>");
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

.curImg{
	margin-right:0;
	border-style:solid;
	border-width: 3px;
	border-color: red;
}
.td_padding{
	padding:5px 5px;
}
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function ilist(){
	var url = "./list.jsp";
	location.href=url;
}

function iupdate(){
	var url = "./updateForm.jsp";
	url += "?imgno=<%=imgno%>";
	
	location.href=url;
}

function ifileupdate(){
	var url = "./updateFileForm.jsp";
	url += "?imgno=<%=dto.getImgno()%>";
	url += "&oldfile=<%=dto.getFname()%>";
	location.href=url;
}

function ireply(){
	var url = "./replyForm.jsp";
	url += "?imgno=<%=imgno%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	 
	location.href = url;
}

function idelete(){
	var url = "./deleteForm.jsp";
	url += "?imgno=<%=imgno%>";
	url += "&oldfile=<%=dto.getFname()%>";
	
	location.href=url;
}

function readGo(imgno){
	var url ="./read.jsp";
	url = url + "?imgno="+imgno;
	
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">상세정보보기</DIV>
  <TABLE style="width: 50%">
  	<tr>
  		<td colspan="2" align="center">
  			<img src="./storage/<%=dto.getFname()%>" width="80%">
  		</td>
  	</tr>
  	
    <TR>
      <TH>이름</TH>
      <TD><%=dto.getWname() %></TD>
    </TR>
    
     <TR>
      <TH>제목</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
    
     <TR>
      <TH>내용</TH>
      <TD><%=dto.getContent() %></TD>
    </TR>
    
     <TR>
      <TH>등록날짜</TH>
      <TD><%=dto.getWdate() %></TD>
    </TR>
    
     <TR>
      <TH>파일이름</TH>
      <TD><%=dto.getFname() %></TD>
    </TR>
  </TABLE>
  
  <table style="width: 50%">
	  <%
	  	List list = dao.imgRead(imgno);
	  	String[] files = (String[])list.get(0);
	  	int[] noArr = (int[])list.get(1);
	  	
	  	for(int i = 0; i < 5; i++){
	  		if(files[i]==null){
	  %>
	  <td>
	  	<img src="../images/default.jpg" width="100%">
	  </td>
	  <%
	  		} else {
	  			if(noArr[i]==imgno){
	  %>
	  <td class="td_padding">
	  	<a href="javascript:readGo('<%=noArr[i] %>')">
	  	<img class="curImg" src="./storage/<%=files[i] %>" width="100%" border="0">
	  	</a>
	  </td>
	  <%
	  			}else{
	  %>
	  <td class="td_padding">
	  	<a href="javascript:readGo('<%=noArr[i] %>')">
	  		<img src="./storage/<%=files[i] %>" width="100%" border="0">
	  	</a>
	  </td>
	  <%
	  			}
	  		 }
	  	  }
	  %>
  </table>
  
  <DIV class='bottom'>
    <button type='button' onclick="ilist()">목록</button>
    <button type='button' onclick="iupdate()">수정</button>
    <button type='button' onclick="ifileupdate()">사진수정</button>
    <button type='button' onclick="ireply()">답변</button>
    <button type='button' onclick="idelete()">삭제</button>
    
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 