class TodoListsController < ApplicationController
  def show
    @todo_list = TodoList.find(params[:id])
  end

  def new
    @todo_list = TodoList.new
    @event = Event.find(params[:event_id])
  end

  def create
    @todo_list = TodoList.new(todo_list_params)
    @event = Event.find(params[:event_id])
    @todo_list.user = current_user
    @todo_list.event = @event
    if @todo_list.save
      params[:option].each do |item|
        # raise
        new_item = Item.new(content: item, todo_list: @todo_list)
        new_item.save if new_item.valid?
      end
      redirect_to todo_list_path(@todo_list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @todo_list = TodoList.find(params[:id])
    if @todo_list.update(todo_list_params)
      redirect_to todo_list_path(@todo_list.event)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @todo_list = TodoList.find(params[:id])
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:title, :user_id, :event_id)
  end
end
