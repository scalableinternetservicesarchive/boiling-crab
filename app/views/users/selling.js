$('#middleSection').html("<%= escape_javascript(render partial: 'selling', locals: {posts: @posts}) %>");
$("html, body").animate({ scrollTop: 0 }, "slow");
