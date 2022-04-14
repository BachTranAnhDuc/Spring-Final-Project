var iconNames = {
	'PICKED':'fa-people-carry',
	'SHIPPING':'fa-shipping-fast',
	'DELIVERED':'fa-box-open',
	'RETURNED':'fa-undo'	
};

var confirmText;
var confirmModalDialog;
var yesUpdate;
var noButton;

$(document).ready(function() {
	confirmText = $("#confirmText");
	confirmModalDialog = $("#confirmModal");
	yesUpdate = $("#yes-update");
	noButton = $("#no-button");
	
	$(".link-update-status").on("click", function(e) {
		e.preventDefault();
		
		link = $(this);
		
		showUpdateConfirm(link);
	});
	
	addEventHandlerForYesUpdate();
});

function addEventHandlerForYesUpdate() {
	yesUpdate.click(function(e) {
		e.preventDefault();
		sendRequestToUpdateOrderStatus($(this));
	});
}

function sendRequestToUpdateOrderStatus(button) {
	requestURL = button.attr("href");
	
	$.ajax({
		type: 'POST',
		url: requestURL,
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfValue);
		}
	}).done(function(response) {
		showMessageModal("Order updated successfully");
		updateStatusIconColor(response.orderId, response.status);
		
		console.log(response);
	}).fail(function(err) {
		showMessageModal("Error updating order status");
	})
}

function updateStatusIconColor(orderId, status) {
	link = $("#link" + status + orderId);
	link.replaceWith("<i class='fas " + iconNames[status] + " fa-2x icon-green'></i>");
}

function showUpdateConfirm(link) {
	noButton.text("NO");
	yesUpdate.show();
	
	orderId = link.attr("orderId");
	status = link.attr("status");
	yesUpdate.attr("href", link.attr("href"));
	
	confirmText.text("Are you sure want to update status of the order ID: " + orderId + " to status: " + status + "?");
	
	confirmModalDialog.modal();
}


function showUpdateConfirmModal(link) {
	noButton.text("NO");
	yesUpdate.show();
		
	orderId = link.attr("orderId");
	status = link.attr("status");
	yesUpdate.attr("href", link.attr("href"));
	
	confirmText.text("Are you sure you want to update status of the order ID #" + orderId
					 + " to " + status + "?");
					 
	confirmModalDialog.modal();
}

function showMessageModal(message) {
	noButton.text("Close");
	yesUpdate.hide();
	confirmText.text(message);
}