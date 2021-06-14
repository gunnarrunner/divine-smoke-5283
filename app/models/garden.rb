class Garden < ApplicationRecord
  has_many :plots
  has_many :plants, through: :plots


  def unique_name_and_not_100_days
    plants.where("days_to_harvest < 100")
          .uniq
          .pluck(:name)
  end
end
