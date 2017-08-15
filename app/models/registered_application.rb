class RegisteredApplication < ApplicationRecord
  belongs_to :user
  has_many :event
end
