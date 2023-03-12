<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/includes/nav.jsp"%>
<%@ include file="/resources/includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
@import url('https://fonts.googleapis.com/css?family=Tajawal');

@import
	url('https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css')
	;
</style>
</head>

<body>

		<!-- Accordion -->
		<div class="container-fluid bg-gray" id="accordion-style-1"
			style="margin-left: 5%">
			<div class="container">
				<section>
					<div class="row">
						<div class="col-12">
							<h1 class="text-green mb-4 text-center">Q&A</h1>

							<div class="form-group pull-right"
								style="float: left; margin-left: 9%; width: 300px">
								<input type="text" name="keyword" class="search form-control"
									placeholder="What you looking for?">
							</div>
						</div>
						<div class="col-10 mx-auto">
							<div class="accordion" id="accordionExample">
								<div class="card">
									<div class="card-header" id="headingOne">
										<h5 class="mb-0">
											<button class="btn btn-link btn-block text-left"
												type="button" data-toggle="collapse"
												data-target="#collapseOne" aria-expanded="true"
												aria-controls="collapseOne">
												<i class="fa fa-amazon main"></i><i
													class="fa fa-angle-double-right mr-3"></i>How to pay
												amazon.
											</button>
										</h5>
									</div>

									<div id="collapseOne" class="collapse show fade"
										aria-labelledby="headingOne" data-parent="#accordionExample">
										<div class="card-body">
											Anim pariatur cliche reprehenderit, enim eiusmod high life
											accusamus terry richardson ad squid. 3 wolf moon officia
											aute, non cupidatat skateboard dolor brunch. Food truck
											quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
											sunt aliqua put a bird on it squid single-origin coffee nulla
											assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft
											beer labore wes anderson cred nesciunt sapiente ea proident.
											Ad vegan excepteur butcher vice lomo. Leggings occaecat craft
											beer farm-to-table, raw denim aesthetic synth nesciunt you
											probably haven't heard of them accusamus labore sustainable
											VHS.<a
												href="https://www.fiverr.com/sunlimetech/fix-your-bootstrap-html-and-css3-issues"
												class="ml-3" target="_blank"><strong>View More
													designs <i class="fa fa-angle-double-right"></i>
											</strong></a>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header" id="headingTwo">
										<h5 class="mb-0">
											<button class="btn btn-link collapsed btn-block text-left"
												type="button" data-toggle="collapse"
												data-target="#collapseTwo" aria-expanded="false"
												aria-controls="collapseTwo">
												<i class="fa fa-plus main"></i><i
													class="fa fa-angle-double-right mr-3"></i>There are many
												more.
											</button>
										</h5>
									</div>
									<div id="collapseTwo" class="collapse fade"
										aria-labelledby="headingTwo" data-parent="#accordionExample">
										<div class="card-body">
											Anim pariatur cliche reprehenderit, enim eiusmod high life
											accusamus terry richardson ad squid. 3 wolf moon officia
											aute, non cupidatat skateboard dolor brunch. Food truck
											quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
											sunt aliqua put a bird on it squid single-origin coffee nulla
											assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft
											beer labore wes anderson cred nesciunt sapiente ea proident.
											Ad vegan excepteur butcher vice lomo. Leggings occaecat craft
											beer farm-to-table, raw denim aesthetic synth nesciunt you
											probably haven't heard of them accusamus labore sustainable
											VHS.<a
												href="https://www.fiverr.com/sunlimetech/design-and-fix-your-bootstrap-4-issues"
												class="ml-3" target="_blank"><strong>View More
													designs <i class="fa fa-angle-double-right"></i>
											</strong></a>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header" id="headingThree">
										<h5 class="mb-0">
											<button class="btn btn-link collapsed btn-block text-left"
												type="button" data-toggle="collapse"
												data-target="#collapseThree" aria-expanded="false"
												aria-controls="collapseThree">
												<i class="fa fa-expeditedssl main"></i><i
													class="fa fa-angle-double-right mr-3"></i>How to enable two
												factor authentication.
											</button>
										</h5>
									</div>
									<div id="collapseThree" class="collapse fade"
										aria-labelledby="headingThree" data-parent="#accordionExample">
										<div class="card-body">
											Anim pariatur cliche reprehenderit, enim eiusmod high life
											accusamus terry richardson ad squid. 3 wolf moon officia
											aute, non cupidatat skateboard dolor brunch. Food truck
											quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
											sunt aliqua put a bird on it squid single-origin coffee nulla
											assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft
											beer labore wes anderson cred nesciunt sapiente ea proident.
											Ad vegan excepteur butcher vice lomo. Leggings occaecat craft
											beer farm-to-table, raw denim aesthetic synth nesciunt you
											probably haven't heard of them accusamus labore sustainable
											VHS.<a
												href="https://www.fiverr.com/sunlimetech/convert-bootstrap-or-html-to-wordpress-for-global-devices"
												class="ml-3" target="_blank"><strong>View More
													designs <i class="fa fa-angle-double-right"></i>
											</strong></a>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header" id="headingFour">
										<h5 class="mb-0">
											<button class="btn btn-link collapsed btn-block text-left"
												type="button" data-toggle="collapse"
												data-target="#collapseFour" aria-expanded="false"
												aria-controls="collapseFour">
												<i class="fa fa-envelope main"></i><i
													class="fa fa-angle-double-right mr-3"></i>How to contact
												us.
											</button>
										</h5>
									</div>
									<div id="collapseFour" class="collapse fade"
										aria-labelledby="headingFour" data-parent="#accordionExample">
										<div class="card-body">
											Anim pariatur cliche reprehenderit, enim eiusmod high life
											accusamus terry richardson ad squid. 3 wolf moon officia
											aute, non cupidatat skateboard dolor brunch. Food truck
											quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
											sunt aliqua put a bird on it squid single-origin coffee nulla
											assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft
											beer labore wes anderson cred nesciunt sapiente ea proident.
											Ad vegan excepteur butcher vice lomo. Leggings occaecat craft
											beer farm-to-table, raw denim aesthetic synth nesciunt you
											probably haven't heard of them accusamus labore sustainable
											VHS.<a
												href="https://www.fiverr.com/sunlimetech/do-web-development-in-pure-php-and-frameworks"
												class="ml-3" target="_blank"><strong>View More
													designs <i class="fa fa-angle-double-right"></i>
											</strong></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
</body>
</html>