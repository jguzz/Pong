require 'ruby2d'

set background: 'blue'

class Paddle
  HEIGHT = 150
    attr_writer :direction
    def initialize(side)
        @direction = nil
        @y = 200
        if side == :left
            @x = 40
            @movement_speed = 5
        else
            @x = 600
            @movement_speed = 3
        end
    end
    def move
        if @direction == :up 
            @y = [@y -= @movement_speed, 0].max
        elsif @direction == :down 
            @y = [@y += @movement_speed, max_y].min
        end
    end
    def draw 
        Rectangle.new(x: @x, y: @y, width: 20, height: HEIGHT, color: 'white')
    end
    private
    def max_y
        Window.height - HEIGHT
    end
end

player = Paddle.new(:left)
opponent = Paddle.new(:right)

update do 
    clear
    player.move
    player.draw
    opponent.draw
end

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

show