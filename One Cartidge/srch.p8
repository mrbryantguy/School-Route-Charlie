pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
--init

function _init()
		--varialbes
		scene = "logo"	
		lastscene= ""	
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
 
 
 	p2={
		sp=38,
		x=8,
		y=flr(180),
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
 
 sp = 10,
 x  = 0,
 y  = 0,
 w  = 2,
 h  = 2
 
 }
	
	--- map x and y base loc
	-- declaring var 
	
	mx = 0 --- map x 
	my = 0 --- map y 
	
	-- camera x and y loc
	-- declaring var
	
	cx = 0 -- camera x 
	cy = 0 -- camera y 
	
	
	mx2 = 0
	
	my2 = 0 
	
	cx2 = 0 
	cy2 = 0
	
	
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
snow = 10
snow_x = 300
snow_y =56
s1x = 400
s2x = 500
s3x = 600
s4x = 700
s5x = 800
s6x = 900
s7x = 1000



--sharks
shark = 61
shark_y = 165
shark1x = 400
shark2x = 500
shark3x = 600
shark4x = 700
shark5x = 800
shark6x = 900
shark7x = 1000

shark8x = 400
shark9x = 500
shark10x = 600
shark11x = 700
shark12x = 800
shark13x = 900
shark14x = 1000


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
	--was game
		scene = "game" 
	end 	
	
end  -- end update menu 

-- code from update scr1.p8

anim_time=0
foward = true

function update_game()

	player_update()
--snowball_update()
-- snow ball update was drawing
-- the error ball on the corner 
-- idk the functionality 
-- change made by alexis 

-- change this number to change
-- the speed of a specific ball

snow_x-=1  -- speed of the ball 
s1x -=1
s2x -=1
s3x -=2
s4x -=2
s5x -=3
s6x -=3
s6x -=4
s7x -=5

local spawnlimit = 950

--this resets the balls when 

if snow_x < p.x then
	
	if flr(p.x + 200) < spawnlimit then
	snow_x = flr(p.x + 200)
	end
	
end

if s1x < p.x then
	
	if flr(p.x + 300) < spawnlimit then
	s1x = flr(p.x + 300)
	
	end

end

if s2x < p.x then
	
	if flr(p.x + 400 < spawnlimit) then
	s2x = flr(p.x + 400)
	end

end

if s3x < p.x then

	if flr(p.x + 500) < spawnlimit then
	s3x = flr(p.x + 500)
	end
	
end

if s4x < p.x then

	if flr(p.x + 600) < spawnlimit then
	s4x = flr(p.x + 600)
	end

end

if s5x < p.x then
	
	if flr(p.x + 700) < spawnlimit then
	s5x = flr(p.x + 700)
	end

end

if s6x < p.x then

	if flr(p.x + 800) < spawnlimit then
	s6x = flr(p.x + 800)
	end

end

if s7x < p.x then

	if	flr (p.x + 900) < spawnlimit then
	s7x = flr(p.x + 900)
	end
	
end

--here is to end game if player
--touches the snowball

-- this is wat actually gets collisions
-- needs to be fixed to get all 4 frames 
-- of the ball

-- collisions 

--edited by alexis
-- are kinda working
-- fix some parameters 
-- location 


-- example 
-- snowball is at y 62 all time
-- size is 16 pixels
-- y loc in pico 8 is from top to
-- bottom going positive
-- we know the ball is between
-- 62 and 46 y val at all times 

-- if player is at 56 y 

-- example
-- snowball is x 350
-- and the snowball is 16 pixel
-- wide 350 to 366 pixels where
-- snowball is at any moment
-- player is at 357
-- if 350 >= 357 and 366 <= 357

--lifeframe
-- cahnge this varialbe to 
-- modify the invincibilty
-- whem the ball hits

lifeframe = 2 

								-- 10             --12                 12           14      
if flr((snow_x / 8 ))  <= flr(p.x/8) and  flr (p.x /8) <= flr(snow_x/8) + 1   then
  --cls()
  if flr ((snow_y / 8)) >= flr(p.y / 8) and flr (snow_y / 8) - 1 <= flr(p.y / 8) then
  
  	ballframe += 1
  
  	if ballframe > lifeframe then
  	lives -= 1
  
  	ballframe = 0
  
  end -- end snow_ y if
  
  end -- end snow_x if

end--if the player touches snow

if flr((s1x / 8 ))  <= flr(p.x/8) and  flr (p.x /8) <= flr(s1x/8) + 1   then
  --cls()
  if flr ((snow_y / 8)) >= flr(p.y / 8) and flr (snow_y / 8) - 1 <= flr(p.y / 8) then
  
  	ballframe += 1
   
  	if ballframe > lifeframe then
  	lives -= 1
  
  	ballframe = 0
  
  end -- end snow_ y if
  
  end -- end snow_x if

