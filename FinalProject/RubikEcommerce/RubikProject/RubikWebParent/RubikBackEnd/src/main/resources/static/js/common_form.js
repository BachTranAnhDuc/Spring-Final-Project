$(document).ready(function() {
	$("#buttonCancel").on("click", function() {
		window.location = moduleURL;
	});

	$("#imageFile").change(function() {
		fileSize = this.files[0].size;
		alert("File size: " + fileSize);
		if (fileSize > 1048576) {
			this.setCustomValidity("You must choose an image less then 1Mb!");
			this.reportValidity();
		}
		else {
			this.reportValidity("");
			showImageThumbnail(this);
		}
	});
})

function showImageThumbnail(fileInput) {
	var file = fileInput.files[0];
	var reader = new FileReader();
	reader.onload = function(e) {
		$('#thumbnail').attr("src", e.target.result);
	};

	reader.readAsDataURL(file);
}