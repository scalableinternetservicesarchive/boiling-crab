$('#middleSection').html("<%= escape_javascript(render partial: 'sold', locals: {posts: @posts}) %>");
