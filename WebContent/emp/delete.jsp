<%@page import="kr.co.acorn.dto.DeptDto"%>
<%@page import="kr.co.acorn.dao.DeptDao"%>
<%@ page pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int no = Integer.parseInt(request.getParameter("no"));
	String temPage = request.getParameter("page");
	
	DeptDao dao = DeptDao.getInstance();
	boolean isSuccess=dao.delete(no);
	if(isSuccess){
%>

<script>
alert('부서 정보가 삭제 되었습니다.');
location.href="view.jsp?page=<%=temPage%>";
</script>
<%}else{%>
<script>
alert('DB ERROR');
history.back(-1);
</script>

<%}%>