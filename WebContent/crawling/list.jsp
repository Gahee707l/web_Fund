<%@page import="java.util.Calendar"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="java.util.Date"%>
<%@ page pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ include file="../inc/header.jsp"%>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">사원관리</li>
	</ol>
</nav>

<%
	//비어있는 파라미터에 없다면 디폴트 값을 다 미리 넣는거 잊지 말자
	//Calendar c = Calendar.getInstance();
	Date sd = new Date();
	int sYear = sd.getYear();
	int sMon = sd.getMonth();
	
	int sDay= sd.getDate();
	String coin="bitcoin";
	int eYear = sYear-1;
	int eMon = sd.getMonth();
	int eDay = sDay;
	
	if(request.getParameter("sDay").length()!=0 || request.getParameter("sDay")!=null){
		sDay = Integer.parseInt(request.getParameter("sDay"));
	}
	if(request.getParameter("coin").length()!=0 || request.getParameter("coin")!=null){
		coin = request.getParameter("coin");
	}
	if(request.getParameter("eDay").length()!=0 || request.getParameter("eDay")!=null){
		coin = request.getParameter("eDay");
	}
	if(request.getParameter("eDay").length()!=0 || request.getParameter("eDay")!=null){
		
	}

	Document doc = null;
	Elements elements = null;

	String srcURI = "https://coinmarketcap.com/currencies/bitcoin/historical-data/?start=20171101&end=20191203";
	//https://twitter.com/medievalart_kr
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	//String month = sdf.ap;
	//써먹을 포맷 지정

	try {
		doc = Jsoup.connect(srcURI).get();
		elements = doc.select(".cmc-table__table-wrapper-outer table tbody tr");

	} catch (IOException e) {
		e.printStackTrace();
	}
	//.js-tweet-text-container p
	//".js-stream-item"
%>

<!--main start-->
<%--선택바의 내용에 따라 나오도록 만들것 --%>
<form name="f" method="post" action="list.jsp">
	<div class="form-group row">
		<label for="no" class="col-sm-3 col-form-label">코인선택</label>
		<div class="form-group col-sm-9">
			<select id="coin" name="coin" class="form-control">
				<option selected>Coin...</option>
				<option value="bitcoin" selected>비트코인</option>
				<option value="ethereum">이더리움</option>
				<option value="xrp">리플</option>
				<option value="bitcoin-cash">비트코인캐쉬</option>
				<option value="litecoin">라이트코인</option>
			</select>
		</div>
	</div>
	<div class="form-group row">
		<label for="no" class="col-sm-3 col-form-label">시작날짜</label>
		<div class="form-group col-sm-3">
			<select id="startYear" name="startYear" class="form-control">
				<option selected>Year...</option>

				<%
					for(int y = 2009; y <= sYear; y++){
				%>
				<option value="<%=y%>"></option>
				<%
					}
				%>
			</select>
		</div>
		<div class="form-group col-sm-3">
			<select id="endMonth" name="endMonth" class="form-control">
				<option selected>Month...</option>
				<%
					for(int m = 1; m <= 12; m++){
				%>
				<option value="<%=m%>"></option>
				<%
					}
				%>
			</select>
		</div>
		<div class="form-group col-sm-3">
			<select id="endDay" name="endDay" class="form-control">
				<option selected>Day...</option>
				<%
					for (int d = 1; d <= 31; d++) {
				%>
				<option value="<%=d%>"></option>
				<%
					}
				%>
			</select>
		    </div>
		  </div>
		  <div class="text-right">
			<button type="button" id="searchCoin" class="btn btn-outline-success">검색</button>
        </div>
		</form>
		<h3></h3>
		<div class="table-responsive-lg">
			<table class="table table-hover">
				<colgroup>
					<col width="10%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
				</colgroup>
				<thead>
					<%
						
					%>

					<tr>
						<th scope="col">Date</th>
						<th scope="col">Open</th>
						<th scope="col">High</th>
						<th scope="col">Low</th>
						<th scope="col">Close</th>
						<th scope="col">Volume</th>
						<th scope="col">MerketCap</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < elements.size(); i++) {
							Element tbElement = elements.get(i);
					%>
					<%
						for (int index = 0; index < tbElement.childNodeSize(); index++) {
								String date = tbElement.child(index++).text();
					%>
					<tr>
						<td><%=date%></td>
						<td>double open =
							Double.parseDouble(tbElement.child(index++).text().replace);</td>
						<td>String high = tbElement.child(index++).text();</td>
						<td>String low = tbElement.child(index++).text();</td>
						<td>String close = tbElement.child(index++).text();</td>
						<td>long volume = tbElement.child(index++).text();</td>
						<td>long cap = tbElement.child(index++).text();</td>
					</tr>
					<%
						}
					%>
					<%
						}
					%>
					<tr>
						<td colspan="6">데이터가 존재하지 않습니다.</td>
					</tr>
					<%%>
				</tbody>
			</table>

		</div>

		<%@ include file="../inc/footer.jsp"%>

