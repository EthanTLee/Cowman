local monkey = {
  gfx = love.graphics.newImage('monkey.png'),
  xpos = 0,
  ypos = 300,
  direction = 'right'
}

function monkey.update(dt)
    if love.keyboard.isDown('right') then
        monkey.xpos = monkey.xpos + 100*dt
        monkey.direction = 'right'
    end
    if love.keyboard.isDown('left') then
        monkey.xpos = monkey.xpos - 100*dt
        monkey.direction = 'left'
    end
end

function monkey.draw()
    if monkey.direction == 'right' then
        love.graphics.draw(monkey.gfx, monkey.xpos, monkey.ypos, 0, 1, 1, 13)
    end
    if monkey.direction == 'left' then
        love.graphics.draw(monkey.gfx, monkey.xpos, monkey.ypos, 0, -1, 1, 13)
    end
end


return monkey

