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
      @cicloide.reload
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
  end
  
  def draw
    #Quad
    draw_quad(0,0,Gosu::Color::GRAY,
              900,0,Gosu::Color::GRAY,
              0,700,Gosu::Color::GRAY,
              900,700,Gosu::Color::GRAY)
    @cicloide.draw
    @msg.draw("Press 1, 2, 3, 4, 5, 6, 7, 8 or 9 to change numbers of 'entrace'", 10,10,0)
    @msg.draw("Develop by Ottony Costa", 10,680,0)
  end
end
