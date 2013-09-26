require './models/equation'

class Curve
  attr_accessor :win
  
  def initialize(window, equation)
    @win =  window
    @t = 0
    @count_vector = 0;
    @points = []
    @vectors = []
    @equation = equation
    @text = Gosu::Font.new(@win, "Times New Roman", 30)

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
   # @text.draw("CTRL+SHIFT+r set R | CTRL+r set r ", 10,10,0)
    @points.each_with_index do |point, i|
      if (i > @count_vector)
        point.image.draw(point.x + 450,point.y + 350,0, 0.1, 0.1)
      else 
        @win.draw_line(450, 350, Gosu::Color::BLACK, point.x + 450, point.y + 350, Gosu::Color::BLUE)
      end
    end
  end
end
