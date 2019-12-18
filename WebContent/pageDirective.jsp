<%-- pageDirective.jsp--%>
<%-- <%@ page contentType="text/html;charset=utf-8"%> --%>

<%-- 이 응답mime타입은 html아니고 이미지나 excel등등 서비스 할 수 있음 : 하면 다운로드 창 뜸 
		서블릿은 지원 되는게 아주 많기 때문이다.json도 되고...
		C:\Users\admin\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\ROOT\org\apache\jsp
		에서 변환시 확인 가능 
		
		이제는 html에 text타입만 하면 contentType말고 pageEncoding 씀--%>

<%@ page pageEncoding="utf-8"%>
<%@ page import="java.util.Calendar,java.text.SimpleDateFormat" %>
<%-- page디렉토리의 pageEncoding속성을 변환 --%>
<%-- ;찍지도 말고 복수 연결시 ,사용...다른 문제는 아니고 읽기에는 따로 있는게 편함 --%>

<%@ page session="true" %>
<%--세션  객체 많이 씀,ex) 로그인 판단용 default = true--%>
<%@ page buffer="10kb" %>
<%--출력버퍼 크기 --%>
<%@ page autoFlush="false" %>
<%--다 안차면 안보내주는거라서 잘릴 수 있음,큰일남...--%>
<%@ page isThreadSafe="false" %>
<%--isThreadSafe는 false시 single스레드 방식으로 됨...멀티스레드가 기본이다.
C:\Users\admin\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\ROOT\org\apache\jsp
java 파일에서 보면 불려오는 class가 조금 달라짐--%>
<%@ page info="test jsp page,none influencial to html" %>
<%--어찌저찌하면 꺼내오기는 가능...--%>
<%@ page errorPage="/error/error.jsp" %>
<%--에러시 에러 페이지로 이동 is errorpage와 연동됨--%>
<%@ page isELIgnored="true" %>
<%--기본 false,즉 원래 먹힘--%>

<% Calendar c = Calendar.getInstance(); 
SimpleDateFormat s = new SimpleDateFormat();
session.setAttribute("aa","aa"); //false면 못씀

//int a= Integer.parseInt("123a");
String id =request.getParameter("id");
out.print(id);
//아래의 el과 동일 방식

//<%@ include 는 2가지 방식 :
	//트랜슬레이트 타임: 아예 코드를 통으로 가져와 '한번에'컴파일과 실행이 이루어지기에 변수 충돌 위험이 있으나 빠르고
	//런타임(액션):속도는 좀 느려도 런타임 시에 해석이 되기에(여러개 실행 시키고  그 결과들만 받아오는거라)충돌 위험은 없(적)다.
%>

${param.id }
<%--isELIgnored때문에 안먹힘--%>
