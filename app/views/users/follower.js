$('#middleSection').html("<%= escape_javascript(render partial: 'follower', locals: {followers: @followers}) %>");
