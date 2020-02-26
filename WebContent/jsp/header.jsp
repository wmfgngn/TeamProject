<%@page import="project.vo.RegVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title></title>
<link rel="stylesheet" href="css/style.css" />
</head>
<body>
	<div id="menu" class="txt_r">
<%
  	Object obj = session.getAttribute("loVo");
	RegVO vo = null;
	
  	if(obj != null) {
  		vo = (RegVO)obj;  		
%>
		<a href="control?type=logout">로그아웃</a>
		<a href="control?type=mypage"><%=vo.getS_name()%></a>
<%
  	} else {
%>		<a href="control?type=login">로그인</a>
		<a href="control?type=regist">회원가입</a>
<%	}
%>
		<input type="text" /> <input type="button" value="검색" />
	</div>
	<hr noshade color="line">
</body>
</html>
