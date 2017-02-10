class Account < ApplicationRecord
  has_many :users, dependent: :destroy
  accepts_nested_attributes_for :users

  enum industry_type: [:other, :agriculture, :apperal, :banking, :biotechnology, :chemicals, :communications, :construction, :consulting, :education, :electronics, :energy, :engineering, :entertainmental, :finance, :food_and_beverage, :government, :healthcare, :hospitality, :insurance, :machinery, :manufacturing, :media, :not_for_profit, :recreation, :retail, :shipping, :technology, :telecommunications, :transportation, :utilities]

end
