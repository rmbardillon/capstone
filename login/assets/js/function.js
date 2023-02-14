$(document).ready(function() {
  $(".toggle-password").click(function() {
    const passwordField = $("#password");

    if (passwordField.attr("type") === "password") {
      passwordField.attr("type", "text");
      $(this).find("i").removeClass("fa-eye").addClass("fa-eye-slash");
    } else {
      passwordField.attr("type", "password");
      $(this).find("i").removeClass("fa-eye-slash").addClass("fa-eye");
    }

    return false; // prevent the link from triggering navigation
  });
});
