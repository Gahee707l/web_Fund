<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Calendar"%>
<%@page pageEncoding = "utf-8"%>

<%
request.setCharacterEncoding("utf-8");
//String name = request.getParameter("name"); ->null나옴

String path = request.getRealPath("/upload/file");
//보는 dir과 서비스 되는 dir이 다르다.<옆의 project explorer말고 이렇게 뜨는게 실질적 서비스 위치(tomcat의 위치)
//변화 적용이 안되면 build 파일이 web-inf의 classes로 copy 해야한다. 원본의 위치와 카피된 실질적 서비스 위치가 각각 다름///실직적 위치의 아래에 폴더가 생간다는 말.
//변화를 주면 전부 내렸다 올리는 식이라 원래 좀 걸린다.

Calendar c = Calendar.getInstance();
//file 이름 뒤에 날짜덧붙여서 디렉토리 만들기

int year = c.get(Calendar.YEAR);
int month = c.get(Calendar.MONTH)+1;
path += File.separator + year + File.separator + month;

File f = new File(path);
if(!f.exists()){
	f.mkdirs();
}

MultipartRequest multi = null;
try{
multi = new MultipartRequest(
		request,
		path,//업로딩 디렉토리
		10*1024*1024,//업로딩 파일 크기
		"utf-8",//인코딩 타입
		new DefaultFileRenamePolicy()//중복 파일 이름에 1,2,3 붙여 변경시켜주는 클래스
		);
}catch(Exception e){
	e.printStackTrace();
}

String name = multi.getParameter("name");
String fileName = multi.getFilesystemName("file");
String uploadName = multi.getOriginalFileName("file");
File f1 = new File(f,fileName);
long fileSize = f1.length()/1024;

%>

name : <%=name %><br>
<img src="/upload/file/<%=year%>/<%=month%>/<%= fileName %>" style= "width:700px;height:500px"></img><br>
File system Name : <a href="/upload/file/<%=year%>/<%=month%>/<%= fileName %>"><%= fileName %></a>(<%=fileSize %>kb)<br>
File Origin Name : <%=uploadName %>
 
 <%=path%>
