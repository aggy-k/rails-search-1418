class Director < ApplicationRecord
  has_many :movies

  include PgSearch::Model
  multisearchable against: [:first_name, :last_name]
end
