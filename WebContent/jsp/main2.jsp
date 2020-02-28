<%@page import="project.vo.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <!-- Bootstrap core CSS -->
    <title></title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap-theme.min.css" rel="stylesheet">
<link href="../css/jquery-ui.min.css" rel="stylesheet">
  </head>
  <body>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
  <a class="navbar-brand" href="#">HOME</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExampleDefault">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">공지게시판 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">자유게시판 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">팁 게시판 <span class="sr-only">(current)</span></a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<main role="main">

  <!-- Main jumbotron for a primary marketing message or call to action -->
  <div class="jumbotron">
    <div class="container">
      <h1 class="display-3">Hello, world!</h1>
      <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
      <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p>
    </div>
  </div>

  <div class="container">
    <!-- Example row of columns -->
    <div class="row">
      <div class="col-md-4">
        <h2>공지사항</h2>
        <p><table class="bbs_table">
				<thead>
					<tr>
						<td>제목</td>
						<td>작성자</td>
						<td>조회수</td>
					</tr>
				</thead>
				<tbody>
				<%
				Object obj01 = request.getAttribute("ar01");
				if(obj01 != null) {
					BbsVO[] vo = (BbsVO[])obj01;
					for(int i = 0 ; i < vo.length ; i++) {
				%>
					<tr>
						<td><a href="javascript:view('1', '<%=vo[i].getB_idx()%>')">
								<%=vo[i].getSubject()%>
							<%	if(vo[i].getC_list().size() > 0) { %>
									(<%=vo[i].getC_list().size() %>)
							<%	} %>
							</a></td>
						<td><%=vo[i].getWriter() %></td>
						<td><%=vo[i].getHit() %></td>
					</tr>
				<%
					}
				} else { %>
					<tr><td>게시글이 없습니다</td></tr>
			<%	}%>
				</tbody>
			</table></p>
			<p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
      </div>
      <div class="col-md-4">
        <h2>자유게시판</h2>
        <p><table class="bbs_table">
				<thead>
					<tr>
						<td>제목</td>
						<td>작성자</td>
						<td>조회수</td>
					</tr>
				</thead>
				<%
				Object obj02 = request.getAttribute("ar02");
				if(obj02 != null) {
					BbsVO[] vo = (BbsVO[])obj02;
					for(int i = 0 ; i < vo.length ; i++) {
				%>
					<tr>
						<td><a href="javascript:view('1', '<%=vo[i].getB_idx()%>')">
								<%=vo[i].getSubject()%>
							<%	if(vo[i].getC_list().size() > 0) { %>
									(<%=vo[i].getC_list().size() %>)
							<%	} %>
							</a></td>
						<td><%=vo[i].getWriter() %></td>
						<td><%=vo[i].getHit() %></td>
					</tr>
				<%
					}
				} else { %>
					<tr><td>게시글이 없습니다</td></tr>
			<%	}%>
			</table></p>
        <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
      </div>
      <div class="col-md-4">
        <h2>팁게시판</h2>
        <p><table class="bbs_table">
				<thead>
					<tr>
						<td>제목</td>
						<td>작성자</td>
						<td>조회수</td>
					</tr>
				</thead>
				<%
				Object obj03 = request.getAttribute("ar03");
				if(obj03 != null) {
					BbsVO[] vo = (BbsVO[])obj03;
					for(int i = 0 ; i < vo.length ; i++) {
				%>
					<tr>
						<td><a href="javascript:view('1', '<%=vo[i].getB_idx()%>')">
								<%=vo[i].getSubject()%>
							<%	if(vo[i].getC_list().size() > 0) { %>
									(<%=vo[i].getC_list().size() %>)
							<%	} %>
							</a></td>
						<td><%=vo[i].getWriter() %></td>
						<td><%=vo[i].getHit() %></td>
					</tr>
				<%
					}
				} else { %>
					<tr><td colspan="3">게시글이 없습니다</td></tr>
			<%	}%>
			</table></p>
        <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
      </div>
    </div>

    <hr>

  </div> <!-- /container -->

</main>

	
	<form action="control" method="post" name="frm">
		<input type="hidden" name="type" value="view"/>
		<input type="hidden" name="cPage" />
		<input type="hidden" name="b_idx" />
	</form>

<footer class="container">
  <p>&copy; Company 2019-2020</p>
</footer>

<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script>
		function view(cPage, b_idx) {
			document.frm.b_idx.value = b_idx;
			document.frm.cPage.value = cPage;
			document.frm.submit();
		}
		
		function aaa(){
			alert("로그인 후 이용하세요!");
		}
	</script>
</body>
</html>
