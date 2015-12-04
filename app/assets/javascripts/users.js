function buy(post_id, ele) {
  $.ajax({
    url: "/posts/" + post_id + "/orders",
    type: "POST",
    data: {},
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    success: function(data)
    {
        //data - response from server
        console.log("buy successful");
        ele.innerHTML = "Cancel";
        ele.classList.remove("post-cost-buy-btn");
        ele.classList.add("post-cost-cancel-btn");
        ele.setAttribute('onclick', 'cancel(' + post_id + ',this)');
    },
    error: function (error)
    {
      console.log("buy error");
    }
  });
}

function cancel(post_id, ele) {
  $.ajax({
    url:  "/posts/" + post_id + "/orders/1",
    type: "DELETE",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    success: function(data)
    {
      console.log("cancel successful");
      ele.innerHTML = "Order";
      ele.classList.remove("post-cost-cancel-btn");
      ele.classList.add("post-cost-buy-btn");
      ele.setAttribute('onclick', 'buy(' + post_id + ',this)');
    },
    error: function(error) {
      console.log("cancel error");
    }
  });
}
