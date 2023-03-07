$(document).ready( function () {
    var mainAdministratorsTable = $('#mainAdministrators').DataTable({
        
        buttons:['copy', 'csv', 'excel', 'pdf', 'print']
        
    });
    var pwdAdministratorsTable = $('#pwdAdministrators').DataTable({
        
        buttons:['copy', 'csv', 'excel', 'pdf', 'print']
        
    });
    var soloparentAdministratorsTable = $('#soloparentAdministrators').DataTable({
        
        buttons:['copy', 'csv', 'excel', 'pdf', 'print']
        
    });
    var srCitizenAdministratorsTable = $('#srCitizenAdministrators').DataTable({
        
        buttons:['copy', 'csv', 'excel', 'pdf', 'print']
        
    });
    var pwdDataTable = $('#pwdDataTable').DataTable({
        
        buttons:['copy', 'csv', 'excel', 'pdf', 'print']
        
    });
    var spDataTable = $('#spDataTable').DataTable({
        
        buttons:['copy', 'csv', 'excel', 'pdf', 'print']
        
    });
    var scDataTable = $('#scDataTable').DataTable({
        
        buttons:['copy', 'csv', 'excel', 'pdf', 'print']
        
    });
    var announcementsTable = $('#announcements').DataTable({
        
        buttons:['copy', 'csv', 'excel', 'pdf', 'print']
        
    });
    var pwdID = $('#pwdIDTable').DataTable({
        
        buttons:['copy', 'csv', 'excel', 'pdf', 'print'],
        columnDefs: [
            {width: 1, targets: 0}
        ]
        
    });
    var spID = $('#spIDTable').DataTable({
        
        buttons:['copy', 'csv', 'excel', 'pdf', 'print'],
        columnDefs: [
            {width: 1, targets: 0}
        ]
        
    });
    var scID = $('#scIDTable').DataTable({
        
        buttons:['copy', 'csv', 'excel', 'pdf', 'print'],
        columnDefs: [
            {width: 1, targets: 0}
        ]
        
    });
    pwdID.buttons().container().appendTo('#pwdIDTable_wrapper .col-md-6:eq(0)');
    spID.buttons().container().appendTo('#spIDTable_wrapper .col-md-6:eq(0)');
    scID.buttons().container().appendTo('#scIDTable_wrapper .col-md-6:eq(0)');
    mainAdministratorsTable.buttons().container().appendTo('#mainAdministrators_wrapper .col-md-6:eq(0)');
    pwdAdministratorsTable.buttons().container().appendTo('#pwdAdministrators_wrapper .col-md-6:eq(0)');
    soloparentAdministratorsTable.buttons().container().appendTo('#soloparentAdministrators_wrapper .col-md-6:eq(0)');
    srCitizenAdministratorsTable.buttons().container().appendTo('#srCitizenAdministrators_wrapper .col-md-6:eq(0)');
    pwdDataTable.buttons().container().appendTo('#pwdDataTable_wrapper .col-md-6:eq(0)');
    spDataTable.buttons().container().appendTo('#spDataTable_wrapper .col-md-6:eq(0)');
    scDataTable.buttons().container().appendTo('#scDataTable_wrapper .col-md-6:eq(0)');
    announcementsTable.buttons().container().appendTo('#announcements_wrapper .col-md-6:eq(0)');
    
});

// GENERATE UUID
function generateUUID() {
  var cryptoObj = window.crypto || window.msCrypto;
  var uuid = '';
  var byteArray = new Uint8Array(8);
  cryptoObj.getRandomValues(byteArray);
  for (var i = 0; i < byteArray.length; i++) {
    uuid += byteArray[i].toString(16).padStart(2, '0');
  }
  return uuid;
}

// Announcement
$('#announcementFor').val() == "Senior Citizen" ? $("#coveredMonths").show() : $("#coveredMonths").hide();
$('#announcementFor').change(function() {
    if($(this).val() == "Senior Citizen") {
        $("#coveredMonths").show();
        $("#from").prop("disabled", false);
    } else {
        $("#coveredMonths").hide();
    }
});

