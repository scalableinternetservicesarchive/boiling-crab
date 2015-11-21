$('#comment-count-<%= @post.id %>').html(parseInt($("#comment-count-<%= @post.id %>").html()) - 1);
