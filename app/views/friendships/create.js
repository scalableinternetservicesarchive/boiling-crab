$('#middleSection').html("<%= escape_javascript(render partial: 'users/following', locals: {followings: @following}) %>");
