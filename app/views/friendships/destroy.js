$('#middleSection').html("<%= escape_javascript(render partial: 'users/following', locals: {followings: @following}) %>");
$('#following-count').html(parseInt($('#following-count').html()) - 1);
