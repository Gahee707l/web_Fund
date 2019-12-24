<%@page import="kr.co.acorn.dto.EmpDto"%>
<%@page import="kr.co.acorn.dao.EmpDao"%>
<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>
<%@page import="kr.co.acorn.dto.DeptDto"%>
<%@page import="kr.co.acorn.dao.DeptDao"%>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="/index.jsp">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">회원관리</li>
	</ol>
</nav>
<%
	int cPage = 0;
	String temPage = request.getParameter("page");

	if (temPage == null || temPage.length() == 0) {
		cPage = 1;
	}
	try {
		cPage = Integer.parseInt(temPage);
	} catch (NumberFormatException e) {
		cPage = 1;
	}
%>
<!--main start-->
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h3>회원 상세보기</h3>

			<form name="f" method="post" action="save.jsp">
				<%--<div class="form-group row">
					<label for="no" class="col-sm-2 col-form-label">사원번호</label>
					 사실,시스템에서 부여하는 부분이라서 없는게 더 나음. 
					<!-- 반응형 -->
					<div class="col-sm-10">
						<input type="number" class="form-control" id="no" name="no">
					</div>
				</div>--%>
				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name" name="name">
					</div>
					<div id="nameMessage"></div>
				</div>
				<div class="form-group row">
					<label for="email" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="email" name="email">
					</div>
					<div id="emailMessage"></div>
				</div>
				<div class="form-group row">
					<label for="password" class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="password"
							name="password">
					</div>
					<div id="passwordMessage"></div>
				</div>
				<div class="form-group row">
					<label for="repassword" class="col-sm-2 col-form-label">비밀번호
						확인</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="repassword"
							name="repassword">
					</div>
					<div id="repasswordMessage"></div>
				</div>
				<div class="form-group row">
					<label for="phone" class="col-sm-2 col-form-label">핸드폰</label>
					<div class="col-sm-10">
						<input type="tel" class="form-control" id="phone" name="phone">
					</div>
					<div id="phoneMessage"></div>
				</div>
				<input type="hidden" id="checkEmail" value="no" />
				<%--no면 아직 안보내는 거임 --%>
			</form>
			<div class="text-right">
				<a href="list.jsp?page=<%=cPage%>" class="btn btn-outline-secondary">목록</a>
				<button type="button" id="saveMember"
					class="btn btn-outline-success">저장</button>
			</div>
		</div>
	</div>
</div>


<!--main end-->


<%@ include file="../inc/footer.jsp"%>
<!-- 여기부터 script... -->

<script>
	$(function() {
		$("#name").focus();

		$("#saveMember")
				.click(
						function() {
							if ($("#name").val().length == 0) {
								$("#name").addClass("is-invalid");
								$("#nameMessage")
										.html(
												"<span class='text-danger'>이름을 입력하세요</span>");
								$("#name").focus();
								return;
							}
							let regEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
							//  //속,^[A-Z]문자로 시작 + 이런게 한개 이상이면 @(이건 반드시 해라) 요기또 한글자 들어가라(이부분은 도메인) . 필수
							//email 정규표현식
							//최소부합 : 1@a.c
							if (regEmail.test($("#email").val()) == false) {
								//중복인지 아닌지도 나중에 db로 ajax보내서 물어봄
								$("#email").addClass("is-invalid");
								$("#emailMessage")
										.html(
												"<span class='text-danger'>이메일을 입력하세요</span>");
								$("#email").focus();
								return;
							}
							if ($("#password").val().length == 0) {
								$("#password").addClass("is-invalid");
								$("#passwordMessage")
										.html(
												"<span class='text-danger'>비밀번호를 입력하세요</span>");
								$("#password").focus();
								return;
							}
							if ($("#repassword").val().length == 0) {
								$("#repassword").addClass("is-invalid");
								$("#repasswordMessage")
										.html(
												"<span class='text-danger'>비밀번호 확인을 입력하세요</span>");
								$("#repassword").focus();
								return;
							}
							if ($("#password").val() != $("#repassword").val()) {
								$("#repassword").addClass("is-invalid");
								$("#repasswordMessage").html("<span class='text-danger'>비밀번호가 일치 하지 않습니다.</span>");
								$("#password").val("");
								$("#repassword").focus();
								return;
							}
							if ($("#phone").val().length == 0) {
								$("#phone").addClass("is-invalid");
								$("#phoneMessage")
										.html(
												"<span class='text-danger'>핸드폰을 입력하세요</span>");
								$("#phone").focus();
								return;
							}

							if ($("#checkEmail").val() == "no") {
								return;
							}

							f.submit();
						});

		$("#name").keyup(function() {
			$("#name").removeClass("is-invalid");
			$("#nameMessage").html('');
			//내용 초기화,이젠 사라져야 하니까.
		});
		$("#email").keyup(function() {
							$("#email").removeClass("is-invalid");
							$("#emailMessage").html('');

							let regEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
							if (regEmail.test($("#email").val())) {
								$.ajax({
											type : 'GET',
											url : 'check_email_ajax.jsp?email='
													+ $("#email").val(),
											//디비랑 비교해서 
											dataType : 'json',
											error : function() {
												alert('error');
											},
											success : function(json) {
												//이렇게 비교
												//json=> {"result" : "ok or fail"}로 반환
												if(json.result=="ok") {
													//중복된걸 ok 보낼거냐 없으면 ok보낼거냐...
													//지금은 ok=db에 들고된 이메일이 없다=db등록 가능
													$("#emailMessage").html("<span class='text-success'>등록 가능한 이메일입니다.</span>");
													$("#checkEmail").val("yes");
												} else {
													// = false,중복 이메일 있을경우
													$("#email").addClass("is-invalid");
													$("#emailMessage").html("<span class='text-danger'>이미 등록된 이메일입니다.</span>");
												}
											}
										});
							}
						});
		$("#password").keyup(function() {
			$("#password").removeClass("is-invalid");
			$("#passwordMessage").html('');
		});
		$("#repassword").keyup(function() {
			$("#repassword").removeClass("is-invalid");
			$("#repasswordMessage").html('');
		});
		$("#phone").keyup(function() {
			$("#phone").removeClass("is-invalid");
			$("#phoneMessage").html('');

		});
	});
</script>