end--if the player touches snow


if flr((s2x / 8 ))  <= flr(p.x/8) and  flr (p.x /8) <= flr(s2x/8) + 1   then
  --cls()
  if flr ((snow_y / 8)) >= flr(p.y / 8) and flr (snow_y / 8) - 1 <= flr(p.y / 8) then
   
  	ballframe += 1
  
  	if ballframe > lifeframe then
  	lives -= 1
  
  	ballframe = 0
  
  end -- end snow_ y if
  
  end -- end snow_x if

end--if the player touches snow

if flr((s3x / 8 ))  <= flr(p.x/8) and  flr (p.x /8) <= flr(s3x/8) + 1   then
  --cls()
  if flr ((snow_y / 8)) >= flr(p.y / 8) and flr (snow_y / 8) - 1 <= flr(p.y / 8) then
  
 	ballframe += 1
  
  	if ballframe > lifeframe then
  	lives -= 1
  
  	ballframe = 0
  
  end -- end snow_ y if
  
  end -- end snow_x if

end--if the player touches snow


if flr((s4x / 8 ))  <= flr(p.x/8) and  flr (p.x /8) <= flr(s4x/8) + 1   then
  --cls()
  if flr ((snow_y / 8)) >= flr(p.y / 8) and flr (snow_y / 8) - 1 <= flr(p.y / 8) then
  
  	ballframe += 1
  
  	if ballframe > lifeframe then
  	lives -= 1
  
  	ballframe = 0
  
  end -- end snow_ y if
  
  end -- end snow_x if

end--if the player touches snow


if flr((s5x / 8 ))  <= flr(p.x/8) and  flr (p.x /8) <= flr(s5x/8) + 1   then
  --cls()
  if flr ((snow_y / 8)) >= flr(p.y / 8) and flr (snow_y / 8) - 1 <= flr(p.y / 8) then
  
  	ballframe += 1
  
  	if ballframe > lifeframe then
  	lives -= 1
  
  	ballframe = 0
  
  end -- end snow_ y if
  
  end -- end snow_x if

end--if the player touches snow


if flr((s6x / 8 ))  <= flr(p.x/8) and  flr (p.x /8) <= flr(s6x/8) + 1   then
  --cls()
  if flr ((snow_y / 8)) >= flr(p.y / 8) and flr (snow_y / 8) - 1 <= flr(p.y / 8) then
  
  	ballframe += 1
  
  	if ballframe > lifeframe then
  	lives -= 1
  
  	ballframe = 0
  
  end -- end snow_ y if
  
  end -- end snow_x if

end--if the player touches snow


if flr((s7x / 8 ))  <= flr(p.x/8) and  flr (p.x /8) <= flr(s7x/8) + 1   then
  --cls()
  if flr ((snow_y / 8)) >= flr(p.y / 8) and flr (snow_y / 8) - 1 <= flr(p.y / 8) then
  
  	ballframe += 1
  
  	if ballframe > lifeframe then
  	lives -= 1
  
  	ballframe = 0
  
  end -- end snow_ y if
  
  end -- end snow_x if

end--if the player touches snow

-- end collisions 

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
    

end

-- update second game 

function update_game2()

player_update2()
shark1x -= 2
shark2x -= 2
shark3x -= 3
shark4x -= 3
shark5x -= 4
shark6x -= 5
shark7x -= 5

shark8x -= 6
shark9x -= 6
shark10x -= 7
shark11x -= 8
shark12x -= 8
shark13x -= 9
shark14x -= 10

local spawnlimit = 950

--this resets the sharks when 

--if snow_x < p.x then
	
--	if flr(p2.x + 200) < spawnlimit then
--	snow_x = flr(p2.x + 200)
--	end
	
--end

if shark1x < p2.x then
	
	if flr(p2.x + 300) < spawnlimit then
	shark1x = flr(p2.x + 300)
	
	end

end

if shark2x < p2.x then
	
	if flr(p2.x + 400 < spawnlimit) then
	shark2x = flr(p2.x + 400)
	end

end

if shark3x < p2.x then

	if flr(p2.x + 500) < spawnlimit then
	shark3x = flr(p2.x + 500)
	end
	
end

if shark4x < p2.x then

	if flr(p2.x + 600) < spawnlimit then
	shark4x = flr(p2.x + 600)
	end

end

if shark5x < p2.x then
	
	if flr(p2.x + 700) < spawnlimit then
	shark5x = flr(p2.x + 700)
	end

end

if shark6x < p2.x then

	if flr(p2.x + 800) < spawnlimit then
	shark6x = flr(p2.x + 800)
	end

end

