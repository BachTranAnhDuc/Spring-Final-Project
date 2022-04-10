$(document).ready(function() {
	$('.btn-num-product-down').on('click', function(e){
		e.preventDefault();
		    	
		decreaseQuantity($(this));
    });

    $('.btn-num-product-up').on('click', function(e){
		e.preventDefault();
		increaseQuantity($(this));
    });
});

function decreaseQuantity(link) {
	
	productId = link.attr("pid");
	quantityInput = $("#quantity" + productId);
	newQuantity = parseInt(quantityInput.val()) - 1;
		
	if (newQuantity > 0) {
		quantityInput.val(newQuantity);
		updateQuantity(productId, newQuantity);
	} 
	else {
		showWarningModal('Minimum quantity is 1');
	} 
}

function increaseQuantity(link) {
	
	productId = link.attr("pid");
	quantityInput = $("#quantity" + productId);
	newQuantity = parseInt(quantityInput.val()) + 1;
		
	if (newQuantity <= 5) {
		quantityInput.val(newQuantity);
		updateQuantity(productId, newQuantity);
	} 
	else {
		showWarningModal('Maximum quantity is 5');
	} 
}

function updateQuantity(productId, quantity) {
	url = contextPath + "cart/update/" + productId + "/" + quantity;
	
	$.ajax({
		type: "POST",
		url: url,
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfValue);
		}
	}).done(function(updatedTotalAll) {
		updateTotal(updatedTotalAll, productId);
		updateTotalAll()
	}).fail(function() {
		showErrorModal("Error while updating product to shopping cart.");
	});
}

function updateTotal(updatedTotalAll, productId) {
	formatNumber = $.number(updatedTotalAll, 2);
	$("#totalall" + productId).text(formatNumber);
}

function updateTotalAll() {
	total = 0.0;
	
	$(".subtotal").each(function(index, element) {
		total += parseFloat(element.innerHTML.replaceAll(",", ""));
	});
	
	formattedTotal = $.number(total, 2);
	$("#total").text(formattedTotal);
}