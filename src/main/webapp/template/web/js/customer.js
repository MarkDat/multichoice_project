$(document).ready(function () {
  $("#editinfo").click(function () {
    $("#save").removeClass("d-none");
    $("#editinfo").addClass("d-none");
    $("input").attr("readonly", false);
  });
  $("#save").click(function () {
    $("#editinfo").removeClass("d-none");
    $("#save").addClass("d-none");
    $("input").attr("readonly", true);
  });
});
