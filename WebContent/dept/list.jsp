<%@page import="kr.co.acorn.dto.DeptDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.acorn.dao.DeptDao"%>
<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>


<%
int len = 5
;
int pageLength=2;//한 줄에 페이지 몇개까지 보여줄지(언제 prev next시킬지)
int start = 0;

int totalRows = 0; //db에서 가져옴,dept dao로...연결해야 하니  dao 아래에서.
int totalPage = 0;
int startPage = 0; //총 로우 수와 현재페이지에 따라 갈림,앞의 n개 뒤의 n개
int endPage = 0;
int pageNum=0;
int cPage = 0;

String temPage = request.getParameter("page");
/*String tempLen = request.getParameter("len");*/

/*if(tempLen==null|| tempLen.length()==0){
	len=2;
}try{
	cPage=Integer.parseInt(tempLen);
}catch(){
	
}*/
	
	//System.out.println(temPage); 우리 콘솔에서 뜸
	
	if (temPage == null || temPage.length() == 0) {
		//아무것도 안쳤을때 		?page= 해놓고 안쳤을때
		cPage = 1;
	}
	try {//문자로 입력해 들어올 경우가 있으니,그때는 1로 만들자.
		cPage = Integer.parseInt(temPage);
	} catch (NumberFormatException e) {
		cPage = 1;
	}
	

	DeptDao dao = DeptDao.getInstance();
	totalRows = dao.getTotalRows();
	totalPage = totalRows % len == 0 ? totalRows / len : totalRows / len + 1;
	//3항 연산자,맞으면 왼쪽 아니면 오른쪽 근데 토탈 로우가 0이면...
	if (totalPage == 0) {
		totalPage = 1;
	}
	if(cPage>totalPage){
		/*response.sendRedirect("list.jsp?page=1");
		return 대신 이건 한번 더 호출하니까...*/
		cPage=totalPage;
	}

	//등차수열로 한다고 한다...
	//A(n) = a1 + (n-1)*d
	//start = 0 + (page-1)*len
	start = (cPage - 1) * len;
	pageNum = totalRows-(cPage-1)*len;
	//역시 등차수열
	ArrayList<DeptDto> list = dao.select(start, len);
	//ArrayList<DeptDto> list = dao.select(0, 5);
	//오늘만 임시로 넣기
	
	/*가정)
ttr = 132;	len=5	pageLength=10;	
if:cpage =1	startpage=1(등차수열)		endpage = 10(등차수열)
if:cpage =5	startpage=1		endpage = 10
if:cpage =14 startpage=11		endpage = 20
if:cpage =18 startpage=11		endpage = 20
if:cpage =22 startpage=21		endpage = 27
n-1부분을 cpage로...하지만 1~10사이가 start1 이런식이니까.
cpage= 1-10 -> n=1
cpage = 11-20 -> n=2
그래서 n= current block으로 판단한다.

startPage = 1+(currentBlock-1)*pageLength
endPage = pageLength+(currentBlock-1)*pageLength
	*/
	int currentBlock = cPage%pageLength ==0 ? (cPage/pageLength) : ((cPage/pageLength)+1);
	int totalBlock =totalPage%pageLength ==0 ? (totalPage/pageLength) : ((totalPage/pageLength)+1);;
	//이게 곧 마지막 블록
	startPage = 1+(currentBlock-1)*pageLength;
	endPage = pageLength+(currentBlock-1)*pageLength;
	//무조건 30이 나오는데..마지막 페이지에서는 total로 바꿔줘야 함.26까지만 나오는 식으로
	if(currentBlock==totalBlock){
		endPage = totalPage;
	}
%>
<!--bread crumb start-->
<!--<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item active" aria-current="page">Home</li>
    </ol>
  </nav>-->

<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Library</li>
	</ol>
</nav>

<!--<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="#">Home</a></li>
      <li class="breadcrumb-item"><a href="#">Library</a></li>
      <li class="breadcrumb-item active" aria-current="page">Data</li>
    </ol>
  </nav>-->
<!--brad curmb end-->



<!--main start-->

<h3>
	부서 리스트(<%=totalRows%>)
</h3>
<div class="table-responsive-lg">
<table class="table table-hover">
	<colgroup>
	<col width = "10%"/>
		<col width="10%" />
		<col width="60%" />
		<col width="20%" />
	</colgroup>
	<thead>
		<tr>
		<th scope="col">#</th>
			<th scope="col">부서번호</th>
			<th scope="col">부서이름</th>
			<th scope="col">부서위치</th>
		</tr>
	</thead>
	<tbody>
		<%
			if (list.size() != 0) {
		%>

		<%
			for (DeptDto dto : list) {
		%>
		<tr>
		<td><%=pageNum--%></td>
			<td><a href="view.jsp?page=<%=cPage%>&no=<%=dto.getNo()%>"><%=dto.getNo()%></a></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getLoc()%></td>
		</tr>
		<%
			}
		%>
		<%
			} else {
		%>
		<tr>
			<td colspan="3">데이터가 존재하지 않습니다.</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>


<div class="text-right">
	<a href="write.jsp?page=<%=cPage%>" class="btn btn-outline-secondary">부서 등록</a>
</div>
</div>

<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
	
		<%if(currentBlock==1){ %>
		
		<li class="page-item disabled">
		<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
			<%}else{%>
				<li class="page-item">
				<a class="page-link" href="list.jsp?page=<%=startPage-1%>">Previous</a></li>
			<%} %>
			
			<%for(int i =startPage;i<=endPage;i++){ %>
		<li class="page-item <% if(cPage==i){ %>active<% }%>">
		<a class="page-link" href="list.jsp?page=<%=i%>"><%=i %></a></li>
		<%}%>
		
		<%if(currentBlock==totalBlock){ %>
		<li class="page-item disabled">
		<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Next</a></li>
		<%} else{%>
		<li class="page-item">
		<a class="page-link" href="list.jsp?page=<%=endPage+1%>">Next</a></li>
		<%}%>
		
	</ul>
</nav>

<!--main end-->


<%@ include file="../inc/footer.jsp"%>
