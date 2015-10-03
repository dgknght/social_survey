require 'rails_helper'

RSpec.describe SurveysController, type: :controller do
  let (:user) { FactoryGirl.create(:user) }
  let (:survey_attributes) do
    {
      name: 'My first survey',
      description: 'This is a great survey. You are going to love it.'
    }
  end
  let (:survey) { FactoryGirl.create(:survey) }

  context 'for an authenticated user' do
    before(:each) { sign_in user }

    describe "get #index" do
      it 'is successful' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "post #create" do
      it 'creates a new survey' do
        expect do
          post :create, survey: survey_attributes
        end.to change(Survey, :count).by(1)
      end

      it 'redirects to the survey index page'
    end

    describe "get #new" do
      it 'is successful' do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    context 'that owns the survey' do
      describe "get #edit" do
        it 'is successful' do
          get :edit, id: survey
          expect(response).to be_success
        end
      end

      describe "patch #update" do
        it 'updates the survey' do
          original_name = survey.name
          expect do
            patch :update, id: survey, survey: survey_attributes
            survey.reload
          end.to change(survey, :name).from(original_name).to('My first survey')
        end

        it 'redirects to the survey index page' do
          patch :update, id: survey, survey: survey_attributes
          expect(response).to redirect_to surveys_path
        end
      end

      describe "delete #destroy" do
        it 'deletes the survey'
        it 'redirects to the survey index page'
      end

      describe "GET #show" do
        it 'is successul'
      end
    end

    context 'that does not own the survey' do
      describe 'get #edit' do
        it 'redirects to the user\'s home page'
      end

      describe 'path #update' do
        it 'does not update the survey'
        it 'redirects to the user\'s home page'
      end

      describe 'delete #destory' do
        it 'does not delete the survey'
        it 'redirects to the user\'s home page'
      end

      describe 'get #show' do
        it 'redirects to the user\'s home page'
      end
    end
  end

  context 'for an unauthenticated user' do
    describe "get #index" do
      it 'is successful' # All users can see surveys so they can take them
    end

    describe "post #create" do
      it 'does not create a survey'
      it 'redirects to the sign in page'
    end

    describe "get #new" do
      it 'redirects to the sign in page'
    end

    describe 'get #edit' do
      it 'redirects to the sign in page'
    end

    describe 'path #update' do
      it 'does not update the survey'
      it 'redirects to the sign in page'
    end

    describe 'delete #destory' do
      it 'does not delete the survey'
      it 'redirects to the sign in page'
    end

    describe 'get #show' do
      it 'redirects to the sign in page'
    end
  end
end
