class Admin < ApplicationRecord
  belongs_to :admin, optional: true
  belongs_to :tier
end
