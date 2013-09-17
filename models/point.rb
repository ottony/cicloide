class Point
  attr_accessor :x
  attr_accessor :y
  attr_reader :image
  
  def initialize (image_, x_ = 0, y_ = 0)
      @x =  x_
      @y =  y_
      @image = image_
  end
end
