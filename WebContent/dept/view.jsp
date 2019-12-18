<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="/index.jsp">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Dept</li>
	</ol>
</nav>

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
						<input type="number" class="form-control" id="no" name="no" value="10">
					</div>
				</div>
				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">부서이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name" name="name" value="총무부">
					</div>
				</div>
				<div class="form-group row">
					<label for="loc" class="col-sm-2 col-form-label">부서위치</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="loc" name="loc" value="서울">
					</div>
				</div>
			</form>
			<div class="text-right">
				<a href="list.jsp" class="btn btn-outline-secondary">목록</a>
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