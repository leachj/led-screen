require_relative './screen.rb' 

pixelMap = {
' '=>[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
'!'=>[0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
'"'=>[0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0],
'#'=>[0,0,1,0,1,0,0,1,1,1,1,1,1,1,0,0,1,0,1,0,0,1,1,1,1,1,1,1,0,0,1,0,1,0,0],
'$'=>[0,0,1,0,0,1,0,0,1,0,1,0,1,0,1,1,1,1,1,1,1,0,1,0,1,0,1,0,0,1,0,0,1,0,0],
'%'=>[1,1,0,0,0,1,0,1,1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,1,1,0,1,0,0,0,1,1],
'&'=>[0,1,1,0,1,1,0,1,0,0,1,0,0,1,1,0,1,0,1,0,1,0,1,0,0,0,1,0,0,0,0,0,1,0,1],
'\''=>[0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
'('=>[0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0],
')'=>[0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0],
'*'=>[0,0,1,0,1,0,0,0,0,0,1,0,0,0,0,1,1,1,1,1,0,0,0,0,1,0,0,0,0,0,1,0,1,0,0],
'+'=>[0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,1,1,1,1,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0],
','=>[0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
'-'=>[0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0],
'.'=>[0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
'/'=>[0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0],
'0'=>[0,1,1,1,1,1,0,1,0,0,0,1,0,1,1,0,0,1,0,0,1,1,0,1,0,0,0,1,0,1,1,1,1,1,0],
'1'=>[0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0],
'2'=>[0,1,0,0,0,0,1,1,0,0,0,0,1,1,1,0,0,0,1,0,1,1,0,0,1,0,0,1,0,1,1,0,0,0,1],
'3'=>[1,0,0,0,0,1,0,1,0,0,0,0,0,1,1,0,1,0,0,0,1,1,1,0,1,0,0,1,1,0,0,0,1,1,0],
'4'=>[0,0,0,1,1,0,0,0,0,1,0,1,0,0,0,1,0,0,1,0,0,1,1,1,1,1,1,1,0,0,0,0,1,0,0],
'5'=>[1,1,1,0,0,1,0,1,0,1,0,0,0,1,1,0,1,0,0,0,1,1,0,1,0,0,0,1,1,0,0,1,1,1,0],
'6'=>[0,0,1,1,1,1,0,0,1,0,1,0,0,1,1,0,0,1,0,0,1,1,0,0,1,0,0,1,0,0,0,0,1,1,0],
'7'=>[1,0,0,0,0,0,0,1,0,0,0,1,1,1,1,0,0,1,0,0,0,1,0,1,0,0,0,0,1,1,0,0,0,0,0],
'8'=>[0,1,1,0,1,1,0,1,0,0,1,0,0,1,1,0,0,1,0,0,1,1,0,0,1,0,0,1,0,1,1,0,1,1,0],
'9'=>[0,1,1,0,0,0,0,1,0,0,1,0,0,1,1,0,0,1,0,0,1,1,0,0,1,0,1,0,0,1,1,1,1,0,0],
':'=>[0,0,0,0,0,0,0,0,1,1,0,1,1,0,0,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
';'=>[0,0,0,0,0,0,0,0,1,1,0,1,0,1,0,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
'<'=>[0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0],
'='=>[0,0,1,0,1,0,0,0,0,1,0,1,0,0,0,0,1,0,1,0,0,0,0,1,0,1,0,0,0,0,1,0,1,0,0],
'>'=>[0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0],
'?'=>[0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,1,0,1,1,0,0,1,0,0,0,0,1,1,0,0,0,0],
'@'=>[0,1,0,0,1,1,0,1,0,0,1,0,0,1,1,0,0,1,1,1,1,1,0,0,0,0,0,1,0,1,1,1,1,1,0],
'A'=>[0,1,1,1,1,1,1,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,0,1,1,1,1,1,1],
'B'=>[1,1,1,1,1,1,1,1,0,0,1,0,0,1,1,0,0,1,0,0,1,1,0,0,1,0,0,1,0,1,1,0,1,1,0],
'C'=>[0,1,1,1,1,1,0,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,0,1,0,0,0,1,0],
'D'=>[1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,1,1,0,0],
'E'=>[1,1,1,1,1,1,1,1,0,0,1,0,0,1,1,0,0,1,0,0,1,1,0,0,1,0,0,1,1,0,0,0,0,0,1],
'F'=>[1,1,1,1,1,1,1,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,0,0],
'G'=>[0,1,1,1,1,1,0,1,0,0,0,0,0,1,1,0,0,1,0,0,1,1,0,0,1,0,0,1,0,1,0,1,1,1,1],
'H'=>[1,1,1,1,1,1,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,1,1,1,1,1,1,1],
'I'=>[0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0],
'J'=>[0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,1,1,1,1,0,1,0,0,0,0,0,0],
'K'=>[1,1,1,1,1,1,1,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,1,0,0,0,0,0,1],
'L'=>[1,1,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1],
'M'=>[1,1,1,1,1,1,1,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,1,0,0,0,0,0,1,1,1,1,1,1,1],
'N'=>[1,1,1,1,1,1,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,1,1,1,1,1,1,1],
'O'=>[0,1,1,1,1,1,0,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,0,1,1,1,1,1,0],
'P'=>[1,1,1,1,1,1,1,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,0,1,1,0,0,0,0],
'Q'=>[0,1,1,1,1,1,0,1,0,0,0,0,0,1,1,0,0,0,1,0,1,1,0,0,0,0,1,0,0,1,1,1,1,0,1],
'R'=>[1,1,1,1,1,1,1,1,0,0,1,0,0,0,1,0,0,1,1,0,0,1,0,0,1,0,1,0,0,1,1,0,0,0,1],
'S'=>[0,1,1,0,0,0,1,1,0,0,1,0,0,1,1,0,0,1,0,0,1,1,0,0,1,0,0,1,1,0,0,0,1,1,0],
'T'=>[1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0],
'U'=>[1,1,1,1,1,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,1,0],
'V'=>[1,1,1,1,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,1,1,1,1,0,0],
'W'=>[1,1,1,1,1,1,0,0,0,0,0,0,0,1,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0],
'X'=>[1,1,0,0,0,1,1,0,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,0,1,1,0,0,0,1,1],
'Y'=>[1,1,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,0,0,0,1,0,0,0,1,1,1,0,0,0,0],
'Z'=>[1,0,0,0,0,1,1,1,0,0,0,1,0,1,1,0,0,1,0,0,1,1,0,1,0,0,0,1,1,1,0,0,0,0,1],
'['=>[0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0],
'\\'=>[0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0],
']'=>[0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0],
'^'=>[0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0],
'_'=>[0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1],
'`'=>[0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0],
'a'=>[0,0,0,0,0,1,0,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,0,1,1,1,1],
'b'=>[1,1,1,1,1,1,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,0,1,1,0],
'c'=>[0,0,0,1,1,1,0,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1],
'd'=>[0,0,0,0,1,1,0,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,1,1,1,1,1,1,1],
'e'=>[0,0,0,1,1,1,0,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,0,1,1,0,1],
'f'=>[0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,1,1,1,1,1,0,0,1,0,0,0,0,1,0,0,0,0,0],
'g'=>[0,0,0,1,0,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,1,1,1,0],
'h'=>[1,1,1,1,1,1,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1],
'i'=>[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
'j'=>[0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,1,1,1,1,0,0,0,0,0,0,0,0],
'k'=>[0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1],
'l'=>[0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0],
'm'=>[0,0,1,1,1,1,1,0,0,1,0,0,0,0,0,0,0,1,1,1,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1],
'n'=>[0,0,1,1,1,1,1,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1],
'o'=>[0,0,0,1,1,1,0,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,0,1,1,1,0],
'p'=>[0,0,1,1,1,1,1,0,0,1,0,1,0,0,0,0,1,0,1,0,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0],
'q'=>[0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0,1,0,1,0,0,0,0,1,0,1,0,0,0,0,1,1,1,1,1],
'r'=>[0,0,1,1,1,1,1,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0],
's'=>[0,0,0,1,0,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,0,1,0],
't'=>[0,0,1,0,0,0,0,0,0,1,0,0,0,0,1,1,1,1,1,1,0,0,0,1,0,0,0,1,0,0,1,0,0,1,0],
'u'=>[0,0,1,1,1,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,1,1,1,1,0],
'v'=>[0,0,1,1,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1,1,1,0,0],
'w'=>[0,0,1,1,1,1,0,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,1,0,0,1,1,1,1,0],
'x'=>[0,0,1,0,0,0,1,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1],
'y'=>[0,0,1,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,1,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0],
'z'=>[0,0,1,0,0,0,1,0,0,1,0,0,1,1,0,0,1,0,1,0,1,0,0,1,1,0,0,1,0,0,1,0,0,0,1],
'{'=>[0,0,0,1,0,0,0,0,1,1,0,1,1,0,1,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0],
'|'=>[0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
'}'=>[0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,1,0,1,1,0,1,1,0,0,0,0,1,0,0,0],
'~'=>[0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0]}



@leds = Screen.new(100,15,30)

text = ARGV[0]
repeat = ARGV[1]
colour = ARGV[2]

offset = 0

while true do


	@leds.clear


	(0..30).each do |n|

		character = text.chars[((n+offset)/6)%text.size]
		positionInCharacter = (n+offset)%6

		if positionInCharacter < 5
			pixelMap[character].each_slice(7).to_a[positionInCharacter].each_with_index { |val, x| @leds.setPixel(x,n,colour.to_sym) if val == 1}
		end
	end
	
	@leds.update
	sleep 0.05

	offset = (offset + 1)

	break if ((30+offset)/6) == text.size and !repeat
end

sleep(5)