if shark7x < p2.x then

	if	flr (p2.x + 900) < spawnlimit then
	shark7x = flr(p2.x + 900)
	end
	
	
	end
	if shark8x < p2.x then
	
	if flr(p2.x + 300) < spawnlimit then
	shark8x = flr(p2.x + 300)
	
	end

end

if shark9x < p2.x then
	
	if flr(p2.x + 400 < spawnlimit) then
	shark9x = flr(p2.x + 400)
	end

end

if shark10x < p2.x then

	if flr(p2.x + 500) < spawnlimit then
	shark10x = flr(p2.x + 500)
	end
	
end

if shark11x < p2.x then

	if flr(p2.x + 600) < spawnlimit then
	shark11x = flr(p2.x + 600)
	end

end

if shark12x < p2.x then
	
	if flr(p2.x + 700) < spawnlimit then
	shark12x = flr(p2.x + 700)
	end

end

if shark13x < p2.x then

	if flr(p2.x + 800) < spawnlimit then
	shark13x = flr(p2.x + 800)
	end

end

if shark14x < p2.x then

	if	flr (p2.x + 900) < spawnlimit then
	shark14x = flr(p2.x + 900)
	end
	end
	
end--update_game2













-- update third game 

function update_game3()



end 

-- update game over 

function update_gover()


	if btnp(❎) then 
	
	if lastscene == "game" then
	
	-- reseting lifes , scene 
	-- and position of player
	
	 lives = 3 
	 
	 scene = "game"
	 
	 p.x = 8
	 
	 p.y = 20
	 
	 -- reseting ball locaiton 
	 snow_x = 300 
	 s1x = 400
	 s2x = 500
	 s3x = 600
	 s4x = 700
	 s5x = 800
	 s6x = 900
	 s7x = 1000
	 
	 
	
	elseif lastscene == "game2" then
	
		--reseting lifes , scene
		-- and player positon
	
		lives = 3 
		
		scene = "game2"
	
	elseif lastscene == "game3" then
	
		--reseting lifes, scene
		-- and player position
	
		lives = 3 
		
		scene = "game3"
	
	
	end
	

	end


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

	map(0 ,48)
	homemenulogo()

	print("press ❎ to start" ,30,63)


end 

-- code from scr1.p8 draw func

function draw_game() 
 cls()
	camera(cx, cy - 24)
	map(mx,my)
	spr(p.sp, p.x, p.y - 14, p.w, p.h)

		-- function in the correct area
 random = flr(rnd(50))


-- debug print statements 
--	print('snowball x :'..  flr(snow_x / 8) , p.x ,p.y + 5)
--	print('player x:'..  flr(p.x / 8) , p.x , p.y+ 20)
--	print('snowball y:'..  flr(snow_y/ 8) , p.x , p.y + 40)
--	print('snowball y:'..  flr((snow_y -16) / 8) , p.x , p.y + 50)
--	print('player y:'..  flr(p.y / 8) , p.x , p.y + 60 )
-- print(random, cx , cy)

-- end debug
	 
		-- function in the correct area end 

	-- this is what actualy is printing the snow ball
 
 spr(snow, snow_x ,snow_y - 8 , 2 ,2 )
 spr(snow, s1x ,snow_y - 8 , 2 ,2 )
	spr(snow, s2x ,snow_y - 8 , 2 ,2 )
 spr(snow, s3x ,snow_y - 8 , 2 ,2 )
 spr(snow, s4x ,snow_y - 8 , 2 ,2 )
 spr(snow, s5x ,snow_y - 8 , 2 ,2 )
 spr(snow, s6x ,snow_y - 8 , 2 ,2 )
 spr(snow, s7x ,snow_y - 8 , 2 ,2 )
	

 -- cam hardcode the # of balls 
 -- end what actualy is printing the rolling snowball

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
	
		lastscene = scene
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
map(mx2,my2)

camera(cx2, 140)

-- sprite changed to swiming

--print(p.x , p.y , 0 , 26*8)

spr(p2.sp, p2.x , flr(p2.y) , p2.w, p2.h)
print('lives: '..lives, cx2, 155) 


		if collide_map(p2, "up", 1) then
			print("flag reached", cx2 , 150)
		end
		
		print(p2.y , cx2 , 180)
		
		if collide_map(p2, "down", 1) then
			print("flag reached", cx2 , 150)
		end



 palt(14, true)
 palt(0,false)
 spr(shark, shark1x ,shark_y - 8 , 3 ,1 )
	
	spr(shark, shark2x ,shark_y - 8 , 3 ,1 )
 spr(shark, shark3x ,shark_y+5 - 8 , 3 ,1 )
 spr(shark, shark4x ,shark_y+20 - 8 , 3 ,1 )
 spr(shark, shark5x ,shark_y+30 - 8 , 3 ,1 )
 spr(shark, shark6x ,shark_y+40 , 3 ,1 )
 spr(shark, shark7x ,shark_y+25 , 3 ,1 )
 
 spr(shark, shark8x ,shark_y +80 , 3 ,1 )
 spr(shark, shark9x ,shark_y+35 - 8 , 3 ,1 )
 spr(shark, shark10x ,shark_y+40 - 8 , 3 ,1 )
 spr(shark, shark11x ,shark_y+50 - 8 , 3 ,1 )
 spr(shark, shark12x ,shark_y+60 , 3 ,1 )
 spr(shark, shark13x ,shark_y+70 , 3 ,1 )
 spr(shark, shark14x ,shark_y+100 , 3 ,1 )

