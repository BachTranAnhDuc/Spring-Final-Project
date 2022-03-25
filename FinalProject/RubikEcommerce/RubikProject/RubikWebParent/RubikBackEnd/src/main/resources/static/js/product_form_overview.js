
dropdownBrands = $("#brand");
dropdownCategories = $('#category')

$(document).ready(function() {

	$("#shortDescription").richText();
	$("#fullDescription").richText();

	dropdownBrands.change(function() {
		dropdownCategories.empty();
		getCategories();
	});
	getCategoriesForNewForm();
});

function getCategoriesForNewForm() {
	catIdField = $("#categoryId");
	editMode = false;
	
	if (catIdField.length) {
		editMode = true;
	}
	
	if (!editMode) getCategories();
}

function checkFileSize(fileInput) {
	fileSize = fileInput.files[0].size;

	if (fileSize > 10485760) {
		fileInput.setCustomValidity("You must choose an image less than 10485760 bytes!");
		fileInput.reportValidity();

		return false;
	} else {
		fileInput.setCustomValidity("");

		return true;
	}
}


function getCategories() {
	brandId = dropdownBrands.val();
	url = brandModuleURL + "/" + brandId + "/categories";

	$.get(url, function(responseJson) {
		$.each(responseJson, function(index, category) {
			$("<option>").val(category.id).text(category.name).appendTo(dropdownCategories);
		});
	});
};

function checkUnique(form) {
	productId = $("#id").val();
	productName = $("#name").val();

	csrfValue = $("input[name='_csrf']").val();

	

	params = { id: productId, name: productName, _csrf: csrfValue };

	$.post(checkUniqueURL, params, function(response) {
		if (response == "OK") {
			form.submit();
		} else if (response == "Duplicate") {
			showWarningModal("There is another brand having same name " + productName);
		} else {
			showErrorModal("Unknown response from server");
		}

	}).fail(function() {
		showErrorModal("Could not connect to the server");
	});

	return false;
}