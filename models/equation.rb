require 'gosu'
require './models/point'

class Equation
  attr_accessor :R, :r

  def initialize(window)
    @point_img = Gosu::Image.new(window, './media/point_image.png', true)
    @R = 100
    @r = 100
  end 

  def get_point(angle)
      Point.new(@point_img, x_position(angle), y_position(angle))
  end

  protected
  
  def x_position(angle)
     (@R+@r)*Math.cos(angle) + @r*Math.sin(angle*(@R+@r)/@r - (Math::PI)/2)
  end

  def y_position(angle)
      (@R+@r)*Math.sin(angle) - @r*Math.cos(angle*(@R+@r)/@r - (Math::PI)/2)
  end
end
