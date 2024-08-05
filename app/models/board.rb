class Board < ApplicationRecord
  before_save :capitalize_title

  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :title, presence: true
end