require 'funtions'
local anim8 = require 'anim8'

function createMonkey(xpos, ypos, zpos, direction)
    local monkey = {
        xpos = xpos, 
        ypos = ypos, 
        zpos = zpos,
        direction = direction,
        speed = 100,
        scalex = 1,
        scaley = 1,
        walking = false
    }
    spritesheet = love.graphics.newImage('dude42.png')
    frameWidth = 120
    frameHeight = 114
    grid = anim8.newGrid(frameWidth,frameHeight,spritesheet:getWidth(),spritesheet:getHeight())

    monkey.walkingSideAnime = anim8.newAnimation(grid('1-4',1), 1/5)
    monkey.sideIdle = anim8.newAnimation(grid(2,1), 1/5)
    monkey.walkingUpAnime = anim8.newAnimation(grid('1-4',2), 1/5)
    monkey.upIdle = anim8.newAnimation(grid(2, 2), 1/5)
    monkey.walkingDownAnime = anim8.newAnimation(grid('1-4',3), 1/5)
    monkey.downIdle = anim8.newAnimation(grid(2, 3), 1/5)

    monkey.originx = frameWidth/2
    monkey.originy = frameHeight

    monkey.screenX, monkey.screenY = posToScreenCoords(monkey.xpos, monkey.ypos, monkey.zpos)

    function monkey:update(dt)
        monkey.screenX, monkey.screenY = posToScreenCoords(monkey.xpos, monkey.ypos, monkey.zpos)

        if love.keyboard.isDown('right') then
            monkey.xpos = monkey.xpos + monkey.speed*dt
            monkey.direction = 'right'
            monkey.walking = true
            monkey.walkingSideAnime:update(dt)
        elseif love.keyboard.isDown('left') then
            monkey.xpos = monkey.xpos - monkey.speed*dt
            monkey.direction = 'left'
            monkey.walking = true
            monkey.walkingSideAnime:update(dt)

        elseif love.keyboard.isDown('down') then
            monkey.zpos = monkey.zpos + monkey.speed*dt
            monkey.direction = 'down'
            monkey.walking = true
            monkey.walkingDownAnime:update(dt)

        elseif love.keyboard.isDown('up') then
            monkey.zpos = monkey.zpos - monkey.speed*dt
            monkey.direction = 'up'
            monkey.walking = true
            monkey.walkingUpAnime:update(dt)
        else
            monkey.walking = false
            if monkey.direction == 'up' then
                monkey.upIdle:update(dt)
            elseif monkey.direction == 'down' then
                monkey.downIdle:update(dt)
            elseif monkey.direction == 'left' then
                monkey.sideIdle:update(dt)
            elseif monkey.direction == 'right' then
                monkey.sideIdle:update(dt)
            end
            
        end
    end

    function monkey:draw()
        if monkey.walking == true then
            if monkey.direction == 'right' then
                monkey.walkingSideAnime:draw(spritesheet, monkey.screenX, monkey.screenY, 0, monkey.scalex, monkey.scaley, monkey.originx, monkey.originy)
            elseif monkey.direction == 'left' then
                monkey.walkingSideAnime:draw(spritesheet, monkey.screenX, monkey.screenY, 0, -monkey.scalex, monkey.scaley, monkey.originx, monkey.originy)
            elseif monkey.direction == 'down' then
                monkey.walkingDownAnime:draw(spritesheet, monkey.screenX, monkey.screenY, 0, monkey.scalex, monkey.scaley, monkey.originx, monkey.originy)
            elseif monkey.direction == 'up' then
                monkey.walkingUpAnime:draw(spritesheet, monkey.screenX, monkey.screenY, 0, monkey.scalex, monkey.scaley, monkey.originx, monkey.originy)
            end
        else
            if monkey.direction == 'up' then
                monkey.upIdle:draw(spritesheet, monkey.screenX, monkey.screenY, 0, monkey.scalex, monkey.scaley, monkey.originx, monkey.originy)
            elseif monkey.direction == 'down' then
                monkey.downIdle:draw(spritesheet, monkey.screenX, monkey.screenY, 0, monkey.scalex, monkey.scaley, monkey.originx, monkey.originy)
            elseif monkey.direction == 'left' then
                monkey.sideIdle:draw(spritesheet, monkey.screenX, monkey.screenY, 0, -monkey.scalex, monkey.scaley, monkey.originx, monkey.originy)
            elseif monkey.direction == 'right' then
                monkey.sideIdle:draw(spritesheet, monkey.screenX, monkey.screenY, 0, monkey.scalex, monkey.scaley, monkey.originx, monkey.originy)
            end
        end

    end

    table.insert(listOfStuff, monkey)
end 






--function zFromY(ypos)
  --  zpos = (600-ypos)/200 + 4
    --return zpos
--end






--HighScore = { {x = 90}, {x= 0}, {x= 11}}

--for key,value in spairs(listOfMonkeys, function(t,a,b) return t[a].zpos > t[b].zpos end) do
    --value.draw()
--end

