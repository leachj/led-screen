require 'rubygems'
require_relative './screen.rb' 

@leds = Screen.new(100,15,30)

@leds.clear
@leds.update
colours = [:red, :green, :blue]
rain = []


1000000.times { |n|

(0..14).each { |col|

	rain << [col,29, rand(6), rand(3)+1] if rand(15) == 0
	
}

@leds.clear
newRain = []
rain.each { |loc|

	@leds.setPixel(loc[0], loc[1], :green) unless loc[1] < 0
	loc[2].times { |n|
		@leds.setPixelB(loc[0], loc[1]+n, :green, 1.0/(n+1)) unless (loc[1]+n >= 29 or (loc[1]+n) < 0)
	}
	diff = 0
	diff = 1 if (n % loc[3]) == 0
	newRain << [loc[0], loc[1] -diff, loc[2], loc[3]] unless (loc[1]+loc[2]) <= 0 
	
}
	rain = newRain
	@leds.update
	sleep 0.015
}


