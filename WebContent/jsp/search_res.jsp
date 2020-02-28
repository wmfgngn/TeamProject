<%@page import="project.vo.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="header.jsp"/>
	<jsp:include page="menu.jsp"/>

<style>
	table{
		border-collapse: collapse;
		
	}
	tr, td{
		border: 1px solid black;
	}
	#wrap{
		margin: 0 auto;
	}
</style>	
	
</head>
<body>
	<h1>검색결과</h1>
<%
		BbsVO[] ar = null;
		Object obj = request.getAttribute("searchAr");
		
		if(obj != null){
			ar = (BbsVO[])obj;
				
			for(BbsVO vo : ar){
%>
			<a href="#">
				<div id="wrap">
					<table id="searchTable">
						<colgroup>
							<col width="50px"/>
							<col width="300px"/>
						</colgroup>
						<tr>
							<td>제목 : </td>
							<td><%=vo.getSubject() %> </td>
						</tr>
						<tr>
							<td>내용 : </td>
							<td><%=vo.getContent() %> </td>
						</tr>
					</table>
				</div>
			</a>
				<hr/>
				
<% 	
			}
		}
%>
</body>
</html>