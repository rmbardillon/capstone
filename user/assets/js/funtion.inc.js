function congenitalCheckboxChecker(elClass) {
    el = document.getElementsByClassName(elClass);
    var mainCheckbox = document.querySelector('#inborn');
    var subCheckbox1 = document.querySelector('#autism');
    var subCheckbox2 = document.querySelector('#adhd');
    var subCheckbox3 = document.querySelector('#cerebralPalsy');
    var subCheckbox4 = document.querySelector('#downSyndrome');

    if (subCheckbox1.checked || subCheckbox2.checked || subCheckbox3.checked || subCheckbox4.checked) {
        mainCheckbox.checked = true;
        for (i = 0; i < el.length; i++) {
        el[i].required = false;
        }
    } else {
        mainCheckbox.checked = false;
        for (i = 0; i < el.length; i++) {
        el[i].required = true;
        }
    }
}

function acquiredCheckboxChecker(elClass) {
    el = document.getElementsByClassName(elClass);
    var mainCheckbox = document.querySelector('#acquired');
    var subCheckbox1 = document.querySelector('#chronicIllness');
    var subCheckbox2 = document.querySelector('#acquiredCerebralPalsy');
    var subCheckbox3 = document.querySelector('#injury');

    if (subCheckbox1.checked || subCheckbox2.checked || subCheckbox3.checked) {
        mainCheckbox.checked = true;
        for (i = 0; i < el.length; i++) {
        el[i].required = false;
        }
    } else {
        mainCheckbox.checked = false;
        for (i = 0; i < el.length; i++) {
        el[i].required = true;
        }
    }
}
// Cause of disability checker
function deRequire(elClass) {
    el = document.getElementsByClassName(elClass);

    var atLeastOneChecked = false; //at least one cb is checked
    for (i = 0; i < el.length; i++) {
        if (el[i].checked === true) {
        atLeastOneChecked = true;
        }
    }

    if (atLeastOneChecked === true) {
        for (i = 0; i < el.length; i++) {
        el[i].required = false;
        }
    } else {
        for (i = 0; i < el.length; i++) {
        el[i].required = true;
        }
    }
}

function updateFamily() {
    var parent = document.getElementById('new');
    var tr = document.createElement('tr');
    tr.setAttribute("id", "duplicaterow");
    var td1 = document.createElement('td');
    var td2 = document.createElement('td');
    var td3 = document.createElement('td');
    var td4 = document.createElement('td');
    var td5 = document.createElement('td');
    var inputName = document.createElement('input');
    inputName.setAttribute("class", "form-control");
    inputName.setAttribute("type", "text");
    inputName.setAttribute("name", "relativeName[]");
    inputName.setAttribute("required", "true");
    var inputAge = document.createElement('input');
    inputAge.setAttribute("class", "form-control");
    inputAge.setAttribute("type", "text");
    inputAge.setAttribute("name", "relativeAge[]");
    inputAge.setAttribute("required", "true");
    var inputAddress = document.createElement('input');
    inputAddress.setAttribute("class", "form-control");
    inputAddress.setAttribute("type", "text");
    inputAddress.setAttribute("name", "relativeAddress[]");
    inputAddress.setAttribute("required", "true");
    var inputContact = document.createElement('input');
    inputContact.setAttribute("class", "form-control");
    inputContact.setAttribute("type", "text");
    inputContact.setAttribute("name", "relativeContact[]");
    inputContact.setAttribute("required", "true");
    var deleteButton = document.createElement('button');
    deleteButton.setAttribute("class", "btn btn-danger delete");
    deleteButton.setAttribute("type", "button");
    deleteButton.setAttribute("onclick", "deleteRow(this);");
    deleteButton.textContent = "Delete";
    td1.appendChild(inputName);
    td2.appendChild(inputAge);
    td3.appendChild(inputAddress);
    td4.appendChild(inputContact);
    td5.appendChild(deleteButton);
    tr.appendChild(td1);
    tr.appendChild(td2);
    tr.appendChild(td3);
    tr.appendChild(td4);
    tr.appendChild(td5);
    parent.appendChild(tr);
}

