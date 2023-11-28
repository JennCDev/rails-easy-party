class SurveysController < ApplicationController
  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      redirect_to @survey
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:question, :deadline, :category, :result, :user_id, :event_id)
  end
end