if lives == 0 then
	
		lastscene = scene
		scene = "gover"
end

--print("here is game 2" , 4 * 8 , 26*8 )





end 

-- draw third game 

function draw_game3()



end 


 

-- when scene end is reached 
function draw_end()


	cls()
	map()
 camera (33*8,48*8)


 
	print("why are you late",37*8 ,50*8, 2)
	print("game over" ,37*8 ,55*8, 2)

end 

--gameover
function draw_gameover()
  cls()
  map()
  camera (17*8,48*8)
  
  
  print("you died", 20*8, 50*8, 2)
  
  print("press ❎ for restart", 21*8 , 60*8 , 2)
  
  --debug print
  --print(scene)
  
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


function homemenulogo() 

		print("school",51,cy+20,8)
  print("route",55,cy+26,6)
  print("charlie",53,cy+32,8)

end -- end home menu logo

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

		cls()		
		
		-- setting the value for next
		-- location of the player 

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
--player_update2
function player_update2()
	--physics
	p2.dy+=gravity*.1
	p2.dx*=friction*.5
	

	--controls
	if btn(⬅️) then

		p2.sp=40--was 3
		p2.dx-=p.acc
		p2.running=true
		p2.flp=true
		
		c = 3
		
		end
		
		
		if btn(⬇️) then
			p2.sp = 40
			p2.dy = 0
			p2.dy+=p.acc*5
			p2.running = true
			p2.flp = true
			c=3
			end
	
	if btn(➡️) then
	
	 --if time() - anim_time > anim_wait then
   -- p.sp+=6
   -- anim_time=time()

   -- if p.sp > 7 then
     -- p.sp = 1
   -- end
 -- end
	 p2.sp=38
	 c = 1
		p2.dx+=p.acc
		p2.running=true
		p2.flp=false
		
	end
	
	--slide
	if p2.running
	and not btn(⬅️)
	and not btn(➡️)
	and not p.falling
	and not p.jumping then
		p2.running=false
		p2.sliding=true
	end
	
	--jump
	if btnp(❎) then
		p2.sp=42
		p2.dy-=p.boost *.5
		p.landed=false
	end
	
	
	-- check collision up and down
	if p2.dy>0 then
		p_falling = true
		p_landed = false
		p2.jumping=false
		
		if collide_map(p2, "down", 0) then
			p2.landed=true
			p2.falling=false
			p2.dy=0
			p2.y-=(p2.y+p2.h)%8
		end
		
	elseif p2.dy<0 then
		if collide_map(p2, "up", 1) then
			p2.y = 154
			p2.dy = 0
			p2.jumping = false
		end
	end
	
--check collision left and right
	if p2.dx<0 then
		if collide_map(p2, "left", 1) then
			p2.dx=0
		end
	elseif p2.dx>0 then
		if collide_map(p2, "right", 1) then
			p2.dx=0
		end
	end

	--stop sliding
	if p2.sliding then
		if abs(p2.dx)<.2
		or p2.running then
			p2.dx=0
			p2.sliding=false
		end
	end
	
	--movement
		
	p2.x+=p2.dx	
	p2.y+=p2.dy
			
	cx2 = p2.x 
	cy2 = p2.y - 39
	
	
		-- this code detects when 
		-- the flag is reached 
		-- at the end of the code 
	cobj = mget((p2.x + 8)/ 8  , p2.y / 8 )

 if fget(cobj , 2 ) then
	
		scene = "end"
		
		-- setting the value for next
		-- location of the player 

	end
	
