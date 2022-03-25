var extraImagesCount = 0;
dropdownBrands = $("#brand");
dropdownCategories = $('#category')

$(document).ready(function() {

	$("#shortDescription").richText();
	$("#fullDescription").richText();

	dropdownBrands.change(function() {
		dropdownCategories.empty();
		getCategories();
	});
	getCategories();
	
	$("input[name='extraImage']").each(function(index) {
		extraImagesCount++;
		$(this).change(function() {
			
			showExtraImageThumbnail(this, index);
		});
	});

});

function showExtraImageThumbnail(fileInput, index) {
	var file = fileInput.files[0];
	var reader = new FileReader();
	reader.onload = function(e) {
		$("#extraThumbnail" + index).attr("src", e.target.result);
	};

	reader.readAsDataURL(file);
	
	if (index >= extraImagesCount - 1) {
		addNextExtraImageSection(index + 1);
	}
}

function addNextExtraImageSection(index) {
	htmlExtraImage = `
		<div class="col border m-3 p-2" id="divExtraImage${index}">
			<div id="extraImageHeader${index}">
				<label>Extra Image #${index + 1}:</label>
			</div>
				
			<div class="m-2">
				<img id="extraThumbnail${index}" alt="Extra Image #${index + 1} Preview" class="img-fluid"
					src="${defaultImageThumbnailSrc}"/>
			</div>
			
			<div>
				<input type="file" name="extraImage" 
					accept="image/png, image/jpeg, image/jpg"
					onchange="showExtraImageThumbnail(this, ${index})"/>
			</div>
		</div>
	`;
	
	htmlLinkRemove = `
		<a class="btn fas fa-times-circle fa-2x float-right" 
			title="Remove this image"
			href="javascript:removeExtraImage(${index - 1})"></a>
	`;
	
	$("#divProductImages").append(htmlExtraImage);
	
	$("#extraImageHeader" + (index - 1)).append(htmlLinkRemove);
	
	extraImagesCount++;
}

function removeExtraImage(index) {
	
	$("#divExtraImage" + index).remove();
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