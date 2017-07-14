class Wiki < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  has_many :collaborators
end