function duplicate() {
    var parent = document.getElementById('newRow');
    var div = document.createElement('div');
    div.setAttribute("class", "row family-data");
    div.setAttribute("id", "duplicater");
    var inputName = document.createElement('input');
    inputName.setAttribute("type", "text");
    inputName.setAttribute("class", "form-control col");
    inputName.setAttribute("name", "family-composition-name[]");
    inputName.setAttribute("required", "true");
    var inputRelationship = document.createElement('input');
    inputRelationship.setAttribute("type", "text");
    inputRelationship.setAttribute("class", "form-control col");
    inputRelationship.setAttribute("name", "family-composition-relationship[]");
    inputRelationship.setAttribute("required", "true");
    var inputAge = document.createElement('input');
    inputAge.setAttribute("type", "text");
    inputAge.setAttribute("class", "form-control col");
    inputAge.setAttribute("name", "family-composition-age[]");
    inputAge.setAttribute("required", "true");
    var selectCivilStatus = document.createElement('select');
    selectCivilStatus.setAttribute("class","col form-select");
    selectCivilStatus.setAttribute("name","family-composition-civil-status[]");
    selectCivilStatus.setAttribute("required","true");
    var option = document.createElement('option');
    option.setAttribute("disabled","disabled");
    option.setAttribute("selected","selected");
    // option.textContent = "Please Select";
    var single = document.createElement('option');
    single.setAttribute("value","Single");
    single.textContent = "Single";
    var annuled = document.createElement('option');
    annuled.setAttribute("value","Annuled");
    annuled.textContent = "Annuled";
    var widow = document.createElement('option');
    widow.setAttribute("value","Widow");
    widow.textContent = "Widow";
    var married = document.createElement('option');
    married.setAttribute("value","Married");
    married.textContent = "Married";
    var separated = document.createElement('option');
    separated.setAttribute("value","Separated");
    separated.textContent = "Separated";
    var inputEducationalAttainment = document.createElement('input');
    inputEducationalAttainment.setAttribute("type", "text");
    inputEducationalAttainment.setAttribute("class", "form-control col");
    inputEducationalAttainment.setAttribute("name", "family-composition-educ-attainment[]");
    inputEducationalAttainment.setAttribute("required", "true");
    var inputOccupation = document.createElement('input');
    inputOccupation.setAttribute("type", "text");
    inputOccupation.setAttribute("class", "form-control col");
    inputOccupation.setAttribute("name", "family-composition-occupation[]");
    inputOccupation.setAttribute("required", "true");
    var inputIncome = document.createElement('input');
    inputIncome.setAttribute("type", "text");
    inputIncome.setAttribute("class", "form-control col");
    inputIncome.setAttribute("name", "family-composition-monthly-income[]");
    inputIncome.setAttribute("required", "true");
    var button = document.createElement('button');
    button.textContent = "Delete";
    button.setAttribute("type","button");
    button.setAttribute("class","btn btn-danger delete col");
    button.setAttribute("onclick","deleteDiv(this);");
    selectCivilStatus.appendChild(option);
    selectCivilStatus.appendChild(single);
    selectCivilStatus.appendChild(annuled);
    selectCivilStatus.appendChild(widow);
    selectCivilStatus.appendChild(married);
    selectCivilStatus.appendChild(separated);
    div.appendChild(inputName);
    div.appendChild(inputRelationship);
    div.appendChild(inputAge);
    div.appendChild(selectCivilStatus);
    div.appendChild(inputEducationalAttainment);
    div.appendChild(inputOccupation);
    div.appendChild(inputIncome);
    div.appendChild(button);
    parent.appendChild(div);
}

function deleteDiv(button) {
    const countAll = document.querySelectorAll('#duplicater').length;
    if (countAll > 1) {
        $(button).parent().closest('div').remove();
    }
}

function deleteRow(button) {
    $(button).parent().closest('tr').remove();
}

// Prohibit Special Characters 
function alpha(e) {
    var k;
    document.all ? k = e.keyCode : k = e.which;
    return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57));
}

// Profile Picture
const imgDiv = document.querySelector('.profile-pic-div');
const img = document.querySelector('#photo');
const file = document.querySelector('#file');
const uploadBtn = document.querySelector('#uploadBtn');

