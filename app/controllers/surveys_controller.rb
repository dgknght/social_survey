class SurveysController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_survey, only: [:edit, :update]
  respond_to :html

  def index
    @surveys = current_user.surveys
  end

  def create
    @survey = current_user.surveys.new(survey_params)
    flash[:notice] = 'The survey was created successfully.' if @survey.save
    respond_with @survey, location: surveys_path
  end

  def new
    @survey = Survey.new
  end

  def edit
  end

  def update
    @survey.update_attributes(survey_params)
    flash[:notice] = 'The survey was updated successfully.' if @survey.save
    respond_with @survey, location: surveys_path
  end

  def destroy
  end

  def show
  end

  private

  def load_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:name, :description)
  end
end
