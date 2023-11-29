class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    @event = Event.find(params[:event_id])
  end

  def create
    raise
    @survey = Survey.new(survey_params)
    @event = Event.find(params[:event_id])
    @survey.user = current_user
    @survey.event = @event

    if @survey.save
      redirect_to @survey
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:question, :deadline, :category)
  end
end
