require "serialport"
require "color"

class Screen
 

def initialize(brightness,width, height)

	#params for serial port
	port_str = "/dev/ledScreen"  #may be different for you
	baud_rate = 115200
	data_bits = 8
	stop_bits = 1
	parity = SerialPort::NONE
 
	@sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
	@sp.sync = true

	@height = height
	@state = Array.new(width) {Array.new(height,[0,0,0])}
	@lastState = Array.new(width) {Array.new(height,[0,0,0])}
	@colourMap = {:white => [brightness,brightness,brightness],:black => [0,0,0], :red => [brightness,0,0], :blue => [0,0,brightness], :pink => [brightness,192,203], :green => [0,brightness,0], :cyan => [0,brightness,brightness], :purple => [160,32,240], :yellow => [brightness,brightness,0]}
end

def update 

	@state.each_with_index{|arr, x|
		arr.each_with_index {|val, y|
 			if(@lastState[x][y] != val)
				
				if ((x % 2) == 0)
					ledNum = (x * @height)+y
				else
					ledNum = (x * @height) + (@height - y) -1
				end

				if (ledNum >= 254)
					@sp.putc(ledNum-254)
					@sp.putc(1)
				else
					@sp.putc(ledNum)
					@sp.putc(0)
				end
				@sp.putc(val[0])
				@sp.putc(val[1])
				@sp.putc(val[2])


				@lastState[x][y] = val
			end               	
        	}
	}
	@sp.putc(255)
	@sp.flush
end


def setPixel(x,y,colour)

	@state[x][y] = @colourMap[colour]
end

def setPixelB(x,y,colour,brightness)

	@state[x][y] = @colourMap[colour].map { |comp| comp * brightness }
end

def setPixelH(x,y,hue)

	col = Color::HSL.new(hue,100,50).to_rgb

	@state[x][y] = [col.red.to_i, col.green.to_i, col.blue.to_i].map { |n| [n,254].min }
end


def clear
	@state.each_with_index{|arr, x|
                arr.each_with_index {|val, y|
			@state[x][y] = [0,0,0]
		}
	}
end

def hardClear
	@state.each_with_index{|arr, x|
                arr.each_with_index {|val, y|
			@lastState[x][y] = [1,0,0]
			@state[x][y] = [0,0,0]
		}
	}
end
end
