class Game < ApplicationRecord
  has_many :players

  validates :difficulty, presence: true
end