if(imgDiv) {
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
// Date Of Birth and Age
function getDataFromAPI() {
  // Make the API call using jQuery's $.getJSON() method
  return $.getJSON('https://worldtimeapi.org/api/ip');
}
getDataFromAPI().then(function(data) {
    var now = new Date(data.datetime);
    var dobNow = new Date(data.datetime);
    var birthNow = new Date(data.datetime);
    var srCitizenDOBNow = new Date(data.datetime);
    $('#srCitizenDOB').change(function () {
        var dateOfBirth = new Date($('#srCitizenDOB').val())
        //calculate month difference from current date in time
        var month_diff = now - dateOfBirth.getTime()

        //convert the calculated difference in date format
        var age_dt = new Date(month_diff)

        //extract year from date
        var year = age_dt.getUTCFullYear()

        //now calculate the age of the user
        var age = Math.abs(year - 1970)

        //display the calculated age
        $('#edad').val(age)
    });
    $('#soloParentDOB').change(function () {
        var dateOfBirth = new Date($('#soloParentDOB').val())
        //calculate month difference from current date in time
        var month_diff = now - dateOfBirth.getTime()

        //convert the calculated difference in date format
        var age_dt = new Date(month_diff)

        //extract year from date
        var year = age_dt.getUTCFullYear()

        //now calculate the age of the user
        var age = Math.abs(year - 1970)

        //display the calculated age
        $('#age').val(age)
    });
    var day = dobNow.toLocaleDateString();
    $(".date").val(day);
    const srCitizenDOBMaxDate = new Date(srCitizenDOBNow.setFullYear(srCitizenDOBNow.getFullYear() - 60));
    const birthMaxDate = new Date(birthNow.setFullYear(birthNow.getFullYear() - 6));
    const dobMaxDate = new Date(dobNow.setFullYear(dobNow.getFullYear() - 1));
    srCitizenDOBMaxDate.toISOString().split('T')[0];
    birthMaxDate.toISOString().split('T')[0];
    dobMaxDate.toISOString().split('T')[0];
    srCitizenDOB.max = srCitizenDOBMaxDate.toISOString().split('T')[0];
    soloParentDOB.max = birthMaxDate.toISOString().split('T')[0];
    PWDDob.max = dobMaxDate.toISOString().split('T')[0];
});

// Registration Changer
$(window).load(function()
{
    $('#staticBackdrop').modal('show');
    $("#pensyon").on('change', function() {
        if ($('#pensyon').val() == "Oo") {
            $("#saan").prop("required", true);
            $("#saan").removeAttr("disabled");
            $(".saan").addClass("required");
            $("#magkano").prop("required", true);
            $("#magkano").removeAttr("disabled");
            $(".magkano").addClass("required");
        } else {
            $("#saan").prop("required", false);
            $("#saan").attr("disabled", "disabled");
            $(".saan").removeClass("required");
            $("#magkano").prop("required", false);
            $("#magkano").attr("disabled", "disabled");
            $(".magkano").removeClass("required");
        }
    });
    $("input[name='typeOfApplication']").click(function () {
        $("#bago").removeAttr("required");
        $("#lumipat").removeAttr("required");
        $("#magpapalit").removeAttr("required");
        $("#nawala").removeAttr("required");

        if ($("#bago").is(":checked")) {
            $("#IDnum").removeAttr("disabled");
            $("#IDnum").focus();
            $("#IDnum").prop('required',true);
        } else {
            $("#IDnum").attr("disabled", "disabled");
            $("#IDnum").removeAttr("required");
            $('#IDnum').val(""); 
        }
        if ($("#nawala").is(":checked")) {
            $("#lostNumber").removeAttr("disabled");
            $("#lostNumber").focus();
            $("#lostNumber").prop('required',true);
        } else {
            $("#lostNumber").attr("disabled", "disabled");
            $("#lostNumber").removeAttr("required");
            $('#lostNumber').val(""); 
        }
    });
});

$(document).ready(function(){
    $("#id-type").on('change', function(){
        $(".registration-container").hide();
        $("#" + $(this).val()).fadeIn(700);
    });
}).change();

$("input[name='employmentStatus']").click(function () {
    if ($('#employed').is(':checked') || $('#selfEmployed').is(':checked')) {
        $(".disable").removeClass('disableDiv');
    } else {
        $(".disable").addClass('disableDiv');
        $('input:radio[name=income]').each(function () { $(this).prop('checked', false); });
        $('input:radio[name=categoryOfEmployment]').each(function () { $(this).prop('checked', false); });
        $('input:radio[name=natureOfEmployment]').each(function () { $(this).prop('checked', false); });
        $('input:radio[name=occupation]').each(function () { $(this).prop('checked', false); });
        $('#organization').val(""); 
        $('#contactPerson').val(""); 
        $('#officeAddress').val(""); 
        $('#telNumber').val("");
        $('#otherOccupation').val("");
    }
    if ($('#others').is(':checked')) {
        $('#otherOccupation').attr("disabled", false);
    }
});

$('#guardianLastName').change(function(){
    if($(this).val() == "") {
        $("#guardianRelationship").attr("disabled", true);
        $("#guardianContactNumber").attr("disabled", true);
        $("#guardianRelationship").val("");
        $("#guardianContactNumber").val("");
    } else {
        $("#guardianRelationship").attr("disabled", false);
        $("#guardianRelationship").prop("required", true);
        $("#guardianContactNumber").attr("disabled", false);
        $("#guardianContactNumber").prop("required", true);

    }
});

// Cause of disability checker
$(window).on('load', function() {
    if ($("#change-info").is(":checked")) {
        $("#textChangeInfo").removeAttr("disabled");
        $("#textChangeInfo").focus();
    } else {
        $("#textChangeInfo").attr("disabled", "disabled");
        // $('#textChangeInfo').val(""); 
    }
    if ($("#transfer").is(":checked")) {
        $("#textTransfer").removeAttr("disabled");
        $("#textTransfer").focus();
    } else {
        $("#textTransfer").attr("disabled", "disabled");
        // $('#textTransfer').val(""); 
    }
    el = document.getElementsByClassName('cod');
    var subCheckboxAutism = document.querySelector('#autism');
    var subCheckboxADHD = document.querySelector('#adhd');
    var subCheckboxCerebralPalsy = document.querySelector('#cerebralPalsy');
    var subCheckboxDownSyndrome = document.querySelector('#downSyndrome');
    var subCheckboxChronicIllnes = document.querySelector('#chronicIllness');
    var subCheckboxAcquiredCerebralPalsy = document.querySelector('#acquiredCerebralPalsy');
    var subCheckboxInjury = document.querySelector('#injury');
    if (subCheckboxAutism) {
        if (subCheckboxAutism.checked || subCheckboxADHD.checked || subCheckboxCerebralPalsy.checked || subCheckboxDownSyndrome.checked || subCheckboxChronicIllnes.checked || subCheckboxAcquiredCerebralPalsy.checked || subCheckboxInjury.checked) {
            for (i = 0; i < el.length; i++) {
                el[i].required = false;
            }
        }
    }
    
});

// ID Type
$("input[name='idType']").click(function () {
    if ($("#transfer").is(":checked")) {
        $("#textTransfer").removeAttr("disabled");
        $("#textTransfer").focus();
    } else {
        $("#textTransfer").attr("disabled", "disabled");
        // $('#textTransfer').val(""); 
        }
        if ($("#change-info").is(":checked")) {
        $("#textChangeInfo").removeAttr("disabled");
        $("#textChangeInfo").focus();
    } else {
        $("#textChangeInfo").attr("disabled", "disabled");
        // $('#textChangeInfo').val(""); 
    }
});

window.onload = function() {
    var $recaptcha = document.querySelector('#g-recaptcha-response');

    if($recaptcha) {
        $recaptcha.setAttribute("required", "required");
    }
};
let email = document.getElementById("email")
let password = document.getElementById("password")
let verifyPassword = document.getElementById("verifyPassword")
let submitBtn = document.getElementById("submitBtn")
let emailErrorMsg = document.getElementById('emailErrorMsg')
let passwordErrorMsg = document.getElementById('passwordErrorMsg')

function displayErrorMsg(type, msg) {
    if(type == "email") {
        emailErrorMsg.style.display = "block"
        emailErrorMsg.innerHTML = msg
        submitBtn.disabled = true
    }
    else {
        passwordErrorMsg.style.display = "block"
        passwordErrorMsg.innerHTML = msg
        submitBtn.disabled = true
    }
}

function hideErrorMsg(type) {
    if(type == "email") {
        emailErrorMsg.style.display = "none"
        emailErrorMsg.innerHTML = ""
        submitBtn.disabled = true
        if(passwordErrorMsg.innerHTML == "")
            submitBtn.disabled = false
    }
    else {
        passwordErrorMsg.style.display = "none"
        passwordErrorMsg.innerHTML = ""
        if(emailErrorMsg.innerHTML == "")
            submitBtn.disabled = false
    }
}

// Validate password upon change
if(password) {
    password.addEventListener("change", function() {

        // If password has no value, then it won't be changed and no error will be displayed
        if(password.value.length == 0 && verifyPassword.value.length == 0) hideErrorMsg("password")
        
        // If password has a value, then it will be checked. In this case the passwords don't match
        else if(password.value !== verifyPassword.value) displayErrorMsg("password", "Passwords do not match")
        
        // When the passwords match, we check the length
        else {
            // Check if the password has 8 characters or more
            if(password.value.length >= 8)
                hideErrorMsg("password")
            else
                displayErrorMsg("password", "Password must be at least 8 characters long")
        }
    })

    verifyPassword.addEventListener("change", function() {
        if(password.value !== verifyPassword.value)
            displayErrorMsg("password", "Passwords do not match")
        else {
            // Check if the password has 8 characters or more
            if(password.value.length >= 8)
                hideErrorMsg("password")
            else
                displayErrorMsg("password", "Password must be at least 8 characters long")
        }
    })

    // Validate email upon change
    email.addEventListener("change", function() {
        // Check if the email is valid using a regular expression (string@string.string)
        if(email.value.match(/^[^@]+@[^@]+\.[^@]+$/))
            hideErrorMsg("email")
        else
            displayErrorMsg("email", "Invalid email")
    });
}
// Form validation
$('input[type="text"]').keydown(function(event) {
    this.value = this.value.toUpperCase()
});
$('input[type="text"]').change(function(event) {
    this.value = this.value.toUpperCase()
});
const forms = document.querySelectorAll("form");

forms.forEach(function(form) {
    form.addEventListener('submit', e => {
        if (!form.checkValidity()) {
            e.preventDefault();
        }
        form.classList.add('was-validated');
    });
});
