<%@page import="kr.co.acorn.dto.DeptDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.acorn.dao.DeptDao"%>
<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>


<%
	DeptDao dao = DeptDao.getInstance();
	ArrayList<DeptDto> list = dao.select(0, 5);
	//오늘만 임시로 넣기
%>
<!--bread crumb start-->
<!--<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item active" aria-current="page">Home</li>
    </ol>
  </nav>-->

<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Library</li>
	</ol>
</nav>

<!--<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="#">Home</a></li>
      <li class="breadcrumb-item"><a href="#">Library</a></li>
      <li class="breadcrumb-item active" aria-current="page">Data</li>
    </ol>
  </nav>-->
<!--brad curmb end-->



<!--main start-->
<h3>부서 리스트</h3>

<table class="table table-hover">
	<colgroup>
		<col width="20%" />
		<col width="60%" />
		<col width="20%" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">부서번호</th>
			<th scope="col">부서이름</th>
			<th scope="col">부서위치</th>
		</tr>
	</thead>
	<tbody>
		<%
			if (list.size() != 0) {
		%>

		<%
			for (DeptDto dto : list) {
		%>
		<tr>
			<td><a href="view.jsp"><%=dto.getNo() %></a></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getLoc() %></td>
		</tr>
		<%
			}
		%>
		<%
			} else {
		%>
		<tr>
			<td colspan="3">데이터가 존재하지 않습니다.</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>

<div class="text-right">
	<a href="write.jsp" class="btn btn-outline-secondary">부서 등록</a>
</div>

<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<li class="page-item disabled"><a class="page-link" href="#"
			tabindex="-1" aria-disabled="true">Previous</a></li>
		<li class="page-item"><a class="page-link" href="#">1</a></li>
		<li class="page-item"><a class="page-link" href="#">2</a></li>
		<li class="page-item"><a class="page-link" href="#">3</a></li>
		<li class="page-item"><a class="page-link" href="#">Next</a></li>
	</ul>
</nav>

<!--main end-->


<%@ include file="../inc/footer.jsp"%>
