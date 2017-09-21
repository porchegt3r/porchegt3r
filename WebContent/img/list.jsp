<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/img/ssi.jsp" %>
 <%
 	String col = Utility.checkNull(request.getParameter("col"));
 	String word = Utility.checkNull(request.getParameter("word"));
 	if(col.equals("total"))
 	word="";
 	
 	int nowPage = 1;
 	if(request.getParameter("nowPage")!=null){
 		nowPage = Integer.parseInt(request.getParameter("nowPage"));
 	}
 	int recordPerPage = 3;
 	int sno = ((nowPage-1)*recordPerPage)+1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	List<ImgDTO> list = dao.list(map);
	int totalRecord = dao.total(map);
 	
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
.search{
	width:80%;
	margin:2px auto;
	text-align:center;
}

</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<script type="text/javascript">
function aread (imgno){
	var url = "./read.jsp";
	url += "?imgno="+imgno;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	location.href=url;
}

function aupdate (imgno){
	var url="./updateForm.jsp";
	url +="?imgno="+imgno;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	location.href=url;
}
function adelete (imgno, fname){
	var url="./deleteForm.jsp";
	url += "?imgno="+imgno;
	url += "&oldfile="+fname;
	location.href=url;
	
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
 

<DIV class="search">
<FORM name='frm'
 method='POST' 
 action='./list.jsp'>
 
 <select name="col">
				<option value="wname"
				<%if(col.equals("wname")) out.print("selected='selected'"); %>
				>성명</option>
				<option value="title"
				<%if(col.equals("title")) out.print("selected='selected'"); %>
				>타이틀</option>
				
				<option value="total">전체출력</option>
	</select>
	<input type="text" name="word" value="<%=word %>" >
			<button class="btn btn-warning">검색</button>
			<button type="button" onclick="location.href='./createForm.jsp'" class="btn btn-warning">등록</button>
	</form>
	</div>
	
	
	<div class="container">
<h2>목록</h2>
<h4 align="center">회원 여러분의 사진을 자랑해 주세요. ^^ </h4>
	
  <TABLE class="table table-hover">
    <TR>
      <TH>번호</TH>
      <TH>사진</TH>
      <TH>이름</TH>
      <TH>제목</TH>
      <TH>수정</TH>
      <TH>삭제</TH>
      <TH>grpno</TH>
      <TH>indent</TH>
      <TH>ansnum</TH>
    </TR>
    
    <%
	if (list.size() == 0) {
%>
	<tr>
		<td colspan=9> 등록된 글이 없습니다.	
<%
	}else {
	for(int i=0;i<list.size();i++){
		ImgDTO dto = list.get(i);
%>


	<tr>
	<td><%=dto.getImgno() %></td>
	<td><img src="./storage/<%=dto.getFname()%>" width="300" height="190"  class="img-circle"></td>
		<td><a href="javascript:aread('<%=dto.getImgno() %>')">
		
		<%
		for(int j = 0;j<dto.getIndent();j++){
			out.print("&nbsp&nbsp&nbsp");
		}
		if(dto.getIndent()>0){
			out.print("<img src='../images/re.jpg'>");
		}
		%>
	
		 <%= dto.getWname() %></a></td>
		 
		<td><a href="javascript:aread('<%=dto.getImgno() %>')"><%=dto.getTitle() %></a></td>
		<td><a href="javascript:aupdate('<%=dto.getImgno() %>')">수정</a></td> 
		<td><a href="javascript:adelete('<%=dto.getImgno() %>', '<%=dto.getFname()%>')">삭제</a></td> 
		<td><%=dto.getGrpno() %></td>
		<td><%=dto.getIndent() %></td>
		<td><%=dto.getAnsnum() %></td>
    </tr>
	<%
	}
	}
%>
    
  </TABLE>
  </div>
  
  <DIV class='bottom'>
 	<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
  </DIV>
 
  
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 