// Sweet Alert
$(".deleteAnnouncement").click(function(event) {
    event.preventDefault(); // prevent the default behavior of the anchor tag

    const deleteUrl = $(this).attr('href'); // store the URL of the anchor tag

    Swal.fire({
        position: 'center',
        icon: 'warning',
        title: 'Are you sure you want to delete?',
        showConfirmButton: true,
        showCancelButton: true, // show "Cancel" button
        confirmButtonColor: '#dc3545', // set color of "OK" button
        cancelButtonColor: '#6c757d', // set color of "Cancel" button
        confirmButtonText: 'Yes, delete it',
        cancelButtonText: 'Cancel' // customize text of "Cancel" button
    }).then((result) => {
        if (result.isConfirmed) {
            // User clicked "OK", perform deletion here
            $.ajax({
                url: deleteUrl, // use the stored URL for the AJAX request
                method: 'POST',
                data: {
                    delete: "<?php echo $announcement['ANNOUNCEMENT_ID']; ?>"
                },
                success: function(response) {
                    // Handle successful deletion here
                    console.log(response);
                    // Redirect to the URL specified in the href attribute
                    window.location.href = deleteUrl;
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    // Handle error here
                    console.log(textStatus, errorThrown);
                }
            });
        }
    });
});

$(".deleteAdmin").click(function(event) {
    event.preventDefault(); // prevent the default behavior of the anchor tag

    const deleteUrl = $(this).attr('href'); // store the URL of the anchor tag

    Swal.fire({
        position: 'center',
        icon: 'warning',
        title: 'Are you sure you want to delete?',
        showConfirmButton: true,
        showCancelButton: true, // show "Cancel" button
        confirmButtonColor: '#dc3545', // set color of "OK" button
        cancelButtonColor: '#6c757d', // set color of "Cancel" button
        confirmButtonText: 'Yes, delete it',
        cancelButtonText: 'Cancel' // customize text of "Cancel" button
    }).then((result) => {
        if (result.isConfirmed) {
            // User clicked "OK", perform deletion here
            $.ajax({
                url: deleteUrl, // use the stored URL for the AJAX request
                method: 'POST',
                data: {
                    delete: "<?php echo $admin['id']; ?>"
                },
                success: function(response) {
                    // Handle successful deletion here
                    console.log(response);
                    // Redirect to the URL specified in the href attribute
                    window.location.href = deleteUrl;
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    // Handle error here
                    console.log(textStatus, errorThrown);
                }
            });
        }
    });
});

$("#logout").click(function(event) {
    event.preventDefault(); // prevent the default behavior of the anchor tag

    const deleteUrl = $(this).attr('href'); // store the URL of the anchor tag

    Swal.fire({
        position: 'center',
        icon: 'warning',
        title: 'Are you sure you want to logout?',
        showConfirmButton: true,
        showCancelButton: true, // show "Cancel" button
        confirmButtonColor: '#dc3545', // set color of "OK" button
        cancelButtonColor: '#6c757d', // set color of "Cancel" button
        confirmButtonText: 'Yes, log out',
        cancelButtonText: 'Cancel' // customize text of "Cancel" button
    }).then((result) => {
        if (result.isConfirmed) {
            // User clicked "OK", perform deletion here
            $.ajax({
                url: deleteUrl, // use the stored URL for the AJAX request
                method: 'POST',
                data: {
                    delete: "<?php echo $announcement['ANNOUNCEMENT_ID']; ?>"
                },
                success: function(response) {
                    // Handle successful deletion here
                    console.log(response);
                    // Redirect to the URL specified in the href attribute
                    window.location.href = deleteUrl;
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    // Handle error here
                    console.log(textStatus, errorThrown);
                }
            });
        }
    });
});

var formName; // declare a variable to store formName
$("#save_name").click(function(){
    // Get applicant's name, save form data to JSON file, and submit form
    var applicantName = new URLSearchParams(window.location.search).get('name');
    var applicantType = $('#applicantType').val();

    // Check if formName already exists
    if(formName === undefined) {
        var applicantName = $('#applicant-name').val();
        formName = generateUUID();
    }
    var formData = $('form').serializeArray();
    var jsonData = {
        "formName": formName,
        "formData": formData,
        "applicantName": applicantName,
        "applicantType": applicantType
    };
    $.ajax({
        type: "POST",
        url: "includes/save-data.inc.php",
        data: JSON.stringify(jsonData),
        success: function(response) {
            $('#name-modal').modal('hide');
            $('form').attr('action', 'includes/save-drafts.inc.php?applicant_name=' + encodeURIComponent(applicantName) + '&form_name=' + encodeURIComponent(formName) + '&applicant_type=' + encodeURIComponent(applicantType));
            $('form').submit();
            alert("Data saved successfully.");
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log(textStatus, errorThrown);
            alert("Failed to save data.");
        },
        dataType: "json"
    });
});


// Edit Draft Form
$('.edit-draft').click(function(event) {
    // Get the value of the "draftid" parameter
    var draftId = $(this).data('draftid');
    var page = $(this).data('page');
    var userName = $(this).data('name');
    // alert(page + draftId + "&name=" + userName);
    window.location.href = page + draftId + "&name=" + userName;
});

