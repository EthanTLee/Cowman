require 'funtions'

Thang = Object.extend(Object)

function Thang:new(xpos, ypos, zpos, xthick, ythick, zthick, pathToGraph)
    self.xpos = xpos
    self.ypos = ypos
    self.zpos = zpos
    self.screenX, self.screenY = self:posToScreenCoords()

    self.xthick = xthick
    self.ythick = ythick
    self.zthick = zthick

    self.graph = love.graphics.newImage(pathToGraph)
end

function Thang:update(dt)
    self.lastxpos = self.xpos
    self.lastypos = self.ypos
    self.lastzpos = self.zpos

    self.screenX, self.screenY = self:posToScreenCoords()
end

function Thang:resolveCol(b)
    if self.xpos and self.xthick and b.xpos and b.xthick then
        if self:detectCol(b) then
            if self:checkZAlignment(b) then
                print('zcol')
                if self.zpos < b.zpos then
                    zoverlap = (self.zpos + self.zthick/2) - (b.zpos - b.zthick/2)
                    self.zpos = self.zpos - zoverlap
                else
                    zoverlap = (b.zpos + b.zthick/2 ) - (self.zpos - self.zthick/2)
                    self.zpos = self.zpos + zoverlap
                end
            elseif self:checkXAlignment(b) then
                print('xcol')
                if self.xpos > b.xpos then
                    xoverlap = b.xpos + b.xthick/2 - (self.xpos - self.xthick/2)
                    self.xpos = self.xpos + xoverlap
                else
                    xoverlap = self.xpos + self.xthick/2 - (b.xpos - b.xthick/2)
                    self.xpos = self.xpos - xoverlap
                end
            elseif self:checkYAlignment(b) then
                if self.ypos + self.ythick/2 > b.ypos + b.ypos/2 then
                    yoverlap = b.ypos + b.ythick - self.ypos
                    self.ypos = self.ypos + yoverlap
                else
                    yoverlap = self.ypos + self.ythick - b.ypos
                    self.ypos = self.ypos - yoverlap 
                end
            end
        end
    end
end

function Thang:detectCol(b)
    return self.xpos + self.xthick/2 > b.xpos - b.xthick/2
    and self.xpos - self.xthick/2 < b.xpos + b.xthick/2
    and self.ypos + self.ythick > b.ypos
    and self.ypos < b.ypos + b.ythick
    and self.zpos - self.zthick/2 < b.zpos + b.zthick/2
    and self.zpos + self.zthick/2 > b.zpos - b.zthick/2
end

function Thang:checkXAlignment(b)
    return self.lastypos + self.ythick > b.lastypos
    and self.lastypos < b.lastypos + b.ythick
    and self.lastzpos - self.zthick/2 < b.lastzpos + b.zthick/2
    and self.lastzpos + self.zthick/2 > b.lastzpos - b.zthick/2
end

function Thang:checkYAlignment(b)
    return self.xpos + self.xthick/2 > b.xpos - b.xthick/2
    and self.lastxpos - self.xthick/2 < b.lastxpos + b.xthick/2
    and self.lastzpos - self.zthick/2 < b.lastzpos + b.zthick/2
    and self.lastzpos + self.zthick/2 > b.lastzpos - b.zthick/2
end

function Thang:checkZAlignment(b)
    return self.lastxpos + self.xthick/2 > b.lastxpos - b.xthick/2
    and self.lastxpos - self.xthick/2 < b.lastxpos + b.xthick/2
    and self.lastypos + self.ythick > b.lastypos
    and self.lastypos < b.lastypos + b.ythick
end

function Thang:posToScreenCoords()
    screenX = self.xpos
    screenY = self.zpos + self.ypos
    return screenX, screenY
end
