<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String f_name = (String)request.getAttribute("f_name");
%>


{
	"img_url" : "<%=request.getContextPath()%>/editor_img/<%=f_name%>"
}
