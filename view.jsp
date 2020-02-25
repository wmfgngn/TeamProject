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
	
	#tbd .ans{
		border-top: 1px solid gray;
		border-bottom: 1px solid gray;
		
	}
	
</style>
</head>
<body>
	<div id="view">
		<div id="adr">
			<!-- 해당 게시글의 주소를 보여주는 버튼 -->
			<button type=button id="add" onclick="add()">주소보기</button>
			<!-- 해당 게시글의 주소를 복사할 수 있는 버튼 -->
			<button type=button id="copy" onclick="copy()">복사</button>
			<!-- 해당 게시글이 속해있는 게시판 목록으로 갈 수 있는 링크 -->
			<a href="">해당 게시판 목록</a>
		</div>
		<div id="content">
			<table id="ct">
				<thead id="thd">
					<tr>
						<th><span class="sp">닉네임</span></th>
						<th>작성일</th>
						<th>조회: <span class="sp">조회수</span></th>
						<th>추천: <span class="sp">추천수</span></th>
					</tr>
				</thead>
				<tbody id="tbd">
					<tr>
						<td>[카테고리]</td>
						<td class="mv" colspan="3"><a href="">목록</a>｜<a href="">댓글</a></td>
					</tr>
					<tr>
						<td id="title" colspan="4">제목</td>
					</tr>
					<tr>
						<td colspan="4">내용</td>
					</tr>
					<tr>
						<td colspan="4"><button type="button" id="best" onclick="best()">추천</button></td>
					</tr>
				</tbody>
			</table>
			<table id="ans">
				<hr/>
				<tr>
					<td colspan="4">댓글닉네임(댓글작성일)</td>
				</tr>
				<tr>
					<td colspan="4">댓글내용</td>
				</tr>
			</table>
				<hr/>
	</div>
	</div>
</body>
</html>