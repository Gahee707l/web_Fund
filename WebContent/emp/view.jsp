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
	String tempNo = request.getParameter("no");
	if (temPage == null || temPage.length() == 0) {
		temPage = "1";
	}
	if (tempNo == null || tempNo.length() == 0) {
		response.sendRedirect("list.jsp?page=" + temPage);
		return;
		//이전 페이지로 보내기.return 안해주면 가끔 문제 생길 수 있음...return 안하면 느린 네트워크 상황에서 출력을 좀 하다가 넘어갈 수 있음.
	}
	int cPage = 0;
	int no = 0;
	try {
		cPage = Integer.parseInt(temPage);
	} catch (NumberFormatException e) {
		cPage = 1;
	}
	try {
		no = Integer.parseInt(tempNo);
	} catch (NumberFormatException e) {
		response.sendRedirect("list.jsp?page=" + temPage);
		return;
	}

	DeptDao dao = DeptDao.getInstance();
	DeptDto dto = dao.select(no);
	if (dto == null) {
		//없는 페이지
		response.sendRedirect("list.jsp?page=" + temPage);
		return;
	}
	String name = dto.getName();
	String loc = dto.getLoc();
%>
<!--main start-->
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h3>부서 상세보기</h3>

			<form name="f" method="post" action="save.jsp">
				<div class="form-group row">
					<label for="no" class="col-sm-2 col-form-label">사원번호</label>
					<!-- 반응형 -->
					<div class="col-sm-10">
						<input type="number" class="form-control" id="no" name="no">
					</div>
				</div>
				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name" name="name">
					</div>
				</div>
				<div class="form-group row">
					<label for="job" class="col-sm-2 col-form-label">직책</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="job" name="job">
					</div>
				</div>
				<div class="form-group row">
					<label for="mgr" class="col-sm-2 col-form-label">사수</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="mgr" name="mgr">
					</div>
				</div>
				<div class="form-group row">
					<label for="sal" class="col-sm-2 col-form-label">월금</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="sal" name="sal">
					</div>
				</div>
				<div class="form-group row">
					<label for="comm" class="col-sm-2 col-form-label">상여금</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="comm" name="comm">
					</div>
				</div>
				<div class="form-group row">
					<label for="deptNo" class="col-sm-2 col-form-label">부서 번호</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="deptNo"
							name="deptNo">
					</div>
				</div>
				<input type="hidden" name="page" value="<%=cPage%>">
			</form>
			<div class="text-right">
				<a href="list.jsp?page=<%=cPage%>"
					class="btn btn-outline-secondary">목록</a>
				<button type="button" id="updateEmp"
					class="btn btn-outline-success">수정</button>
				<button type="button" id="deleteEmp" class="btn btn-outline-danger">삭제</button>
			</div>
		</div>
	</div>
</div>


<!--main end-->


<%@ include file="../inc/footer.jsp"%>

<script>
	$(function() {
		$("#no").focus();
		$("#updateEmp").click(function() {
			if($("#no").val().length==0){
				alert("사원 번호를 입력하세요.");
				$("#no").focus();
				return;
			}
			if($("#name").val().length==0){
				alert("이름을 입력하세요.");
				$("#name").focus();
				return;
			}
			if($("#job").val().length==0){
				alert("직책을 입력하세요.");
				$("#job").focus();
				return;
			}
			//사수와 상여금은 필수 X.사수는 기존의 사원번호에서 넣어야함.필수와 옵션 구분 할 것
			if($("#sal").val().length==0){
				alert("월급을 입력하세요.");
				$("#sal").focus();
				return;
			}
			if($("#deptNo").val().length==0){
				alert("부서 번호를 입력하세요.");
				$("#deptNo").focus();
				return;
			}
			f.action = "update.jsp";
			f.submit();
		});

		$("#deleteEmp").click(function() {
			f.action = "delete.jsp";
			f.submit();
		});

	});
</script>