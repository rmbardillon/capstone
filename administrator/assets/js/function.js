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
    var generateReport = $('#exampleTable').DataTable({
        
        buttons:['copy', 'csv', 'excel', 'pdf', 'print']
        
    });
    generateReport.buttons().container().appendTo('#exampleTable_wrapper .col-md-6:eq(0)');
    mainAdministratorsTable.buttons().container().appendTo('#mainAdministrators_wrapper .col-md-6:eq(0)');
    pwdAdministratorsTable.buttons().container().appendTo('#pwdAdministrators_wrapper .col-md-6:eq(0)');
    soloparentAdministratorsTable.buttons().container().appendTo('#soloparentAdministrators_wrapper .col-md-6:eq(0)');
    srCitizenAdministratorsTable.buttons().container().appendTo('#srCitizenAdministrators_wrapper .col-md-6:eq(0)');
    pwdDataTable.buttons().container().appendTo('#pwdDataTable_wrapper .col-md-6:eq(0)');
    spDataTable.buttons().container().appendTo('#spDataTable_wrapper .col-md-6:eq(0)');
    scDataTable.buttons().container().appendTo('#scDataTable_wrapper .col-md-6:eq(0)');
    announcementsTable.buttons().container().appendTo('#announcements_wrapper .col-md-6:eq(0)');
    
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
// Print Button
$("#printBtn").click(function() {
    var divToPrint = $(".printPage").html();
    var newWin = window.open("");
    newWin.document.write(divToPrint);
    newWin.print();
    newWin.close();
});


$(document).on('keyup change', 'input[type="text"]', function() {
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
        const srCitizenDOBMaxDate = new Date(srCitizenDOBNow.setFullYear(srCitizenDOBNow.getFullYear() - 60));
        const childSrCitizenDOBMaxDate = new Date(srCitizenChildDOBNow.setFullYear(srCitizenChildDOBNow.getFullYear() - 15));
        const spouseSrCitizenDOBMaxDate = new Date(srCitizenSpouseDOBNow.setFullYear(srCitizenSpouseDOBNow.getFullYear() - 18));
        const srCitizenDOBMax = srCitizenDOBMaxDate.toISOString().split('T')[0];
        const childSrCitizenDOBMax = childSrCitizenDOBMaxDate.toISOString().split('T')[0];
        const spouseSrCitizenDOBMax = spouseSrCitizenDOBMaxDate.toISOString().split('T')[0];
        $("#srCitizenDOB").attr("max", srCitizenDOBMax);
        $("#srCitizenChildDOB").attr("max", childSrCitizenDOBMax);
        $("#spouseDOB").attr("max", spouseSrCitizenDOBMax);
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
        if ($('#hasPension').val() == "Meron") {
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
        const soloParentDOBMaxDate = new Date(soloParentDOBNow.setFullYear(soloParentDOBNow.getFullYear() - 6));
        const soloParentChildDOBMaxDate = new Date(soloParentChildDOBNow.setFullYear(soloParentChildDOBNow.getFullYear() - 1));
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
    } else {
        $("#transfereeAddress").hide();
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
    } else {
        $("#categoryOfEmploymentDiv").hide();
        $("#natureOfEmploymentDiv").hide();
        $("#occupationDiv").hide();
        $("#incomeDiv").hide();
    }
});
$("#occupation").change(function() {
    if ($(this).val() == "Others") {
        $("#otherOccupation").show();
        $("#otherOccupation").focus();
    } else {
        $("#otherOccupation").hide();
    }
});
$("#isPhilhealthMember").change(function() {
    if ($(this).val() != "No") {
        $("#philhealthNumber").show();
        $("#philhealthNumber").focus();
    } else {
        $("#philhealthNumber").hide();
    }
});
$("#guardianSurname").keyup(function() {
    if ($(this).val().trim() !== "") {
        $("#guardian").show();
    } else {
        $("#guardian").hide();
    }
});
$("#accomplishedBy").change(function() {
    if ($(this).val() == "Representative") {
        $("#accomplisherName").show();
        $("#accomplisherName").focus();
    } else {
        $("#accomplisherName").hide();
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
        $("input[name='acquired[]']").prop('disabled', true);
    } else {
        $("input[name='inborn[]']").prop('required', true);
        $("#congenital").prop('checked', false);
        $("input[name='acquired[]']").prop('disabled', false);
    }
});
$('input[name="acquired[]"]').click(function() {
    if($("input[name='acquired[]']:checked").length > 0){
        $("input[name='acquired[]']").removeAttr("required");
        $("#acquired").prop('checked', true);
        $("input[name='inborn[]']").prop('disabled', true);
    } else {
        $("input[name='acquired[]']").prop('required', true);
        $("#acquired").prop('checked', false);
        $("input[name='inborn[]']").prop('disabled', false);
    }
});
$('input[name="statusOfDisability"]').click(function() {
    $("input[name='statusOfDisability']").removeAttr("required");
});