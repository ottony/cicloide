require 'gosu'
require './models/point'

class CicloideEquationCartesian
  attr_accessor :R, :r, :hipo

  def initialize(window)
    @point_img = Gosu::Image.new(window, './media/point_image.png', true)
    @R = 100
    @r = 100
    @hipo = 1
  end 

  def getPoint(angle)
      Point.new(@point_img, x_position(angle), y_position(angle))
  end

  def getEquationString
    #["X = (#{@R}+#{@r})*cos(t) + #{@r}*sin((t/#{@r})*(#{@R}+#{@r}) - PI/2)", "Y = (#{@R}+#{@r})*sin(t) + #{@r}*cos((t/r)*(#{@R}+#{@r}) - PI/2)"]
    ["X = (R+r)*cos(t) + r*sin((t/r)*(R+r) - PI/2)", "Y = (R+r)*sin(t) + r*cos((t/r)*(R+r) - PI/2)"]
  end

  protected
  
  def x_position(angle)
     (@R+@r)*Math.cos(angle) + @hipo*@r*Math.sin(angle*(@R+@r)/@r - (Math::PI)/2)
  end

  def y_position(angle)
      (@R+@r)*Math.sin(angle) - @r*Math.cos(angle*(@R+@r)/@r - (Math::PI)/2)
  end
end
