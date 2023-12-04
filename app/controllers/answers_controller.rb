class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    unless @answer.content == ""
      @survey = Survey.find(params[:survey_id])
      @answer.survey = @survey
      if @answer.save
        redirect_to survey_path(@survey)
      else
        render "surveys/show", status: :unprocessable_entity
      end
    end
  end

  def answer_params
    params.require(:answer).permit(:content)
  end
end
