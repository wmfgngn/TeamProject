<%@page import="project.vo.RegVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title></title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/jquery-ui.min.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="control?type=main">HOME</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExampleDefault"
			aria-controls="navbarsExampleDefault" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsExampleDefault">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="control?type=list&reqnum=1">공지게시판
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="control?type=list&reqnum=2">자유게시판
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="control?type=list&reqnum=3">팁
						게시판 <span class="sr-only">(current)</span>
				</a></li>
			</ul>
			
			<%
			  	Object obj = session.getAttribute("loVo");
				RegVO vo = null;
			
			  	if(obj != null) {
			  		vo = (RegVO)obj;  		
			%>
			<form class="form-inline my-2 my-lg-0">
				<button class="btn btn-outline-success my-2 my-sm-0" type="button"
					onclick="javascript:location.href='control?type=logout'" style="margin-right : 5px;">로그아웃</button>
				<a href="control?type=mypage" style="margin-right : 5px;"><%=vo.getS_name()%></a>
			</form>
			<%
			  	} else {
			%>
			<form class="form-inline my-2 my-lg-0">
				<button class="btn btn-outline-success my-2 my-sm-0" type="button"
					onclick="javascript:location.href='control?type=login'" style="margin-right : 5px;">로그인</button>
				<button class="btn btn-outline-success my-2 my-sm-0" type="button" 
					onclick="javascript:location.href='control?type=regist'" style="margin-right : 5px;">회원가입</button>
			</form>
			<%	}
			  	
			%>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Search" id="searchValue" name="searchValue"
					aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="button" id="search_btn">Search</button>
			</form>
		</div>
	</nav>
	
<%-------------------------------------------------------- --%>

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
