BigStuff = Object.extend(Object)

function BigStuff:new(screenX, screenY, zpos, spriteSheet, spriteSheetLocX, spriteSheetLocY, spriteWidth, spriteHeight)
    self.screenX = screenX
    self.screenY = screenY
    self.zpos = zpos
    self.spriteSheet = spriteSheet
    self.quad = love.graphics.newQuad(spriteSheetLocX, spriteSheetLocY, spriteWidth, spriteHeight, self.spriteSheet:getDimensions())

end 

function BigStuff:draw()
    love.graphics.draw(self.spriteSheet, self.quad, self.screenX, self.screenY) 
end

function BigStuff:update(dt)
end