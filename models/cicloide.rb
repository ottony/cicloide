require './models/cicloide_equation_cartesian'
require './models/cicloide_equation_polar'
require './models/curve'

class Cicloide < Curve
  attr_accessor :window

  def initialize(window)
    @window =  window
    @t = 0
    @count_vector = 0;
    @points = []
    @vectors = []
    @cicloide_polar = CicloideEquationPolar.new(window)
    @cicloide_cartesian = CicloideEquationCartesian.new(window)
    @current = @cicloide_polar
  end

  def reload
    @points.clear
    @vectors.clear
    @t = 0
    @count_vector = 0;
    @points = []
    @vectors = []
  end

  def getEquationString
    @current.getEquationString
  end
  def changeCicloide()
    @cicloide_cartesian.hipo = -1*@cicloide_cartesian.hipo
    self.reload
  end
  def nowPolar
    @current = @cicloide_polar
    self.reload
  end

  def nowCartesian
    @current = @cicloide_cartesian
    self.reload
  end

  def update
    if currentPolar?
      if (@t <= Math::PI*2)
        @t += Math::PI/80
        @points << @current.getPoint(@t)
        @count_vector += 1
      elsif (@t <= Math::PI*4)
        @t += Math::PI/600
        @points << @current.getPoint(@t)
      end
    else
      if (@t >= -Math::PI*2)
        @t -= Math::PI/80
        @points << @current.getPoint(@t)
        @count_vector += 1
      elsif (@t >= -Math::PI*4)
        @t -= Math::PI/600
        @points << @current.getPoint(@t)
      end
    end
  end

  def draw
    @points.each_with_index do |point, i|
      if (i > @count_vector)
        point.image.draw(aligneX(point.x),aligneY(point.y),0, 0.08, 0.08)
      else 
        @window.draw_line(450, 350, Gosu::Color::BLACK, aligneX(point.x), aligneY(point.y), Gosu::Color::BLUE)
      end
    end
  end

  def currentPolar?
    @current.class == CicloideEquationPolar
  end
  def aligneX(x)
    x+450
    #if (currentPolar?) then -1*x+450 else (x+450) end
  end

  def aligneY(y)
    if (currentPolar?) then -1*y+350 else (y+350) end
  end

  def setCav(rason)
    case rason
    when 1
      @cicloide_cartesian.R = 1*100
      @cicloide_cartesian.r = 100
    when 2
      @cicloide_cartesian.R = 2*5*10
      @cicloide_cartesian.r = 5*10
    when 3
      @cicloide_cartesian.R = 3*3*10
      @cicloide_cartesian.r = 3*10
    when 4
      @cicloide_cartesian.R = 4*5*5
      @cicloide_cartesian.r = 5*5
    when 5
      @cicloide_cartesian.R = 5*5*5
      @cicloide_cartesian.r = 5*5
    when 6
      @cicloide_cartesian.R = 6*5*5
      @cicloide_cartesian.r = 5*5
    when 7
      @cicloide_cartesian.R = 7*3*10
      @cicloide_cartesian.r = 3*10
    when 8
      @cicloide_cartesian.R = 8*5*5
      @cicloide_cartesian.r = 5*5
    when 9
      @cicloide_cartesian.R = 9*3*8
      @cicloide_cartesian.r = 3*8
    end

    self.reload unless currentPolar?
  end

  def changeEntrace(entrace)
    case entrace
    when :up
      @cicloide_polar.trigonometric = :sin
      @cicloide_polar.sense = 1
    when :down
      @cicloide_polar.trigonometric = :sin
      @cicloide_polar.sense = -1
    when :left
      @cicloide_polar.trigonometric = :cos
      @cicloide_polar.sense = -1
    when :right
      @cicloide_polar.trigonometric = :cos
      @cicloide_polar.sense = 1
    end
    self.reload if currentPolar?
  end
end
