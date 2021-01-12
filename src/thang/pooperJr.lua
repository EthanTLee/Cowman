PooperJr = Thang:extend()



function PooperJr:new(xpos,ypos,zpos,direction)
    self.xthick = 69
    self.ythick = 123
    self.zthick = 40
    self.pathToGraph = 'res/pooperJr/pooperJr.png'

    PooperJr.super.new(self, xpos, ypos, zpos, self.xthick, self.ythick, self.zthick, self.pathToGraph)
    
    self.frameWidth = 69
    self.frameHeight = 123
    self.grid = anim8.newGrid(self.frameWidth, self.frameHeight, self.spriteSheet:getWidth(), self.spriteSheet:getHeight(),self.spriteSheetLocX, self.spriteSheetLocY,2)
    self.myAnimeList = {
        walkingSide = anim8.newAnimation(self.grid('1-4',1), 1/5),
        sideIdle = anim8.newAnimation(self.grid(2,1), 1/5),
        walkingUp = anim8.newAnimation(self.grid('1-4',2), 1/5),
        upIdle = anim8.newAnimation(self.grid(2, 2), 1/5),
        walkingDown = anim8.newAnimation(self.grid('1-4',3), 1/5),
        downIdle = anim8.newAnimation(self.grid(2, 3), 1/5)
    }

    self.originX = self.frameWidth/2
    self.originY = self.frameHeight
    self.direction = direction

end

function PooperJr:update(dt)
    PooperJr.super.update(self, dt)

    if love.keyboard.isDown('right') then
        self.xpos = self.xpos + self.speed*dt
        self.direction = 'right'
        self.walking = true
        self.myAnimeList.walkingSide:update(dt)
    elseif love.keyboard.isDown('left') then
        self.xpos = self.xpos - self.speed*dt
        self.direction = 'left'
        self.walking = true
        self.myAnimeList.walkingSide:update(dt)

    elseif love.keyboard.isDown('down') then
        self.zpos = self.zpos + self.speed*dt
        self.direction = 'down'
        self.walking = true
        self.myAnimeList.walkingDown:update(dt)

    elseif love.keyboard.isDown('up') then
        self.zpos = self.zpos - self.speed*dt
        self.direction = 'up'
        self.walking = true
        self.myAnimeList.walkingUp:update(dt)
    else
        self.walking = false
        if self.direction == 'up' then
            self.myAnimeList.upIdle:update(dt)
        elseif self.direction == 'down' then
            self.myAnimeList.downIdle:update(dt)
        elseif self.direction == 'left' then
            self.myAnimeList.sideIdle:update(dt)
        elseif self.direction == 'right' then
            self.myAnimeList.sideIdle:update(dt)
        end
    end

end

function PooperJr:draw()
    if self.walking == true then
        if self.direction == 'right' then
            self.myAnimeList.walkingSide:draw(self.spriteSheet, self.screenX, self.screenY, 0, self.scalex, self.scaley, self.originX, self.originY)
        elseif self.direction == 'left' then
            self.myAnimeList.walkingSide:draw(self.spriteSheet, self.screenX, self.screenY, 0, -self.scalex, self.scaley, self.originX, self.originY)
        elseif self.direction == 'down' then
            self.myAnimeList.walkingDown:draw(self.spriteSheet, self.screenX, self.screenY, 0, self.scalex, self.scaley, self.originX, self.originY)
        elseif self.direction == 'up' then
            self.myAnimeList.walkingUp:draw(self.spriteSheet, self.screenX, self.screenY, 0, self.scalex, self.scaley, self.originX, self.originY)
        end
    else
        if self.direction == 'up' then
            self.myAnimeList.upIdle:draw(self.spriteSheet, self.screenX, self.screenY, 0, self.scalex, self.scaley, self.originX, self.originY)
        elseif self.direction == 'down' then
            self.myAnimeList.downIdle:draw(self.spriteSheet, self.screenX, self.screenY, 0, self.scalex, self.scaley, self.originX, self.originY)
        elseif self.direction == 'left' then
            self.myAnimeList.sideIdle:draw(self.spriteSheet, self.screenX, self.screenY, 0, -self.scalex, self.scaley, self.originX, self.originY)
        elseif self.direction == 'right' then
            self.myAnimeList.sideIdle:draw(self.spriteSheet, self.screenX, self.screenY, 0, self.scalex, self.scaley, self.originX, self.originY)
        end
    end
end