// Populate form with draft data
$(document).ready(function() {
    // Get user ID from URL parameters
    var userId = new URLSearchParams(window.location.search).get('userId');
    
    if(userId != null) {
        $("#saveForm").click(function() {
            $("#save_name").click();
        });
        // Get saved form data and populate fields
        $.ajax({
            type: "GET",
            url: "includes/get-json.inc.php?userId=" + userId,
            dataType: "json",
            success: function(data) {
                if (data) {
                    // Store formName value from retrieved data
                    formName = data.formName;

                    $.each(data.formData, function(index, item) {
                        $('[name="' + item.name + '"]').val(item.value);
                    });
                    alert('Draft loaded!');
                    // Senior Citizen Form
                    if($("#numberOfChildren").val() > 0) {
                        $("#childLastName").prop("required", true);
                        $("#childFirstName").prop("required", true);
                        $("#srCitizenChildDOB").prop("required", true);
                        $("#childBarangay").prop("required", true);
                        $("#childAddress").prop("required", true);
                        $("#childLastName").removeAttr("disabled");
                        $("#childFirstName").removeAttr("disabled");
                        $("#childMiddlename").removeAttr("disabled");
                        $("#childSuffix").removeAttr("disabled");
                        $("#childTelephone").removeAttr("disabled");
                        $("#srCitizenChildDOB").removeAttr("disabled");
                        $("#childBarangay").removeAttr("disabled");
                        $("#childAddress").removeAttr("disabled");
                    }
                    if ($('#hasPension').val() == "Y") {
                        $("#whatPension").prop("required", true);
                        $("#whatPension").removeAttr("disabled");
                        $(".whatPension").addClass("required");
                        $("#howMuchPension").prop("required", true);
                        $("#howMuchPension").removeAttr("disabled");
                        $(".howMuchPension").addClass("required");
                    }
                    // Solo Parent Form
                    if ($("#job").val() != "Unemployed") {
                        $("#company").removeAttr("disabled");
                        $("#monthlyIncome").removeAttr("disabled");
                        $("#monthlyIncome").prop("required", true);
                        $("#company").prop("required", true);
                    } 
                    if($("#job").val() == "Others") {
                        $("#otherOccupation").show();
                        $("#otherOccupation").prop("required", true);
                    }
                    if ($("#childOccupation").val() == "Others") {
                        $("#otherChildOccupation").show();
                        $("#otherChildOccupation").prop("required", true);
                    }
                    // PWD Application Form
                    if ($("#employmentStatus").val() == "Employed" || $(this).val() == "Self-employed") {
                        $("#categoryOfEmploymentDiv").show();
                        $("#natureOfEmploymentDiv").show();
                        $("#occupationDiv").show();
                        $("#incomeDiv").show();
                        $("#categoryOfEmployment").prop("required", true);
                        $("#natureOfEmployment").prop("required", true);
                        $("#occupation").prop("required", true);
                        $("#income").prop("required", true);
                    }
                    if ($("#occupation").val() == "Others") {
                        $("#otherOccupation").show();
                        $("#otherOccupation").prop("required", true);
                    }
                    if ($("#organization").val().trim() !== "") {
                        $(".organizationDiv").show();
                        $("#organizationContactPerson").prop("required", true);
                        $("#organizationOfficeAddress").prop("required", true);
                        $("#organizationTelephoneNumber").prop("required", true);
                    }
                    if ($("#isPhilhealthMember").val() != "No") {
                        $("#philhealthNumber").show();
                        $("#philhealthNumber").prop("required", true);
                    }
                    if ($("#guardianSurname").val().trim() !== "") {
                        $("#guardian").show();
                        $("#guardianFirstName").prop("required", true);
                        $("#guardianRelationship").prop("required", true);
                        $("#guardianContactNumber").prop("required", true);
                    }
                    if ($("#accomplishedBy").val() == "Representative") {
                        $("#accomplisherName").show();
                        $("#accomplisherName").focus();
                        $("#accomplisherName").prop("required", true);
                    }

                    if ($("#accomplishedBy").val() == "Guardian") {
                        $("#guardianSurname").prop("required", true);
                        $("#guardianFirstName").prop("required", true);
                    }

                    if ($("#accomplishedBy").val() == "Guardian" || $("#accomplishedBy").val() == "Representative") {
                        $("#accomID").show();
                        $("#accomID").prop("required", true);
                    }
                }
            },
            error: function() {
                alert("Failed to load draft.");
            }
        });
    } else {
        // Save Form Data
        $("#saveForm").click(function() {
            $('#name-modal').modal('show');
        })
    }
});
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

