class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    unless @item.content == ""
      @todo_list = TodoList.find(params[:todo_list_id])
      @item.todo_list = @todo_list
      if @item.save
        redirect_to todo_list_path(@todo_list)
      else
        render "todo_lists/show", status: :unprocessable_entity
      end
    end
  end

  def item_params
    params.require(:item).permit(:content)
  end
end
