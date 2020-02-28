<%@page import="project.vo.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css"/>
<link rel="stylesheet" href="css/main.css"/>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/jquery-ui.min.css" rel="stylesheet">
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style>
.ellip {
	display: inline-block;
	width: 97%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
h5, h6 {
	text-decoration: none;
	color: black;	
}
</style>
</head>
<body>
<%
BbsVO[] vo01 = null;
BbsVO[] vo02 = null;
BbsVO[] vo03 = null;

Object obj01 = request.getAttribute("ar01");
if(obj01 != null) {
	vo01 = (BbsVO[])obj01;
}
Object obj02 = request.getAttribute("ar02");
if(obj02 != null) {
	vo02 = (BbsVO[])obj02;
}
Object obj03 = request.getAttribute("ar03");
if(obj03 != null) {
	vo03 = (BbsVO[])obj03;
}
%>
	<jsp:include page="header.jsp"/>
	<div>
    	<br/><br/><br/>
		<img src="images/main.jpg" style="width: 1000px; margin: auto; text-align: center;
		display: block;">
		<br/>
	</div>
	<!-- ----------------------------------------------------------- -->
	<div class="container">
    <!-- Example row of columns -->
    <div class="row">
    	<div class="col-md-4" style="height: 50px; boreder: 3px solid red;">
    	<%if(vo01 !=null && vo01.length > 0){ %>
    	<a href="javascript:view('1', '<%=vo01[0].getB_idx()%>')">
    		<h5><%=vo01[0].getSubject() %></h5>
    		<h6 class="ellip" style="height: 50px;"><%
    			String cont = vo01[0].getContent();
    			while(true) {
	    			int f_idx = cont.indexOf("<img");
	    			if(f_idx >= 0){
		    			int e_idx = cont.indexOf(">", f_idx);
		    			StringBuffer sb = new StringBuffer();
		    			sb.append(cont.substring(0, f_idx));
		    			sb.append(cont.substring(e_idx+1));
		    			
		    			//out.println(sb.toString());
		    			cont = sb.toString();
	    			}else{
	    				out.println(cont);
	    				break;
	    			}
    			}
    		%></h6>
    		</a>
    	<%}else{ %>
    		<h5>글이 없습니다.</h5>
    	<%} %>
    		<br/>
    	
    	</div>
    	<div class="col-md-4" style="height: 100px;">
    	<%if(vo02 !=null && vo02.length > 0){ %>
    	<a href="javascript:view('1', '<%=vo01[0].getB_idx()%>')">
    		<h5><%=vo02[0].getSubject() %></h5>
    		<h6 class="ellip" style="height: 50px;">
    		<%
    			String cont = vo02[0].getContent();
    			while(true) {
	    			int f_idx = cont.indexOf("<img");
	    			if(f_idx >= 0){
		    			int e_idx = cont.indexOf(">", f_idx);
		    			StringBuffer sb = new StringBuffer();
		    			sb.append(cont.substring(0, f_idx));
		    			sb.append(cont.substring(e_idx+1));
		    			
		    			//out.println(sb.toString());
		    			cont = sb.toString();
	    			}else{
	    				out.println(cont);
	    				break;
	    			}
    			}
    		%>
    		</h6>
    		</a>
    	<%}else{ %>
    		<h5>글이 없습니다.</h5>
    	<%} %>
    		<br/>
    	</div>
    	<div class="col-md-4" style="height: 100px;">
    	<%if(vo03 !=null && vo03.length > 0){ %>
    	<a href="javascript:view('1', '<%=vo01[0].getB_idx()%>')">
    		<h5><%=vo03[0].getSubject() %></h5>
    		<h6 class="ellip" style="height: 50px;"><%
    			String cont = vo03[0].getContent();
    			while(true) {
	    			int f_idx = cont.indexOf("<img");
	    			if(f_idx >= 0){
		    			int e_idx = cont.indexOf(">", f_idx);
		    			StringBuffer sb = new StringBuffer();
		    			sb.append(cont.substring(0, f_idx));
		    			sb.append(cont.substring(e_idx+1));
		    			
		    			//out.println(sb.toString());
		    			cont = sb.toString();
	    			}else{
	    				out.println(cont);
	    				break;
	    			}
    			}
    		%></h6>
    		</a>
    	<%}else{ %>
    		<h5>글이 없습니다.</h5>
    	<%} %>
    		<br/>
    	</div>
      <div class="col-md-4">
        <h4 style="display: inline ;">공지사항</h4>
        <a class="btn btn-secondary" href="control?type=list&reqnum=1" role="button" style="display: inline;">View details &raquo;</a>
        <p><table class="bbs_table" style="width: 300px;">
				<thead>
					<tr>
						<td>제목</td>
						<td>작성자</td>
					</tr>
				</thead>
				<tbody>
				<%
				if(obj01 != null) {
					vo01 = (BbsVO[])obj01;
					for(int i = 0 ; i < vo01.length ; i++) {
				%>
					<tr>
						<td><a href="javascript:view('1', '<%=vo01[i].getB_idx()%>')">
								<%=vo01[i].getSubject()%>
							<%	if(vo01[i].getC_list().size() > 0) { %>
									(<%=vo01[i].getC_list().size() %>)
							<%	} %>
							</a></td>
						<td><%=vo01[i].getWriter() %></td>
					</tr>
				<%
					}
				} else { %>
					<tr><td colspan="2">게시글이 없습니다</td></tr>
			<%	}%>
				</tbody>
			</table></p>
      </div>
      <div class="col-md-4">
        <h4 style="display: inline ;">자유게시판</h4>
        <a class="btn btn-secondary" href="control?type=list&reqnum=2" role="button" style="display: inline;">View details &raquo;</a>
        <p><table class="bbs_table" style="width: 300px;">
				<thead>
					<tr>
						<td>제목</td>
						<td>작성자</td>
					</tr>
				</thead>
				<%
				if(obj02 != null) {
					vo02 = (BbsVO[])obj02;
					for(int i = 0 ; i < vo02.length ; i++) {
				%>
					<tr>
						<td><a href="javascript:view('1', '<%=vo02[i].getB_idx()%>')">
								<%=vo02[i].getSubject()%>
							<%	if(vo02[i].getC_list().size() > 0) { %>
									(<%=vo02[i].getC_list().size() %>)
							<%	} %>
							</a></td>
						<td><%=vo02[i].getWriter() %></td>
					</tr>
				<%
					}
				} else { %>
					<tr><td colspan="2">게시글이 없습니다</td></tr>
			<%	}%>
			</table></p>
      </div>
      <div class="col-md-4">
        <h4 style="display: inline ;">팁게시판</h4>
        <a class="btn btn-secondary" href="control?type=list&reqnum=3" role="button" style="display: inline;">View details &raquo;</a>
        <p><table class="bbs_table" style="width: 300px;">
				<thead>
					<tr>
						<td>제목</td>
						<td>작성자</td>
					</tr>
				</thead>
				<%
				obj03 = request.getAttribute("ar03");
				if(obj03 != null) {
					vo03 = (BbsVO[])obj03;
					for(int i = 0 ; i < vo03.length ; i++) {
				%>
					<tr>
						<td><a href="javascript:view('1', '<%=vo03[i].getB_idx()%>')">
								<%=vo03[i].getSubject()%>
							<%	if(vo03[i].getC_list().size() > 0) { %>
									(<%=vo03[i].getC_list().size() %>)
							<%	} %>
							</a></td>
						<td><%=vo03[i].getWriter() %></td>
					</tr>
				<%
					}
				} else { %>
					<tr><td colspan="2">게시글이 없습니다</td></tr>
			<%	}%>
			</table></p>
      </div>
    </div>

    <hr>

  </div>
	
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
		
		function aaa(){
			alert("로그인 후 이용하세요!");
		}
	</script>
</body>
</html>