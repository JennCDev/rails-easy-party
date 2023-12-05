class SurveysController < ApplicationController
  def show
    @survey = Survey.find(params[:id])
    @answer = Answer.new
  end



  def new
    @survey = Survey.new
    @event = Event.find(params[:event_id])
    @users = User.all
    @guests = @event.user_events
  end

  def create
    @survey = Survey.new(survey_params)
    @event = Event.find(params[:event_id])
    @survey.user = current_user
    @survey.event = @event
    @survey.category = "Autre"
    # raise
    if @survey.save
      if params[:survey][:answer].present?
        params[:survey][:answer].each do |answer|
          new_answer = Answer.new(content: answer, survey: @survey)
          new_answer.save if new_answer.valid?

        end
      end
      redirect_to survey_path(@survey)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:question, :deadline, :category, :hidden_user_id)
  end
end
