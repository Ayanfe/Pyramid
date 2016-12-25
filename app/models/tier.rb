class Tier < ApplicationRecord
  validates :admins, numericality: { only_integer: true, even: true }
end
