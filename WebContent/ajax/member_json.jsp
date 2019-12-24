<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="application/json;charset=utf-8"%>

<%--{ 
"cafelist" : [ 
{"name":"뫄뫄뫄","clubid":"mawmaw"],
{}이런거 만들거임 
}--%>

<%
	JSONObject jsonObj = new JSONObject();
	JSONArray jsonArray = new JSONArray();
	
	JSONObject item1 = new JSONObject();
	item1.put("name", "이가희");
	item1.put("clubid", "gahee808");
	
	JSONObject item2 = new JSONObject();
	item2.put("name", "palmo");
	item2.put("clubid", "mimimi");
	
	JSONObject item3 = new JSONObject();
	item3.put("name", "ㅅㅈㅇ");
	item3.put("clubid", "sonjung");
	
	jsonArray.add(item1);
	jsonArray.add(item2);
	jsonArray.add(item3);
	
	jsonObj.put("cafelist", jsonArray);
	out.print(jsonObj.toString());
	
%>