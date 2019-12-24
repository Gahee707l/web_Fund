<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.acorn.dao.MemberDao"%>
<%@ page contentType="appllication/json;charset=utf-8"%>

<%
String email = request.getParameter("email");
MemberDao dao = MemberDao.getInstance();
boolean inExisted = dao.isEmail(email);
JSONObject obj = new JSONObject();

if(inExisted){
	obj.put("result","fail");
}else{
	obj.put("result","ok");
}
out.print(obj.toString());
%>

