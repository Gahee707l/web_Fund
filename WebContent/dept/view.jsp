<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>
<%@page import="kr.co.acorn.dto.DeptDto"%>
<%@page import="kr.co.acorn.dao.DeptDao"%>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="/index.jsp">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Dept</li>
	</ol>
</nav>
<% 
request.setCharacterEncoding("utf-8");
// 하지만 깨진다...한글은 깨진다. 파라미터로 한글을 안전히 받아오기위한 추가
//DeptDto dto = new DeptDto(no, name, loc);


String temPage = request.getParameter("page");
String tempNo =request.getParameter("no");
if (temPage == null || temPage.length() == 0) {
	temPage = "1";
}
if (tempNo == null || tempNo.length() == 0) {
	response.sendRedirect("list.jsp?page="+temPage);
	return;
	//이전 페이지로 보내기.return 안해주면 가끔 문제 생길 수 있음...return 안하면 느린 네트워크 상황에서 출력을 좀 하다가 넘어갈 수 있음.
}
int cPage=0;
int no =0;
try{
	cPage=Integer.parseInt(temPage);
}catch(NumberFormatException e){
	cPage=1;
}
try{
	no=Integer.parseInt(tempNo);
}catch(NumberFormatException e){
	response.sendRedirect("list.jsp?page="+temPage);
	return;
}

DeptDao dao = DeptDao.getInstance();
DeptDto dto = dao.select(no);
if(dto==null){
	//없는 페이지
	response.sendRedirect("list.jsp?page="+temPage);
	return;
}
	String name=dto.getName();
	String loc=dto.getLoc();

	%>
<!--main start-->
<div class="container">
	<div class="row">
		<div class="col-lg-12">
		<h3>부서 상세보기</h3>

			<form name="f" method="post">
			<!-- 한번에 두군데를 가니 액션 지우기 -->
				<div class="form-group row">
					<label for="no" class="col-sm-2 col-form-label">부서번호</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="no" name="no" readonly="readonly" value="<%=no %>">
					</div>
				</div>
				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">부서이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name" name="name" value="<%=name %>">
					</div>
				</div>
				<div class="form-group row">
					<label for="loc" class="col-sm-2 col-form-label">부서위치</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="loc" name="loc" value="<%=loc %>">
					</div>
				</div>
				<input type="hidden" name="page" value="<%=cPage%>">
			</form>
			<div class="text-right">
				<button type="button" id="prevPage" class="btn btn-outline-secondary">이전</button>
				<%--이게 직전에 보던 페이지들로 가게끔 하려면...그냥 history back해야 한다 --%>
				<button type="button" id="updateDept" class="btn btn-outline-success">수정</button>
				<button type="button" id="deleteDept" class="btn btn-outline-danger">삭제</button>
			</div>
		</div>
	</div>
</div>


<!--main end-->


<%@ include file="../inc/footer.jsp"%>

<script>
$(function(){
	//전체 페이지 로딩 후 호출
	$("#no").focus();
	$("#prevPage").click(function(){
		history.back(-1);
	});
	$("#updateDept").click(function(){
		//js 유효성 검사
		if($("#no").val().length==0){
			alert("부서 번호를 입력하세요.");
			$("#no").focus();
			return;
		}
		if($("#name").val().length==0){
			alert("부서명을 입력하세요.");
			$("#name").focus();
			return;
		}
		if($("#loc").val().length==0){
			alert("부서 위치를 입력하세요.");
			$("#loc").focus();
			return;
		}
		f.action="update.jsp";
		f.submit();
	});
	
	$("#deleteDept").click(function(){
		f.action="delete.jsp";
		f.submit();
	});
	
});
</script>