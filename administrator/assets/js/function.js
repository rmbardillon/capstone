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
const imgDiv = document.querySelector('.profile-pic-div');
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
