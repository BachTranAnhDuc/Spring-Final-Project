$(document).ready(function() {
	$('.btn-num-product-down').on('click', function(e){
		e.preventDefault();
		productId = $(this).attr("pid");
		quantityInput = $("#quantity" + productId);
		newQuantity = parseInt(quantityInput.val()) - 1;
		
		if (newQuantity > 0) {
			quantityInput.val(newQuantity);
		} else {
			showWarningModal('Minimum quantity is 1');
		}                      	
		
        //var numProduct = Number($(this).next().val());
        //if(numProduct > 0) $(this).next().val(numProduct - 1);
    });

    $('.btn-num-product-up').on('click', function(e){
		e.preventDefault();
		productId = $(this).attr("pid");
		quantityInput = $("#quantity" + productId);
		newQuantity = parseInt(quantityInput.val()) + 1;
		
		if (newQuantity <= 5) {
			quantityInput.val(newQuantity);
		} else {
			showWarningModal('Maximum quantity is 5');
		}
		
        //var numProduct = Number($(this).prev().val());
        //$(this).prev().val(numProduct + 1);
    });
});