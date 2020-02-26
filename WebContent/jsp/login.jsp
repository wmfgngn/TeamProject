<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
    <link rel="stylesheet" href="../css/sb-admin-2.min.css"/>
    <link rel="stylesheet" href="../css/fontawesome/all.min.css"/>
    <link rel="stylesheet" href="css/loginStyle.css"/>
<title>Login</title>

</head>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>
<body id="bodyMain" class="" style="">
	<div id="leftPart">
		<p>여기 그냥 간지용 이미지</p>
	</div>
	<div id="rightPart"> 
	<div id="toMain">
		<a href="#"><span id="airbnb" class="fab fa-airbnb fa-8x"><h1>으아아아아아</h1></span></a>
		<!-- push 변경 실험실험실험실험실험실험실험실험실험싫머
		
				하하하하ㅏ하하하ㅏ하하하하ㅏ하하하하 -->
	</div>
	<div id="mobileWrap" class="mobileWrap">
		<div class="" id="page">
			<div id="mobileLogin">
				<form id="loginForm" action="control?type=login_ok" method="post">
					<fieldset>
						<div id="loginWrap" class="loginWrap">
							<div class="loginUserInfo">
								<p class="idWrap">
									<input type="text" maxlength="50" id="s_id" name="s_id"placeholder="아이디">
								</p>
								<p class="pwWrap">
									<input type="password" id="s_pw" name="s_pw" placeholder="비밀번호">
								</p>
								<p id="content">
									<intput id="loginBtn" class="btn btn-warning btn-large " type="button">
										<span><i class="fa fa-sign-in"></i> 로그인</span>
									</intput>
								</p>
							</div>
							<div class="saveid">
								<div class="btn-group">
									<label class="txt btn btn-info">
										<input id="save_login" class="saveLogin" name="save_login" type="checkbox"> 
										<i class="icon-user icon-white"></i> 로그인 상태 유지</label>
									<label class="txt btn btn-info">
										<input id="save_id" class="saveId" name="save_id" type="checkbox"> 
										<i class="icon-user icon-white"></i> 아이디 저장</label>
								</div>
							</div>

						</div>
					</fieldset>
				</form>

				<div id="sns-provider">
					<div class="sns-login half">
						<a href="" class="btn btn-danger gftbtn"><i class="fab fa-google"></i>&nbsp;Google 로그인</a><br/>
						<a href="" class="btn btn-success gftbtn"><i class="fab fa-twitter"></i>&nbsp;Twitter 로그인</a><br/>
						<a href="" class="btn btn-primary gftbtn"><i class="fab fa-facebook"></i>&nbsp;Facbook 로그인</a>
					</div>
				</div>

				<div class="userMenu">
					<a href="#" class="findpw ">아이디/비밀번호 찾기</a>
				</div>
			</div>

		</div>
	</div>
	</div>
	
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="js/jquery-3.4.1.min.js"></script>
	<script>
		$(function(){
			
			$("#loginBtn").bind("click", function(){
				var s_id = $("#s_id").val();
				var s_pw = $("#s_pw").val();
				console.log(s_id);
				var param = "s_id="+encodeURIComponent(s_id)+
					"&s_pw="+encodeURIComponent(s_pw);
				
				$.ajax({
					url: "control?type=login_ok",
					type: "post",
					data: param,
					dataType: "json"
				}).done(function(data){
					if(data.res == "true")
						location.href = "control?type=main";
					else{
						alert("!");
					}
				}).fail(function(err){
					
				});
				
			});
			
		});	
	</script>
</body>
<footer>
	<div id="invenFoot" class="footline" >
				<address>Copyright ⓒ Inven. All rights reserved.</address>
	</div>
</footer>
</html>










