require 'gosu'
require './models/cicloide'
require './modules/modules'

class MainControler < Gosu::Window
  def initialize
    super(900, 700, false)
    self.caption = "Cicloide Curve"
    @cicloide = Cicloide.new(self)
    @text = Gosu::Font.new(self, "Times New Roman", 30)
    @msg = Gosu::Font.new(self, "Times New Roman", 20)
    @status = Status::NONE
    @inputNumber = 1;
    @keys = [Gosu::Kb1, Gosu::Kb2, Gosu::Kb3, Gosu::Kb4, Gosu::Kb5, Gosu::Kb6,Gosu::Kb7, Gosu::Kb8, Gosu::Kb9]

  end
  
  def update
    @cicloide.update
    if (@status == Status::NONE)
      self.controller(self.getKeys)


    end
    if @inputNumber != 0
      @cicloide.setCav(@inputNumber)
      @inputNumber = 0
    end
  end
  
  def controller comb
    case comb
  
    when Controller::CONTROL*Controller::SHIFT*Controller::R
      @status = Status::READING_R
    when Controller::CONTROL*Controller::R
      @status = Status::READING_r
    else
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

    @keys.each_with_index do |key, i|
      if button_down? key
        @inputNumber = i+1
      end
    end

      if button_down? KbP
        @cicloide.nowPolar
      elsif button_down? KbC
        @cicloide.nowCartesian
      end

      if button_down? KbUp
        @cicloide.changeEntrace(:up)
      elsif button_down? KbDown
        @cicloide.changeEntrace(:down)
      elsif button_down? KbLeft
        @cicloide.changeEntrace(:left)
      elsif button_down? KbRight
        @cicloide.changeEntrace(:right)
      end
  end
  
  def draw
    #Quad
    #draw_quad(0,0,Gosu::Color::GRAY,
              #900,0,Gosu::Color::GRAY,
              #0,700,Gosu::Color::GRAY,
              #900,700,Gosu::Color::GRAY)
    @cicloide.draw
    @text.draw(@cicloide.getEquationString[0], 10,10,0,1,1,Gosu::Color::BLACK)
    @text.draw(@cicloide.getEquationString[1], 10,30,0,1,1, Gosu::Color::BLACK)
    @msg.draw("Develop by Ottony Costa", 10,680,0,1,1,Gosu::Color::BLACK)
  end
end