<script>
  	$("#searchCoin").click(function(){
  		f.submit();
  	});
  </script>
		<%--

<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

  <title>Our Site!</title>
</head>

<body>
  <!-- navbar start    -->
  <nav class="navbar navbar-expand-lg navbar-dark" style="background-color:#563d7c;">
    <a class="navbar-brand" href="/index.jsp">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02"
      aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
	
    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
      <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
        <li class="nav-item ">
          <a class="nav-link" href="/dept/list.jsp">부서관리</a>
        </li>
        <li class="nav-item ">
          <a class="nav-link" href="/emp/list.jsp">사원관리</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="/crawling/list.jsp">크롤링</a>
        </li>
        <li class="nav-item ">
          <a class="nav-link" href="/notice/list.jsp">공지사항</a>
        </li>

      </ul>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </nav>
  <!-- navbar end-->
  
    
  <!-- breadcrumb start-->
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="#">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">Library</li>
    </ol>
  </nav>
  <!-- breadcrumb end-->

  <!-- main start-->
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
		
		<h3>Crawling(bitcoin)</h3>
		<form name="f" method="post" action="list.jsp">
		  <div class="form-group row">
		    <label for="no" class="col-sm-3 col-form-label">코인선택</label>
		    <div class="form-group col-sm-9">
		      <select id="coin" name="coin" class="form-control">
		        <option selected>Coin...</option>
		        <option value="bitcoin" selected>비트코인</option>
		        <option value="ethereum" >이더리움</option>
		        <option value="xrp" >리플</option>
		        <option value="bitcoin-cash" >비트코인캐쉬</option>
		        <option value="litecoin" >라이트코인</option>
		      </select>
		    </div>
		    
		  </div>
		  <div class="form-group row">
		    <label for="no" class="col-sm-3 col-form-label">시작날짜</label>
		    <div class="form-group col-sm-3">
		      <select id="startYear" name="startYear" class="form-control">
		        <option selected>Year...</option>
		        
		        <option value="2010" >2010</option>
		        
		        <option value="2011" >2011</option>
		        
		        <option value="2012" >2012</option>
		        
		        <option value="2013" >2013</option>
		        
		        <option value="2014" >2014</option>
		        
		        <option value="2015" >2015</option>
		        
		        <option value="2016" >2016</option>
		        
		        <option value="2017" >2017</option>
		        
		        <option value="2018" selected>2018</option>
		        
		        <option value="2019" >2019</option>
		        
		      </select>
		    </div>
		    <div class="form-group col-sm-3">
		      <select id="startMonth" name="startMonth" class="form-control">
		        <option selected>Month...</option>
		        
		        <option value="1" >1</option>
		        
		        <option value="2" >2</option>
		        
		        <option value="3" >3</option>
		        
		        <option value="4" >4</option>
		        
		        <option value="5" >5</option>
		        
		        <option value="6" >6</option>
		        
		        <option value="7" >7</option>
		        
		        <option value="8" >8</option>
		        
		        <option value="9" >9</option>
		        
		        <option value="10" >10</option>
		        
		        <option value="11" >11</option>
		        
		        <option value="12" selected>12</option>
		        
		      </select>
		    </div>
		    <div class="form-group col-sm-3">
		      <select id="startDay" name="startDay"  class="form-control">
		        <option selected>Day...</option>
		        
		        <option value="1" >1</option>
		        
		        <option value="2" >2</option>
		        
		        <option value="3" >3</option>
		        
		        <option value="4" >4</option>
		        
		        <option value="5" >5</option>
		        
		        <option value="6" >6</option>
		        
		        <option value="7" >7</option>
		        
		        <option value="8" >8</option>
		        
		        <option value="9" >9</option>
		        
		        <option value="10" >10</option>
		        
		        <option value="11" >11</option>
		        
		        <option value="12" >12</option>
		        
		        <option value="13" >13</option>
		        
		        <option value="14" >14</option>
		        
		        <option value="15" >15</option>
		        
		        <option value="16" >16</option>
		        
		        <option value="17" >17</option>
		        
		        <option value="18" >18</option>
		        
		        <option value="19" >19</option>
		        
		        <option value="20" selected>20</option>
		        
		        <option value="21" >21</option>
		        
		        <option value="22" >22</option>
		        
		        <option value="23" >23</option>
		        
		        <option value="24" >24</option>
		        
		        <option value="25" >25</option>
		        
		        <option value="26" >26</option>
		        
		        <option value="27" >27</option>
		        
		        <option value="28" >28</option>
		        
		        <option value="29" >29</option>
		        
		        <option value="30" >30</option>
		        
		        <option value="31" >31</option>
		        
		      </select>
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="endYear" class="col-sm-3 col-form-label">끝날짜</label>
		    <div class="form-group col-sm-3">
		      <select id="endYear" name="endYear" class="form-control">
		        <option selected>Year...</option>
		        
		        <option value="2010" >2010</option>
		        
		        <option value="2011" >2011</option>
		        
		        <option value="2012" >2012</option>
		        
		        <option value="2013" >2013</option>
		        
		        <option value="2014" >2014</option>
		        
		        <option value="2015" >2015</option>
		        
		        <option value="2016" >2016</option>
		        
		        <option value="2017" >2017</option>
		        
		        <option value="2018" >2018</option>
		        
		        <option value="2019" selected>2019</option>
		        
		      </select>
		    </div>
		    <div class="form-group col-sm-3">
		      <select id="endMonth" name="endMonth" class="form-control">
		        <option selected>Month...</option>
		        
		        <option value="1" >1</option>
		        
		        <option value="2" >2</option>
		        
		        <option value="3" >3</option>
		        
		        <option value="4" >4</option>
		        
		        <option value="5" >5</option>
		        
		        <option value="6" >6</option>
		        
		        <option value="7" >7</option>
		        
		        <option value="8" >8</option>
		        
		        <option value="9" >9</option>
		        
		        <option value="10" >10</option>
		        
		        <option value="11" >11</option>
		        
		        <option value="12" selected>12</option>
		        
		      </select>
		    </div>
		    <div class="form-group col-sm-3">
		      <select id="endDay" name="endDay"  class="form-control">
		        <option selected>Day...</option>
		        
		        <option value="1" >1</option>
		        
		        <option value="2" >2</option>
		        
		        <option value="3" >3</option>
		        
		        <option value="4" >4</option>
		        
		        <option value="5" >5</option>
		        
		        <option value="6" >6</option>
		        
		        <option value="7" >7</option>
		        
		        <option value="8" >8</option>
		        
		        <option value="9" >9</option>
		        
		        <option value="10" >10</option>
		        
		        <option value="11" >11</option>
		        
		        <option value="12" >12</option>
		        
		        <option value="13" >13</option>
		        
		        <option value="14" >14</option>
		        
		        <option value="15" >15</option>
		        
		        <option value="16" >16</option>
		        
		        <option value="17" >17</option>
		        
		        <option value="18" >18</option>
		        
		        <option value="19" >19</option>
		        
		        <option value="20" selected>20</option>
		        
		        <option value="21" >21</option>
		        
		        <option value="22" >22</option>
		        
		        <option value="23" >23</option>
		        
		        <option value="24" >24</option>
		        
		        <option value="25" >25</option>
		        
		        <option value="26" >26</option>
		        
		        <option value="27" >27</option>
		        
		        <option value="28" >28</option>
		        
		        <option value="29" >29</option>
		        
		        <option value="30" >30</option>
		        
		        <option value="31" >31</option>
		        
		      </select>
		    </div>
		  </div>
		  
		</form>
		<div class="text-right">
			<button type="button" id="searchCoin" class="btn btn-outline-success">검색</button>
        </div>
		<div class="table-responsive-lg">
			<table class="table table-hover">
	          <colgroup>
	            <col width="10%"/>
	          	<col width="15%"/>
	          	<col width="15%"/>
	          	<col width="15%"/>
	          	<col width="15%"/>
	          	<col width="15%"/>
	          	<col width="15%"/>
	          </colgroup>
			  <thead>
			    <tr>
			      <th scope="col">Date</th>
			      <th scope="col">Open</th>
			      <th scope="col">High</th>
			      <th scope="col">Low</th>
			      <th scope="col">Close</th>
			      <th scope="col">Volume</th>
			      <th scope="col">Market Cap</th>
			    </tr>
			  </thead>
			  <tbody>
			    
			    <tr>
			    
			   
			  </tbody>
			</table>
		</div>
        
      </div>
    </div>
  </div>
  <!-- main end-->
  

  <!-- footer start-->
  <footer class="bg-dark bd-footer" style="color:white;padding:1em;margin-top: 1em;">
    <div class="container-fluid text-center">
      <p>Since 2019-12-13</p>
    </div>
  </footer>
  <!-- footer end-->
  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"></script>
</body>

</html> 
  
  <script>
  	$("#searchCoin").click(function(){
  		f.submit();
  	});
  </script>
  
  
  
--%>