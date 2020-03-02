require 'ruby2d'

set background: 'blue'

class Paddle
    attr_writer :direction
    def initialize(side)
        @direction = nil
        @y = 200
        if side == :left
            @x = 40
        else
            @x = 600
        end
    end
    def move
        if @direction == :up 
            @y -= 1
        elsif @direction == :down 
            @y += 1
        end
    end
    def draw 
        Rectangle.new(x: @x, y: @y, width: 20, height: 150, color: 'white')
    end
end

player = Paddle.new(:left)

update do 
    clear
    player.move
    player.draw
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