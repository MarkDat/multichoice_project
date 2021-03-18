$(document).ready(function() {
	$("#editinfo").click(function() {
		$("#save").removeClass("d-none");
		$("#editinfo").addClass("d-none");
		$("input").attr("readonly", false);
		$("#email").attr("readonly", true);
	});
	$("#save").click(function() {
		$("#editinfo").removeClass("d-none");
		$("#save").addClass("d-none");
		$("input").attr("readonly", true);
	});
});
