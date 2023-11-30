class UsersController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
      format.html
      # format.json { render json: @users.where("email ILIKE ?", "%#{params[:query]}%") }
      format.json
    end
  end

  def search
    query = params[:q]
    @users = User.where("first_name ILIKE :query OR last_name ILIKE :query", query: "%#{query}%")
    render json: @users, only: [:id, :first_name, :last_name, :email]
  end


end
