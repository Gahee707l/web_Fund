package kr.co.acorn.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
//이거덕분에 출력됨,원랜 http 도 /HelloServlet이었다.
@WebServlet("/acorn")
/*
1.servlet annotation ->@WebServlet("/hello")
2.servlet annotation으로 지정된 이름으로 서블릿을 호출 가능
3.servlet annotation 을 사용하지 않고 서블릿을 호출하려 하면 web.xml파일(DD파일)에 서블릿 정도를 추가해야 한다.
4.url-pattern 지정 방법 3가지 (annotation과 사실 같은 것)
	4-1.extension matching => *.do 혹은 *.nhn , *.acorn 즉,확장자 마음대로=마지막에 아무튼 .(지정)이면 이 서블렛을 호출해주겠다.(네이버가 nhn으로 씀)
	4-2.exact matching => /test , /acorn , /test/acorn 즉,적황히 써줘야만 한다.
	4-3.wildcard matching => /test/* , /acorn/* 즉,뭐가오건 앞에 해당 문자열이 있다면 이 서블렛 호출 
	2,3 : 꼭 /로 시작
	1: /로 시작하면 안됌
	ex) /*.do = 2번,이그잭트로 온다. 3은...와일드카드로 끝나야 함(.* 같은거 말고 *)
*/

//dd파일 추가하기 = xml 파일 수정

public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doget은 url로 바로 들어오는 방식
		//dopost는 폼에서 들어오는 방식
		//service 는 doget이나 dopost둘다 처리됨
		
		//response MIME type과 문자 인코딩 지정
		response.setContentType("text/html;charset=utf-8");
		//클라이언트에게 응답할 출력개체 생성
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>Hello ㅅㅇㅎ!</h1>");
		String id = request.getParameter("id");
		String age = request.getParameter("age");
		out.println(id + "," +age);
		out.println("</body>");
		out.println("</html>");
		//print하면 한줄로 주욱 이어 붙여짐
		//이래서...힘들어서 만들어진게 jsp
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}*/

}
