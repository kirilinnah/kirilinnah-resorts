// basic interactivity for PNG Resorts site

document.addEventListener('DOMContentLoaded', function () {
    console.log('PNG Resorts site loaded.');

    // simple form validation on contact page
    var form = document.querySelector('form');
    if (form) {
        form.addEventListener('submit', function (e) {
            var name = form.name.value.trim();
            var email = form.email.value.trim();
            if (!name || !email) {
                e.preventDefault();
                alert('Please enter your name and email before submitting the form.');
            }
        });
    }

    // future: toggle mobile nav
});