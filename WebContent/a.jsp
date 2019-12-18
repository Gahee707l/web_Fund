<%@ page pageEncoding="utf-8"%>

<%
int age = 20;
%>

<!--<%@ include file="h.jsp"  %>-->
<jsp:include page = "h.jsp"/>
<!-- include action : 이건 오류 없이 잘 된다
<section>section</section>
<%@ include file="f.jsp"  %>

<!-- 번역 시점에서 이미 다 적용되어 가져와짐...어차피 가져올때 인코딩은 안가져오지만 안하면 오류남
그리고 같은 변수 이름에 다른 값을 넣는 등 아무튼 중복 선언은 위험하게 오류남 -->