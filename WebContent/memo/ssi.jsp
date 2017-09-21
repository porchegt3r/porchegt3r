<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="memo.MemoDTO" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<jsp:useBean id="dao" class="memo.MemoDAO" />
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
%>