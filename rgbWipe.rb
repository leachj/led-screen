require 'rubygems'
require_relative './screen.rb' 

@leds = Screen.new(100,15,30)


@leds.clear
@leds.update
colours = [:red, :green, :blue]

100.times {
colours.each { |col| 
	(0..29).each { |y|
		(0..14).each { |x| 	
			@leds.setPixel(x, y, col)
		}	
		@leds.update
		sleep 0.02
	}

}
	colours.each { |col|

		(0..14).each { |x|
 	               (0..29).each { |y|
        	                @leds.setPixel(x, y, col)
               	 	}
                	@leds.update
                	sleep 0.02
        	}
	}
}


