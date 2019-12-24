<%@ page pageEncoding="utf-8" %>
<%
/*
HttpSession 객체 종료 방법
1.브라우저 종료(탭은 꺼도 살아있다.)
2.해당 페이지의 시간이 세션만료 시간을 경화했을 때
3.invalidate() 메서드 호출 시

사라진 세션은 나중에 gc가 가져감.새 세션을 만들고 jsession id도 바뀐다.당연히 더이상 못찾고...
종료 후 재 접속 = 클라이언트가 새로운 jsession id를 보낸다.
*/

//로그인은 된채로 장바구니를 비울떄 :
//	session.removeAttribute("member");
//지금은 둘 다 같은 거지만...세션은 유지하고 내부 속성만 제거할떈 이 함수 사용
session.invalidate();
response.sendRedirect("/index.jsp");
%>