<%@page import="project.vo.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="header.jsp"/>
<link rel="stylesheet" href="css/style.css"/>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/jquery-ui.min.css" rel="stylesheet">
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
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
	.ellip {
	display: inline-block;
	width: 97%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	}
	a {
		text-decoration: none;
		color: black;	
	}
</style>	
	
</head>
<body>
<br/><br/><br/>
	<h1>검색결과</h1>
<%
		BbsVO[] ar = null;
		Object obj = request.getAttribute("searchAr");
		
		if(obj != null){
			ar = (BbsVO[])obj;
				
			for(BbsVO vo : ar){
%>
			<a href="javascript:view('1', '<%=vo.getB_idx()%>')">
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
		} else {
%>
			<h3>검색결과가 없습니다.</h3>
<%
		}
%>

	<form action="control" method="post" name="frm">
		<input type="hidden" name="type" value="view"/>
		<input type="hidden" name="cPage" />
		<input type="hidden" name="b_idx" />
	</form>
	<%-- Script *******************************************************************--%>
	<script>
		function view(cPage, b_idx) {
			document.frm.b_idx.value = b_idx;
			document.frm.cPage.value = cPage;
			document.frm.submit();
		}
	</script>
</body>
</html>