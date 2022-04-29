pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
--init

function _init()
		--varialbes
		scene = "logo"
		
		lives = 3
	 loselives = 0
	 
		-- scene var keeps track of 
		-- where scene we are and 
		-- start val is logo 
		
		-- next are var from scr1.p8
		-- please add comments 
		
		p={
		sp=4,
		x=8,
		y=64,
		w=2,
		h=2,
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
 
 ball = {
 
 sp = 11,
 x  = 0,
 y  = 0,
 w  = 8,
 h  = 8
 }
	
	--- map x and y base loc
	-- declaring var 
	
	mx = 0 --- map x 
	my = 0 --- map y 
	
	-- camera x and y loc
	-- declaring var
	
	cx = 0 -- camera x 
	cy = 0 -- camera y 
	
	
	
	 --grav and fric declariation
	gravity=0.3
	friction=0.85
	
	framecount = 0
	
		
	ballframe = 0
		
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
	
	-- if we are in game2 scene	
	elseif scene == "game2" then
		update_game2()
		
	-- if we are in game3 scene 	
	elseif scene == "game3" then
		update_game3()
		
	elseif scene == "gover" then
		update_gover()			
	
	-- if we are in end scene 
	elseif scene == "end" then
		update_end()
		
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
	
	-- uf we are on game scene
	elseif scene == "game" then
	 draw_game()
	 
	 
	 --snow  spawn
  random = flr(rnd(50))
	print(random)
	if flr(p.x/10) > 0 then
	 if random < 2 then
	  spr(ball.sp , cx + 120, 56, ball.w , ball.h)
		 	
	 end -- ball spawn --
 end -- p.x check --
 
 
 
 
	
	-- if we are on game2 scene
	elseif scene == "game2" then
		draw_game2()
	
	-- if we are on game 3 scene
	elseif scene == "game3" then
		draw_game3()
		
	elseif scene == "gover" then
		draw_gameover()
	
	-- if we are on end  scene
	elseif scene == "end" then
	 draw_end()
	
	end -- end ifs1
		
end -- end draw
-->8
--update funcitons

--sprite for the ball
snow = 11
snow_x = 300
snow_y =56


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
snowball_update()
snow_x-=1


--here is to end game if player
--touches the snowball


if flr((snow_x / 10)) - 1 == flr(p.x/10) then
  --cls()
  
  ballframe += 1
  
  
  if ballframe >5 then
  lives -= 1
  
  ballframe = 0
  
  end
  --draw_gameover()
  
  
  
end--if the player touches snow



--	anim_time=0
	anim_wait=.35
	
	
	--c resets the original sprite
	--proablly not needed
	--foward = true
	c = 4
	x = 0
	q = -1
	--print(9999) 
	 if time() - anim_time > anim_wait then
    if p.sp == 4 then
      p.sp+=2
      anim_time = time()
    --end
   elseif p.sp == 6 and foward == true then
     p.sp+=2
     q = p.sp
      anim_time = time()
    --end
    elseif p.sp == 8  then
      p.sp = 4
      q = 696969696969
      foward = false
      anim_time = time()
    --end
     else-- p.sp == 3 and foward == false then
      p.sp = 4
      foward = true
      anim_time = time()
    end
   
    
   -- if p.sp > 5  then
     -- p.sp = c
      --anim_time=0
   -- end
  end	--player_animate()
  
  
  --snowball spawn
 -- random = flr(rnd(50))
--	print(random)
--	if flr(p.x/10) > 0 then
	 --if random < 2 then
	  --spr(ball.sp , cx + 120, 56, ball.w , ball.h)
		 	
	 --end -- ball spawn --
 --end -- p.x check --
 
end

-- update second game 

function update_game2()




end


-- update third game 

function update_game3()






end 

-- update game over 

function update_gover()






end



-- update when  scene = end 

function update_end()





end -- end funciton end 
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
	camera(cx, cy - 24)
	map(mx,my)
	spr(p.sp, p.x, p.y - 14, p.w, p.h)

 spr(snow, snow_x,snow_y)


--prints x of player and snowball
	--print(flr(p.x/10), cx, cy - 24)
 --print(flr(p.x/10), cx, cy - 24)
	--print(flr(snow_x / 10), cx, cy)
	
	----------------------------
	print('lives: '..lives, cx, cy-24) 
	--print(flr(snow_y / 10), cx, cy-24)
	--print(flr(p.y / 10), cx, cy)

-- print(flr(p.x/10), snow_x)
	--prints the time at the top right
	--print(q)
	
	if lives == 0 then
		scene = "gover"
	end
	
	-- snowball drawing -- 
	--the random says when it spawns
--	random = flr(rnd(50))
--	print(random)
--	if flr(p.x/10) > 0 then
--	if random < 2 then
	 -- spr(ball.sp , cx + 120, 56, ball.w , ball.h)
	 --end -- ball spawn --
 --end -- p.x check -- 
end

	-- draw second level
	
function draw_game2()

cls()

map(mx, my)
camera(0,18 * 8 )




print("here is game 2" , 4 * 8 , 26*8 )



end

-- draw third game 

function draw_game3()





end 


 

-- when scene end is reached 
function draw_end()

	camera(0,0)
 cls()
 
	print("end of lvl 1" ,30,63, 2)
	


end 

--gameover
function draw_gameover()
  cls()
  camera (0,0)
  cls()
  
  print("you died", 30, 63, 2)
end--draw_gameover

-->8
--splash screen
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
--collisions
-- collisions form scr1.p8

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


-- this code is to identify walls 


-- this code is not working or implemented
-- on the code right now 



function wallcoll(xloc , yloc , wloc , hloc)
 
	
	sprite1 = mget(xloc/8 , yl0c )
	sprite2 = mget((xloc+wloc-1)/8 , yloc /8)
	sprite3 = mget(xloc / 8 , (yloc + wloc -1) / 8 )
	sprite4 = mget((xloc + wloc - 1) / 8 , (yloc+wloc-1) / 8 )

	if fget(sprite1 , 7 ) then
				return true
	elseif fget(sprite2 , 7 ) then
				return true
	elseif fget(sprite3 , 7 ) then 
				return true
	elseif fget(sprite4 , 7 ) then 
				return true
	end
	
	return false
				




end 
-->8
-- player update
-- this code is from src1.p8

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


	
		p.sp=6--was 3
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
	 p.sp=4
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
		p.sp=8
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
			
	cx = p.x 
	cy = p.y - 39
	
	
	
	
		-- this code detects when 
		-- the flag is reached 
		-- at the end of the code 
	cobj = mget((p.x + 8)/ 8  , p.y / 8 )

 if fget(cobj , 2 ) then
	
		scene = "game2"
	
	end
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
function snowball_update()
  ball.x+=1
end--snoeball_update
-->8
-- ice ball logic 

function ball() 
end 
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077770000000000000000000000000000000000
000000000000000000004000000000000000044444440000000004444444000000000444444400000000000007cccc7000000000000000000000000000000000
007007000000000000044e00000000000000444ffff440000000444ffff440000000444ffff40000000000007cccccc700000000000000000000000000000000
00077000000000000044ee40000000000000444ffff440000000444ffff440000000444ffff4000000000000cc77cc7c00000000000000000000000000000000
00077000000000000044e4444000000000004f4ffff4400000004f4ffff4400000004f4ffff4000000000000cccc7ccc00000000000000000000000000000000
0070070000000000000004444e0000000000494ffff400000004494ffff400000004494ffff4000000000000cccccccc00000000000000000000000000000000
000000000000000000000444e400000000004449f944000000044449f940000000444449f90000000000000007cccc7000000000000000000000000000000000
00000000000000000004404e444000000000449958940000000400995890000000440099589000000000000000c7cc0000000000000000000000000000000000
0000000000000000000000e4e4440400000040995990000000000099599000000000009959900000000000000000000000000000000000000000000000000000
00000000000000000000000000640000000009995990000000000099599900000000099959900000000000000000000000000000000000000000000000000000
000000000000000000000006060460000000090911f00000000000f1190900000000090911f00000000000000000000000000000000000000000000000000000
0000000000000000000000000066000000000f011100000000000001110f000000000f0111000000000000000000000000000000000000000000000000000000
00000000000000000000000000880000000000010100000000000001010000000000000101000000000000000000000000000000000000000000000000000000
00000000000000000000000000880000000000110100000000000011010000000000001101000000000000000000000000000000000000000000000000000000
00000000000000005555555555555555000000100100000000000010010000000000001001000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000600600000000000060060000000000006006000000000000000000000000000000000000000000000000000000
0888800000000000cccccccccbbcbbcccccccccccccccbcb00000000000000000000000000000000000000000000000000000000000000000000000000000000
8888800000000000cccccccccbccbccccccccbcccbcbcbcb00000444444400000000044444440000000000000000000000000000000000000000000000000000
8888800000000000ccccccccbbbcbbbcbcbbcbbbcbcbcbcb0000444ffff440000000444ffff44000000000000000000000000000000000000000000000000000
8888800000000000ccccccccbcbcccbcbcbccccbcbcbcbbb0000444ffff440000000444ffff44000000000000000000000000000000000000000000000000000
0006600000000000ccccccccccbccbbcbcbbccbbbbcbcbcb00004f4ffff4400000004f4ffff44000000000000000000000000000000000000000000000000000
0006600000000000ccccccccccbccbccbccbccbccbbbbbbb0004494ffff400000004494ffff40000000000000000000000000000000000000000000000000000
0006600000000000ccccccccccbbbbbcbccbccbccbbbbcbb00044449f940000000044449f9400000000000000000000000000000000000000000000000000000
0006600000000000cccccccccbbcccbbbcbbccbbbccbccbc00040099589000000004000958900000000000000000000000000000000000000000000000000000
000660000000000000000000000000000000000000000000000000999f90000000000f9959900000000000000000000000000000000000000000000000000000
0006600000000000000000000000000000000000000000000000000959999f0000000009f9900000000000000000000000000000000000000000000000000000
00066000000000000000000000000000000000000000000000000001190000000000000119000000000000000000000000000000000000000000000000000000
00066000000000000000000000000000000000000000000000000001110000000000000111000000000000000000000000000000000000000000000000000000
00066000000000000000000000000000000000000000000000061111010000000006111101000000000000000000000000000000000000000000000000000000
00066000000000000000000000000000000000000000000000000000010000000000000001000000000000000000000000000000000000000000000000000000
00066000000000000000000000000000000000000000000000000061110000000000006111000000000000000000000000000000000000000000000000000000
00066000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1dccccccccccccccccccccccccccccd1cccccccccccccccccccccccccccccccc4444444400000000000000000000000000000000000000000000000000000000
1d7777777777777777777777777777d177777777777777777777777777777777dddddddd00000000000000000000000000000000000000000000000000000000
1d7777777777777777777777777777d177777777777777777777777777777777dddddddd00000000000000000000000000000000000000000000000000000000
1d7777777777777777777777777777d1777777777777777777777777777777771111111100000000000000000000000000000000000000000000000000000000
11177717771771777717717771777111111777177717717777177177717771111111111100000000000000000000000000000000000000000000000000000000
1dc171c171c11c1771c11c171c171cd1ccc171c171c11c1771c11c171c171ccc1111111100000000000000000000000000000000000000000000000000000000
1dcc1ccc1c77ccc11c77ccc1cc71ccd1cc771ccc1c77ccc11c77ccc1cc71cccc1111111100000000000000000000000000000000000000000000000000000000
1dcccccc77ddcccc77ddcccc77ddccd177ddcccc77ddcccc77ddcccc77ddcccc1111111100000000000000000000000000000000000000000000000000000000
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
32424232525252223242423252525222223242423252525222223242423252525222324242325252522232424232525252223242423252525222324242325252
52223242423252525222222232424232525252223242423252525222223242423252525222223242423252525222223242423252525222222232424232525252
84848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484
84848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484
__gff__
0080000000000000000000080000000000000000000000000000000000000000040000000000000000000000000000000400000000000000000000000000000003030303131313130000000000000000030303031313131300000000000000000303030313131313000000000000000003030303131313130000000000000000
1010101010101010000000000000000010101010101010100000000000000000101010101010101000000000000000001010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030
4445464744454647444546474445464744454647444546474445464445464744454647444546474445464744454647444546474445464744454647444546474444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
6465666764656667747576777475767774757677747576777475767764656667646566676465666764656667646566676465666764656667646566676465666754545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454
7475767774757677646566676465666764656667646566676465666774757677747576777475767774757677747576777475767774757677747576775455565754545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454
6465666764656667646566676465666764656667646566676465666754555657545556575455565754555657545556575455565754555657545556576465666754545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454
7475767774757677747576777475767774757677747576777475767764656667646566676465666764656667646566676465666764656667646566677475767754545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454
5455565754555657545556575455565754555657545556575455565754555657545556575455565754555657545556577475767774757677545556575455565754545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454
6465666764656667646566676465666764656667646566676465666764656667646566676465666764656667646566676465666754555657646566676465666754545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454
7475767774757677747576777475767774757677747576777475767774757677747576777475767774757677747576777475767764656667747576777475767754545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848
2525252323232323232323232323222323232323232222222323232323232222232323232323222223232323232223232323232222232223222223222222222323222222222323232323222223222322222223232322222323232325252523232323232323232323232223232323252525232323232323232323232322232323
2522252322232323232223232323222223232323222222222323232323222222232323232323222223232323232322232323222222232223222223222222232323222222222323232323222223222322222323232322222323222325222523222323232322232323232222232323252225232223232323222323232322222323
2222222222222323232223232322222223232223222222222323222323222222222223232223222223232223232322232323232222232223222223222222232323222222222323222223222323222322222223222322222323222322222222222223232322232323222222232322222222222222232323222323232222222323
2222222222222222222222222222222222222222222222222223222322222222222223222222222222232223232223232322232222232223222223232222232222222222222222222222222222222322222322232322222323222322222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222223222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
