<%@page import="project.vo.BbsVO"%>
<%@page import="project.vo.PageVO"%>
<%@page import="mybatis.dao.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// ******************************************************************************************
	PageVO pvo = null;
	BbsVO[] ar = null;
	Object obj01 = request.getAttribute("page");	// 페이징 기법관련 객체
	Object obj02 = request.getAttribute("ar");		// 한 페이지에 표시될 게시물 리스트
	if(obj01 != null) {
		pvo = (PageVO)obj01;
	}
	if(obj02 != null) {
		ar = (BbsVO[])obj02;
	}
	
	String reqnum = request.getParameter("reqnum");
	
	session.setAttribute("page", pvo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css"/>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>

	<jsp:include page="header.jsp"/>
	<jsp:include page="menu.jsp"/>

<div id="warp">
	<div id="bbs">
	<%
	String str = "";
	switch(Integer.parseInt(reqnum)) {
	case 1 :
		str="공지사항";
		System.out.println(str);
		break;
	case 2 :
		str="자유게시판";
		System.out.println(str);
		break;
	case 3 :
		str="팁게시판";
		System.out.println(str);
		break;
	}
	%>
		<h1><%=str %></h1>
		<table summary="<%=str%>">
			<thead>
				<tr>
					<td colspan="6" style="text-align:right;"><input type="button" value="글쓰기"/></td>
				</tr>
				<tr class="title">
					<th class="no">번호</th>
					<th class="subject">제목</th>
					<th class="writer">글쓴이</th>
					<th class="reg">날짜</th>
					<th class="hit">조회수</th>
					<th class="recomnum">추천</th>
				</tr>
			</thead>

			<tfoot>
				<tr>
                	<td colspan="5">
                    	<ol class="paging">
                    		<%-- 이전으로 : 현재페이지 - pagePerBlock 
	 							 다음으로 : 현재페이지 + pagePerBlock --%>
	 				<%	// 이전으로 : startPage가 pagePerBlock보다 작을 때는 비활성화
	 					if(pvo.getStartPage() < pvo.getPagePerBlock()) { %>
							<li class="disable">&lt;</li>
					<%	} else { %>
							<li><a href="control?type=list&cPage=<%= pvo.getNowPage() - pvo.getPagePerBlock()%>">◀</a></li>
					<%	}
						for(int i = pvo.getStartPage() ; i <= pvo.getEndPage() ; i++)  {
							if(pvo.getNowPage() != i) { %>
								<li><a href="control?type=list&cPage=<%=i%>"><%=i%></a></li>
						<%	} else {%>
								<li class="now"><%=i%></li>
						<%	}
						}
						// 다음으로 : endPage가 totalPage보다 작을 때만 활성화 
						if(pvo.getEndPage() < pvo.getTotalPage()) { %>
							<li><a href="control?type=list&cPage=<%=pvo.getNowPage()+pvo.getPagePerBlock()%>">▶</a></li>
					<%	} else { %>
							<li class="disable">&gt;</li>
					<%	} %>
                        </ol>
					</td>
					<td style="border-left: none;">
						<input type="button" value="글쓰기"	onclick="javascript:location.href='control?type=write&cPage=<%=pvo.getNowPage()%>&reqnum=<%=reqnum%>'"/>
					</td>
				</tr>
			</tfoot>
			<tbody>
			<%
			if(ar != null && ar.length > 0) {
				int cnt = 0;	// 번호 만들기
				for(int i = 0 ; i < ar.length ; i++) {
					int num = pvo.getTotalRecord() - cnt++ - ((pvo.getNowPage()-1)*pvo.getNumPerPage());	%>
					<tr>
						<td><%=num%></td>
						<td style="text-align: left">
							<a href="javascript:view('<%=pvo.getNowPage()%>', '<%=ar[i].getB_idx()%>')">
								<%=ar[i].getSubject()%>
							<%	if(ar[i].getC_list().size() > 0) { %>
									(<%=ar[i].getC_list().size() %>)
							<%	} %>
							</a>
						</td>
						<td><%=ar[i].getWriter()%></td>
						<td><%=ar[i].getWrite_date()%></td>
						<td><%=ar[i].getHit()%></td>
						<td><%=ar[i].getRecommend() %></td>
					</tr>
			<%
				}
			} else { %>
				<tr>
					<td colspan="6">등록된 게시물이 없습니다.</td>
				</tr>				
		<%	} %>
			</tbody>
		</table>
	</div>
	
	<form action="control" method="post" name="frm">
		<input type="hidden" name="type" value="view"/>
		<input type="hidden" name="cPage" />
		<input type="hidden" name="b_idx" />
	</form>
	
	<%-- Script *******************************************************************--%>
	<script>
		function view(cPage, b_idx) {
			document.frm.b_idx.value = b_idx;
			document.frm.cPage.value = cPage;
			document.frm.submit();
		}
	</script>
</div>
</body>
</html>
