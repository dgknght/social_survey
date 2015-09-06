class SurveysController < ApplicationController
  respond_to :html

  def index
  end

  def create
    @survey = Survey.new(survey_params)
    flash[:notice] = 'The survey was created successfully.' if @survey.save
    respond_with @survey, location: surveys_path
  end

  def new
    @survey = Survey.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  private

  def survey_params
    params.require(:survey).permit(:name, :description)
  end
end
