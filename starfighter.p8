pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

#include main.lua

-- field of view
fov = 0.2 -- 0.2 = 72 degrees

function _init()
  star = {}
  star.x = 0
  star.y = 0
  star.z = 1

  pl={}
	pl.x = 0 pl.y = 0
	pl.dx = 0 pl.dy = 0
	pl.z = 0
	pl.d = 0.0
	pl.dz = 0
	pl.jetpack=false

	x = 64
  y = 64
end

function _update()
  if (btn(0)) then x=x-1 end
  if (btn(1)) then x=x+1 end
  if (btn(2)) then y=y-1 end
  if (btn(3)) then y=y+1 end

  local dx=0
	local dy=0
  if (btn(⬆️)) then
    dy+= 1
  end

	if (btn(⬇️)) then
    dy-= 1
  end

  spd = sqrt(dx*dx+dy*dy)
	if (spd) then
	
		spd = 0.1 / spd
		dx *= spd
		dy *= spd
		
		pl.dx += cos(pl.d-0.25) * dx
		pl.dy += sin(pl.d-0.25) * dx
		pl.dx += cos(pl.d+0.00) * dy
		pl.dy += sin(pl.d+0.00) * dy
    
    pl.x += pl.dx
    pl.y += pl.dy

    -- friction
    pl.dx *= 0.6
	  pl.dy *= 0.6
	end

end
 
function _draw()
  cls(5)
  printh(pl.x)
  
  local v = {}
  v.x0 = cos(pl.d + fov / 2)
  v.x1 = cos(pl.d - fov / 2)
  v.y0 = sin(pl.d + fov / 2)
  v.y1 = sin(pl.d - fov / 2)

  for sx=0,127 do
    local sy=127
    
  end

  circfill(x,y,7,14)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
