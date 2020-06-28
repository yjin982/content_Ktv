<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style type="text/css">
.myNewDivHeight{ 
	height: 1000px;
	width: 1000px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#admin").click(function(e) {
		window.location.href='../admin/conadminLogin.jsp';
		//var url = "../admin/conadminLogin.jsp";
		//$(location).attr('href',url);
	});
});
</script>
</head>
<body>
<%@ include file="../gogek/top.jsp" %>
<div class="container">
	<div class="row">
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner myNewDivHeight">
					<div class="carousel-item active">
						<a href="../program/programdetail.jsp?code=2"><img class="d-block w-100" src="../upload/b.jpg" alt="First slide"></a>
					</div>
					<div class="carousel-item myNewDivHeight">
						<a href="../program/programdetail.jsp?code=7"><img class="d-block w-100" src="../upload/g.jpg" alt="Second slide"></a>
					</div>
					<div class="carousel-item myNewDivHeight">
						<a href="../program/programdetail.jsp?code=11"><img class="d-block w-100" src="../upload/k.png" alt="Third slide"></a>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<br><br>
</div>
<br>
<%@ include file="../gogek/bottom.jsp" %>


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>