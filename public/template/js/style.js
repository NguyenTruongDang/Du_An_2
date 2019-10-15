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

// Lên top
$(document).ready(function () {
    $('.lentop').click(function (e) {
      e.preventDefault();
      $('body,html').animate({ scrollTop: 0 }, 2000, 'easeOutQuad')
    });
  });