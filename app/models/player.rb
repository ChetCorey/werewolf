class Player < ApplicationRecord
  belongs_to :game
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :game_id, presence: true
  validates :position, uniqueness: true
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

  def roles
    ['villager', 'werefolf']
  end

  def werefolf?
    roles[role] == 'werefolf'
  end

  def werefolf_calculation

  end

  # def role
  #   binding.pry
  #   read_attribute(:role).to_i -=1
  #   roles[]
  #
  # end

  def color
    colors[position]
  end
end
