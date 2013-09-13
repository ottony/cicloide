require 'gosu'
require './point'

class Curve
  attr_accessor :win
  
  def initialize(window)
    @win =  window
    @t = 0
    @count_vector = 0;
    @points = []
    @vectors = []
    @R = 100
    @r = 100
    
    @point_img = Gosu::Image.new(@win, 'point_image.png', true)
    #@vector_img = Gosu::Image.new(@win, 'vector_image.png', true)

  end

  def update
    if (@t <= Math::PI*2)
      @t += Math::PI/80
      @points << get_point(@t)
      @count_vector += 1
    elsif (@t<= Math::PI*4)
      @t += Math::PI/600
      @points << get_point(@t)
    end
  end

  def get_point(angle)
      Point.new(@point_img, x_position(angle), y_position(angle))
  end

  def x_position(angle)
     (@R+@r)*Math.cos(angle) + @r*Math.sin(angle*(@R+@r)/@r - (Math::PI)/2)
  end

  def y_position(angle)
      (@R+@r)*Math.sin(angle) - @r*Math.cos(angle*(@R+@r)/@r - (Math::PI)/2)
  end

  def draw
    @points.each_with_index do |point, i|
      if (i > @count_vector)
        point.image.draw(point.x + 450,point.y + 350,0, 0.1, 0.1)
      else 
        @win.draw_line(450, 350, Gosu::Color::BLACK, point.x + 450, point.y + 350, Gosu::Color::BLUE)
      end
    end
  end
end
