<<<<<<< HEAD
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
</head>
<body>
	
	<div>
	<form>
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
				<select id="s_phone" name="s_phone" style="width:450px;height:50px;font-size:30px;">
			<option value="gender">성별</option>
			<option value="M">남자</option>
			<option value="W">여자</option>
					</select>
					</td>
			</tr>
		</table>
			
			
		</form>
		<a href="javascripot:registry_ok(this.form)">
			<img src ="imges/registry_yet.png" onmouseover="this.src='imges/registy_ok.png'" onmouseout="this.src='imges/registry_yet.png'" alt="회원가입 마우스 올릴떄 변경"/>
		</a>
			
	</div>
	<script>
		
		
		function registry_ok(){
		}
	</script>
</body>

</html>