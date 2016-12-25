class Tier < ApplicationRecord
  validate :validate_number_of_admins

  def validate_number_of_admins
    if admins.present?
      if Tier.count == 0
        unless admins == 1
          errors.add(:admins, "must be one")
        end
      else
        unless (admins % Tier.last.admins) == 0
          errors.add(:admins, "must be divisible by #{Tier.last.admins}")
        end
      end
    else
      errors.add(:admins, "must be present")
    end
  end
end
