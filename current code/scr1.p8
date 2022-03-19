pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
--variables

function _init()
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
--update and draw


anim_time=0
foward = true
function _update()
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

function _draw()

	cls()
	map(0,0)
	spr(p.sp, p.x, p.y, p.w, p.h)
	
	--prints the time at the top right
	print( q)
end

function draw_gameover()
	--nothing yet
end
-->8
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
--player

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
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700000004444444000000000444444400000000444444440000000044444400000000000aaaaaaa000000aaaaaaa000000000000aaaaaaa000000000aaaa
00077000004444444444000000444444444400000444444444440000004444444400000000aaaaaaaaaa0000aaaaaaaaaa00000000aaaaaaaaaa000000aaaaaa
00700700004444444444000000444444444400004444444444440000044444444440000000aaaaaaaaaa0000aaaaaaaaaa00000000aaaaaaaaaa000000aaaaaa
000000000044ffffff4400000044ffffff4400000444ffffff440000044ffffff440000000aaffffffaa0000aaffffffaa00000000aaaaaaaaaa000000aaffff
000000000444ffffff4400000444ffffff4400004444ffffff440000044ffffff44400000aaaffffffaa0000aaffffffaaa000000aaaaaaaaaaa00000aaaffff
0000000004f4ffffff40000004f4ffffff40000044f4ffffff400000004ffffff4f400000afaffffffa000000affffffafa000000aaaaaaaaaa000000afaffff
000000004444ffffff4000004444ffffff4000004444ffffff400000004ffffff4444000aaaaffffffa000000affffffaaaa0000aaaaaaaaaaa00000aaaaffff
00000000499499f944400000499499f944000000099099f900000000000449f994994000a99a88f8aaa000000aaa8f88a99a0000aaaaaaaaaaa00000a99a88f8
00000000499499f944400000499499f944000000099099f900000000000049f994994000a99a88f8aaa000000aaa8f88a99a0000aaaa8888aaa00000a99a88f8
00000000444499f999400000440099f999000000000099f999000000000999f994444000aaaa88f888a000000a888f88aaaa0000aaaa888888a00000aaaa88f8
000000004440995599400000400099559900000000009955990000000009955990444000aaa0885588a000000a8855880aaa0000aaa0888888a00000aaa08855
00000000009999559900000000999955990000000099995599000000000995599990000000888855880000000088558888000000008888888800000000888855
00000000009999559900000000999955990000000099995599000000000995599990000000888855880000000088558888000000008888888800000000888855
00000000009999559900000000999955990000000099995599000000000995599990000000888855880000000088558888000000008888888800000000888855
00000000099099559900000009909955990000000990995599000000000995599099000008808855880000000088558808800000088088888800000008808855
00000000090099559990000009009955999000000900995599900000009995599009000008008855888000000888558800800000080088888880000008008855
00000000990099119990000099009911999000009900991199900000009991199009900088008811888000000888118800880000880088118880000088008811
000000009900111111f000009900111111f000009900111111f0000000f11111100990008800111111f000000f111111008800008800111111f0000088001111
00000000ff00111111000000ff00111111000000ff0011111100000000011111100ff000ff001111110000000011111100ff0000ff00111111000000ff001111
00000000000011111100000000001111110000000000111111000000000111111000000000001111110000000011111100000000000011111100000000001111
00000000000011111100000000001111110000000000111111000000000111111000000000001111110000000011111100000000000011111100000000001111
00000000000111001100000000011100110000000001110011000000000110011100000000111100110000000011001111000000000011001100000000001100
00000000000110001100000000011000110000000001100011000000000110001100000000110000110000000011000011000000000011001100000000001100
00000000000110001100000000011000110000000001100011000000000110001100000000110000110000000011000011000000000011001100000000001100
00000000000110001100000000011000110000000001100011000000000110001100000000110000110000000011000011000000000011001100000000001100
00000000000110001100000000011000110000000001100011000000000110001100000000110000110000000011000011000000000011001100000000001100
00000000000110001100000000011000110000000001100011000000000110001100000000110000110000000011000011000000000011001100000000001100
00000000000100000100000000010000010000000001000001000000000100000100000000100000010000000010000001000000000010000100000000001000
00000000000600000600000000060000060000000006000006000000000600000600000000600000060000000060000006000000000060000600000000006000
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
55555555555555555555555555555555555555555555555555555555555555550000000000000000000000000000000000000000000000000000000000000000
55555555555555555555555555555555555555555555555555555555555555550000000000000000000000000000000000000000000000000000000000000000
55555555555555555555555555555555555555555555555555555555555555550000000000000000000000000000000000000000000000000000000000000000
55550000000555555555000000055555555500000005555550000000555555550000000000000000000000000000000000000000000000000000000000000000
55000000000055555500000000005555550000000000555500000000005555550000000000000000000000000000000000000000000000000000000000000000
55000000000055555500000000005555550000000000555500000000005555550000000000000000000000000000000000000000000000000000000000000000
55000000000055555500444444005555550044444400555500444444005555550000000000000000000000000000000000000000000000000000000000000000
50000000000055555000444444005555500044444400555500444444000555550000000000000000000000000000000000000000000000000000000000000000
50000000000555555040444444055555504044444405555550444444040555550000000000000000000000000000000000000000000000000000000000000000
00000000000555550000444444055555000044444405555550444444000055550000000000000000000000000000000000000000000000000000000000000000
00000000000555550880cc4c000555550880cc4c000555555000c4cc088055550000000000000000000000000000000000000000000000000000000000000000
0000cccc000555550880cc4c000555550880cc4c000555555000c4cc088055550000000000000000000000000000000000000000000000000000000000000000
0000cccccc0555550000cc4ccc0555550000cc4ccc05555550ccc4cc000055550000000000000000000000000000000000000000000000000000000000000000
0005cccccc0555550005cc55cc0555550005cc55cc05555550cc55cc500055550000000000000000000000000000000000000000000000000000000000000000
55cccccccc55555555cccc55cc55555555cccc55cc55555555cc55cccc5555550000000000000000000000000000000000000000000000000000000000000000
55cccccccc55555555cccc55cc55555555cccc55cc55555555cc55cccc5555550000000000000000000000000000000000000000000000000000000000000000
55cccccccc55555555cccc55cc55555555cccc55cc55555555cc55cccc5555550000000000000000000000000000000000000000000000000000000000000000
5cc5cccccc5555555cc5cc55cc5555555cc5cc55cc55555555cc55cc5cc555550000000000000000000000000000000000000000000000000000000000000000
5c55ccccccc555555c55cc55ccc555555c55cc55ccc555555ccc55cc55c555550000000000000000000000000000000000000000000000000000000000000000
cc55cc11ccc55555cc55cc11ccc55555cc55cc11ccc555555ccc11cc55cc55550000000000000000000000000000000000000000000000000000000000000000
cc55111111f55555cc55111111f55555cc55111111f555555f11111155cc55550000000000000000000000000000000000000000000000000000000000000000
ff55111111555555ff55111111555555ff551111115555555511111155ff55550000000000000000000000000000000000000000000000000000000000000000
55551111115555555555111111555555555511111155555555111111555555550000000000000000000000000000000000000000000000000000000000000000
55551111115555555555111111555555555511111155555555111111555555550000000000000000000000000000000000000000000000000000000000000000
55551155115555555555115511555555551111551155555555115511115555550000000000000000000000000000000000000000000000000000000000000000
55551155115555555555115511555555551155551155555555115555115555550000000000000000000000000000000000000000000000000000000000000000
55551155115555555555115511555555551155551155555555115555115555550000000000000000000000000000000000000000000000000000000000000000
55551155115555555555115511555555551155551155555555115555115555550000000000000000000000000000000000000000000000000000000000000000
55551155115555555555115511555555551155551155555555115555115555550000000000000000000000000000000000000000000000000000000000000000
55551155115555555555115511555555551155551155555555115555115555550000000000000000000000000000000000000000000000000000000000000000
55551555515555555555155551555555551555555155555555155555515555550000000000000000000000000000000000000000000000000000000000000000
55556555565555555555655556555555556555555655555555655555565555550000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003030303030303030000000000000000030303030303030300000000000000000303030303030303000000000000000003030303030303030000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
5959595959595959595959595959595948494a4b48494a4b48494a4b48494a78797a7b78797a7b78797a7b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5959595959595959595959595959595958595a5b58595a5b58595a5b494a4b48494a4b48494a4b48494a4b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5959595958595959595959595959595968696a6b68696a6b68696a6b595a5b58595a5b58595a5b58595a5b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5959595968595959595959595959595978797a7b78797a7b78797a7b696a6b68696a6b68696a6b68696a6b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5959595978595959595959595959595978797a7b78797a7b78797a7b797a7b78797a7b78797a7b78797a7b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5959595959595959595959595959595948494a4b48494a4b48494a4b494a4b48494a4b4b494a4b48494a4b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5959595959595959595959595959595958595a5b58595a5b58595a5b595a5b58595a5b5b595a5b58595a5b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4041424359595959595959404142435968696a6b68696a6b68696a6b696a6b68696a6b6b696a6b68696a6b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5051525359595959595959505152535978797a7b78797a7b78797a7b78797a53535353535353535300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4445464744454647444546444546474744454647444546474445465353535353535353535353535300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5455565754555657545556545556575754555657545556575455565353535353535353535353535300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6465666764656667646566646566676764656667646566676465665353535353535353535353535300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7475767774757677747576747576777774757677747576777475765353535353535353535353535300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7474757677757677646566677475767774757475767475747576770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
