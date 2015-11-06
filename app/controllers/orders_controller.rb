class OrdersController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post.orders.create({user_id: current_user.id})
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def deal
    order = Order.find(params[:id])
    post = Post.find(order.post_id)
    post.sell_to = order.user_id
    post.save
    redirect_to user_path(User.find(post.user_id))
  end

  def destroy
    post = Post.find(params[:post_id])
    order = post.orders.find_by(user_id: current_user.id)
    order.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
