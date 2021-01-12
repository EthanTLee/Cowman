require 'monkeyredo'

function love.load()
    listOfMonkeys = {}
    createMonkey()

    listOfTrees = {}
    createTree()
    createTree()
    listOfTrees[1].ypos, listOfTrees[1].xpos = 200, 300
    listOfTrees[2].ypos, listOfTrees[2].xpos = 400, 500
end

function love.update(dt)
    for i,v in ipairs(listOfMonkeys) do
        v:update(dt)
    end
    for i,v in ipairs(listOfTrees) do
        v:update(dt) 
    end
end

function love.draw()
    for i,v in ipairs(listOfMonkeys) do
        v:draw()
    end
    for i,v in ipairs(listOfTrees) do
        v:draw()
    end
end

