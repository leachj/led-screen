require "serialport"

class ScoreScreen
 

def initialize

	#params for serial port
	port_str = "/dev/ledScoreScreen"  #may be different for you
	baud_rate = 57600
	data_bits = 8
	stop_bits = 1
	parity = SerialPort::NONE
 
	@sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
	@sp.sync = true

	sleep(5)

end

def setScore(score) 
	@sp.putc(score)
	@sp.flush
end


end
