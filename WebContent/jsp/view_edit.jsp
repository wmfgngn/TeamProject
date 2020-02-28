<%@page import="project.vo.BbsVO"%>
<%@page import="project.vo.RegVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/summernote-lite.css"/>
<link rel="stylesheet" href="css/style.css"/>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/jquery-ui.min.css" rel="stylesheet">
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
	#bbs table {
	    width:780px;
	    margin:0 auto;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	#writer{
		background-color: #dedede;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	
	.odd {background:silver}
	
		
</style>

</head>
<body>
<jsp:include page="header.jsp"/>
<%
	String cPage = (String)request.getAttribute("cPage");
	String reqnum = (String)request.getAttribute("reqnum");
	String b_idx = (String)request.getAttribute("b_idx");
	Object obj = session.getAttribute("vo");
	RegVO vo = (RegVO)session.getAttribute("loVo");
	//System.out.println(reqnum+"하하");
	BbsVO bvo = null;
	if(obj != null){
		bvo = (BbsVO)obj;
	
%>
	<div id="bbs">
	<form action="control?type=view_edit" method="post" 
	encType="multipart/form-data">
		<table summary="게시판 수정하기">
			<caption>게시판 수정하기</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td><input type="text" name="subject" size="45" value="<%=bvo.getSubject() %>"/></td>
				</tr>
				<tr>
					<th>이름:</th>
					<td><input type="text" id="writer" name="writer" size="12" value="<%=vo.getS_name()%>" readonly/></td>
				</tr>				
				<tr>
					<th>첨부파일:</th>
					<td><input type="file" name="file"/><%=bvo.getOri_name() %></td>
				</tr>
			
			</tbody>
		</table>
		<input type="hidden" name="str" id="str"/>
		<input type="hidden" name="reqnum" value="<%= reqnum%>">
		<input type="hidden" name="pwd" value="<%=vo.getS_pw() %>">
		<input type="hidden" name="b_idx" value="<%=b_idx %>">
	</form>
	
		<table>
			<tbody>
				<tr>
					<th style="width:100px;">내용:</th>
					<td><textarea id="content" name="content" cols="50" 
							rows="8"><%=bvo.getContent() %></textarea></td>
				</tr>
			
				<tr>
					<td colspan="2">
						<input type="button" value="보내기"
						onclick="sendData()"/>
						<input type="button" value="다시"/>
						<input type="button" value="목록" onclick="javascript:location.href='control?type=list&reqnum=<%= reqnum%>'"/>
					</td>
				</tr>
			</tbody>		
		</table>
	</div>
<%
	}
%>	
	<script src="js/summernote-lite.js"></script>
	<script src="js/lang/summernote-ko-KR.min.js"></script>
	
	<script>
	$(function(){
		$("#content").summernote({
			height:300,
			width:580,
			lang: "ko-KR",
			callbacks:{ // 특정한 상황에 자동으로 호출하는
				onImageUpload: function(files, editor){
					for(var i=0; i<files.length; i++){
						sendFile(files[i], editor); 
					}
				},
			}
		});
		
		$("#content").summernote("lineHeight", 1.0);
		
	});
	
	function sendFile(file, editor){
		var frm = new FormData
		frm.append("upload", file);
				
		$.ajax({
			url: "control?type=saveImage",
			type: "post",
			dataType: "json",
			contentType: false, 
			processData: false,
			data: frm
		}).done(function(data){
			console.log(data.img_url);
			
			$("#content").summernote("editor.insertImage", data.img_url);
			
		}).fail(function(err){
			console.log(err);
		});
		
	}
	
	function sendData(){
		for(var i=0 ; i<document.forms[0].elements.length ; i++){
		// 만약 제목과 이름만 입력되었는지 유효성 검사를 한다면...
		if(i > 1)
			break;
		
			if(document.forms[0].elements[i].value == ""){
				alert(document.forms[0].elements[i].name+
						"를 입력하세요");
				document.forms[0].elements[i].focus();
				return;//수행 중단
			}
		}

		var str = $("#content").val();		
		//console.log(str);
		$("#str").val(str);
		
		document.forms[0].submit();
	}
	
	</script>
</body>
</html>












