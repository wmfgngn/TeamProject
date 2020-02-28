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
	
		<input type="text" id="searchValue" name="searchValue"/> <input type="button" id="search_btn" value="검색" />
		<input type="hidden" id="type" name="type" value="searchBbs"/>
	</div>

	<hr noshade color="line">
	<script src="js/jquery-3.4.1.min.js"></script>
	<script>
		$(function(){
			$("#search_btn").bind("click", function(){
				var searchValue = $("#searchValue").val();
				
				location.href="control?type=searchBbs&searchValue="+searchValue;
				
			});
			
		});
	</script>
</body>
</html>
