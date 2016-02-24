require 'rubygems'
require_relative './screen.rb' 
require_relative './scoreScreen.rb' 
require 'cwiid'

@leds = Screen.new(100,15,30)
@scoreScreen = ScoreScreen.new

@scoreScreen.setScore(255)

@leds.clear
@leds.update
colours = [:red, :green, :blue]
hue = 1

100.times {
		(0..14).each { |x| 	
			(0..20).each { |y|
			@leds.setPixelH(x, y, hue)
			}
		}	
	@leds.update
	sleep 0.2
	hue = (hue +5) %360 
}


