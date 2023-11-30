class UserItemsController < ApplicationController
  def create

    @user_item = UserItem.new
    @item = Item.find(params[:item_id])
    @user_item.item = @item
    @user_item.user = current_user

    @user_item.save
    redirect_to todo_list_path(@item.todo_list)

  end
end
