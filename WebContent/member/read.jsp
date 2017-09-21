<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp" %>
<%
	String id = request.getParameter("id");
	if(id==null)id=(String)session.getAttribute("id");
	MemberDTO dto = dao.read(id);
	
	String nowPage = request.getParameter("nowPage");
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	
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
function downM(){
	var url = "<%=root%>/download";
	url += "?dir=/member/storage";
	url += "&filename=<%=dto.getFname()%>";
	location.href=url;
}
function updateFile(){
	var url = "updateFileForm.jsp";
	url += "?id=<%=id%>";
	url += "&oldfile=<%=dto.getFname()%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	location.href=url;
}
function updatePw(){
	var url = "updatePwForm.jsp";
	url += "?id=<%=id%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	location.href=url;
}
function update(){
	var url = "./update.jsp";
	url += "?id=<%=id%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	location.href=url;
}
function del(){
	var url = "deleteForm.jsp";
	url += "?id=<%=id%>";
	url += "&oldfile=<%=dto.getFname()%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	location.href=url;
}
</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"><%=dto.getMname() %></DIV>
 
  <TABLE>
    <TR>
    <td colspan="2">
    <img src="./storage/<%=dto.getFname() %>">
    </td>
    </TR>
	<TR>
      <TH>아이디</TH>
      <TD><%=dto.getId() %></TD>
    </TR>
    <tr>
    	<th>성명</th>
    	<td><%=dto.getMname() %></td>
    </tr>
    <tr>
    	<th>전화번호</th>
    	<td><%=Utility.checkNull(dto.getTel()) %></td>
    </tr>
    <tr>
    	<th>이메일</th>
    	<td><%=dto.getEmail() %></td>
    </tr>
    <tr>
    	<th>우편번호</th>
    	<td><%=Utility.checkNull(dto.getZipcode()) %></td>
    </tr>
    <tr>
    	<th>주소</th>
    	<td>
    	<%=Utility.checkNull(dto.getAddress1()) %>
    	<%=Utility.checkNull(dto.getAddress2()) %>
    	</td>
    </tr>
    <TR> 
      <TH>직업</TH>
      <TD>
     	 직업코드:<%=dto.getJob() %>
		(<%=Utility.getCodeValue(dto.getJob()) %>)
	      </TD>
    </TR>
    <tr>
    	<th>등록날짜</th>
    	<td>
    	<%=dto.getMdate() %>
    	</td>
    </tr>


  </TABLE>

   
  <DIV class='bottom'>
   <input type='button' value='정보수정' onclick="update()">
    <input type='button' value='패스워드 변경' onclick="updatePw()">
    <input type='button' value='사진수정' onclick="updateFile()">
    <input type='button' value='회원탈퇴' onclick="del()">
    <input type='button' value='사진 다운로드' onclick="downM()">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 