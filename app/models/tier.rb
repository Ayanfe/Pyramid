class Tier < ApplicationRecord
  validate :validate_number, :validate_creation, :validate_previous_is_full
  has_many :admins

  def validate_number
    if number.present?
      if Tier.count == 0
        unless number == 1
          errors.add(:number, "must be one")
        end
      else
        unless (number % Tier.last.number) == 0
          errors.add(:number, "must be divisible by #{Tier.last.number}")
        end
      end
    else
      errors.add(:number, "must be present")
    end
  end

  def validate_creation
    if Tier.last && Tier.last.bottom == true
      errors.add(:bottom, "No more tiers can be created")
    end
  end

  def full?
    if number == admins.count
      return true
    end
    false
  end

  def validate_previous_is_full
    if Tier.last
      unless Tier.last.full?
        errors.add(:create, "Previous tier must be full")
      end
    end
  end
end