end
__gfx__
0000000077777777000000000000000000000000000000000000000000000000000000000000000000007777777700000000000c700000007ccc7cccc000000c
0000000077777777000040000000000000000444444400000000044444440000000004444444000000007777777700000000007c7c00000077cccc7cc700007c
007007007777777700044e00000000000000444ffff440000000444ffff440000000444ffff4000000771111111177000000077c77700000ccc7ccccccc0077c
00077000777777770044ee40000000000000444ffff440000000444ffff440000000444ffff4000000771111111177000000c77cc77c0000ccccccccccccc77c
00077000777777770044e4444000000000004f4ffff4400000004f4ffff4400000004f4ffff400007711111111111177000c77cccc77c000c77cc77c7ccc77cc
0070070077777777000004444e0000000000494ffff400000004494ffff400000004494ffff40000771111111111117700777cc7ccc77700cccccc7ccc777cc7
000000007777777700000444e400000000004449f944000000044449f940000000444449f900000011117777111177110c77cc7777cc77707ccccccccc77cc77
00000000777777770004404e444000000000449958940000000400995890000000440099589000001111777711117711777ccc77777ccccccc7c77cc777ccc77
0000000000000000000000e4e4440400000040995990000000000099599000000000009959900000111111117711111100000000000000000000000000000000
00000000000000000000000000640000000009995990000000000099599900000000099959900000111111117711111100000000000000000000000000000000
000000000000000000000006060460000000090911f00000000000f1190900000000090911f00000111111111111111100000000000000000000000000000000
0000000000000000000000000066000000000f011100000000000001110f000000000f0111000000111111111111111100000000000000000000000000000000
00000000000000000000000000880000000000010100000000000001010000000000000101000000007711111111770000000000000000000000000000000000
00000000000000000000000000880000000000110100000000000011010000000000001101000000007711111111770000000000000000000000000000000000
00000000000000005555555555555555000000100100000000000010010000000000001001000000000011771111000000000000000000000000000000000000
00000000000000000000000000000000000000600600000000000060060000000000006006000000000011771111000000000000000000000000000000000000
08888000c8888ccccccccccccbbcbbcccccccccccccccbcbeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000000000000000000000000
8888800088888ccccccccccccbccbccccccccbcccbcbcbcbeeeee4444444eeeeeeee4444444eeeeeeeeee4444444eeee00000000000000000000000000000000
8888800088888cccccccccccbbbcbbbcbcbbcbbbcbcbcbcbeeee444ffff44eeeeee44ffff444eeeeeeee444ffff44eee00000000000000000000000000000000
8888800088888cccccccccccbcbcccbcbcbccccbcbcbcbbbeeee444ffff44eeeeee44ffff444eeeeeeee444ffff44eee00000000000000000000000000000000
00066000ccc66cccccccccccccbccbbcbcbbccbbbbcbcbcbeeee4f4ffff44eeeeee44ffff4f4eeeeeeee4f4ffff44eee00000000000000000000000000000000
00066000ccc66cccccccccccccbccbccbccbccbccbbbbbbbeee4494ffff4eeeeeeee4ffff4944eeeeeee494ffff4eeee00000000000000000000000000000000
00066000ccc66cccccccccccccbbbbbcbccbccbccbbbbcbbeee44449f94eeeeeeeeee49f94444eeeeeee4449f944eeee00000000000000000000000000000000
00066000ccc66ccccccccccccbbcccbbbcbbccbbbccbccbceee4ee99589eeeeeeeeee98599ee4eeeeeee44995894eeee00000000000000000000000000000000
00066000ccc66ccc00000000000000000000000000000000eeeeee999f9eeeeeeeeee9f999eeeeeeeeee4e99599eeeee00000000eeeeeeee000000000eeee00e
00066000ccc66ccc00000000000000000000000000000000eeeeeee959999feeeef999959eeeeeeeeeeee999599eeeee00000000eeee0000776666666000060e
00066000ccc66ccc00000000000000000000000000000000eeeeeee119eeeeeeeeeeee911eeeeeeeeeeee9e911feeeee00000000eeee066607666666666660ee
00066000ccc66ccc00000000000000000000000000000000eeeeeee111eeeeeeeeeeee111eeeeeeeeeeeefe111eeeeee00000000eeeee066666766666666060e
00066000ccc66ccc00000000000000000000000000000000eee61111e1eeeeeeeeeeee1e11116eeeeeeeeee1e1eeeeee00000000eeeeee07777666666600e00e
00066000ccc66ccc00000000000000000000000000000000eeeeeeeee1eeeeeeeeeeee1eeeeeeeeeeeeeee11e1eeeeee00000000eeeeeee07766660000eeee00
00066000ccc66ccc00000000000000000000000000000000eeeeee6111eeeeeeeeeeee1116eeeeeeeeeeee1ee1eeeeee00000000eeeeeeee00000660eeeeeeee
00066000ccc66ccc00000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6ee6eeeeee00000000eeeeeeeeee00e00eeeeeeeee
1dccccccccccccccccccccccccccccd1cccccccccccccccccccccccccccccccc444444440007700044444444777777777777777777774447ccc77cccbbbbbbbb
1d7777777777777777777777777777d177777777777777777777777777777777dddddddd0077777044444444777777777777777774444444cc77777cbbbbbbbb
1d7777777777777777777777777777d177777777777777777777777777777777dddddddd077777774444444477777777777777f9994ffff4c7777777bbbbbbbb
1d7777777777777777777777777777d1777777777777777777777777777777771111111177777777444444447777777776111119989ffff477777777bbbbbbbb
1117771777177177771771777177711111177717771771777717717771777111111111110777777744444444777777777777711555fffff4c7777777bbbbbbbb
1dc171c171c11c1771c11c171c171cd1ccc171c171c11c1771c11c171c171ccc1111111107777770444444447777777777711199999ffff4c777777cbbbbbbbb
1dcc1ccc1c77ccc11c77ccc1cc71ccd1cc771ccc1c77ccc11c77ccc1cc71cccc111111110077000044444444777777777611777999444444cc77ccccbbbbbbbb
1dcccccc77ddcccc77ddcccc77ddccd177ddcccc77ddcccc77ddcccc77ddcccc1111111100000000444444447777777777777f997449f444ccccccccbbbbbbbb
1dcccc77ddcccc77ddcccc77ddccccd1ddcccc77ddcccc77ddcccc77ddcccc77bbbbbbbbcccccccccccccccccccccccccccccccccccc444caaaaaaaaccc44ccc
1dcc77ddcccc77ddcccc77ddcccc77d1cccc77ddcccc77ddcccc77ddcccc77ddbbbbbbbbccccccccccccccccccccccccccccccccc4444444aaaaaaaaccc44ccc
1d77ddcccc77ddcccc77ddcccc77ddd1cc77ddcccc77ddcccc77ddcccc77ddcc4b44b4b4ccccccccccccccccccccccccccccccf9994ffff4aaaaaaaaccc44ccc
1dddcccc77ddcccc77ddcccc77ddccd177ddcccc77ddcccc77ddcccc77ddcccc44bb4b44ccccccccccccccccccccccccc6111119989ffff4aaaaaaaaccc44ccc
1dcccc77ddcccc77ddcccc77ddccccd1ddcccc77ddcccc77ddcccc77ddcccc774b44b44bccccccccccccccccccccccccccccc11555fffff4aaaaaaaaccc44ccc
1dcc77ddcccc77ddcccc77ddcccc77d1cccc77ddcccc77ddcccc77ddcccc77dd44444444ccccccccccccccccccccccccccc11199999ffff4aaaaaaaaccc44ccc
1d77ddcccc77ddcccc77ddcccc77ddd1cc77ddcccc77ddcccc77ddcccc77ddcc44444444ccccccccccccccccccccccccc611ccc999444444aaaaaaaaccc44ccc
1dddcccc77ddcccc77ddcccc77ddccd177ddcccc77ddcccc77ddcccc77ddcccc44444444cccccccccccccaaaaccccccccccccf99c449f444aaaaaaaaccc44ccc
1dcccc77ddcccc77ddcccc77ddccccd1ddcccc77ddcccc77ddcccc77ddcccc7700000000caaaaaaaaaaaaaaaaacccccc4444444c0cccccc0ccccccccc4444444
1dcc77ddcccc77ddcccc77ddcccc77d1cccc77ddcccc77ddcccc77ddcccc77dd00000000aaaaaaaaaaaaaaaaaaa55cc444ffff4400cccc00cccccccc44ffff44
1d77ddcccc77ddcccc77ddcccc77ddd1cc77ddcccc77ddcccc77ddcccc77ddcc00000000aaaaaaaaaaaaa99999ac5cc444ffff44c00cc00ccccccccc44ffff44
1dddcccc77ddcccc77ddcccc77ddccd177ddcccc77ddcccc77ddcccc77ddcccc00000000a666a666a666a99999a55cc4f4ffff44c700c07ccccccccc44ffff4f
1dcccc77ddcccc77ddcccc77ddccccd1ddcccc77ddcccc77ddcccc77ddcccc7700000000a666a666a666a96969ac5cc494ffff4ccc7000ccccccccccc4ffff49
1dcc77ddcccc77ddcccc77ddcccc77d1cccc77ddcccc77ddcccc77ddcccc77dd00000000a666a666a666a96969acccc4449f944c7cc77c7cccccccccc449f944
1d77ddcccc77ddcccc77ddcccc77ddd1cc77ddcccc77ddcccc77ddcccc77ddcc00000000a666a666a666a96969acccc44995894c77cc77c7ccccccccc4985994
1dddcccc77ddcccc77ddcccc77ddccd177ddcccc77ddcccc77ddcccc77ddcccc00000000aaaaaaaaaaaaa99999aaaaa4c99599cc77ccc77ccccccccccc99599c
1dcccc77ddcccc77ddcccc77ddccccd1ddcccc77ddcccc77ddcccc77ddcccc7700000000aaaaaaaaaaaaa96969aaaaaa999599cccccccc0000cccccccc995999
1dcc77ddcccc77ddcccc77ddcccc77d1cccc77ddcccc77ddcccc77ddcccc77dd00000000aaaaaaaaaaaaa96969aaaaaa9c911fccccccc00cc00cccccccf119c9
1d77ddcccc77ddcccc77ddcccc77ddd1cc77ddcccc77ddcccc77ddcccc77ddcc00000000a9aaa000aaaaa96969a000aafc111ccccccc007cc700ccccccc111cf
1dddcccc77ddcccc77ddcccc77ddccd177ddcccc77ddcccc77ddcccc77ddcccc00000000aaaa00500aaaa9999900500ccc1c1cccccc0077cc7700cccccc1c1cc
1dcccc77ddcccc77ddcccc77ddccccd1ddcccc77ddcccc77ddcccc77ddcccc770000000055550555055555555505550cc11c1ccccc0077cccc7700ccccc1c11c
1dcc77ddcccc77ddcccc77ddccccccd1cccc77ddcccc77ddcccc77ddcccc77dd00000000cccc00500ccccccccc00500cc1cc1cccc0077cc77cc7700cccc1cc1c
1dddddddddddddddddddddddddddddd1cc77ddcccc77ddcccc77ddcccc77ddcc00000000ccccc000ccccccccccc000ccc6cc6ccc0077cc7777cc7700ccc6cc6c
1111111111111111111111111111111177ddcccc77ddcccc77ddcccc77ddcccc00000000cccccccccccccccccccccccccccccccc077ccc7777ccc770cccccccc
10424232525252223242423252525222223242423252525222223242423252525222324242325252522232424232525252223242423252525222324242325252
52223242423252525222222232424232525252223242423252525222223242423252525222223242423252525222223242423252525222222232424232525213
84848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484
84848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484848484
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aa000a000a0a0a000a000a0aaa0a0a000a000aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aa0aaa0aaa0a0a0a0a0a0a0aaa0a0aaa0aaa0aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aa000a0aaa000a0a0a0a0a0aaa000aaa0aaa0aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaa0a0aaa0a0a0a0a0a0a0aaaaa0aaa0aaa0aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aa000a000a0a0a000a000a000aaa0aaa0aaa0aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaa6666aaa6666aaaaaaaaaaa6666aaa6666aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaa6666aaa6666aaaaaaaaaaa6666aaa6666aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaa6666aaa6666a999999999a6666aaa6666aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaa6666aaa6666a999999999a6666aaa6666aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaaaaaaaaaaaa969696969aaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaaaaaaaaaaaa969696969aaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaaaaaaaaaaaa969696969aaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaaaaaaaaaaaa999999999aaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaaaaaaaaaaaa969696969aaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaaaaaaaaaaaa969696969aaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaaaaaaaaaaaa969696969aaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaaaaaaaaaaaa999999999aaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e600e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e600e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e60000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e600e6e6e6e6e6e6e6e6e6e6e6e6e6e4e6e600e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e60000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e600e6e6e6e6e6e6e4e6e6e6e695e6e6e4e600e6e6e6e6e6e4e6e6e6e6e6e6e6e6e6e60000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e600e6e6e6e6e6e6e6e6e6e6e6a4e6e6e6e600e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e60000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e600e6e6e4e6b4b4b4b4b4b4a4a4a4e6e6e600e6e6e6e6e6e6e6e6e6e4e6e6e6e6e6e60000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e600e6e6e6b4b4b4b4b4b4b4b4a4b4b4e6e600e6e6e6e6e6959595e6e6e6e6e6e6e6e60000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e6e6e4e6e6e6e6e6e6e4e6e6e6e6e6e600e6e6e6b4b4b4b4b4b4b4b4a4b4b4b4e600e6e6e6e6e695959595e6e6e6e4e6e6e60000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e400e6e4e6b4b4b4c4d4b4b4b4a4b4b4b4e600e6e6e4e6e6e6e6e6e6e6e6e6e6e6e6e60000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e6e6e6e6e6e6e6e6e6e6e6e4e6e6e6e600e695e6b4b4b4b4b4b4b4b4b4b4b495e600e6e6e6e6e6e4e6e6e6e6e6e6959595e60000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e6e6e6e4e6e6e6e6e6e6e6e6e6e6e6e600e69595b4b4b4b4b4b4b4b4b4b49595e600e6959595e6e6e6e6e6e6e6e6959595e60000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e6e6e6e6e6e6e6e6e6d7e7e6e6e6e6e600e6e49595b4b4b4b4b4b4b4b4b4e6e6e600e6959595e6e6e6e6e69595e6e6e6e6e60000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e6e6e6e6e6e6e6e6d7e0e0e7e6e6e6d700e6e6e6e6e6e6e695959595959595959500e6e6e6e6e6e6e6e695959595959595950000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e6e6e6e6e6e6e6d7e0e0e0e0e7e6d7e000e6e6e6e6e6e6959595e495959595959500e6e6e6e6e6e6e61929394959959595950000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
96a6b6c6e6e6d7e0e0e0e0e0e0d6e0e00095959595e495959595959595959595950096a6b6c6e6f4f61a2a3a4a5ac6f6f4950000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
97a7b7c7e6d7e0e0e0e0e0e0e0e0e0e00095e4959595959595959595959595e4950097a7b7c7e6f5f71b2b3b4b5bc7f7f5958600000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444444444444444444444444444009595959595959595959595959595959500858585858585858585858585858585850000000000000000000000000000
__gff__
0013000000000000000008080000000000000000000000000000080800000000040400000000000000000000000000000404000000000000000000000000000003030303131313131300000000000000030303031313131300000000000000000303030313131313000000000000000003030303131313130000000000000000
1010101010101010000000000000000010101010101010100000000000000000101010101010101000000000000000001010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
010000000000000c0d000000000000000000000000000000004900000000000000000000000000000000000000000000000000000000000000000000000c0d0000004900000000000000000000000c0d000049000000000000000000000000000000000000000000000000000000000000000000000049000000000000000000
0100000000000c0e0e0d00490000000000000000000000000000000000000000000049000049000000000000000000000000000000000000004900000c0e0e0d000000000000000000000000000c0e0e0d0000000000000049000000000000000000000000000000000000000000000000000000000000000000000000000049
01000049000c0e0e0e0e0d0000000049000000000000000000000000000000000000000000000000000000000049000000000049000000000000000c0e0e0e0e0d00000049000000004900000c0e0e0e0e0d00004900000000000000000000490000000000000000490000000000004900000000000000000000000000000000
010000000c0e0e0e0e0e0e0d000000000000000000490000000000000c0d00000000000000000000000000000000000000000000000c0d0000000c0e0e0e0e0e0e0d0000000000000000000c0e0e0e0e0e0e0d000000000000000000000000000000000c0d000000000000000000000000000000000000000000000049000000
0149000c0e0e0e0e0e0e0e0e0d004900000c0d00000000000000000c0e0e0d000049000000000c0d0000004900000000000000000c0e0e0d000c0e0e0e0e0e0e0e0e0d000000490000000c0e0e0e0e0e0e0e0e0d000000000c0d00004900000000000c0e0e0d000000004900000c0d0000004900000000000c0d000000000020
01000c0e0e0e0e0e0e0e0e0e0e0d00000c0e0e0d0000004900000c0e0e0e0e0d00000000000c0e0e0d000000000000490000000c0e0e0e0e0f0e0e0e0e0e0e0e0e0e0e0d00000000000c0e0e0e0e0e0e0e0e0e0e0d00000c0e0e0d0000000000000c0e0e0e0e0d00000000000c0e0e0d000000000000000c0e0e0d0000000030
010c0e0e0e0e0e0e0e0e0e0e0e0e0d0c0e0e0e0e0d000000000c0e0e0e0e0e0e0d0000000c0e0e0e0e0d000000000000000c0f0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0d0000000c0e0e0e0e0e0e0e0e0e0e0e0e0d0c0e0e0e0e0d000000000c0e0e0e0e0e0e0d0000000c0e0e0e0e0d00000000000c0e0e0e0e0d00000030
010e0e0e0e0e210e0e0e0e0e0e0e0e0e0e0e0e0e0e0d00000c0e0e0e0e0e0e0e0e0d000c0e0e0e0e0e0e0d00000c0d000c0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0d000c0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0d00000c0e0e0e0e0e0e0e0e0d000c0e0e0e0e0e0e0d0000000c0e0e0e0e0e0e0d000030
0145464744454647444546474445464744454647444546474445464445464744454647444546474445464744454647444546474445464744454647444546474444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
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
0125252323232323232323232323222323232323232222222323232323232222232323232323222223232323232223232323232222232223222223222222222323222222222323232323222223222322222223232322222323232325252523232323232323232323232223232323252525232323232323232323232322232321
0122252322232323232223232323222223232323222222222323232323222222232323232323222223232323232322232323222222232223222223222222232323222222222323232323222223222322222323232322222323222325222523222323232322232323232222232323252225232223232323222323232322222331
0122222222222323232223232322222223232223222222222323222323222222222223232223222223232223232322232323232222232223222223222222232323222222222323222223222323222322222223222322222323222322222222222223232322232323222222232322222222222222232323222323232222222331
0122222222222222222222222222222222222222222222222223222322222222222223222222222222232223232223232322232222232223222223232222232222222222222222222222222222222322222322232322222323222322222222222222222222222222222222222222222222222222222222222222222222222231
0122222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222223222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222231
0122222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222231
0122222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222231
0122222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222231
0122222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222231
0122222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222231
0122222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222231
0122222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222231
0122222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222231
