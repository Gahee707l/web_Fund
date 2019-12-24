<%@page import="kr.co.acorn.dao.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.acorn.dto.MemberDto"%>
<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>


<%
	int len = 5;
	int pageLength = 3;//한 줄에 페이지 몇개까지 보여줄지(언제 prev next시킬지)
	int start = 0;

	int totalRows = 0; //db에서 가져옴,dept dao로...연결해야 하니  dao 아래에서.
	int totalPage = 0;
	int startPage = 0; //총 로우 수와 현재페이지에 따라 갈림,앞의 n개 뒤의 n개
	int endPage = 0;
	int pageNum = 0;
	int cPage = 0;

	String temPage = request.getParameter("page");

	if (temPage == null || temPage.length() == 0) {
		cPage = 1;
	}
	try {
		cPage = Integer.parseInt(temPage);
	} catch (NumberFormatException e) {
		cPage = 1;
	}

	MemberDao dao = MemberDao.getInstance();
	totalRows = dao.getTotalRows();
	totalPage = totalRows % len == 0 ? totalRows / len : totalRows / len + 1;
	if (totalPage == 0) {
		totalPage = 1;
	}
	if (cPage > totalPage) {
		cPage = totalPage;
	}

	start = (cPage - 1) * len;
	pageNum = totalRows - (cPage - 1) * len;
	//역시 등차수열
	ArrayList<MemberDto> list = dao.select(start, len);
	int currentBlock = cPage % pageLength == 0 ? (cPage / pageLength) : ((cPage / pageLength) + 1);
	int totalBlock = totalPage % pageLength == 0 ? (totalPage / pageLength) : ((totalPage / pageLength) + 1);
	//이게 곧 마지막 블록
	startPage = 1 + (currentBlock - 1) * pageLength;
	endPage = pageLength + (currentBlock - 1) * pageLength;
	//무조건 30이 나오는데..마지막 페이지에서는 total로 바꿔줘야 함.26까지만 나오는 식으로
	if (currentBlock == totalBlock) {
		endPage = totalPage;
	}
%>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">회원관리</li>
	</ol>
</nav>



<!--main start-->

<h3>
	회원 리스트(<%=totalRows%>)
</h3>
<div class="table-responsive-lg">
	<table class="table table-hover">
		<colgroup>
			<col width="10%" />
			<col width="15%" />
			<col width="25%" />
			<col width="25%" />
			<col width="25%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">이름</th>
				<th scope="col">email</th>
				<th scope="col">휴대폰번호</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>
			<%
			if (list.size() != 0) {
		%>

		<%
			for (MemberDto dto : list) {
		%>
			<tr>
				<td><%=pageNum--%></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getEmail()%></td>
				<td><%=dto.getPhone()%></td>
				<td><%=dto.getRegdate()%></td>
			</tr>
			<%
			}}else{
			%>
			<tr>
				<td colspan="6">데이터가 존재하지 않습니다.</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>


	<div class="text-right">
		<a href="write.jsp?page=<%=cPage%>" class="btn btn-outline-secondary">등록</a>
	</div>
</div>

<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">

		<%
			if (currentBlock == 1) {
		%>

		<li class="page-item disabled"><a class="page-link" href="#"
			tabindex="-1" aria-disabled="true">Previous</a></li>
		<%
			} else {
		%>
		<li class="page-item"><a class="page-link"
			href="list.jsp?page=<%=startPage - 1%>">Previous</a></li>
		<%
			}
		%>

		<%
			for (int i = startPage; i <= endPage; i++) {
		%>
		<li class="page-item <%if (cPage == i) {%>active<%}%>"><a
			class="page-link" href="list.jsp?page=<%=i%>"><%=i%></a></li>
		<%
			}
		%>

		<%
			if (currentBlock == totalBlock) {
		%>
		<li class="page-item disabled"><a class="page-link" href="#"
			tabindex="-1" aria-disabled="true">Next</a></li>
		<%
			} else {
		%>
		<li class="page-item"><a class="page-link"
			href="list.jsp?page=<%=endPage + 1%>">Next</a></li>
		<%
			}
		%>

	</ul>
</nav>

<!--main end-->


<%@ include file="../inc/footer.jsp"%>
