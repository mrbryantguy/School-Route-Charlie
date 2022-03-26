pico-8 cartridge // http://www.pico-8.com
version 35
__lua__
--init

function _init()
		--varialbes
		scene = "logo"
		-- scene var keeps track of 
		-- where scene we are and 
		-- start val is logo 
		
		-- next are var from scr1.p8
		-- please add comments 
		
		p={
		sp=1,
		x=59,
		y=39,
		w=2,
		h=4,
  flp=false,
  dx=0,
  dy=0,
  max_dx=2,
  max_dy=3,
  acc=0.5,
  boost=4,
  anim=0,
  running=false,
  jumping=false,
  falling=false,
  sliding=false,
  landed=false
 }
	
	gravity=0.3
	friction=0.85
	
	
		
	
		
end 
		
-->8
--main update

-- remember to keep the code 
-- create specific update func
-- to mantain code easy to read


function _update()

	-- if where loading logo
	if scene =="logo" then
		update_logo()
	
	-- if we are start screen 
	elseif scene =="menu" then
		update_menu()
		
	-- if we are in game scene	
	elseif scene == "game" then 
		update_game()
		
	end
	
	
	

end
-->8
--main draw

-- remember for specific scenes
-- create a specific draw func
-- to keep the code clean and 
-- readable 

function _draw()

	-- if we are in logo
	if scene == "logo" then
		draw_logo()
	
	-- if we are on menu	
	elseif scene == "menu" then 
		draw_menu()
	
	-- uf we are on game
	elseif scene == "game" then
	draw_game()
	
	end -- end ifs
		
end -- end draw
-->8
--update funcitons

function update_logo()
 fcount += 1  -- from splash.p8
 
  -- when fcount = 60 then
  -- change menu
 if fcount == 60 then 
 	scene = "menu"
 	
 	fcount = 0 
 end 
 
end

-- menu screen 
function update_menu()

	--when x is press change the
	--scene to game
	if btnp(❎) then 
		scene = "game" 
	end 	
	
end  -- end update menu 


-- code from update scr1.p8

anim_time=0
foward = true

function update_game()

player_update()
	
--	anim_time=0
	anim_wait=.35
	
	
	--c resets the original sprite
	--proablly not needed
	--foward = true
	c = 1
	x = 0
	q = -1
	x=print( time() - anim_time)
	 if time() - anim_time > anim_wait then
    if p.sp == 1 then
      p.sp+=2
      anim_time = time()
    --end
   elseif p.sp == 3 and foward == true then
     p.sp+=2
     q = p.sp
      anim_time = time()
    --end
    elseif p.sp == 5  then
      p.sp = 3
      q = 696969696969
      foward = false
      anim_time = time()
    --end
     else-- p.sp == 3 and foward == false then
      p.sp = 1
      foward = true
      anim_time = time()
    end
   
    
   -- if p.sp > 5  then
     -- p.sp = c
      --anim_time=0
   -- end
  end
	--player_animate()

end
-->8
-- draw functions

--draw logo from splash.p8
function draw_logo()
 cls()
 logo()
end


-- draw menu 
function draw_menu()
	cls() -- clear the screen
	print("press ❎ to start" ,30,63)

end 

-- code from scr1.p8 draw func

function draw_game() 

	cls()
	map(0,0)
	spr(p.sp, p.x, p.y, p.w, p.h)
	
	--prints the time at the top right
	print(q)

end 



-->8
-- logo function form splash.p8
fcount = 0
logoanim=1
logostop=31
logofr=2
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
-- collisions form scr1.p8

--collisions

function collide_map(obj,aim,flag)
	--obj = table needs x,y,w,h
	--aim = left,right,up,down
	
	local x=obj.x		local y=obj.y
	local w=obj.w		local h=obj.h
	
	local x1=0		local y1=0
	local x2=0		local y2=0
	
	if aim=="left" then
		x1=x-1		y1=y
		x2=x				y2=y+h-1
	
	elseif aim=="right" then
		x1=x+w			y1=y
		x2=x+w+1	y2=y+h-1
	
	elseif aim=="up" then
		x1=x+1			y1=y-1
		x2=x+w-1	y2=y
	
	--collision box not in correct area
	elseif aim=="down" then
		x1=x					y1=y-h
		x2=x+w			y2=y+h
	end
		
		--pixels to tiles
		x1/=8				y1/=8
		x2/=8				y2/=8
		
		if fget(mget(x1,y1), flag)
		or fget(mget(x1,y2), flag)
		or fget(mget(x2,y1), flag)
		or fget(mget(x2,y2), flag) then
			return true
		else
			return false	
		end
		
