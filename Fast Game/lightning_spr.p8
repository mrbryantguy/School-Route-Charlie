pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
-- init

function _init()
	-- variables
	scene = "logo"
	playerinit()
	
	coins = {}
	
	for i=0,10 do
		local coin={
			f = 2,
			x = flr(rnd(16))*8,
			y = flr(rnd(16))*8,
			}
		add(coins,coin)
	end
	
	mx = 0 --- map x 
	my = 0 --- map y 
	
	cx = 0 -- camera x 
	cy = 0 -- camera y 

	
end
-->8
-- main update
function _update()

	if scene == "logo" then
		update_logo()
	
	elseif scene == "game" then
		update_game()
		
	end
		
		
end


-->8
-- main draw

function _draw()

	if scene == "logo" then
		draw_logo()
	
	elseif scene == "game" then
	 draw_game()
	 
	end
		
		
end

-->8
-- logo function implementation

function update_logo()

fcount += 1


if fcount == 60 then
	scene = "game"
	
	fcount = 0

end


end

function draw_logo()
cls()
logo()

end

-->8
--logo function

fcount = 0
logoanim=1
logostop=31
logofr=64

function logo()
 local cx = 55
 local cy = 45
 local frx=logofr%16*8
 local fry=flr(logofr/16)*8
 for s=0,logoanim do
  for x=0,15 do
   camera(rnd(30/fcount),
          rnd(30/fcount))
   for y=0,15 do
    if(x+y==s) then 
     pset(cx+x,cy+y,7)
    elseif(x+y == s-1) then
     pset(cx+x,cy+y,6)
    elseif(x+y<s-1) then
     pset(cx+x,cy+y,
      sget(frx+x,fry+y))
    end
   end
  end
 end
 if(logoanim<=logostop) logoanim+=1
 if(fcount > 35) then
  print("circus",51,cy+20,8)
  print("bear",55,cy+26,6)
  print("games",53,cy+32,8)
 end
end
-->8
-- game functions draw and upd

function update_game()

	-- movemenmt codes
	
 if(btnp(⬅️)) p.x -=4 -- movement left
	if(btnp(⬅️)) p.f = 17 -- changing sprite when left
 if(btnp(➡️)) p.x +=4-- movement right
 if(btnp(➡️)) p.f = 1 -- changing sprite when right
 if(btnp(⬆️)) p.y -=4 -- movement up
 if(btnp(⬇️)) p.y +=4 -- movemement down 

	-- map changes  simp;e
	
	cx = p.x - 60
	cy = p.y - 60
	
	

end



function draw_game()

cls()

camera (cx , cy)

map(mx,my)

spr(p.f , p.x ,p.y)

for coin in all (coins) do
	spr(coin.f, coin.x, coin.y)
end






end
-->8
-- player funcitons

function playerinit()

p ={}
p.f = 1  -- starting frame 
p.x = 16*4 -- start location x 
p.y = 16*4 -- start location y
p.s = 2  -- speed


end
-->8
--change map location


