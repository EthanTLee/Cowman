Person = Thang:extend()

function Person:new(xpos, ypos, zpos, xthick, ythick, zthick, pathToGraph)
    Person.super.new(self, xpos,ypos,zpos, xthick, ythick, zthick, pathToGraph)

end

function Person:update(dt)
    Person.super.update(self,dt)
end