end
-->8
-- player code from scr1.p8

function player_update()
	--physics
	p.dy+=gravity
	p.dx*=friction
	
--	anim_time=0
--	anim_wait=.05
	
	--c resets the original sprite
	--proablly not needed
	
	--c = 1
	
	
	-- if time() - anim_time > anim_wait then
 --   p.sp+=6
 --   anim_time = time()

 --   if p.sp > 7  then
 --     p.sp = c
 --   end
 -- end
	
	--controls
	if btn(⬅️) then
		p.sp=7--was 3
		p.dx-=p.acc
		p.running=true
		p.flp=true
		
		c = 3
	end
	if btn(➡️) then
	
	 --if time() - anim_time > anim_wait then
   -- p.sp+=6
   -- anim_time=time()

   -- if p.sp > 7 then
     -- p.sp = 1
   -- end
 -- end
	--	p.sp=1
	c = 1
		p.dx+=p.acc
		p.running=true
		p.flp=false
	end
	
	--slide
	if p.running
	and not btn(⬅️)
	and not btn(➡️)
	and not p.falling
	and not p.jumping then
		p.running=false
		p.sliding=true
	end
	
	--jump
	if btnp(❎)
	and p.landed then
		p.sp=7
		p.dy-=p.boost
		p.landed=false
	end
	
	-- check collision up and down
	if p.dy>0 then
		p_falling = true
		p_landed = false
		p.jumping=false
		
		if collide_map(p, "down", 0) then
			p.landed=true
			p.falling=false
			p.dy=0
			p.y-=(p.y+p.h)%8
		end
	elseif p.dy<0 then
		p.jumping=true
		if collide_map(p, "up", 1) then
			p.dy=0
		end
	end
	
--check collision left and right
	if p.dx<0 then
		if collide_map(p, "left", 1) then
			p.dx=0
		end
	elseif p.dx>0 then
		if collide_map(p, "right", 1) then
			p.dx=0
		end
	end

	--stop sliding
	if p.sliding then
		if abs(p.dx)<.2
		or p.running then
			p.dx=0
			p.sliding=false
		end
	end
	
	--movement
	p.x+=p.dx	
	p.y+=p.dy
		
end

--function player_animate()
--	if p.jumping then
	--	p.sp=7
	--if p.sliding then
	--	p.sp=1
	--else --player idle
		--p.sp=1
	--end
