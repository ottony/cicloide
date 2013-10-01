require 'gosu'
require './models/point'

class CicloideEquationPolar
  attr_accessor :trigonometric, :sense

  def initialize(window)
    @point_img = Gosu::Image.new(window, './media/point_image.png', true)
    @trigonometric = :sin
    @sense = 1
  end 

  def getPoint(angle)
      Point.new(@point_img, x_position(angle), y_position(angle))
  end

  def getEquationString
    ["r = 1 #{@sense < 0 ? "+":"-"} #{@trigonometric.to_s}(t)", "Θ = t"]
  end

  protected
  def r(angle)
      1 - @sense*Math.send(@trigonometric, angle)
  end  

  def x_position(angle)
     150*(r(angle))*Math.cos(angle)
  end

  def y_position(angle)
     150*(r(angle))*Math.sin(angle)
  end
end
