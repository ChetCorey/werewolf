class Player < ApplicationRecord

  def initials
     "#{firstname[0,1].upcase}#{lastname[0,1].upcase}"
   end

  def color
    r = ((firstname[0,1].sum % 15) + 1) * 32
    g = ((lastname[0,1].sum % 15) + 1) * 32
    b = ((initials.sum % 15) + 1) * 32
    "rgb(#{r},#{g},#{b})"
  end
end