// Forms Validation
const forms = document.querySelectorAll("form");
forms.forEach(function(form) {
    form.addEventListener('submit', e => {
        if (!form.checkValidity()) {
            e.preventDefault();
        }
        form.classList.add('was-validated');
    });
});

// Name validation
$('#surname').on('keyup blur',function(){ 
    var node = $(this);
    node.val(node.val().replace(/[^A-Za-z\s]/g,'') ); }
);
$('#firstName').on('keyup blur',function(){ 
    var node = $(this);
    node.val(node.val().replace(/[^A-Za-z\s]/g,'') ); }
);
$('#middlename').on('keyup blur',function(){ 
    var node = $(this);
    node.val(node.val().replace(/[^A-Za-z\s]/g,'') ); }
);

$('.childLastName').on('keyup blur',function(){ 
    var node = $(this);
    node.val(node.val().replace(/[^A-Za-z\s]/g,'') ); }
);
$('.childFirstName').on('keyup blur',function(){ 
    var node = $(this);
    node.val(node.val().replace(/[^A-Za-z\s]/g,'') ); }
);
$('.childMiddlename').on('keyup blur',function(){ 
    var node = $(this);
    node.val(node.val().replace(/[^A-Za-z\s]/g,'') ); }
);


// Print Button
$("#printBtn").click(function() {
    var divToPrint = $(".printPage").html();
    var newWin = window.open("");
    newWin.document.write(divToPrint);
    newWin.print();
    newWin.close();
});

