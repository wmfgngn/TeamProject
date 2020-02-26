<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css"/>
<link rel="stylesheet" href="css/main.css"/>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="menu.jsp"/>
	<div>
		<img src="images/main.jpg" id="main_img">
	</div>
	<!-- ----------------------------------------------------------- -->
	<div class="main_bbs">
		<div class="bss_type01 fl">
			<p class="title">공지사항</p>
			<a href="" class="news_src">
				<span class="ellip subject">
					난청이지만 피아니스트가 되고픈
					한별이의 이야기 입니다.
				</span>
				<span class="writer">by ttogether</span>
				<span class="more_view">자세히보기</span>
				<span class="fclear"></span>
			</a>
		</div>
		<div class="bss_type01 cen">
			<p class="title">기브유 후원금 쓰임현황</p>
			<a href="" class="news_src">
				<span class="ellip subject">
					레티하씨 가정에 희망의 집 선물로
					화목의 웃음꽃이 피어나 건강한 가정으로 탄생!</span>
				<span class="writer">by 한국해비타트</span>
				<span class="more_view">자세히보기</span>
				<span class="fclear"></span>
			</a>
		</div>
		<div class="bss_type01 fr">
			<p class="title">기브유 나눔영상</p>
			<a href="" class="news_src">
				<span class="ellip subject">
					1리터의 생명을 선물해주세요.
				</span>
				<span class="writer">by hungersaver</span>
				<span class="more_view">자세히보기</span>
				<span class="fclear"></span>
			</a>
		</div>
	</div>
	<!-- ----------------------------------------------------------- -->
	<!-- ----------------------------------------------------------- -->
	<div>
		<div class="bss_type02 fl">
			<p class="title">공지사항</p>
			<table class="bbs_table">
				<thead>
					<tr>
						<td>제목</td>
						<td>작성자</td>
						<td>조회수</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
					<tr>
				</tbody>
			</table>
		</div>
		<div class="bss_type02 cen">
			<p class="title">자유게시판</p>
			<table class="bbs_table">
				<thead>
					<tr>
						<td>제목</td>
						<td>작성자</td>
						<td>조회수</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
					<tr>
				</tbody>
			</table>
		</div>
		<div class="bss_type02 fr">
			<p class="title">팁게시판</p>
			<table class="bbs_table">
				<thead>
					<tr>
						<td>제목</td>
						<td>작성자</td>
						<td>조회수</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
					<tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>