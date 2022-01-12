<%@include file="includes/importTag.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.babyboy.model.Status"%>
<!DOCTYPE html>
<html>
<head>
<title>Shopping Order</title>
<%@include file="includes/head.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>

	<div class="card-header text-center py-5 my-3">
		<h4 class="fs-1 text-success">Order</h4>
		<div>
			<a href="<c:url value='/'/>" clas="fs-3">Home</a> - Shop
		</div>
	</div>

	<div class="container">
		<c:forEach items="${bills }" var="bill">
			<div class="row my-4 p-2 bg-light flex-column-reverse flex-md-row">
				<div class="col-12 col-md-8">
					<c:forEach items="${bill.getCarts() }" var="cart">
						<div class="card shadow-0 border mb-4">
							<div class="card-body p-2">
								<div class="row">
									<div class="col-md-2">
										<img src="${cart.getProduct().getImageUrl()}"
											class="img-fluid" alt="Phone"
											style="width:4rem; height: 4rem; object-fit: cover;">
									</div>
									<div
										class="col-md-2 flex-grow-1 text-center d-flex align-items-center">
										<p class="text-muted mb-0">${cart.getProduct().getName() }</p>
									</div>
									<div
										class="col-md-2 text-center d-flex  align-items-center">
										<p class="text-muted mb-0 small text-nowrap">Category:
											${cart.getProduct().getCategory().getName() }</p>
									</div>
									<div
										class="col-md-2 text-center d-flex  align-items-center">
										<p class="text-muted mb-0 small">Quantity:
											${cart.getQuantity() }</p>
									</div>
									<div
										class="col-md-2 text-center d-flex  align-items-center">
										<p class="text-muted mb-0 small">$${cart.getProduct().getPrice()
											}</p>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="col-12 col-md-4 mt-2 mt-md-0 d-flex flex-column ">
					<div class="mb-4">
						<h3 class="fs-4 text-uppercase">Status: <span class="text-danger">${bill.getStatus() }</span></h3>
						<div>Receiver: ${bill.getName() }</div>
						<div>Phone: ${bill.getPhone()}</div>
						<div>Address: ${bill.getAddress() }</div>
						<div>More Information: ${bill.getMoreInfo() }</div>
					</div>
					<div>
						<c:if test="${bill.getStatus().equals(Status.PROCESSING) }">
							<button class="btn btn-outline-warning me-2"
								onclick="handleCancelBill(${bill.getId()}, ${bill.getStatus() })"
							>
							Cancel</button>
						</c:if>
						<c:if test="${!bill.getStatus().equals(Status.PROCESSING) }">
							<button class="btn btn-outline-warning me-2 disabled ">Cancel</button>
						</c:if>
						<c:if test="${bill.getStatus().equals(Status.DONE) }">
							<a class="btn btn-outline-danger ">Remove</a>
						</c:if>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<%@include file="includes/footer.jsp"%>
	<%@include file="includes/script.jsp"%>
	
	<script>
		function handleCancelBill(billId, status) {
			if(status !== 'PROCESSING') {
				
			} else {
				alert("This order is moving. You can't cancel this bill")
			}
		}	
	</script>
</body>
</html>