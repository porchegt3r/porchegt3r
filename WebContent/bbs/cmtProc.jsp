<%@page import="org.json.simple.JSONObject"%>
<%@ page import="bbscmt.*" %>
<%@ page import="bbs.*" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<%@ include file="/bbs/ssi.jsp"%>

<jsp:useBean id="cmtdto" class="bbscmt.CmtDTO" /> 
<jsp:setProperty property="*" name="cmtdto"/>

<%
	int cbbsno = Integer.parseInt(request.getParameter("cbbsNo"));
	String cmtId = request.getParameter("cmtId");
	String cmtContent = request.getParameter("cmtContent");
	String cmtPasswd = request.getParameter("cmtPasswd");

	cmtdto.setCbbsno(cbbsno);
	cmtdto.setId(cmtId);
	cmtdto.setContent(cmtContent);
	cmtdto.setPasswd(cmtPasswd);

	boolean flag = dao.cmtCreate(cmtdto);
	JSONObject obj = new JSONObject();
	obj.put("result", flag);
	out.print(obj);
%>



