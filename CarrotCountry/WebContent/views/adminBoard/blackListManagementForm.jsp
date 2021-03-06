<%@page import="com.javachip.carrotcountry.adminBoard.model.vo.AdminMember"%>
<%@page import="com.javachip.carrotcountry.adminBoard.model.vo.AdminPageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AdminPageInfo pi = (AdminPageInfo)request.getAttribute("pi");
	ArrayList<AdminMember> list = (ArrayList<AdminMember>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<link rel="stylesheet" href="resources/css/adminBoard/adminBoardStyle.css">

</head>
<body>

	<!-- nav 영역 -->
	<%@ include file="../common/commonNavbar.jsp" %>
	
	    <!-- content 영역 -->
    <div class="wrap">
        <div id="content">
            <div id="content1">
                <!-- 관리페이지 메뉴 리스트 -->
				<%@ include file="./adminMenubar.jsp" %>
            </div>
            <div id="content2">
                <div id="pageName">
                    <h3>블랙리스트 관리</h3>
                </div>
                <div id="pageContent">
                    <!-- search -->
                    <form action="<%= contextPath %>/blackListSearch.sb" class="form-inline my-2 my-lg-0" id="search">
                    	<input type="hidden" name="currentPage" value=1>
						<select name="searchCategory" id="searchCategory">
						  <option value="mem_name">회원명</option>
						  <option value="mem_userid">회원아이디</option>
						</select>
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">
                        <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">Search</button>
                    </form>
                    <!-- 블랙리스트회원 리스트 조회 -->
					<div id="board">
						<table class="table table-sm table-hover">
							<thead class="thead-dark">
								<tr>
									<th width="70">회원번호</th>
									<th width="100">아이디</th>
									<th width="60">회원명</th>
									<th width="150">전화번호</th>
									<th width="150">이메일</th>
									<th width="100">신고횟수</th>
									<th width="100">블랙리스트</th>
								</tr>
							</thead>
							<tbody class="tbody">
							
								<% if (list.isEmpty()) { %>
									<tr>
										<th colspan="7">조회된 리스트가 없습니다.</th>
									</tr>
								<% } else { %>
									<% for (AdminMember am : list) { %>
										<tr>
											<td><%= am.getMemNo() %></td>
											<td><%= am.getMemUserId() %></td>
											<td><%= am.getMemName() %></td>
											<td><%= am.getMemPhone() %></td>
											<td><%= am.getMemEmail() %></td>
											<td><%= am.getReportCount() %></td>
											<td>
												<!-- 클릭 시 블랙리스트 해제  -->
												<button onclick="registBlackList(<%= am.getMemNo() %>);" class="btn btn-outline-danger btn-sm">해제</button>
											</td>
										</tr>
									<% } %>
								<% } %>

							</tbody>
						</table>
					</div>
					
					<!-- 페이지 번호 -->
                    <div id="boardNum" align="center">
						<% if (pi.getCurrentPage() != 1) { %>
				            <a href="<%= contextPath %>/blackList.sb?currentPage=<%= pi.getCurrentPage() - 1 %>">&lt; 이전</a>
						<% } %>
			
						<% for (int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
				            <a href="<%= contextPath %>/blackList.sb?currentPage=<%= p %>"><%= p %></a>
						<% } %>
			
						<% if (pi.getCurrentPage() != pi.getMaxPage()) { %>
				            <a href="<%= contextPath %>/blackList.sb?currentPage=<%= pi.getCurrentPage() + 1 %>">다음 &gt;</a>
						<% } %>
					</div>
                </div>
            </div>
        </div>
    </div>
    <script>
		function registBlackList(memNo) {
			const registYN = confirm('해제하시겠습니까?');
			const url = "<%= contextPath %>/blacklistEnroll.sb?&memNo=" + memNo + "&bList=N";
			if(registYN){
				location.href = url;
			}
		}
	</script>    
    <!-- footer 영역 -->
    <%@ include file="../common/footerbar.jsp" %>

</body>
</html>