require 'rubygems'
require_relative './screen.rb' 
require_relative './scoreScreen.rb' 
require 'cwiid'

@leds = Screen.new(100,15,30)
@scoreScreen = ScoreScreen.new

@scoreScreen.setScore(255)

@leds.clear
@leds.update
hue = 1

100.times {
	(0..29).each { |y|
		(0..14).each { |x| 	
			@leds.setPixelH(x, y, hue)
		}
		hue = (hue +5) %360
	}	
	@leds.update
	sleep 0.5
}


