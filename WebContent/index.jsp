<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>

<!--bread crumb start-->

<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="/index.jsp">Home</a></li>
	</ol>
</nav>


<!--brad curmb end-->

<!--main start-->
<div class="container">
	<div class="row">
		<div class="col-lg-12"></div>
		<div class="alert alert-warning" role="alert">A simple warning
			alert—check it out!</div>
		<div class="alert alert-warning" role="alert">A simple warning
			alert—check it out!</div>
		<ul class="list-group">
			<li class="list-group-item active">Cras justo odio</li>
			<li class="list-group-item">Dapibus ac facilisis in</li>
			<li class="list-group-item">Morbi leo risus</li>
			<li class="list-group-item">Porta ac consectetur ac</li>
			<li class="list-group-item">Vestibulum at eros</li>
		</ul>
	</div>
	<div class="alert alert-primary" role="alert">A simple primary
		alert—check it out!</div>
	<div class="alert alert-secondary" role="alert">A simple
		secondary alert—check it out!</div>

	<dl class="row">
		<dt class="col-sm-3">Description lists</dt>
		<dd class="col-sm-9">A description list is perfect for defining
			terms.</dd>

		<dt class="col-sm-3">Euismod</dt>
		<dd class="col-sm-9">
			<p>Vestibulum id ligula porta felis euismod semper eget lacinia
				odio sem nec elit.</p>
			<p>Donec id elit non mi porta gravida at eget metus.</p>
		</dd>

		<dt class="col-sm-3">Malesuada porta</dt>
		<dd class="col-sm-9">Etiam porta sem malesuada magna mollis
			euismod.</dd>

		<dt class="col-sm-3 text-truncate">Truncated term is truncated</dt>
		<dd class="col-sm-9">Fusce dapibus, tellus ac cursus commodo,
			tortor mauris condimentum nibh, ut fermentum massa justo sit amet
			risus.</dd>

		<dt class="col-sm-3">Nesting</dt>
		<dd class="col-sm-9">
			<dl class="row">
				<dt class="col-sm-4">Nested definition list</dt>
				<dd class="col-sm-8">Aenean posuere, tortor sed cursus feugiat,
					nunc augue blandit nunc.</dd>
			</dl>
		</dd>
	</dl>


</div>

<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link" href="#">Previous</a></li>
		<li class="page-item"><a class="page-link" href="#">1</a></li>
		<li class="page-item"><a class="page-link" href="#">2</a></li>
		<li class="page-item"><a class="page-link" href="#">3</a></li>
		<li class="page-item"><a class="page-link" href="#">Next</a></li>
	</ul>
</nav>



<!--main end-->


<%@ include file="../inc/footer.jsp"%>
