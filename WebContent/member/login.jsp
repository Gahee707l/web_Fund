<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>

<%//url로 치고 들어오는 것들을 막기 위한 코드
if(memberDto!=null){
	response.sendRedirect("/index.jsp");
	return;
	//로그인이 되어있어야만 접속하는 페이지들이나 로그인이 되어있지 않으면 보내는...
}

%>
<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="/index.jsp">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">로그인</li>
	</ol>
</nav>

<!--main start-->
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h3>로그인</h3>

			<form name="f" method="post" action="check_login.jsp">
				
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
			</form>
			<div class="text-right">
				<button type="button" id="loginMember" class="btn btn-outline-success">로그인</button>
			</div>
		</div>
	</div>
</div>


<!--main end-->


<%@ include file="../inc/footer.jsp"%>
<!-- 여기부터 script... -->

<script>
	$(function() {
		$("#email").focus();

		$("#loginMember").click(function() {
							if ($("#email").val().length == 0) {
								$("#email").addClass("is-invalid");
								$("#emailMessage").html("<span class='text-danger'>이메일을 입력하세요</span>");
								$("#email").focus();
								return;
							}
							if ($("#password").val().length == 0) {
								$("#password").addClass("is-invalid");
								$("#passwordMessage").html("<span class='text-danger'>비밀번호를 입력하세요</span>");
								$("#password").focus();
								return;
							}

							f.submit();
						});

		
		$("#email").keyup(function() {
							$("#email").removeClass("is-invalid");
							$("#emailMessage").html('');});
		
		$("#password").keyup(function() {
			$("#password").removeClass("is-invalid");
			$("#passwordMessage").html('');
		});
		
	});
</script>
