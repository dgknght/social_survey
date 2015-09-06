require 'rails_helper'

RSpec.describe Survey, type: :model do
  let (:user) { FactoryGirl.create(:user) }
  let (:survey_attributes) do
    {
      name: 'My first survey',
      description: 'This is a my very cool survey',
      user_id: user.id
    }
  end

  let (:really_long_name){"X" * 51}

  it 'can be created from valid attributes' do
    survey = Survey.new(survey_attributes)
    expect(survey).to be_valid
  end

  describe '#name' do
    it 'is required' do
      survey = Survey.new(survey_attributes.except(:name))
      expect(survey).not_to be_valid
      expect(survey).to have_at_least(1).error_on(:name)
    end

    it 'cannot be longer than 50 characters' do
      survey = Survey.new(survey_attributes.merge(name: really_long_name))
      expect(survey).not_to be_valid
      expect(survey).to have_at_least(1).error_on(:name)
    end

    it 'must be unique for the user that owns the survey' do
      survey_1 = Survey.create!(survey_attributes)
      survey_2 = Survey.new(survey_attributes)
      expect(survey_2).not_to be_valid
      expect(survey_2).to have_at_least(1).error_on(:name)
    end
  end

  describe '#user_id' do
    it 'is required' do
      survey = Survey.new(survey_attributes.except(:user_id))
      expect(survey).not_to be_valid
      expect(survey).to have_at_least(1).error_on(:user_id)
    end
  end
end
