<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="img.*" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<jsp:useBean id="dao" class="img.ImgDAO" />
<%    request.setCharacterEncoding("utf-8");
      String root = request.getContextPath();
        
      String upDir = application.getRealPath("/img/storage");
      String tempDir = application.getRealPath("/img/temp");
%> 
 
