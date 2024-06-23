pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

#include main.lua

-- field of view
fov = 0.25 -- 0.2 = 72 degrees

function _init()
  stars = {}

  local star = {}
  star.x = 32
  star.y = 32
  star.z = 1
  add(stars, star)

  local star = {}
  star.x = 25
  star.y = 25
  star.z = 1
  add(stars, star)

  pl={}
	pl.x = 64 pl.y = 64
	pl.dx = 0 pl.dy = 0
	pl.z = 0
	pl.d = 0.75
	pl.dz = 0
end

function _update()
  local dx=0
	local dy=0

  if (btn(⬅️)) pl.d+=0.02
	if (btn(➡️)) pl.d-=0.02
  if (btn(⬆️)) dy+= 0.25
	if (btn(⬇️)) dy-= 0.25
  if (btn(4)) fov-= 0.01
  if (btn(5)) fov+= 0.01
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
  --printh(pl.x)
  
  local v = {}
  v.x0 = cos(pl.d + fov / 2)
  v.y0 = sin(pl.d + fov / 2)

  v.x1 = cos(pl.d - fov / 2)
  v.y1 = sin(pl.d - fov / 2)

  local focalLength = -1/(sin(fov/2)/cos(fov/2))

  --print(pl.d * 360)

  for star in all(stars) do
    local rel_x = pl.x - star.x
    local rel_y = pl.y - star.y

    local rotatedX = cos(-pl.d)*rel_x - sin(-pl.d)*rel_y
    local rotatedY = cos(-pl.d)*rel_y + sin(-pl.d)*rel_x
    local dist = sqrt(rel_x*rel_x+rel_y*rel_y)
    projectedX = 64 + rotatedX*focalLength/dist*64
    projectedY = 64 - rotatedY*focalLength/dist*64
    if rotatedX < 0 then
      circfill(projectedY, 64, 30/dist*focalLength, 14)
    end
    circfill(star.x, star.y, 1, 12)
  end

  line(pl.x, pl.y, cos(pl.d)*30+pl.x, sin(pl.d)*30+pl.y, 2)
  line(pl.x, pl.y, cos(pl.d-fov/2)*30 + pl.x, sin(pl.d-fov/2)*30 + pl.y, 2)
  line(pl.x, pl.y, cos(pl.d+fov/2)*30 + pl.x, sin(pl.d+fov/2)*30 + pl.y, 2)
  circfill(pl.x, pl.y, 1, 13)    
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
