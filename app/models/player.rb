class Player < ApplicationRecord
  belongs_to :game
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :game_id, presence: true
  # validates :position, uniqueness: true
  # validates :role, presence: true

  def initials
    "#{firstname[0,1].upcase}#{lastname[0,1].upcase}"
  end

  def colors
    [
      'rgb(0,0,255)','rgb(0,255,0)','rgb(255,0,0)',
      'rgb(0,255,255)','rgb(255,255,0)','rgb(255,0,255)',
      'rgb(0,0,127)','rgb(0,127,0)','rgb(127,0,0)',
      'rgb(127,0,127)','rgb(0,127,127)','rgb(127,127,0)',
      'rgb(255,0,127)','rgb(255,127,0)','rgb(127,255,0)',
      'rgb(127,0,255)','rgb(0,255,127)'
    ]
  end

  # def roles
  #   ['villager', 'werewolf']
  # end

  def werewolf?
    role == 'werewolf'
  end
end
