
$("#print_button").click(function(){
    const person_id = $("#person_id").val();
    const applicant_type = $("#applicant_type").val();
    const admin_username = $("#admin_username").val();
    console.log(admin_username);
    $("body > *").not("#id").hide();
    window.print();
    $("body > *").show();
    $.ajax({
        type: "POST",
        url: "http://localhost/capstone/administrator/includes/insertid.inc.php",
        dataType: "json",
        data:{
            person_id: person_id,
            applicant_type: applicant_type,
            admin_username: admin_username
        },
        success: function (response) 
        {
            window.location.href = "http://localhost/capstone/administrator/print-id.html";
        },
        error: function(xhr, status, error) {
            console.log("An error occurred: " + error);
        }
    });
});