class SurveysController < ApplicationController
  def show
    @survey = Survey.find(params[:id])
    @event = Event.find(params[:id])
  end

  def new
    @survey = Survey.new
    @event = Event.find(params[:event_id])
  end

  def create
    @survey = Survey.new(survey_params)
    @event = Event.find(params[:event_id])
    @survey.user = current_user
    @survey.event = @event
    if @survey.save
      params[:survey][:answer].each do |answer|
        new_answer = Answer.new(content: answer, survey: @survey)
        new_answer.save if new_answer.valid?
      end
      redirect_to survey_path(@survey)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:question, :deadline, :category)
  end
end
