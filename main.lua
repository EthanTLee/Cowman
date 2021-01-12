--require 'monkeyredo'
--require 'poop'


function love.load()
    Object = require 'classic'
    anim8 = require 'anim8'
    PinkTreeScene = require 'pinktreescene'
    
end

function love.update(dt)
    pinkTreeScene:update(dt)

end

function love.draw()
    pinkTreeScene:draw()

end

