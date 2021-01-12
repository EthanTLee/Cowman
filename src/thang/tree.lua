Tree = Thang.extend(Thang)

function Tree:new(xpos, ypos, zpos,xrad, yrad, zrad,spriteSheet,spriteSheetLocX, spriteSheetLocY,spriteWidth, spriteHeight) 
    Tree.super.new(self, xpos, ypos, zpos)
    self.spriteSheet = spriteSheet
    self.sprite = love.graphics.newQuad(spriteSheetLocX, spriteSheetLocY, spriteWidth, spriteHeight, spriteSheet:getDimensions())

    self.originX = spriteWidth/2
    self.originY = spriteHeight
    self.scaleX = 1
    self.scaleY = 1
    self.xrad = xrad or spriteWidth
    self.yrad = yrad or spriteHeight
    self.zrad = zrad

end

function Tree:update(dt)
    Tree.super.update(self,dt)
end

function Tree:draw()
    love.graphics.draw(self.spriteSheet, self.sprite, self.screenX, self.screenY, 0, self.scaleX, self.scaleY, self.originX, self.originY)
end

function Tree:detectCol(e)
    print(e.xrad)
    return self.xpos + self.xrad/2 > e.xpos - e.xrad/2
    and self.xpos - self.xrad/2 < e.xpos + e.xrad/2
    and self.ypos + self.yrad > e.ypos
    and self.ypos < e.ypos + e.yrad
    and self.zpos - self.zrad/2 < e.zpos + e.zrad/2
    and self.zpos + self.zrad/2 > e.zpos - e.zrad/2
end

--function createPoop(xpos, ypos, zpos, gfx) --if anime, gfx should be {spritesheet, frameWidth, frameHeight, frameRangeY, frameRangeX, T}
    --local poop = {
      --xpos = xpos,
      --ypos = ypos,
      --zpos = zpos,
      --gfx = gfx,
      --scalex = 1,
      --scaley = 1
    --}
    --if type(gfx) == 'string' then
        --poop.gfx = love.graphics.newImage(gfx)
        --poop.originx = poop.gfx:getWidth()/2
        --poop.originy = poop.gfx:getHeight()
        
    --elseif type(gfx)=='table' then
--        poop.originx = gfx.frameWidth/2
--        poop.originy = gfx.frameHeight
--    end
--
--    poop.screenX, poop.screenY = posToScreenCoords(poop.xpos, poop.ypos, poop.zpos)
--
--    function poop:update(dt)
--        poop.screenX, poop.screenY = posToScreenCoords(poop.xpos, poop.ypos, poop.zpos)
--    end
--
--    function poop:draw()
--        love.graphics.draw(poop.gfx, poop.screenX, poop.screenY, 0, poop.scalex, poop.scaley, poop.originx, poop.originy)
--    end
--
--    table.insert(listOfStuff, poop)
--end