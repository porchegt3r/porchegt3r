<%@ page contentType="text/html; charset=UTF-8" %> 
 
<% String root = request.getContextPath();
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
%>
 
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
<style type="text/css">

.table{
width: 100%;
} 
.table,.td{
border-style: none;
}

</style>
</head>
<body>
<!-- 상단 메뉴 -->
<div style="background-color: #EEEEEE;">
<table class="table">
  <tr>
    <td class="td">
        <div align="center"><img src="<%=root %>/images/main.JPG" width="90%">
    </td>
  </tr>
  
  <tr>
    <td class="td">
    
  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=root%>/index.jsp">어뮤즈 월드</a>
    </div>
    <ul class="nav navbar-nav">
      
      <li><a href="<%=root %>/bbs/list.jsp">동영상</a></li>
      <li><a href="<%=root%>/img/list.jsp">회원 사진들</a></li>
      <li><a href="<%=root %>/memo/list.jsp">방명록</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
<%if(id!=null){ %>
    <li><a href="<%=root %>/member/deleteForm.jsp">회원탈퇴</a></li>  
    <li><a href="<%=root %>/member/logout.jsp">로그아웃</a></li>  
   <%}%>
      
      
     <%if(id==null) {%>
      <li><a href="<%=root %>/member/agreement.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="<%=root %>/member/loginForm.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
     <%}else{ %>
      <li><a href="<%=root %>/member/read.jsp"><span class="glyphicon glyphicon-user"></span> My Info</a></li>
      <li><a href="<%=root %>/member/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
     <%}%>
	<% if(id!=null && grade.equals("A")) {%>
      <li><a href="<%=root %>/admin/list.jsp"><span class="glyphicon glyphicon-ok"></span> 회원목록</a></li>
	<%} %>      
    </ul>
    
   
  </div>
</nav>
  </td> 
 </tr>
 
</table>
</div>
<!-- 상단 메뉴 끝 -->

<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 10px;">