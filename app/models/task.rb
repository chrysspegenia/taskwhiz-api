class Task < ApplicationRecord
  before_save :capitalize_title

  belongs_to :board
  has_one_attached :image
end
