<%@page import="project.vo.RegVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Object obj =request.getAttribute("loVo");
		System.out.print(obj);//로그인 판단
		if(obj != null){
			RegVO rvo =(RegVO)obj;
		
	%>
	<h1>회원 정보</h1>
	<hr />
	<hr />
	<div>
		<form action="" name="frm">
			<table summary="마이페이지">
			<tbody>
				<tr>
					<td>ID:</td>
					<td><%=rvo.getS_id() %></td>
				</tr>
				<tr>
					<td>이름:</td>
					<td><%=rvo.getS_name() %></td>
				</tr>

				<tr>
					<td>비밀번호:</td>
				</tr>
				<tr>
					<td><input type="password" id="s_pw" name="s_pw" value="<%=rvo.getS_pw() %>"
						placeholder="영문숫자로 4글자 이상 10글자 이하 입력해주세요"
						style="width: 450px; height: 50px; font-size: 30px;" /></td>
				</tr>
				<tr>
					<td>핸드폰 번호:</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="s_phone" name="s_phone" value="<%=rvo.getS_phone()%>"
						style="width: 450px; height: 50px; font-size: 30px;"/>
					</td>
				</tr>
				<tr>
				
				<tr>
					<td colspan="4">
						<input type="button" value="회원정보변경"
							onclick="edit()"/>
						<input type="button" value="회원탈퇴" 
							onclick="del_btn"/>
						<input type="button" value="목록"
							onclick="goList('${loVo}')"/>
					</td>
				</tr>
				</tbody>
			</table>
		</form>
	</div>
	<%
		}
	%>
	<script src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		
	
	
	
	function goList(loVo){
		location.href="control?type=list&loVo="+loVo;
	}
	
	function edit(){
		document.frm.type.value = "crystal";
		document.frm.submit();
	}
	function del_btn(){
		document.frm.type.value = "taltoe";
		document.frm.submit();
	}
	
	
	</script> 
</body>
</html>