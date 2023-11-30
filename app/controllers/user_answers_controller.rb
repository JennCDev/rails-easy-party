class UserAnswersController < ApplicationController
  def create
    @user_answer = UserAnswer.new
    @answer = Answer.find(params[:answer_id])
    @user_answer.user = current_user
    @user_answer.answer = @answer
    @user_answer.save
    redirect_to survey_path(@answer.survey), status: :see_other
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to survey_path(@answer.survey), status: :see_other
  end
end
