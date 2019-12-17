package kr.co.acorn.hello;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.acorn.dao.DeptDao;
import kr.co.acorn.dto.DeptDto;

@WebServlet("/SaveDeptServlet")
public class SaveDempServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");// 부서이름 같은,파라미터가 한글일 경우 반드시 필요한 부분

		//파라미터는 name 부분이 넘어온다.
		int no = Integer.parseInt(request.getParameter("no"));
		//get parameter = 무조건 문자열로 가져옴
		String name = request.getParameter("name");
		String loc = request.getParameter("Loc");
		
		//dao와 dto 클래스가 있다면  insert를 그냥 불러오면 되지만...
		DeptDto dto = new DeptDto(no,name,loc);
		DeptDao dao = DeptDao.getInstance();
		
		boolean isSuccess = dao.insert(dto);
		if(isSuccess) {
			response.sendRedirect("/dept_success.html");
			//헤당 servlet으로 이동
		}else {
			response.sendRedirect("/dept.html");
		}
	}

}
