<%@page import="project.vo.RegVO"%>
<%@page import="project.vo.CommVO"%>
<%@page import="java.util.List"%>
<%@page import="project.vo.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	#view{
		width: 970px;
		margin: auto;
	}
	
	#adr a{
		color : gray;
		text-decoration : none;
		background-position: 0 -150px;
		float: right;
	}
	
	#ct{
		width: 970px;
		margin: auto;
	}
	
	#thd{
		margin-top: 5px;
		height: 40px;
		border-top: 2px solid #BDBDBD;
		border-bottom: 1px solid #BDBDBD;
		border-collapse: 0;
		line-height: 40px;
		background-color: #EAEAEA;
	}
	
	#tbd{
		width: 970px;
		margin: auto;
	}
	
	.sp{
		font-weight: normal;
	}
	
	.mv{
		text-align: right;
	}
	
	#title{
		height: 100px;
		margin: 100px;
		padding: 10px;
		color: #980000;
		font-size: 1.5em;
	}
	
</style>
</head>
<%
	Object obj = request.getAttribute("vo");
	Object obj2 = session.getAttribute("loVo");
	Object reqnum = session.getAttribute("reqnum");
	RegVO rvo = null;
	
	if(obj2 != null) {
		rvo = (RegVO)session.getAttribute("loVo");
	}
	if(obj != null) {
		BbsVO vo = (BbsVO)obj;
%>

<body>
	<div id="view">
		<div id="adr">
			<!-- 해당 게시글의 주소를 보여주는 버튼 -->
			<button type=button id="adr_bt" name="adr">주소보기</button>
			<!-- 해당 게시글의 주소를 복사할 수 있는 버튼 -->
			<button type=button id="copy_bt" name="copy">복사</button>
			<!-- 해당 게시글이 속해있는 게시판 목록으로 갈 수 있는 링크 -->
			<lable id="lb"></lable>
			<a href="control?type=list&reqnum=<%=reqnum%>">해당 게시판 목록</a>
		</div>
		<div id="content">
			<table id="ct">
				<thead id="thd">
					<tr>
						<th><span class="sp"><%=vo.getWriter() %></span></th>
						<th><%=vo.getWrite_date() %></th>
						<th>조회: <span class="sp"><%=vo.getHit() %></span></th>
						<th>추천: <span class="sp"><%=vo.getRecommend() %></span></th>
					</tr>
				</thead>
				<tbody id="tbd">
					<tr>
						<td class="mv" colspan="4"><a href="control?type=list&reqnum=<%=reqnum%>">목록</a>｜<a href="#ans">댓글</a></td>
					</tr>
					<tr>
						<td id="title" colspan="4"><%=vo.getSubject() %></td>
					</tr>
					<tr>
						<td colspan="4"><%=vo.getContent() %></td>
					</tr>
					<tr>
						<td colspan="4"><button type="button" id="best" onclick="best()">추천</button></td>
					</tr>
					<%
					if(rvo != null) {
					if(vo.getRvo().getR_idx().equals(rvo.getR_idx())){
					%>
					<tr><td colspan="4"><button type=button id="view_del" onclick="view_del('<%=reqnum%>')">삭제</button></td>
						<td colspan="4"><button type=button id="view_edit" onclick="view_edit('<%=vo.getB_idx()%>')">수정</button></td>
					</tr>
					<% }
					}%>
				</tbody>
			</table>
			<hr/>
			
<%
	Object c_obj = vo.getC_list();
	List<CommVO> c_list = null;
	if(c_obj != null){
		c_list = vo.getC_list();
		for(CommVO cvo : c_list) {
%>
			<div id="ans">
					<%=cvo.getWriter() %>(<%=cvo.getWrite_date() %>)
					<p><%=cvo.getContent() %></p>
					<button type=button id="ans_del" onclick="ans_del('<%=vo.getB_idx()%>')">삭제</button>
			</div>
			<hr>
<%
			
		}//for의 끝
	}
%>
	
<%
	if(rvo != null) {
%>
<form action="control?type=com" method="post" name="c_frm">
	<input type="text" id="ans_tt" name="ans_tt">
	<input type="hidden" name="b_idx" value='<%=vo.getB_idx()%>'>
	<input type="button" id="ans_add" value="등록"/>
</form>
	<hr/>
	</div>
	</div>
<%
	}
}else{
		response.sendRedirect("control");
	}
%>
	<script src="js/jquery-3.4.1.min.js"></script>
	<script>
	$(function(){
		var url = $(location).attr('href');
		var ad = (url);
		
		$("#ans_add").bind("click", function(){
			c_frm.submit();
		});

		$("#adr_bt").bind("click",function(){
		
			$("#lb").text(ad);
		
		});

		$("#copy_bt").bind("click",function(){

			$("#lb").select();
			var sc = document.execCommand('copy'); 
			console.log(sc);
	        
			alert('복사되었습니다.'); 
		});
		
	});
	
	function view_del(reqnum){
		$.ajax({
			url:"control",
			type:"post",
			data:"type=view_del",
			dataType:"json"
		}).done(function(data){
			location.href="control?type=list&reqnum="+reqnum;
		}).fail(function(err){
			console.log(err);
		});
		
	}
	
	function ans_del(b_idx){
		$.ajax({
			url:"control",
			type:"post",
			data:"type=ans_del",
			dataType:"json"
		}).done(function(data){
			location.href="control?type=view&b_idx="+b_idx;
		}).fail(function(err){
			
		});
	}
	
	function view_edit(b_idx){
		$.ajax({
			url:"control",
			type:"post",
			data:"type=view_edit",
			dataType:"json"
		}).done(function(data){
			location.href="control?type=view&b_idx="+b_idx;
		}).fail(function(err){
			
		});
	}
	
	</script>
</body>
</html>