--end
--end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000000000000044e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000044ee4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000044e44440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000000000000004444e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000444e4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000004404e44400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000e4e4440400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000640000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000606046000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000005555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1dccccccccccccccccccccccccccccd1cccccccccccccccccccccccccccccccc0000000000000000000000000000000000000000000000000000000000000000
1d7777777777777777777777777777d1777777777777777777777777777777770000000000000000000000000000000000000000000000000000000000000000
1d7777777777777777777777777777d1777777777777777777777777777777770000000000000000000000000000000000000000000000000000000000000000
1d7777777777777777777777777777d1777777777777777777777777777777770000000000000000000000000000000000000000000000000000000000000000
11177717771771777717717771777111111777177717717777177177717771110000000000000000000000000000000000000000000000000000000000000000
1dc171c171c11c1771c11c171c171cd1ccc171c171c11c1771c11c171c171ccc0000000000000000000000000000000000000000000000000000000000000000
1dcc1ccc1c77ccc11c77ccc1cc71ccd1cc771ccc1c77ccc11c77ccc1cc71cccc0000000000000000000000000000000000000000000000000000000000000000
1dcccccc77ddcccc77ddcccc77ddccd177ddcccc77ddcccc77ddcccc77ddcccc0000000000000000000000000000000000000000000000000000000000000000
1dcccc77ddcccc77ddcccc77ddccccd1ddcccc77ddcccc77ddcccc77ddcccc770000000000000000000000000000000000000000000000000000000000000000
1dcc77ddcccc77ddcccc77ddcccc77d1cccc77ddcccc77ddcccc77ddcccc77dd0000000000000000000000000000000000000000000000000000000000000000
1d77ddcccc77ddcccc77ddcccc77ddd1cc77ddcccc77ddcccc77ddcccc77ddcc0000000000000000000000000000000000000000000000000000000000000000
1dddcccc77ddcccc77ddcccc77ddccd177ddcccc77ddcccc77ddcccc77ddcccc0000000000000000000000000000000000000000000000000000000000000000
1dcccc77ddcccc77ddcccc77ddccccd1ddcccc77ddcccc77ddcccc77ddcccc770000000000000000000000000000000000000000000000000000000000000000
1dcc77ddcccc77ddcccc77ddcccc77d1cccc77ddcccc77ddcccc77ddcccc77dd0000000000000000000000000000000000000000000000000000000000000000
1d77ddcccc77ddcccc77ddcccc77ddd1cc77ddcccc77ddcccc77ddcccc77ddcc0000000000000000000000000000000000000000000000000000000000000000
1dddcccc77ddcccc77ddcccc77ddccd177ddcccc77ddcccc77ddcccc77ddcccc0000000000000000000000000000000000000000000000000000000000000000
1dcccc77ddcccc77ddcccc77ddccccd1ddcccc77ddcccc77ddcccc77ddcccc770000000000000000000000000000000000000000000000000000000000000000
1dcc77ddcccc77ddcccc77ddcccc77d1cccc77ddcccc77ddcccc77ddcccc77dd0000000000000000000000000000000000000000000000000000000000000000
1d77ddcccc77ddcccc77ddcccc77ddd1cc77ddcccc77ddcccc77ddcccc77ddcc0000000000000000000000000000000000000000000000000000000000000000
1dddcccc77ddcccc77ddcccc77ddccd177ddcccc77ddcccc77ddcccc77ddcccc0000000000000000000000000000000000000000000000000000000000000000
1dcccc77ddcccc77ddcccc77ddccccd1ddcccc77ddcccc77ddcccc77ddcccc770000000000000000000000000000000000000000000000000000000000000000
1dcc77ddcccc77ddcccc77ddcccc77d1cccc77ddcccc77ddcccc77ddcccc77dd0000000000000000000000000000000000000000000000000000000000000000
1d77ddcccc77ddcccc77ddcccc77ddd1cc77ddcccc77ddcccc77ddcccc77ddcc0000000000000000000000000000000000000000000000000000000000000000
1dddcccc77ddcccc77ddcccc77ddccd177ddcccc77ddcccc77ddcccc77ddcccc0000000000000000000000000000000000000000000000000000000000000000
1dcccc77ddcccc77ddcccc77ddccccd1ddcccc77ddcccc77ddcccc77ddcccc770000000000000000000000000000000000000000000000000000000000000000
1dcc77ddcccc77ddcccc77ddcccc77d1cccc77ddcccc77ddcccc77ddcccc77dd0000000000000000000000000000000000000000000000000000000000000000
1d77ddcccc77ddcccc77ddcccc77ddd1cc77ddcccc77ddcccc77ddcccc77ddcc0000000000000000000000000000000000000000000000000000000000000000
1dddcccc77ddcccc77ddcccc77ddccd177ddcccc77ddcccc77ddcccc77ddcccc0000000000000000000000000000000000000000000000000000000000000000
1dcccc77ddcccc77ddcccc77ddccccd1ddcccc77ddcccc77ddcccc77ddcccc770000000000000000000000000000000000000000000000000000000000000000
1dcc77ddcccc77ddcccc77ddccccccd1cccc77ddcccc77ddcccc77ddcccc77dd0000000000000000000000000000000000000000000000000000000000000000
1dddddddddddddddddddddddddddddd1cc77ddcccc77ddcccc77ddcccc77ddcc0000000000000000000000000000000000000000000000000000000000000000
1111111111111111111111111111111177ddcccc77ddcccc77ddcccc77ddcccc0000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00004444444000000000444444400000000444444440000000044444400000000000aaaaaaa000000aaaaaaa000000000000aaaaaaa000000000aaaa00000000
004444444444000000444444444400000444444444440000004444444400000000aaaaaaaaaa0000aaaaaaaaaa00000000aaaaaaaaaa000000aaaaaa00000000
004444444444000000444444444400004444444444440000044444444440000000aaaaaaaaaa0000aaaaaaaaaa00000000aaaaaaaaaa000000aaaaaa00000000
0044ffffff4400000044ffffff4400000444ffffff440000044ffffff440000000aaffffffaa0000aaffffffaa00000000aaaaaaaaaa000000aaffff00000000
0444ffffff4400000444ffffff4400004444ffffff440000044ffffff44400000aaaffffffaa0000aaffffffaaa000000aaaaaaaaaaa00000aaaffff00000000
04f4ffffff40000004f4ffffff40000044f4ffffff400000004ffffff4f400000afaffffffa000000affffffafa000000aaaaaaaaaa000000afaffff00000000
4444ffffff4000004444ffffff4000004444ffffff400000004ffffff4444000aaaaffffffa000000affffffaaaa0000aaaaaaaaaaa00000aaaaffff00000000
499499f944400000499499f944000000099099f900000000000449f994994000a99a88f8aaa000000aaa8f88a99a0000aaaaaaaaaaa00000a99a88f800000000
499499f944400000499499f944000000099099f900000000000049f994994000a99a88f8aaa000000aaa8f88a99a0000aaaa8888aaa00000a99a88f800000000
444499f999400000440099f999000000000099f999000000000999f994444000aaaa88f888a000000a888f88aaaa0000aaaa888888a00000aaaa88f800000000
4440995599400000400099559900000000009955990000000009955990444000aaa0885588a000000a8855880aaa0000aaa0888888a00000aaa0885500000000
00999955990000000099995599000000009999559900000000099559999000000088885588000000008855888800000000888888880000000088885500000000
00999955990000000099995599000000009999559900000000099559999000000088885588000000008855888800000000888888880000000088885500000000
00999955990000000099995599000000009999559900000000099559999000000088885588000000008855888800000000888888880000000088885500000000
09909955990000000990995599000000099099559900000000099559909900000880885588000000008855880880000008808888880000000880885500000000
09009955999000000900995599900000090099559990000000999559900900000800885588800000088855880080000008008888888000000800885500000000
99009911999000009900991199900000990099119990000000999119900990008800881188800000088811880088000088008811888000008800881100000000
9900111111f000009900111111f000009900111111f0000000f11111100990008800111111f000000f111111008800008800111111f000008800111100000000
ff00111111000000ff00111111000000ff0011111100000000011111100ff000ff001111110000000011111100ff0000ff00111111000000ff00111100000000
00001111110000000000111111000000000011111100000000011111100000000000111111000000001111110000000000001111110000000000111100000000
00001111110000000000111111000000000011111100000000011111100000000000111111000000001111110000000000001111110000000000111100000000
00011100110000000001110011000000000111001100000000011001110000000011110011000000001100111100000000001100110000000000110000000000
00011000110000000001100011000000000110001100000000011000110000000011000011000000001100001100000000001100110000000000110000000000
00011000110000000001100011000000000110001100000000011000110000000011000011000000001100001100000000001100110000000000110000000000
00011000110000000001100011000000000110001100000000011000110000000011000011000000001100001100000000001100110000000000110000000000
00011000110000000001100011000000000110001100000000011000110000000011000011000000001100001100000000001100110000000000110000000000
00011000110000000001100011000000000110001100000000011000110000000011000011000000001100001100000000001100110000000000110000000000
00010000010000000001000001000000000100000100000000010000010000000010000001000000001000000100000000001000010000000000100000000000
00060000060000000006000006000000000600000600000000060000060000000060000006000000006000000600000000006000060000000000600000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003030303030303030000000000000000030303030303030300000000000000000303030303030303000000000000000003030303030303030000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5151515151515151515151515151510000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5151515151515151515151515151510000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
