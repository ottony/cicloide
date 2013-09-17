require './scene/curve'

class GameWindow < Gosu::Window
  def initialize
    super(900, 700, false)
    self.caption = "Cicloide Curve"
    @eq =  Equation.new(self) 
    @curve = Curve.new(self,@eq)
  end

  def update
    @curve.update
  end

  def draw
    #Quad
    draw_quad(0,0,Gosu::Color::GRAY,
              900,0,Gosu::Color::GRAY,
              0,700,Gosu::Color::GRAY,
              900,700,Gosu::Color::GRAY)
    @curve.draw
  end
end
