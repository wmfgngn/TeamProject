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
   <!-- /container -->

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
