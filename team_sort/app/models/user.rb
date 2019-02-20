class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :strengths, limit: 5
  has_and_belongs_to_many :teams, required: false

  attr_accessor :code, :strength1, :strength2, :strength3, :strength4, :strength5
end
