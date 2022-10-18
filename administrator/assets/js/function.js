$(document).ready( function () {
    $('#mainAdministrators').DataTable();
    $('#pwdAdministrators').DataTable();
    $('#soloparentAdministrators').DataTable();
    $('#srCitizenAdministrators').DataTable();
    $('#pwdDataTable').DataTable();
    $('#spDataTable').DataTable();
    $('#scDataTable').DataTable();
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
