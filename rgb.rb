require 'rubygems'
require_relative './screen.rb' 
require_relative './scoreScreen.rb' 
require 'cwiid'

@leds = Screen.new(100,15,30)
#@scoreScreen = ScoreScreen.new

#@scoreScreen.setScore(255)

@leds.clear
@leds.update
colours=[:red,:green,:blue]
colourIndex=0

(0..14).each { |x|
	(0..29).each { |y|
		@leds.setPixel(x, y, colours[colourIndex])
		@leds.update
		sleep 0.02
		colourIndex = (colourIndex +1)%3
	}
}


