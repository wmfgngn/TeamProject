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
		<jsp:include page="header.jsp"/>
		<jsp:include page="menu.jsp"/>
	
	
		
		
	<%	
		
		Object obj =session.getAttribute("loVo");
		System.out.print(obj);//로그인 판단
		if(obj != null){
			RegVO rvo =(RegVO)obj;
		
	%>
	<h1>회원 정보</h1>
	<hr />
	<hr />
	
	<div>
		<form action="" name="frm" method="post">
			<table summary="마이페이지">
			<tbody>
				<tr>
					<td>ID:</td>
					<td><input type="text" id="s_id" name="s_id" value="<%=rvo.getS_id()%>" readonly="readonly"
					></td>
				</tr>
				<tr>
					<td>이름:</td>
					<td><%=rvo.getS_name() %></td>
				</tr>

				<tr>
					<td>비밀번호:</td>
					<td><input type="hidden" id="s_pw" name="s_pw" value="<%=rvo.getS_pw() %>"
						placeholder="영문숫자로 4글자 이상 10글자 이하 입력해주세요"
						 /></td>
				</tr>
					
				<tr>
					<td>핸드폰 번호:</td>
					<td>
						<input type="text" id="s_phone" name="s_phone" value="<%=rvo.getS_phone()%>"
						/>
					</td>
				</tr>
					
				<tr>
				
				<tr>
					<td colspan="4">
						<input type="button" value="회원정보변경"
							onclick="edit()"/>
						<input type="button" value="회원탈퇴" 
							onclick="del_btn()"/>
						<input type="button" value="메인"
							onclick="goList('${loVo}')"/>
					</td>
				</tr>
				</tbody>
			</table>
			
			<input type="hidden" name="r_idx" value="<%=rvo.getR_idx()%>">
			
		</form>
	</div>
	<%
		}
	%>
	<script src="js/jquery-3.4.1.min.js"></script>
	
	<script type="text/javascript">
	
	
	function goList(loVo){
		location.href="control?type=main&loVo="+loVo;
	}
	
	function edit(){
		document.frm.action= "control?type=crystal";
		document.frm.submit();
	}
	function del_btn(){
		document.frm.action= "control?type=taltoe";
		document.frm.submit();
	}
	
	</script>  
</body>
</html>
