<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<meta name="description" content="Citytours - Premium site template for city tours agencies, transfers and tickets.">
	<meta name="author" content="Ansonika">
	<title>CITY TOURS - City tours and travel site template by Ansonika</title>

	<!-- Favicons-->
	<link rel="shortcut icon" href="Cart/html/img/favicon.ico" type="image/x-icon">
	<link rel="apple-touch-icon" type="image/x-icon" href="Cart/html/img/apple-touch-icon-57x57-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="Cart/html/img/apple-touch-icon-72x72-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="Cart/html/img/apple-touch-icon-114x114-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="Cart/html/img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link href="https://fonts.googleapis.com/css2?family=Gochi+Hand&family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
	
	<!-- COMMON CSS -->
	<link href="Cart/html/css/bootstrap.min.css" rel="stylesheet">
    <link href="Cart/html/css/style.css" rel="stylesheet">
	<link href="Cart/html/css/vendors.css" rel="stylesheet">

	<!-- CUSTOM CSS -->
	<link href="Cart/html/css/custom.css" rel="stylesheet">
    
	<style>
    .invoice-title h2, .invoice-title h3 {
        display: inline-block;
    }
    
    .table > tbody > tr > .no-line {
        border-top: none;
    }
    
    .table > thead > tr > .no-line {
        border-bottom: none;
    }
    
    .table > tbody > tr > .thick-line {
        border-top: 2px solid;
    }
    </style>
        
    
        
</head>
<body>
 <div class="container">
    <div class="row">
        <div class="col-12">
    		<div class="invoice-title">
    			<h2>????????????</h2><h3 class="float-end">????????????# 12345</h3>
    		</div>
    		<hr>
    		<div class="row">
    			<div class="col-6">
    				<address>
    				<strong>????????????:</strong><br>
    					John Smith<br>
    					1234 Main<br>
    					Apt. 4B<br>
    					Springfield, ST 54321
    				</address>
    			</div>
    		
    		</div>
    		<div class="row">
    			<div class="col-6">
    				<address>
    					<strong>????????????:</strong><br>
    					Visa ending **** 4242<br>
    					jsmith@email.com
    				</address>
    			</div>
    			<div class="col-6 text-end">
    				<address>
    					<strong>????????????:</strong><br>
    					March 7, 2014<br><br>
    				</address>
    			</div>
    		</div>
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-lg-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>????????????</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>???????????????</strong></td>
        							<td class="text-center"><strong>????????????</strong></td>
									<td class="text-center"><strong>????????????</strong></td>
									<td class="text-center"><strong>??????</strong></td>
        							<td class="text-center"><strong>??????</strong></td>
        							<td class="text-end"><strong>??????</strong></td>
                                </tr>
    						</thead>
    						<tbody>
    							<!-- foreach ($order->lineItems as $line) or some such thing here -->
    							<tr>  <!--??????????????????????????????????????????-->
    								<td>????????????</td>
    								<td class="text-center">2022???8???3???</td>
    								<td class="text-center">10</td>
    								<td class="text-center">0</td>
									<td class="text-center">1</td>
									<td class="text-end">0</td>
    							</tr>  

                                <tr> <!--?????????????????????????????????????????????????????????*????????????-->
        							<td>????????????</td>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="text-center">15000</td>
									<td class="text-center">1</td>
									<td class="text-end">150000</td>
    							</tr>
                                <tr>
									<td>????????????</td>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="text-center">20000</td>
									<td class="text-center">1</td>
									<td class="text-end">200000</td>
    							</tr>
    						
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
									<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>??????</strong></td>
    								<td class="no-line text-end">350000</td>
    							</tr>
    						</tbody>
    					</table>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</div>

</body>
</html>