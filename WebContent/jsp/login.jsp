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
    <link rel="stylesheet" href="css/sb-admin-2.min.css"/>
    <link rel="stylesheet" href="css/fontawesome/all.min.css"/>
    <link rel="stylesheet" href="css/loginStyle.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/jquery-ui.min.css"/>
<title>Login</title>
	<jsp:include page="header.jsp"/>
	<jsp:include page="menu.jsp"/>
</head>
	

<body>

	<div id="contentwrap">
	<div id="leftPart">
		
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
						<a href="https://accounts.google.com/ServiceLogin/signinchooser?hl=ko&passive=true&continue=https%3A%2F%2Fwww.google.com%2F&flowName=GlifWebSignIn&flowEntry=ServiceLogin" class="btn btn-danger gftbtn"><i class="fab fa-google"></i>&nbsp;Google 로그인</a><br/>
						<a href="https://twitter.com/login/error?redirect_after_login=%2F" class="btn btn-success gftbtn"><i class="fab fa-twitter"></i>&nbsp;Twitter 로그인</a><br/>
						<a href="https://www.facebook.com/" class="btn btn-primary gftbtn"><i class="fab fa-facebook"></i>&nbsp;Facbook 로그인</a>
					</div>
				</div>

				<div class="userMenu">
					<a href="javascript:exe()" class="findpw ">아이디/비밀번호 찾기</a>
				</div>
			</div>

		</div>
	</div>
	</div>
	<div id="invenFoot" class="footline" >
				<address>Copyright ⓒ Inven. All rights reserved.</address>
	</div>
	</div>
	<div id="find_win">
		<div id="div_findID">
			<table id="findId">
			<tbody>
				<tr>
					<th>이름:</th>
					<td><input type="text" name="idName" id="idName" size="20"/>
					</td>
				</tr>
				<tr>
					<th>전화번호:</th>
					<td><input type="text" name="idPhone" id="idPhone" size="20" placeholder=" - 를 제외하고 입력하세요 "/>
					</td>
				</tr>
				<tr>
					<td id="idtd" colspan="2"><input type="button" name="id_btn" id="id_btn" value="아이디 찾기"/></td>
				</tr>
			</tbody>
		</table>
		</div>
		<hr/>
		<div id="div_findPW">
		<table id="findPw">
			<tbody>
				<tr>
					<th>아이디:</th>
					<td><input type="text" name="pwId" id="pwId" size="20"/>
					</td>
				</tr>
				<tr>
					<th>전화번호:</th>
					<td><input type="text" name="pwPhone" id="pwPhone" size="20" placeholder=" - 를 제외하고 입력하세요 "/>
					</td>
				</tr>
				<tr>
					<td id="pwtd" colspan="2"><input type="button" name="pw_btn" id="pw_btn" value="비밀번호 찾기"/></td>
				</tr>
			</tbody>
		</table>
		</div>
	</div>	
	
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script>
		function exe(){
			$("#find_win").dialog({title: "아이디/비밀번호 찾기"});
			$("#find_win").dialog({"width": 350, 
									"height": 450});
			
		}
	
		
		$(function(){
			var st = getStorage();
			
			
			if(st != null)
				$("#save_id").prop("checked", true);
			else if(st == null)
				$("#save_id").prop("checked", false);
			
			if($("#save_id").is(":checked") == false){
				st.clear();
				$("#save_id").prop("checked", false);
			}
			init(st);
			
			$("#loginBtn").bind("click", function(){
				var s_id = $("#s_id").val();
				var s_pw = $("#s_pw").val();
				//console.log(s_id);
				var param = "s_id="+encodeURIComponent(s_id)+
					"&s_pw="+encodeURIComponent(s_pw);
				
				if($("#save_id").is(":checked") == true){
					saveId(s_id, st);
				}else{ 
					st.clear();	
				
				}
					
				$.ajax({
					url: "control?type=login",
					type: "post",
					data: param,
					dataType: "json"
				}).done(function(data){
					if(data.res == "true")
						location.href = "control?type=main";
					else{
						alert("아이디 및 비밀번호를 확인하세요!");
					}
				}).fail(function(err){
					
				});
				
			});
			
			if($("#save_id").is(":checked") == true){
				
			}
			
			<%-- x버튼 누를때 이벤트 --%>
			$("#find_win").on("dialogclose", function(event, ui){ 
				clear();
			});
			
			<%-- 아이디 찾기 --%>
			$("#id_btn").bind("click", function(){
				var idPhone = $("#idPhone").val();
				var idName = $("#idName").val();
				//console.log(idPhone)
				
				var param = "idPhone="+encodeURIComponent(idPhone)+"&nono=0"+"&idName="+encodeURIComponent(idName)
				
				console.log(param)
				
				$.ajax({
					url: "control?type=find",
					type: "post",
					data: param,
					dataType: "json"
				}).done(function(data){
						alert("아이디는 "+data.res+" 입니다.");
				}).fail(function(err){
					
				});
			});
			
			<%-- 비밀번호 찾기 --%>
			$("#pw_btn").bind("click", function(){
				var pwPhone = $("#pwPhone").val();
				var pwId = $("#pwId").val();
				//console.log(idPhone)
				
				var param = "pwPhone="+encodeURIComponent(pwPhone)+"&nono=1"+"&pwId="+encodeURIComponent(pwId)
				
				//console.log(param)
				
				$.ajax({
					url: "control?type=find",
					type: "post",
					data: param,
					dataType: "json"
				}).done(function(data){
						alert("비밀번호는 "+data.res+" 입니다.");
				}).fail(function(err){
					
				});
			});
			
			
			
		});	
		
		function saveId(s_id, st){
			st.setItem("s_id", s_id)
			
			
		}
		
		function init(st) {
			
			for(var i = 0; i<st.length; i++){
				var key = st.key(i);
				var value = st.getItem(key);

				$("#s_id").val(value);
			}
		}
		
		function getStorage() {
			try {
				if(window.sessionStorage){ //접속되는 브라우저마다 별개로 저장한다.
					//윈도우는 전체창 // 다큐먼트는 표현되는 창만
					return window.sessionStorage; // 저장된게있다면 저장된걸반환해라
				}
			} catch (e) { // 예외처리..
				//예외가 발생하면 이곳을 수행한다.
				return undefined;
			}
		}
		
		function clear(){
			$("#idName").val("");
			$("#idPhone").val("");
			$("#pwId").val("");
			$("#pwPhone").val("");
			
		}
	</script>
</body>

</html>










