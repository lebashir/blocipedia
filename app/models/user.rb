class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:confirmable,
         :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :wikis

  delegate :collaborators, to: :wikis

  before_save { self.role ||= :standard }

  enum role: [:standard, :premium, :admin]

  # has_one :role

end
