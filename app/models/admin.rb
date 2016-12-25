class Admin < ApplicationRecord
  belongs_to :admin
  belongs_to :tier
end
