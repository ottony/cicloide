require './models/equation'
require './models/curve'

class Cicloide < Curve
  attr_accessor :window

  def initialize(window)
    @window =  window
    @t = 0
    @count_vector = 0;
    @points = []
    @vectors = []
    @equation = Equation.new(window)
  end

  def reload
    @points.clear
    @vectors.clear
    @t = 0
    @count_vector = 0;
    @points = []
    @vectors = []
  end


  def update
    if (@t <= Math::PI*2)
      @t += Math::PI/80
      @points << @equation.get_point(@t)
      @count_vector += 1
    elsif (@t<= Math::PI*4)
      @t += Math::PI/600
      @points << @equation.get_point(@t)
    end
  end

  def draw
    @points.each_with_index do |point, i|
      if (i > @count_vector)
        point.image.draw(point.x + 450,point.y + 350,0, 0.08, 0.08)
      else 
        @window.draw_line(450, 350, Gosu::Color::BLACK, point.x + 450, point.y + 350, Gosu::Color::BLUE)
      end
    end
  end

  def setCav(rason)
    case rason
    when 1
      @equation.R = 1*100
      @equation.r = 100
    when 2
      @equation.R = 2*5*10
      @equation.r = 5*10
    when 3
      @equation.R = 3*3*10
      @equation.r = 3*10
    when 4
      @equation.R = 4*5*5
      @equation.r = 5*5
    when 5
      @equation.R = 5*5*5
      @equation.r = 5*5
    when 6
      @equation.R = 6*5*5
      @equation.r = 5*5
    when 7
      @equation.R = 7*3*10
      @equation.r = 3*10
    when 8
      @equation.R = 8*5*5
      @equation.r = 5*5
    when 9
      @equation.R = 9*3*8
      @equation.r = 3*8
    end
  end
end
