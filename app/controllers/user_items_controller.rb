class UserItemsController < ApplicationController
  def create
    @user_item = UserItem.new
    @item = Item.find(params[:item_id])
    @user_item.item = @item
    @user_item.user = current_user

    @user_item.save
    @avatar_url = url_for(@user_item.user.avatar)
    redirect_to todo_list_path(@item.todo_list)

    @user_item = current_user.user_items.find_by(item: @item)
  end


  def destroy
    item = Item.find(params[:item_id])
    user_item = current_user.user_items.find_by(item: item)
    user_item.destroy if user_item
    redirect_to todo_list_path(item.todo_list)
  end

  # def select_item
    # item = Item.find(params[:item_id])
    # current_user.user_items.create(item: item)
  # end
end
