$('#middleSection').html("<%= escape_javascript(render partial: 'selling', locals: {posts: @posts}) %>");
