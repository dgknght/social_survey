class Survey < ActiveRecord::Base
  validates :name, presence: true,
                   length: { maximum: 50 },
                   uniqueness: { scope: :user_id }
  validates_presence_of :user_id
end