let formControlNumber = $('h5.heading').text();
$("#formControlNumber").val(formControlNumber);
$(document).on('keyup change', 'input[type="text"],textarea', function() {
    $(this).val($(this).val().toUpperCase());
});
$(document).on('keypress', '.numbers', function(e) {
    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        return false;
    }
});
$(document).on('paste', '.numbers', function(e) {
    e.preventDefault();
});
$(document).on('keyup', '.telephone', function() {
    if ($(this).val().length > 11) {
        $(this).val($(this).val().substring(0, 11));
    }
});
$("#numberOfChildren").on("keypress", function(event) {
  var currentValue = parseInt($(this).val() + event.key);
  if (currentValue > 20) {
    event.preventDefault();
  }
});
$("#totalHousemate").on("keypress", function(event) {
  var currentValue = parseInt($(this).val() + event.key);
  if (currentValue > 100) {
    event.preventDefault();
  }
});
// World Time API
function getDataFromAPI() {
    return $.getJSON('https://worldtimeapi.org/api/ip');
}
// Senior Citizen Application Form
var counter = 0;
var newId;
$(document).ready(function() {
    getDataFromAPI().then(function(data) {
        var srCitizenDOBNow = new Date(data.datetime);
        var srCitizenChildDOBNow = new Date(data.datetime);
        var srCitizenSpouseDOBNow = new Date(data.datetime);
        var now = new Date(data.datetime);
        var announcementDate = new Date(data.datetime);
        const srCitizenDOBMaxDate = new Date(srCitizenDOBNow.setFullYear(srCitizenDOBNow.getFullYear() - 60));
        const childSrCitizenDOBMaxDate = new Date(srCitizenChildDOBNow.setFullYear(srCitizenChildDOBNow.getFullYear() - 15));
        const spouseSrCitizenDOBMaxDate = new Date(srCitizenSpouseDOBNow.setFullYear(srCitizenSpouseDOBNow.getFullYear() - 18));
        const announcementMinDate = new Date(announcementDate.setFullYear(announcementDate.getFullYear()));
        const announcementMaxDate = new Date(announcementDate.setFullYear(announcementDate.getFullYear() + 1));
        const srCitizenDOBMax = srCitizenDOBMaxDate.toISOString().split('T')[0];
        const childSrCitizenDOBMax = childSrCitizenDOBMaxDate.toISOString().split('T')[0];
        const spouseSrCitizenDOBMax = spouseSrCitizenDOBMaxDate.toISOString().split('T')[0];
        const announcementMax = announcementMaxDate.toISOString().split('T')[0];
        const announcementMin = announcementMinDate.toISOString().split('T')[0];
        $("#srCitizenDOB").attr("max", srCitizenDOBMax);
        $("#srCitizenChildDOB").attr("max", childSrCitizenDOBMax);
        $("#spouseDOB").attr("max", spouseSrCitizenDOBMax);
        $("#announcementDate").attr("max", announcementMax);
        $("#announcementDate").attr("min", announcementMin);
        $('#srCitizenDOB').change(function(){
            var dateOfBirth = new Date($('#srCitizenDOB').val())
            var month_diff = now - dateOfBirth.getTime()
            var age_dt = new Date(month_diff)
            var year = age_dt.getUTCFullYear()
            var age = Math.abs(year - 1970)
            $('#age').val(age)
        });
    });
    $('input[name="applicationType"]').click(function() {
        $("input[name='applicationType']").removeAttr("required");
        if ($('#srApplicationOption1').is(':checked')) {
            $("#idNumber").hide();
            $('#IDNumber').prop('disabled', true);
            $('#IDNumber').prop("required", false);
            $('#IDNumber').val("");
            $(".IDNumber").removeClass("required");
        } else {
            $("#idNumber").show();
            $('#IDNumber').prop('disabled', false);
            $('#IDNumber').prop("required", true);
            $('#IDNumber').focus();
            $(".IDNumber").addClass("required");
        }
    });
    $('#IDNumber').keyup(function() {
        if ($(this).val().length > 6) {
          $(this).val($(this).val().substring(0, 6));
        }
    });
    $('#textBoxMissing').keyup(function() {
        if ($(this).val().length > 6) {
          $(this).val($(this).val().substring(0, 6));
        }
    });
    $("#hasPension").on('change', function() {
        if ($('#hasPension').val() == "Y") {
            $("#whatPension").prop("required", true);
            $("#whatPension").removeAttr("disabled");
            $(".whatPension").addClass("required");
            $("#whatPension").focus();
            $("#howMuchPension").prop("required", true);
            $("#howMuchPension").removeAttr("disabled");
            $(".howMuchPension").addClass("required");
        } else {
            $("#whatPension").prop("required", false);
            $("#whatPension").attr("disabled", "disabled");
            $("#whatPension").val("");
            $(".whatPension").removeClass("required");
            $("#howMuchPension").prop("required", false);
            $("#howMuchPension").attr("disabled", "disabled");
            $("#howMuchPension").val("");
            $(".howMuchPension").removeClass("required");
        }
    });
    $("#maritalStatus").on('change', function() {
        if ($('#maritalStatus').val() != "Single") {
            $("#hiddenSpouseData").show();
            $("#spouseFirstName").prop("required", true);
            $("#spouseLastName").prop("required", true);
            $("#spouseDOB").prop("required", true);
        } else {
            $("#hiddenSpouseData").hide();
        }
    });
    $("#seniorCitizenDuplicateButton").click(function() {
        var originalDiv = $("#child").parent().clone();
        newId = "srCitizenRelative" + (++counter);
        originalDiv.attr('id', newId);
        originalDiv.find('input[type="text"],input[type="date"],input[type="tel"],select').val('');
        if(counter == 1) {
            originalDiv.insertAfter($("#srCitizenRelative"));
        } else {
            var id = newId.replace(counter, counter - 1);
            originalDiv.insertAfter($("#" + id));
        }
    });
    $("#spouseLastName, #spouseFirstName, #spouseMiddlename, #spouseSuffix").change(function() {
        if ($('#spouseLastName').val().trim() !== "" || $('#spouseFirstName').val().trim() !== "" ) {
            $("#dobSpouse").show();
            $("#spouseFirstName").prop("required", true);
            $("#spouseLastName").prop("required", true);
            $("#spouseDOB").prop("required", true);
        } else {
            $("#dobSpouse").hide();
            $("#spouseFirstName").prop("required", false);
            $("#spouseLastName").prop("required", false);
            $("#spouseDOB").prop("required", false);
        }
    });
    if ($('#numberOfChildren').val() === "") {
        $("#childLastName").prop("disabled", true);
        $("#childFirstName").prop("disabled", true);
        $("#childMiddlename").prop("disabled", true);
        $("#childSuffix").prop("disabled", true);
        $("#childTelephone").prop("disabled", true);
        $("#srCitizenChildDOB").prop("disabled", true);
        $("#childBarangay").prop("disabled", true);
        $("#childAddress").prop("disabled", true);
    }

    // listen for changes to the number input field
    $('#numberOfChildren').on('input', function() {
        // get the current number of relatives entered by the user
        var numRelatives = $(this).val();
        if(numRelatives > 0) {
            $("#childLastName").prop("required", true);
            $("#childFirstName").prop("required", true);
            $("#srCitizenChildDOB").prop("required", true);
            $("#childBarangay").prop("required", true);
            $("#childAddress").prop("required", true);
            $("#childLastName").removeAttr("disabled");
            $("#childFirstName").removeAttr("disabled");
            $("#childMiddlename").removeAttr("disabled");
            $("#childSuffix").removeAttr("disabled");
            $("#childTelephone").removeAttr("disabled");
            $("#srCitizenChildDOB").removeAttr("disabled");
            $("#childBarangay").removeAttr("disabled");
            $("#childAddress").removeAttr("disabled");
        } else {
            $("#childLastName").prop("disabled", true);
            $("#childFirstName").prop("disabled", true);
            $("#childMiddlename").prop("disabled", true);
            $("#childSuffix").prop("disabled", true);
            $("#childTelephone").prop("disabled", true);
            $("#srCitizenChildDOB").prop("disabled", true);
            $("#childBarangay").prop("disabled", true);
            $("#childAddress").prop("disabled", true);
            $("#childLastName").prop("required", false);
            $("#childFirstName").prop("required", false);
            $("#srCitizenChildDOB").prop("required", false);
            $("#childBarangay").prop("required", false);
            $("#childAddress").prop("required", false);
            $("#childLastName").val("");
            $("#childFirstName").val("");
            $("#childMiddlename").val("");
            $("#childSuffix").val("");
            $("#childTelephone").val("");
            $("#srCitizenChildDOB").val("");
            $("#childBarangay").val("");
            $("#childAddress").val("");

        }
        
        // clear the existing divs from the container
        $('#relativesContainer').empty();
        
        // create a new copy of the div for each relative
        for (var i = 1; i < numRelatives; i++) {
            var newDiv = $('#srCitizenRelative').clone();
            // empty the input fields
            newDiv.find('input[type="text"],input[type="date"],input[type="tel"],select').val('');
            // add the new div to the container
            $('#relativesContainer').append(newDiv);
            $('.childLastName').on('keyup blur',function(){ 
                var node = $(this);
                node.val(node.val().replace(/[^A-Za-z]/g,'') ); }
            );
            $('.childFirstName').on('keyup blur',function(){ 
                var node = $(this);
                node.val(node.val().replace(/[^A-Za-z]/g,'') ); }
            );
            $('.childMiddlename').on('keyup blur',function(){ 
                var node = $(this);
                node.val(node.val().replace(/[^A-Za-z]/g,'') ); }
            );
        }
    });
    $("#job").change(function() {
        if ($(this).val() == "Others") {
            $("#otherOccupation").show();
            $("#otherOccupation").focus();
            $("#otherOccupation").prop("required", true);
        } else {
            $("#otherOccupation").hide();
            $("#otherOccupation").prop("required", false);
        }
    });
});
function srCitizenRemoveRelative(button) {
    if ($(button).parent().parent().parent().attr('id') !== 'srCitizenRelative' && $(button).parent().parent().parent().attr('id') == newId) {
        newId = "srCitizenRelative" + (--counter);
        $(button).parent().parent().parent().remove();
    }
}
// Solo Parent Application Form
var soloParentRelativeCounter = 0;
var soloParentNewId;
$(document).ready(function() {
    getDataFromAPI().then(function(data) {
        var soloParentDOBNow = new Date(data.datetime);
        var soloParentChildDOBNow = new Date(data.datetime);
        var now = new Date(data.datetime);
        const soloParentDOBMaxDate = new Date(soloParentDOBNow.setFullYear(soloParentDOBNow.getFullYear() - 13));
        const soloParentChildDOBMaxDate = new Date(soloParentChildDOBNow.setFullYear(soloParentChildDOBNow.getFullYear()));
        const soloParentDOBMax = soloParentDOBMaxDate.toISOString().split('T')[0];
        const soloParentChildDOBMax = soloParentChildDOBMaxDate.toISOString().split('T')[0];
        $("#soloParentDOB").attr("max", soloParentDOBMax);
        $("#soloParentChildDOB").attr("max", soloParentChildDOBMax);
        $('#soloParentDOB').change(function(){
            var dateOfBirth = new Date($('#soloParentDOB').val())
            var month_diff = now - dateOfBirth.getTime()
            var age_dt = new Date(month_diff)
            var year = age_dt.getUTCFullYear()
            var age = Math.abs(year - 1970)
            $('#age').val(age)
        });
    });
    $("#job").change(function() {
        if ($(this).val() == "Unemployed") {
            $("#company").prop("disabled", true);
            $("#monthlyIncome").prop("disabled", true);
        } else {
            $("#company").removeAttr("disabled");
            $("#monthlyIncome").removeAttr("disabled");
            $("#company").focus();
            $("#monthlyIncome").prop("required", true);
            $("#company").prop("required", true);
        }
    });
    $("#childOccupation").change(function() {
        if ($(this).val() == "Others") {
            $("#otherChildOccupation").show();
            $("#otherChildOccupation").focus();
            $("#otherChildOccupation").prop("required", true);
        } else {
            $("#otherChildOccupation").hide();
            $("#otherChildOccupation").prop("required", false);
        }
    });
    $('input[name="soloParentClassification[]"]').on('change', function() {
        if ($('input[name="soloParentClassification[]"]:checked').length > 0) {
            $('input[name="soloParentClassification[]"]').removeAttr('required');
        } else {
            $('input[name="soloParentClassification[]"]').prop('required', true);
        }
    });
    $("#soloParentDuplicateButton").click(function() {
        var originalDiv = $("#child").parent().clone();
        soloParentNewId = "soloParentRelative" + (++soloParentRelativeCounter);
        originalDiv.attr('id', soloParentNewId);
        originalDiv.find('input[type="text"],input[type="date"],input[type="tel"],select').val('');
        if(soloParentRelativeCounter == 1) {
            originalDiv.insertAfter($("#soloParentRelative"));
        } else {
            var id = soloParentNewId.replace(soloParentRelativeCounter, soloParentRelativeCounter - 1);
            originalDiv.insertAfter($("#" + id));
        }
        $('.childLastName').on('keyup blur',function(){ 
            var node = $(this);
            node.val(node.val().replace(/[^A-Za-z]/g,'') ); }
        );
        $('.childFirstName').on('keyup blur',function(){ 
            var node = $(this);
            node.val(node.val().replace(/[^A-Za-z]/g,'') ); }
        );
        $('.childMiddlename').on('keyup blur',function(){ 
            var node = $(this);
            node.val(node.val().replace(/[^A-Za-z]/g,'') ); }
        );
    });
});
function soloParentRemoveRelative(button) {
    if ($(button).parent().parent().parent().attr('id') !== 'soloParentRelative' && $(button).parent().parent().parent().attr('id') == soloParentNewId) {
        soloParentNewId = "soloParentRelative" + (--soloParentRelativeCounter);
        $(button).parent().parent().parent().remove();
    }
}
// PWD Application Form
$('input[name="applicationType"]').click(function() {
    $("input[name='applicationType']").removeAttr("required");
    if ($(this).attr("id") == "pwdApplicationOption4") {
        $("#transfereeAddress").show();
        $("#region").prop("required", true);
        $("#province").prop("required", true);
        $("#city").prop("required", true);
        $("#transferBarangay").prop("required", true);
    } else {
        $("#transfereeAddress").hide();
        $("#region").prop("required", false);
        $("#province").prop("required", false);
        $("#city").prop("required", false);
        $("#transferBarangay").prop("required", false);
    }
});
getDataFromAPI().then(function(data) {
    var pwdDOBNow = new Date(data.datetime);
    var now = new Date(data.datetime);
    const pwdDOBMaxDate = new Date(pwdDOBNow.setFullYear(pwdDOBNow.getFullYear() - 1));
    const pwdMax = pwdDOBMaxDate.toISOString().split('T')[0];
    $("#pwdDOB").attr("max", pwdMax);
    $('#pwdDOB').change(function(){
        var dateOfBirth = new Date($('#pwdDOB').val())
        var month_diff = now - dateOfBirth.getTime()
        var age_dt = new Date(month_diff)
        var year = age_dt.getUTCFullYear()
        var age = Math.abs(year - 1970)
        $('#age').val(age)
    });
});
$("#employmentStatus").change(function() {
    if ($(this).val() == "Employed" || $(this).val() == "Self-employed") {
        $("#categoryOfEmploymentDiv").show();
        $("#natureOfEmploymentDiv").show();
        $("#occupationDiv").show();
        $("#incomeDiv").show();
        $("#categoryOfEmployment").prop("required", true);
        $("#natureOfEmployment").prop("required", true);
        $("#occupation").prop("required", true);
        $("#income").prop("required", true);
    } else {
        $("#categoryOfEmploymentDiv").hide();
        $("#natureOfEmploymentDiv").hide();
        $("#occupationDiv").hide();
        $("#incomeDiv").hide();
        $("#categoryOfEmployment").prop("required", false);
        $("#natureOfEmployment").prop("required", false);
        $("#occupation").prop("required", false);
        $("#income").prop("required", false);
    }
});
$("#occupation").change(function() {
    if ($(this).val() == "Others") {
        $("#otherOccupation").show();
        $("#otherOccupation").focus();
        $("#otherOccupation").prop("required", true);
    } else {
        $("#otherOccupation").hide();
        $("#otherOccupation").prop("required", false);
    }
});
$("#organization").change(function() {
    if ($(this).val().trim() !== "") {
        $(".organizationDiv").show();
        $("#organizationContactPerson").prop("required", true);
        $("#organizationOfficeAddress").prop("required", true);
        $("#organizationTelephoneNumber").prop("required", true);
    } else {
        $(".organizationDiv").hide();
        $("#organizationContactPerson").prop("required", false);
        $("#organizationOfficeAddress").prop("required", false);
        $("#organizationTelephoneNumber").prop("required", false);

    }
});
$("#isPhilhealthMember").change(function() {
    if ($(this).val() != "No") {
        $("#philhealthNumber").show();
        $("#philhealthNumber").focus();
        $("#philhealthNumber").prop("required", true);
    } else {
        $("#philhealthNumber").hide();
        $("#philhealthNumber").prop("required", false);
    }
});
$("#guardianSurname").change(function() {
    if ($(this).val().trim() !== "") {
        $("#guardian").show();
        $("#guardianFirstName").prop("required", true);
        $("#guardianRelationship").prop("required", true);
        $("#guardianContactNumber").prop("required", true);
    } else {
        $("#guardian").hide();
        $("#guardianFirstName").prop("required", false);
        $("#guardianRelationship").prop("required", false);
        $("#guardianContactNumber").prop("required", false);

    }
});
$("#accomplishedBy").change(function() {
    if ($(this).val() == "Representative") {
        $("#accomplisherName").show();
        $("#accomplisherName").focus();
        $("#accomplisherName").prop("required", true);
    } else {
        $("#accomplisherName").hide();
        $("#accomplisherName").prop("required", false);
    }

    if ($(this).val() == "Guardian") {
        $("#guardianSurname").prop("required", true);
        $("#guardianFirstName").prop("required", true);
    } else {
        $("#guardianSurname").prop("required", false);
        $("#guardianFirstName").prop("required", false);
    }

    if ($(this).val() == "Guardian" || $(this).val() == "Representative") {
        $("#accomID").show();
        $("#accomID").prop("required", true);
    } else {
        $("#accomID").hide();
        $("#accomID").prop("required", false);
    }
});
$('input[name="typeOfDisability[]"]').click(function() {
    if($("input[name='typeOfDisability[]']:checked").length > 0){
        $("input[name='typeOfDisability[]']").removeAttr("required");
        $("#medicalCondition").removeAttr("required");
    } else {
        $("input[name='typeOfDisability[]']").prop('required', true);
        $("#medicalCondition").prop('required', true);
    }
    
});
$('#medicalCondition').on("keyup", function() {
   if($('#medicalCondition').val().trim() == "") {
       $("input[name='typeOfDisability[]']").prop('required', true);
   } else {
       $("input[name='typeOfDisability[]']").prop('required', false);
   }
});
$('input[name="inborn[]"]').click(function() {
    if($("input[name='inborn[]']:checked").length > 0){
        $("input[name='inborn[]']").removeAttr("required");
        $("#congenital").prop('checked', true);
        $("#acquired").prop('required', false);
        $("input[name='acquired[]']").prop('disabled', true);
        $("input[name='acquired[]']").prop('required', false);
    } else {
        $("input[name='inborn[]']").prop('required', true);
        $("#congenital").prop('checked', false);
        $("#congenital").prop("disabled", true);
        $("input[name='acquired[]']").prop('disabled', false);
        $("input[name='acquired[]']").prop('required', true);
    }
});
$('input[name="acquired[]"]').click(function() {
    if($("input[name='acquired[]']:checked").length > 0){
        $("input[name='acquired[]']").removeAttr("required");
        $("#acquired").prop('checked', true);
        $("#inborn").prop('required', false);
        $("input[name='inborn[]']").prop('disabled', true);
        $("input[name='inborn[]']").prop('required', false);
    } else {
        $("input[name='acquired[]']").prop('required', true);
        $("#acquired").prop('checked', false);
        $("#acquired").prop("disabled", true);
        $("input[name='inborn[]']").prop('disabled', false);
        $("input[name='inborn[]']").prop('required', true);
    }
});
$('input[name="statusOfDisability"]').click(function() {
    $("input[name='statusOfDisability']").removeAttr("required");
});
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

// security question validation
$(document).ready(function() {
    var selects = $('select[id^="security_question"]');

    selects.change(function() {
        var selectedOption = $(this).find('option:selected').val();
        selects.not($(this)).find('option[value="' + selectedOption + '"]').hide();
    });
});