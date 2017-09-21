<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/memo/ssi.jsp" %>
 
 <%
 	String col = Utility.checkNull(request.getParameter("col"));
 	String word = Utility.checkNull(request.getParameter("word"));
 	
 	if(col.equals("total")){
 		word ="";
 	}
 	int nowPage = 1;
 	int recordPerPage = 5;
 	if(request.getParameter("nowPage")!=null){
 		nowPage = Integer.parseInt(request.getParameter("nowPage"));
 	}
 	int sno = ((nowPage-1)*recordPerPage)+1;
 	int eno = nowPage * recordPerPage;
 	
 	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	int total = dao.total(map); //total에서 필요한건 col, word
	List<MemoDTO> list = dao.list(map);
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
.search{
	width:80%;
	text-align:center;
	margin: 2px auto;
}
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<script type="text/javascript">
function read(memono){
	var url = "./read.jsp";
	url += "?memono="+memono;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<div class="search">
<form method="post" action="./list.jsp">
	<select name="col">
		<option value="title"
		<%if(col.equals("title")) out.print("selected='selected'"); %>
		>제목</option>
		<option value="content"
		<%if(col.equals("content")) out.print("selected='selected'"); %>
		>내용</option>
		<option value="total">전체</option>
	</select>
	<input type="text" name="word" value="<%=word %>">
	<button class="btn btn-warning">검색</button>
	<button type="button" onclick="location.href='./createForm.jsp'" class="btn btn-warning">등록</button>
</form>
</div>
 
 <div class="container">
 <h2>목록</h2>
 <h4 align="center"> 자유로운 글을 남기는 곳 입니다.^^ </h4>
<TABLE class="table table-hover">
 <tr>
	<th>번호</th>
	<th>제목</th>
	<th>날짜</th>
	<th>조회수</th>
	<th>grpno</th>
	<th>indent</th>
	<th>ansnum</th>
</tr>

<% if(list.size()==0){ %>
<tr>
<td colspan="7">등록된 메모가 없습니다.</td>
</tr>
<% }else{
	for(int i=0; i<list.size();i++){
		MemoDTO dto = list.get(i);
	
	%>
<tr>
<td><%=dto.getMemono() %></td>
<td>
<%
	for(int j=0;j<dto.getIndent();j++){
		out.print("&nbsp&nbsp&nbsp");
	}
	if(dto.getIndent()>0){
		out.print("<img src='../images/re.jpg'>");
	}
%>

<a href="javascript:read('<%=dto.getMemono() %>')"><%=dto.getTitle() %>
<% if(Utility.compareDay(dto.getWdate())){ %>
<img src="<%=root %>/images/new.gif	"></a>
<%} %>
</td>
<td><%=dto.getWdate() %></td>
<td><%=dto.getViewcnt() %></td>
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
  <%=Utility.paging3(total, nowPage, recordPerPage, col, word) %>
  </DIV>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html> 