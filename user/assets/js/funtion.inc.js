// Profile Picture
const imgDiv = document.querySelector('#profilePicDiv');
if (imgDiv !== null) {
    const img = document.querySelector('.photo');
    const file = document.querySelector('#file');
    const uploadBtn = document.querySelector('#uploadBtn');


    imgDiv.addEventListener('mouseenter', function(){
        uploadBtn.style.display = "block";
    });

    imgDiv.addEventListener('mouseleave', function(){
        uploadBtn.style.display = "none";
    });

    file.addEventListener('change', function(){
        const choosedFile = this.files[0];

        if (choosedFile) {

            const reader = new FileReader();

            reader.addEventListener('load', function(){
                img.setAttribute('src', reader.result);
            });

            reader.readAsDataURL(choosedFile);
        }
    });
}

$(document).ready(function() {
    // Get the input fields
    var oldPassword = $("#old_password");
    var newPassword = $("#new_password");
    var confirmNewPassword = $("#confirm_new_password");

    // Add event listeners to the input fields
    newPassword.on("input", function() {
        // Compare the values of newPassword and oldPassword
        if (newPassword.val() === oldPassword.val()) {
            // Display an error message
            $("#error-message").html("New password cannot be the same as old password.");
        } else {
            // Clear the error message
            $("#error-message").html("");
        }
    });

    confirmNewPassword.on("input", function() {
        // Compare the values of newPassword and confirmNewPassword
        if (newPassword.val() !== confirmNewPassword.val()) {
            // Display an error message
            $("#error-message").html("New password and confirmed password do not match.");
        } else {
            // Clear the error message
            $("#error-message").html("");
        }
    });
});
