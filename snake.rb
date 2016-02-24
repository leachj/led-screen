require 'rubygems'
require_relative './screen.rb' 
require_relative './scoreScreen.rb' 
require 'cwiid'

@leds = Screen.new(100,15,30)
@scoreScreen = ScoreScreen.new
puts "Put WiiMote in discoverable mode!"
@wiimote = WiiMote.new
@score = 0
@blocks = []

Thread.new {
	while true
	@wiimote.get_state
	
	case @wiimote.buttons
	when WiiMote::BTN_LEFT
		@dir=[-1,0] unless @dir[0] != 0
	when WiiMote::BTN_RIGHT
		@dir=[1,0] unless @dir[0] != 0
	when WiiMote::BTN_DOWN
		@dir=[0,-1] unless @dir[1] != 0
	when WiiMote::BTN_UP
		@dir=[0,1] unless @dir[1] != 0
	when WiiMote::BTN_PLUS
                @score = 0
		@scoreScreen.setScore(@score)
		@running=true
	end
	sleep 0.1
end
}



def gameOver

	@snake.each do |segment|

                @leds.setPixel(segment[0], segment[1], :red)
        end
        @leds.setPixel(@snake[-1][0], @snake[-1][1], :green)

	(1..28).each do |y|

		(1..13).each do |x|
			@leds.setPixel(x,y-1,:black) unless y == 1
			@leds.setPixel(x,y,:white)
		end 
		@leds.update
		sleep 0.1
	end

	@leds.clear
	drawOutline(:blue)
	@leds.update


	reset
	

end

def reset

	@running=false
	@speed = 0.25
	@dir=[1,0]
	@snake=[[4,5],[5,5]]
	@blocks = []
	@block=randomBlock
	@score=255
	@scoreScreen.setScore(@score)
	puts "Ready to go, press + to start"
end

def drawOutline(colour)


	(0..14).each do |i|
                @leds.setPixel(i,0,colour)
                @leds.setPixel(i,29,colour)
        end

        (0..29).each do |i|
                @leds.setPixel(0,i,colour)
                @leds.setPixel(14,i,colour)
        end


end

def randomBlock

	newPos = [1,1]
	loop do
		newPos = [rand(13)+1, rand(28)+1]
		break if (!((@snake.include? newPos) || (@blocks.include? newPos) || (newPos[0] == @snake[0][0]) || (newPos[1] == @snake[0][1])))
	end	
	newPos
end

@leds.hardClear
@leds.update
reset



while true
	
	if(@running)

	@wiimote.rumble=false	

	@leds.clear
	
	drawOutline(:blue)

	newLoc = [(@snake[-1][0] + @dir[0]),(@snake[-1][1] + @dir[1])]	
	
	@snake.each do |segment|

                if(newLoc[0] == segment[0] and newLoc[1] == segment[1])
                        gameOver
			next
                end
        end

	@blocks.each do |segment|
                
                if(newLoc[0] == segment[0] and newLoc[1] == segment[1])
                        gameOver
                        next
                end
        end

	if(newLoc[0] == 0 or newLoc[0] == 14 or newLoc[1] == 0 or newLoc[1] == 29)
		gameOver
		next
	end

	@snake.push(newLoc)
	
	if(@snake[-1][0] == @block[0] and @snake[-1][1] == @block[1])
		@blocks << randomBlock
		@block=randomBlock
		@wiimote.rumble=true
		@score = @score + 1
		@scoreScreen.setScore(@score)
		@speed = @speed - (0.005)
	else
		@snake.shift
	end

	@snake.each do |segment|

		@leds.setPixel(segment[0], segment[1], :red)
	end
	@blocks.each do |block|
		@leds.setPixel(block[0], block[1], :white)
	end
	@leds.setPixel(@snake[-1][0], @snake[-1][1], :green)	

	@leds.setPixel(@block[0], @block[1], :yellow)

	@leds.update

	end

	sleep(@speed)

end

sleep 5

