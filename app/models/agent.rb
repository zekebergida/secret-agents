class Agent < ApplicationRecord
  validates :field_name, presence: true
  validates :base, presence: true
end
