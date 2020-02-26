<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	td {font-weight: bold;
		color: #0B3B24;}
	label {
		text-align: center;
	}	
</style>
<link rel="stylesheet" href="css/style.css"/>
<link rel="stylesheet" href="css/main.css"/>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>

	<jsp:include page="header.jsp"/>
	<jsp:include page="menu.jsp"/>
	
	<div id="warp">
	<form action="control?type=regist" name="frm" method="post">
		<table summary="회원정보를 모두 입력하세요">
		
			<caption>
				회원정보 입력 부분
			</caption>
			
			<colgroup>
				<col width="58px"/>
				<col width="142px">
			</colgroup>
			<!-- ID -->
			<tr>
				<td>ID:</td>
				
			</tr>
			<tr>
				<td>
					<input type="text" id="s_id" name="s_id" placeholder="영문숫자로 입력하세요" style="width:450px;height:50px;font-size:30px;"/>
				</td>
			</tr>
			<!-- PW -->
			<tr>
				<td>비밀번호:</td>
				
			</tr>
			<tr>
				<td>
					<input type="password" id="s_pw" name="s_pw" placeholder="영문숫자로 4글자 이상 10글자 이하 입력해주세요" style="width:450px;height:50px;font-size:30px;"/>
				</td>
			</tr>
			<tr>
				<td>비밀번호 재확인:</td>
				
			</tr>
			<tr>
				<td>
					<input type="password" id="s_pw_ok" name="s_pw_ok" placeholder="동일한 비밀번호를 입력해주세요" style="width:450px;height:50px;font-size:30px;"/>
				</td>
			</tr>
			<!-- 이름 -->
			<tr>
				<td>이름:</td>
				
			</tr>
			<tr>
				<td><input type="text" id="s_name" name="s_name" placeholder="이름을 입력해주세요!" style="width:450px;height:50px;font-size:30px;"></td>
			</tr>
			<tr><td>핸드폰 번호:</td></tr>
			<tr>
				
				<td>
					<select id="s_phone" name="s_phone" style="width:450px;height:50px;font-size:30px;">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="017">017</option>
					</select>
		<label for="s_phone2">↓</label>
		<input type="text" id="s_phone2" name="s_phone" placeholder="☎☎☎☎" style="width:450px;height:50px;font-size:30px;"/>
		<label for="s_phone3">↓</label>
		<input type="text" id="s_phone3" name="s_phone" placeholder="☎☎☎☎" style="width:450px;height:50px;font-size:30px;"/>
			
				</td>
			</tr>
			<tr>
			<td>
				<input type="radio" name="s_gender" value="M" checked="checked"/>남자 
				<input type="radio" name="s_gender" value="W"/>여자 
			</td>
			</tr>
			
			<tr>
				<td>
					<input type="button" value="가입" id="regist_btn"/>
				</td>
			</tr>
		</table>
			
		</form>
	</div>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script>
		
	$(function(){
		$("#regist_btn").bind("click",function(){
			var id = $("#s_id").val().trim();
			var pw = $("#s_pw").val().trim();
			var pw_ok = $("#s_pw_ok").val().trim();
			var name = $("#s_name").val().trim();
			
			//유효성 검사 
			
			if(id.length <1){
				alert("아이디 입력하세요 ^^");
				$("#s_id").focus();
				return;
			}
			if(pw.length != pw_ok.length){
				alert("비밀번호를 확인하세요^^");
				$("#s_pw").focus();
				return;
			}
			if(name.length <1){
				alert("이름을 입력하세요!");
				$("#s_name").focus();
				return;
			}
			if($("#s_phone2").val().trim().length < 3) {
				alert("전화번호를 확인하세요!");
				$("#s_phone2").focus();
				return;
			}
			if($("#s_phone3").val().trim().length < 4) {
				alert("전화번호를 확인하세요!");
				$("#s_phone3").focus();
				return;
			}
			
			alert("가입완료");
			frm.submit();
		});
		
		$("#s_id").on("keyup",function(){
			
			var str = $(this).val();
			
			if(str.trim().length > 3){
				$.ajax({
					url:"idok.jsp",
					type:"post",
					data:"id="+encodeuRIComponent(str)
				}).done(function(data){
					$("#box").html("사용가능합니다.");
				}).fail(function(err){
					consol.log(err);
				});
			}else{
				$("#box").html("ID중복");
			}
			
		});
		
	});
		
	</script>
</body>
</html>
