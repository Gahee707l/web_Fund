<%@ page pageEncoding="utf-8"%>
<%@ page import="kr.co.acorn.dto.DeptDto"%>
<%@ page import="kr.co.acorn.dao.DeptDao"%>
<%
	request.setCharacterEncoding("utf-8");
	// 하지만 깨진다...한글은 깨진다. 파라미터로 한글을 안전히 받아오기위한 추가
	int no = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");
	String loc = request.getParameter("loc");

	DeptDto dto = new DeptDto(no, name, loc);
	DeptDao dao = DeptDao.getInstance();
	boolean isSuccess = dao.insert(dto);

	if (isSuccess) {
%>
<script>
	alert('부서가 등록되었습니다.');
	location.href = "list.jsp?page=1";
</script>

<%
	} else {
%>
<script>
	alert('DB ERROR : 부서번호를 확인하시오');
	history.back(-1);
</script>
<%
	}
%>

