class Poll < ApplicationRecord
  has_many :poll_choices, dependent: :destroy
  has_many :votes, dependent: :destroy
end
