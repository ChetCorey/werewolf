class Player < ApplicationRecord
  before_save :build_player
  validates :firstname, presence: true
  validates :lastname, presence: true
  # validates :position, presence: true, uniqueness: true
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
    [['villager',1], ['werefolf',2]]
  end

  def build_player
    self.position = Player.count if position.nil?
    self.role = "villager" if role.nil?
  end



  def color
    colors[position]
  end
end
