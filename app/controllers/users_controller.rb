class UsersController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
      format.html
      # format.json { render json: @users.where("email ILIKE ?", "%#{params[:query]}%") }
      format.json
    end
  end
end
