#Connects the ruby2d gem library
require 'ruby2d'

#Sets the windows background to blue
set background: 'blue'

#class for our Paddles
class Paddle
  HEIGHT = 150
    attr_writer :direction
    def initialize(side)
        @direction = nil
        @y = 200
        #if paddle is on left postion on left, if on right pos on right.
        if side == :left
            @x = 40
            @movement_speed = 5
        else
            @x = 600
            @movement_speed = 3
        end
    end
    #Moves the paddle up or down the y axis depending on the direction given from key press
    def move
        if @direction == :up 
            @y = [@y -= @movement_speed, 0].max
        elsif @direction == :down 
            @y = [@y += @movement_speed, max_y].min
        end
    end
    #draws our paddle object
    def draw 
        Rectangle.new(x: @x, y: @y, width: 20, height: HEIGHT, color: 'white')
    end
    private
    #gives the max y value for the window, that our paddle can go to.
    def max_y
        Window.height - HEIGHT
    end
end

#instanciate a player paddle
player = Paddle.new(:left)
#instanciate an opponent paddle
opponent = Paddle.new(:right)

#update runs a loop 60 times per second, allowing interactive object
update do 
    clear
    player.move
    player.draw
    opponent.draw
end

#listens for an event key_down if up moves the direction up, down for direction down
on :key_down do |event|
    if event.key == 'up' 
        player.direction = :up
    elsif event.key == 'down' 
        player.direction = :down
    end
end
on :key_up do |event|
    player.direction = nil
end

#displays our code to a window.
show