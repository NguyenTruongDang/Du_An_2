
// Ẩn hiện đăng ký đăng nhập
$(document).ready(function () {
    $('.signup-container').hide();
    $('.login-container').hide();
    $('#dangnhap').click(function () {
        $('.login-container').slideToggle();
        $('.signup-container').fadeOut();
        $('.login-container').css({"position": "absolute", "z-index": "99999","margin": "7%" });
        $('.login-container div.row').css("background-color", "#fff");
    });
    $('#dangky').click(function () {
        $('.signup-container').slideToggle();
        $('.login-container').fadeOut();
        $('.signup-container').css({"position": "absolute", "z-index": "99999","margin": "7%" });
        $('.signup-container div.row').css("background-color", "#fff");
    });
    $('#chuyendk').click(function (event) {
        $('.signup-container').fadeIn();
        $('.login-container').fadeOut();
    });
    $('#chuyendn').click(function (event) {
        $('.signup-container').fadeOut();
        $('.login-container').fadeIn();
    });
});

// Ẩn hiện about, timeline
$(document).ready(function () {
    $('.all-timeline').hide();
    $('#chuyenabout').css("color", "#23527c");
    $('#chuyentimeline').click(function () {
        $('.all-timeline').fadeIn('slow');
        $('.all-about').hide('slow');
        $('#chuyenabout').css("color", "");
    });
    $('#chuyenabout').click(function () {
        $('.all-timeline').fadeOut('slow');
        $('.all-about').show('slow');
    });
});
