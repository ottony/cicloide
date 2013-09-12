require 'gosu'
require './point'

class Curve
  attr_accessor :win
  
  def initialize(window)
    @win =  window
    @t = 0
    @points = []
    @R = 100
    @r = 10
    @image = Gosu::Image.new(@win, 'point_image.png', true)

  end

  def update
    if (@t < Math::PI*2)
      @t += 0.01
    
      @x = (@R+@r)*Math.cos(@t) + @r*Math.sin(@t*(@R+@r)/@r - (Math::PI)/2)
      @y = (@R+@r)*Math.sin(@t) - @r*Math.cos(@t*(@R+@r)/@r - (Math::PI)/2)

      @points << Point.new(@image, @x, @y)
    end
  end

  def draw
    @points.each do |point|
      point.image.draw(point.x + 450,point.y + 350,0, 0.1, 0.1)
      #Gosu::Font.new(@w, "Times New Roman", 20).draw("Index: " + a.to_s,0,0,0)
    end
  end
end
