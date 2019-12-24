<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="application/json;charset=utf-8"%>

<%
//proxy는 우리가 만들어 쓰는것...
//local과 동일한 방식으로 쓴다.
String clientId = "QzwExQk53mnGnGNN10_F";//애플리케이션 클라이언트 아이디값";
String clientSecret = "gW7Jq6y3AQ";//애플리케이션 클라이언트 시크릿값";
try {
    String text = URLEncoder.encode("그린팩토리", "UTF-8");
    String apiURL = "https://openapi.naver.com/v1/search/book.json?query="+ text; // json 결과
    //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
    URL url = new URL(apiURL);
    HttpURLConnection con = (HttpURLConnection)url.openConnection();
    con.setRequestMethod("GET");
    con.setRequestProperty("X-Naver-Client-Id", clientId);
    con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
    int responseCode = con.getResponseCode();
    BufferedReader br;
    if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
    } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
    }
    String inputLine;
   //response: jsp 내장 객체와 이름이 같아서 충돌 나느것.
    StringBuffer message = new StringBuffer();
    while ((inputLine = br.readLine()) != null) {
    	message.append(inputLine);
    }
    br.close();
    out.println(message.toString());
    //System.out.println(message.toString());
    
} catch (Exception e) {
    System.out.println(e);
}
%>