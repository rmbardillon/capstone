$("#print_button").click(function(){
    const person_id = $("#person_id").val();
    const applicant_type = $("#applicant_type").val();
    const admin_username = $("#admin_username").val();
    console.log(admin_username);
    $("body > *").not("#id").hide();
    window.print();
    $("body > *").show();
});

