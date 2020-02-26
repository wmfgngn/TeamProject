<%@page import="mybatis.dao.RegDAO"%>
<%@page import="project.vo.RegVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
    //사용자가 입력한 id 값을 받아서 해당 id로 된 정보가 이는지를 알아낸다.
    
    String id =request.getParameter("id");
    
 	RegVO vo = RegDAO.search(id);
 
    if(vo == null) {
    	// 아이디를 사용할 수 있는 경우 
    	%>
    	
    	<pre id="chk" class="success">사용가능</pre>
    	
    <% }else{
    	// 이미 생성된 아이디 이므로 사용하면 안된다.
    	%>
    	<pre id="chk" class="fail">사용불가</pre>
    <%
    }
    %>