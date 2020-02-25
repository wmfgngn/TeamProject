<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css"/>
<script src="js/jquery-3.4.1.min.js"></script>
<style>
#main_img {
	margin: auto;
	width: 670px;
	text-align: center;
	display: block;
}
</style>
</head>
<body>

	<jsp:include page="header.jsp"/>
	<jsp:include page="menu.jsp"/>
	
	<div>
		<img src="images/main.jpg" id="main_img">
	</div>
	
	<%--
		<div class="main_news">
			<div class="news_type01 fl">
				<p class="title">기브유 후원참여</p>
				<a href="" class="news_src">
					<span class="thum_img">
						<img alt="기사사진"
						 src="../img/@img01.png"/>
					</span>
					<span class="ellip subject">
						난청이지만 피아니스트가 되고픈
						한별이의 이야기 입니다.
					</span>
					<span class="writer">by ttogether</span>
					<span class="more_view">자세히보기</span>
					<span class="fclear"></span>
				</a>
			</div>
			<div class="news_type01 cen">
				<p class="title">기브유 후원금 쓰임현황</p>
				<a href="" class="news_src">
					<span class="thum_img">
						<img alt="기사사진"
						 src="../img/@img02.png"/>
					</span>
					<span class="ellip subject">
						레티하씨 가정에 희망의 집 선물로
						화목의 웃음꽃이 피어나 건강한 가정으로 탄생!						</span>
					<span class="writer">by 한국해비타트</span>
					<span class="more_view">자세히보기</span>
					<span class="fclear"></span>
				</a>
			</div>
			<div class="news_type01 fr">
				<p class="title">기브유 나눔영상</p>
				<a href="" class="news_src">
					<span class="thum_img">
						<img alt="기사사진"
						 src="../img/@img03.png"/>
						 <span class="btn_play" 
						  title="동영상 재생">
						 	<a href=""></a> 
						 </span>
					</span>
					<span class="ellip subject">
						1리터의 생명을 선물해주세요.	
					</span>
					<span class="writer">by hungersaver</span>
					<span class="more_view">자세히보기</span>
					<span class="fclear"></span>
				</a>
			</div>
		</div>
		<div class="main_board">
			<!-- 공지사항 -->
			<div class="board_type01 fl">
				<p class="title">공지사항</p>
				<span class="more_view">
					<a href="">더보기</a>
				</span>
				<ul class="notice">
					<li>
						<a href="">
						T-together 리뉴얼 오픈되었습니다.
						</a>
						<span class="date">2016.04.05</span>
					</li>
					<li>
						<a href="">
						INCREPAS행상 당첨자 발표.
						</a>
						<span class="date">2016.03.30</span>
					</li>
					<li>
						<a href="">
						인크레파스 교육센터 시스템안내.
						</a>
						<span class="date">2016.03.29</span>
					</li>
				</ul>
			</div>
			<div class="board_type01 cen">
				<p class="title">공지사항</p>
				<span class="more_view">
					<a href="">더보기</a>
				</span>
				<a href="" class="article">
					<span class="thum_img">
						<img src="../img/@img04.png"/>
					</span>
					<span class="src">
						[캠페인] 햇살이 따스한 봄날이
						다가옵니다. 그리고 지나갑니다. 
						여름이 곧 올것 같아요!
					</span>
					<div class="fclear"></div>
				</a>
			</div>
			<div class="board_type01 fr">
				<span class="banner b01">
					<a href="">
						T-Together와 함께할 
						기관/단체를 모십니다.
					</a>
				</span>
				<span class="banner b02">
					<a href="">
						T-Together이젠 모바일로
						함께해요.
					</a>
				</span>
			</div>
		</div>
	</div>
	--%>
</body>
</html>