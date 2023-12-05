class SurveysController < ApplicationController
  def show
    @survey = Survey.find(params[:id])
    @answer = Answer.new
    user_event = @survey.event.user_events.find_by(user_id: current_user.id)
    user_event ? @user_is_planner = user_event.planner : @user_is_planner = false
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
    @survey.category = "Autre"
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

  def update
    @survey = Survey.find(params[:id])
    @answer = Answer.new
    user_event = @survey.event.user_events.find_by(user_id: current_user.id)
    user_event ? @user_is_planner = user_event.planner : @user_is_planner = false
    if @survey.update(survey_params)
      redirect_to survey_path(@survey)
    else
      render "surveys/show", status: :unprocessable_entity
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:question, :deadline, :category)
  end
end
