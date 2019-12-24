<%@page import="kr.co.acorn.dto.MemberDto"%>
<%@page import="kr.co.acorn.dao.MemberDao"%>
<%@ page pageEncoding="utf-8"%>

<%
request.setCharacterEncoding("utf-8");
String email = request.getParameter("email");
String password = request.getParameter("password");

MemberDao dao= MemberDao.getInstance();
MemberDto dto= new MemberDto(email,null,password,null,null);
//2개 이상의 파라미터는 객체로 보내는게 나음...물론 누군가는 하나여도 일관성있게 객체로 넘기기도 함
dto = dao.getMember(dto);
//요즘은...그냥 하나라도 틀리면 다시 입력하라 함
//어차피 세션에 정보 넘겨야해서 그대로 dto로 넘긴다.
if(dto != null){
	//세션 시간 설정 : 디폴트 30분,이건 하루
	session.setMaxInactiveInterval(60*60*24);
	//session에 dto정보 저장
	session.setAttribute("member", dto);
	%>
	<script>
	alert('로그인 성공');
	//사실 이것도 잘 안함
	location.href="/index.jsp";
	</script>
	<%
	
}else{
	%>
	<script>
	alert('로그인 정보가 잘못 되었습니다.');
	//사실 이것도 잘 안함
	history.back(-1);
	</script>
	<%
}
%>