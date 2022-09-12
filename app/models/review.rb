class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, presence: true
  validates :rating, presence: true, acceptance: { accept: (0..5) }, numericality: { only_integer: true }
end
