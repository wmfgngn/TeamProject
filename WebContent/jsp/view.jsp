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
<link rel="stylesheet" href="css/view.css"/>
</head>
<%
	String cPage = (String)request.getAttribute("cPage");
	Object obj = session.getAttribute("vo");
	Object obj2 = session.getAttribute("loVo");
	Object reqnum = session.getAttribute("reqnum");
	RegVO rvo = null;
	BbsVO vo = null;
	
	if(obj2 != null) {
		rvo = (RegVO)session.getAttribute("loVo");
	}
	if(obj != null) {
		vo = (BbsVO)session.getAttribute("vo");
		System.out.println("글번호:" + vo.getB_idx());
%>

<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="menu.jsp"/>
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
			<%
				if(rvo != null) {
			%>					
					<tr>
						<td colspan="4"><button type="button" id="best" onclick="best('<%=rvo.getR_idx()%>', '<%=cPage%>', '<%=vo.getB_idx()%>')">추천</button></td>
					</tr>
			<%
				} else {
			%>
					<tr>
						<td colspan="4"><button type="button" id="best" onclick="alert('로그인 후 이용하세요!');">추천</button></td>
					</tr>
			<%
				}
			%>
					<%
					if(rvo != null) {
					if(vo.getRvo().getR_idx().equals(rvo.getR_idx())){
					%>
					<tr><td colspan="4"><button type=button id="view_del" onclick="view_del('<%=reqnum%>',<%=vo.getB_idx()%>)">삭제</button></td>
						<td colspan="4"><button type=button id="view_edit" onclick="javascript:location.href='control?type=view_edit&cPage=<%=cPage%>&reqnum=<%=reqnum%>&b_idx=<%=vo.getB_idx()%>'">수정</button></td>
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
			<div>
					<%=cvo.getWriter() %>(<%=cvo.getWrite_date() %>)
					<p><%=cvo.getContent() %></p>
					<%
			if(rvo != null) {
				if(cvo.getRvo().getR_idx().equals(rvo.getR_idx())) {
					%>								
					<button type=button id="ans_edit" onclick="ans_edit('<%=vo.getB_idx()%>')">수정</button>
					<button type=button id="ans_del" onclick="ans_del('<%=vo.getB_idx()%>')">삭제</button>
			<%	} 
			}%>
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
	<input type="hidden" name="b_idx" >
	<input type="button" id="ans_add" value="등록"/>
</form>

<form action="control?type=rec" method="post" name="r_frm">
	<input type="hidden" name="b_idx" >
	<input type="hidden" name="r_idx" >
	<input type="hidden" name="cPage" >
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
			c_frm.b_idx.value = '<%=vo.getB_idx()%>'; 
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
	
	function view_del(reqnum, b_idx){
	      var param = "type=view_del&b_idx="+encodeURIComponent(b_idx);
	      
	      $.ajax({
	         url:"control",
	         type:"post",
	         data: param,
	         dataType: "json"
	      }).done(function(data){
	    	 if(data.value == "true") {
	        	 location.href="control?type=list&reqnum="+reqnum;
	      	 }
	      }).fail(function(err){
	         console.log(err);
	      });
	      
	}
	
	function ans_del(b_idx){
		
		var inputString = prompt("비밀번호 작성","");
		var Param ="type=ans_del&b_idx="+encodeURIComponent(b_idx)+
		"&pwd="+encodeURIComponent(inputString);
		$.ajax({
			url:"control",
			type:"post",
			data:Param,
			dataType:"json"
		}).done(function(data){
			//console.log(data.value)
			if(data.value == "true")
				alert("댓글삭제 완료");
			location.href="control?type=view&b_idx="+b_idx;
		}).fail(function(err){
			console.log(err)
		});
	}
	
	function ans_edit(b_idx){
		
	}
	
	
	function best(r_idx, cPage, b_idx) {
		r_frm.r_idx.value = r_idx; 
		r_frm.b_idx.value = b_idx; 
		r_frm.cPage.value = cPage; 
		r_frm.submit();
	}
	
	</script>
</body>
</html>
