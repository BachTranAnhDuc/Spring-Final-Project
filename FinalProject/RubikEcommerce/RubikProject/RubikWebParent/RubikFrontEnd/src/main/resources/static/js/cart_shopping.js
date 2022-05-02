decimalSeparator = decimalPointType == 'COMMA' ? ',' : '.';
thousandsSeparator = thousandsPointType == 'COMMA' ? ',' : '.'; 

$(document).ready(function() {
	$('.btn-num-product-down').on('click', function(e){
		e.preventDefault();
		    	
		decreaseQuantity($(this));
    });

    $('.btn-num-product-up').on('click', function(e){
		e.preventDefault();
		increaseQuantity($(this));
    });
    
    $(".linkRemove").on("click", function(evt) {
		evt.preventDefault();
		removeProduct($(this));
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
	//formatNumber = $.number(updatedTotalAll, 2);
	//$("#totalall" + productId).text(formatCurrency(updatedTotalAll));
	$("#subtotal" + productId).text(formatCurrency(updatedTotalAll));
}

function updateTotalAll() {
	total = 0.0;
	productCount = 0;
	
	$(".subtotal").each(function(index, element) {
		productCount++;
		total += parseFloat(clearCurrencyFormat(element.innerHTML));
	});
	
	if (productCount < 1) {
		showEmptyShoppingCart();
	}
	else {
		$("#total").text(formatCurrency(total));
		$("#total1").text(formatCurrency(total));
	}
	
}

function formatCurrency(amount) {
	return $.number(amount, decimalDigits, decimalSeparator, thousandsSeparator);
}

function clearCurrencyFormat(numberString) {
	result = numberString.replaceAll(thousandsSeparator, "");
	return result.replaceAll(decimalSeparator, ".");
}

function showEmptyShoppingCart() {
	$("#sectionTotal").hide();
	$("#sectionEmptyCartMessage").removeClass("d-none");
}

function removeProduct(link) {
	url = link.attr("href");

	$.ajax({
		type: "DELETE",
		url: url,
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfValue);
		}
	}).done(function(response) {
		rowNumber = link.attr("rowNumber");
		removeProductHTML(rowNumber);
		updateTotal();
		
		showModalDialog("Shopping Cart", response);
		
	}).fail(function() {
		showErrorModal("Error while removing product.");
	});				
}

function removeProductHTML(rowNumber) {
	$("#row" + rowNumber).remove();
}