__gfx__
000000000c77c77000aaaa0000000000566666666666666506666666666666650666666666666665066666666666666000000000000000000000000000000000
000000000c74c4700a9999a000000000656666666666665605666666666666560566666666666656056666666666665005666666666666500000000000000000
00700700000cf000aa9aa99a04444440665666666666656606566666666665660656666666666566065666666666656006566666666665600000000000000000
00077000cccccccca9aaaa9a04555540666566666666566606656666666656660665666666665666066566666666566006656666666656600000000000000000
00077000c0cffc0ca9aaaa9a04544540666657766665666606665776666566660666577666656666066657766665666006665776666566600000000000000000
0070070070c00c07aa9aa9aa04544540666675776656666606667577665666660666757766566666066675776656666006667577665666600000000000000000
000000000c0000c00a9999a004544540666677577566666606667757756666660666775775666666066677577566666006667757756666600000000000000000
000000008000000800aaaa0004544540666667755666666606666775566666660666677556666666066667755666666006666775566666600000000000000000
00000000077c77c00000000000000000666667755666666606666775566666660666677556666666066667755666666006666775566666600000000000000000
00000000074c47c00000000000000000666667577566666606666757756666660666675775666666066667577566666006666757756666600000000000000000
00000000000fc0000000000000000000666665777656666606666577765666660666657776566666066665777656666006666577765666600000000000000000
00000000cccccccc0000000000000000666656666665666606665666666566660666566666656666066656666665666006665666666566600000000000000000
00000000c0cffc0c0000000000000000666566666666566606656666666656660665666666665666066566666666566006656666666656600000000000000000
0000000070c00c070000000000000000665666666666656606566666666665660656666666666566065666666666656006566666666665600000000000000000
000000000c0000c00000000000000000656666666666665605666666666666560566666666666656056666666666665005666666666666500000000000000000
00000000800000080000000000000000566666666666666506666666666666650000000000000000000000000000000000000000000000000000000000000000
00000000566666666666666056666666666666600666666666666660000000000000000000000000eeeeeeeeeeeeeeee00000000000000000000000000000000
00000000656666666666665065666666666666500566666666666650000000000000000000000000e56666666666665e00000000000000000000000000000000
00000000665666666666656066566666666665600656666666666560000000000000000000000000e65666666666656e00000000000000000000000000000000
00000000666566666666566066656666666656600665666666665660000000000000000000000000e66566666666566e00000000000000000000000000000000
00000000666657766665666066665776666566600666577666656660000000000000000000000000e66657766665666e00000000000000000000000000000000
00000000666675776656666066667577665666600666757766566660000000000000000000000000e66675776656666e00000000000000000000000000000000
00000000666677577566666066667757756666600666775775666660000000000000000000000000e66677577566666e00000000000000000000000000000000
00000000666667755666666066666775566666600666677556666660000000000000000000000000e66667755666666e00000000000000000000000000000000
000000006666677556666660666667755666666006666775566666600000000000000000077c77c0e66667755666666e00000000000000000000000000000000
000000006666675775666660666667577566666006666757756666600000000000000000074c47c0e66667577566666e00000000000000000000000000000000
000000006666657776566660666665777656666006666577765666600000000000000000000fc000e66665777656666e11110010000000000000000000000000
000000006666566666656660666656666665666006665666666566600000000000000000cccccccce66656666665666e11111110000000000000000000000000
000000006665666666665660666566666666566006656666666656600000000000000000c0cffc0ce66566666666566e11111110000000000000000000000000
00000000665666666666656066566666666665600656666666666560000000000000000070c00c07e65666666666656e11111110000000000000000000000000
0000000065666666666666506566666666666650056666666666665000000000000000000c0000c0e56666666666665e11111110000000000000000000000000
00000000566666666666666000000000000000000000000000000000000000000000000080000008eeeeeeeeeeeeeeee11111110000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111111000000000000000000000000
00004000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111000000000000000000000000
00044e00000000000000000000000000000000000000000000000000000000000000000000000000000001111111117777711111000000000000000000000000
0044ee40000000000000000000000000000000000000000000000000000000000000000000000000000011111111117777711710000000000000000000000000
0044e444400000000000000000000000000000000000000000000000000000000000000000000000000111111111117777711710080000000000000000000000
000004444e0000000000000000000000000000000000000000000000000000000000000000000000000000000011117777711700000000000000000000000000
00000444e40000000000000000000000000000000000000000000000000000000000000000000000000000000111111777717000000000000000000000000000
0004404e444000000000000000000000000000000000000000000000000000000000000000000000000000001111111777770000000000000000000000000000
000000e4e44404000000000000000000000000000000000000000000000000000000000000000000000000011111fff77777fff0000000000000000000000000
00000000006400000000000000000000000000000000000000000000000000000000000000000000000000111111fffffffffff0000000000000000000000000
00000006060460000000000000000000000000000000000000000000000000000000000000000000000001111111ffffffffff00000000000000000000000000
0000000000660000000000000000000000000000000000000000000000000000000000000000000000000000000f000000000000000000000000000000000000
000000000088000000000000000000000000000000000000000000000000000000000000000000000000000000f0000000000000000000000000000000000000
00000000008800000000000000000000000000000000000000000000000000000000000000000000000000000f00000000000000000000000000000000000000
55555555555555550000000000000000000000000000000000000000000000000000000000000000000000000077700000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077700000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077700000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008800888880000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000088800000888000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000088877000088880000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000088788888008880000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000404140504050400040504050405040504041405040504050405040504050405000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000410000000000000000000000000000404100000000000000000000000000004000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000400000000000000000000000000000504000000000000000000000000000005000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000410000000000000000000000000000514100000000000000000000000000005100000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000400000000000000000000000000000504000000000000000000000000000005000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000410000000000000000000000000000514100000000000000000000000000005100000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000400000000000000000000000000000504000000000000000000000000000005000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000500000000000000000000000000000515000000000000000000000000000005100000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000005000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000500000000000000000000000000000405000000000000000000000000000004000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000400000000000000000000000000000504000000000000000000000000000005000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000500000000000000000000000000000405000000000000000000000000000004000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000400000000000000000000000000000504000000000000000000000000000005000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000500000000000000000000000000000405000000000000000000000000000004000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000400000000000000000000000000000504000000000000000000000000000005000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000504050405040504050405040504050405040504050405040504050405040504000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000111111111111111110010000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000011111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000001111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000111f11111111111110000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000011ff1111111111110000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001f11111111111110000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000011111111111111111000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000001111111117777711111000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000011111111117777711710000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000111111111117777711710080000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000011117777711700000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000111111777717000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111111777770000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000011111fff77777fff0000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000111111fffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000001111111ffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000f000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000077700000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000077700000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000077700000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000008800888880000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000088800000888000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000088877000088880000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000088788888008880000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0414040504050405040504050405040504140405040504050405040504050405041404050405040504050405040504050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1400000000000000000000000000000414000000000000000000000000000004140000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0400000000000000000000000000000504000000000000000000000000000005040000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1400000000000000000000000000001514000000000000000000000000000015140000000000000000000000000000150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0400000000000000000000000000000504000003000000000000000000000005040000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1400000000000000000000000000001514000003000000000000000000000015140000000000000000000000000000150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0400000000000000000000000000000504000003000000000000000000000005040000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0500000000000000000000000000001505000000000000000000000000000015050000000000000000000000000000150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0500000000000000000000000000000405000000000000000000000000000004050000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0400000000000000000000000000000504000000000000000000000000000005040000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0500000000000000000000000000000405000000000000000000000000000004050000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0400000000000000000000000000000504000000000000000000000000000005040000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0500000000000000000000000000000405000000000000000000000000000004050000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0400000000000000000000000000000504000000000000000000000000000005040000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0504050405040500050405040504050405040504050405040004050405040504050405040504050405040500050405040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0414040504050400040504050405040504140405040504050005040504050405041404050405040504050400040504050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1400000000000000000000000000000414000000000000000000000000000004140000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0400000000000000000000000000000504000000000000000000000000000005040000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1400000000000000000000000000001514000000000000000000000000000015140000000000000000000000000000150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0400000000000000000000000000000504000000000000000000000000000005040000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1400000000000000000000000000001514000000000000000000000000000015140000000000000000000000000000150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0400000000000000000000000000000504000000000000000000000000000005040000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0500000000000000000000000000001505000000000000000000000000000015050000000000000000000000000000150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0400000000000000000000000000000504000000000000000000000000000005040000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0500000000000000000000000000000405000000000000000000000000000004050000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0400000000000000000000000000000504000000000000000000000000000005040000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0500000000000000000000000000000405000000000000000000000000000004050000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0400000000000000000000000000000504000000000000000000000000000005040000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0500000000000000000000000000000405000000000000000000000000000004050000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0400000000000000000000000000000504000000000000000000000000000005040000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0504050405040504050405040504050405040504050405000504050405040504050405040504050405040504050405040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
