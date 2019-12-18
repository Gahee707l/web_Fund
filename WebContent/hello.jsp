<%@ page pageEncoding="utf-8" %>
<%--무조건 서블릿파일로 바뀌고 컴파일후 메모리에 옮김(그렇게 서비스됨),jsp는 서블렛을 편히 쓰기위해 만들어짐--%>
<%--
C:\Users\admin\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\ROOT\org\apache\jsp
에서 확인 가능,톰캣이 만듦
--%>
<html>
<body>
<%//java code 구분
for(int i =0;i<10;i++){
%>
<h1>hELLO Jsp</h1>
<%} %>
<%--여기다 그냥 자바 쓸 수도 있고 이름 지정도 복잡히 할 필요 x--%>
</body>
</html>