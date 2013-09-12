require 'gosu'

class Curve
  def initialize(window)
    @w =  window
    @t = 0
    @angles = []
  end

  def update
    @t += 1
    @angles <<  @t
  end

  def draw
    @angles.each do |a|
      #Gosu::Font.new(@w, "Times New Roman", 20).draw("Index: " + a.to_s,0,0,0)
    end
  end
end
