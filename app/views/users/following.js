$('#middleSection').html("<%= escape_javascript(render partial: 'following', locals: {followings: @following}) %>");
