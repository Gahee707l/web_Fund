<%@ page pageEncoding="utf-8" %>
<%@ include file="../inc/header.jsp" %>

  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="#">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">파일업로드</li>
    </ol>
  </nav>

  <!--main start-->
  <h3>파일업로드</h3>
  <%--파일업로드시 form 엘리먼트에 enctype(입크립션 타입?)속성 반드시 추가.post method(방식)여야 함. --%>

			<form name="f" method="post" enctype="multipart/form-data" action="upload.jsp">
			<%--									이부분 때문에,parameter로 전달되지 않는다. --%>
				<div class="form-group">
				<div class="col-sm-12">
				<input type="text" class="form-control" placeholder="이름을 입력하세요." id="name" name="name">
				</div>
				</div>
<%-- 	<div class="custom-file">
    <input type="file" class="custom-file-input" id="validatedCustomFile" required>
    <label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
    레이블이 내부로 들어가 choose file이 들어가 있는셈... 
    <div class="invalid-feedback">Example invalid custom file feedback</div>
  </div>
  --%>
  
  <div class="form-group">
    <input type="file" class="form-control" id="file" name = "file" >
    <div class="invalid-feedback">Example invalid custom file feedback</div>
  </div>
  
				
			</form>
			<%if(memberDto != null) {%>
				<button type="button" id="uploadFile" class="btn btn-outline-success">저장</button>
					<%} %>



  <!--main end-->
  
  
 <%@ include file="../inc/footer.jsp" %>
 
 <script >
 $(function(){
	 $("#uploadFile").click(function(){
		 f.submit();
	 });
	 
	 
 }); 
</script>
  