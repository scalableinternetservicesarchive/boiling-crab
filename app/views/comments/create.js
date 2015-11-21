$('#comment-list-<%= @post.id %>').append("<%= escape_javascript(render partial: 'comment', locals: {comment: @comment}) %>");
$('#comment-count-<%= @post.id %>').html(parseInt($("#comment-count-<%= @post.id %>").html()) + 1);
$(".comment-delete").click(function(){
  $(this).parent().parent().remove();
});

$("#comment-text-<%= @post.id %>").val("" );
