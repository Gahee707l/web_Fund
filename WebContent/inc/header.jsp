<%@ page pageEncoding="utf-8" %>

<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

  <title>Hello, world!</title>
</head>

<body>
  <!--nav bar start-->
  <nav class="navbar navbar-expand-lg navbar-dark " style="background-color: #563d7c;">
    <a class="navbar-brand" href="/index.jsp">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02"
      aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
<%
//				/dept/list.jsp , /emp/list.jsp	,	/notice/list.jsp
	String uri = request.getRequestURI();
//경로 return
%>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
      <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
        <li class="nav-item <%if(uri.startsWith("/dept")){ %> active<%} %>">
          <a class="nav-link" href="/dept/list.jsp">부서관리 </a>
        </li>
       <li class="nav-item <%if(uri.startsWith("/emp")){ %> active<%} %>">
          <a class="nav-link" href="/emp/list.jsp">사원관리 </a>
        </li>
       <!-- <li class="nav-item <%if(uri.startsWith("/notice")){ %> active<%} %>">
          <a class="nav-link" href="/notice/notice.jsp">공지사항 <span class="sr-only">(current)</span></a>
        </li>-->
        <li class="nav-item <%if(uri.startsWith("/crawling")){ %> active<%} %>">
          <a class="nav-link" href="/crawling/list.jsp">크롤링</a>
        </li>
        <!--<li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
              </li>-->
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </nav>
  <!--nav bar end-->
  
  
