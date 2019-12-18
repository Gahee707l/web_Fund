<%-- scriptElement.jsp--%>

<%@ page pageEncoding = "utf-8"%>

<%!
//클래스 내부로 들어가기 때문에 멤버 변수와 함수 선언 가능
//declanation

//쿠키와 세션이 왜 나왔는가? http가 스테이트리스 프로토콜이라서 = 응답후 연결을 끊기 때문
//session= 서버측에 상태 저장 / cookie =클라이언트 쪽에서 상태 저장
private String name;
private String id;
public int plus(int a,int b){
	//여기선 out안됌,scriptlet태그서만 가능,클래스 내에는 없다.
	return a+b;
}


%>
<% out.print("1 + 2 = "+plus(1,2)+"<br>");

%>
<!-- 이 둘이 같은 것 -->
1+2 = <%=plus(1,2) %>,<% out.println(plus(1,2));%><br>
<!-- expression -->