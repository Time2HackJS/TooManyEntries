$( document ).on('turbolinks:load', function() {
    //Initialization
    Waves.attach('.btn, .btn-floating', ['waves-light']);
    Waves.attach('.waves-light', ['waves-light']);
    Waves.attach('.navbar-nav a:not(.navbar-brand), .nav-icons li a, .navbar form, .nav-tabs .nav-item', ['waves-light']);
    Waves.attach('.pager li a', ['waves-light']);
    Waves.attach('.pagination .page-item .page-link', ['waves-effect']);
    Waves.init();/* FORMS */
});

function checkInputs() {
    $('input[type=text], input[type=password], input[type=email], input[type=url], input[type=tel], input[type=number], input[type=search], input[type=date], input[type=time], textarea').each(function (element, i) {
        if ((element.value !== undefined && element.value.length > 0) || $(this).attr('placeholder') !== null) {
            $(this).siblings('label').addClass('active');
        }
        else {
            $(this).siblings('label').removeClass('active');
        }
    });
}