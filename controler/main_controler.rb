require './models/curve'
require './modules/modules'

class MainControler < Gosu::Window
  def initialize
    super(900, 700, false)
    self.caption = "Cicloide Curve"
    @eq =  Equation.new(self) 
    @curve = Curve.new(self,@eq)
    @text = Gosu::Font.new(self, "Times New Roman", 30)
    @status = Status::NONE
  end

  def update
    @curve.update
    if (@status == Status::NONE)
      self.controller(self.getKeys)
    end
  end
  
  def controller comb
   @str = ""

    case comb
  
    when Controller::CONTROL*Controller::SHIFT*Controller::R
      @str = "R"
      @status = Status::READING_R
    when Controller::CONTROL*Controller::R
      @str = "r"
      @status = Status::READING_r
    else
      @str = "||"
      @status = Status::NONE
    end
  
  end
  
  def getKeys
    input = 1
    if button_down? Gosu::KbLeftControl
      input *= Controller::CONTROL
    end
    if button_down? Gosu::KbLeftShift
      input *= Controller::SHIFT
    end
    if button_down? Gosu::KbR
      input *= Controller::R
    end
  end
  
  def draw
    #Quad
    draw_quad(0,0,Gosu::Color::GRAY,
              900,0,Gosu::Color::GRAY,
              0,700,Gosu::Color::GRAY,
              900,700,Gosu::Color::GRAY)
    @curve.draw

    @text.draw(@str, 10,10,0)
  end
end
