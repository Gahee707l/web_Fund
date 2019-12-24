<%@page import="kr.co.acorn.dao.EmpDao"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="application/json;charset=utf-8"%>

<%--{ 
"cafelist" : [ 
{"name":"뫄뫄뫄","clubid":"mawmaw"],
{}이런거 만들거임 
}--%>

<%
	EmpDao dao = EmpDao.getInstance();
	int start = Integer.parseInt(request.getParameter("start"));
	int length = Integer.parseInt(request.getParameter("length"));
	out.print(dao.selectJson(start, length));
%>