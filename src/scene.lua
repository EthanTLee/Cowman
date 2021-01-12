require 'lib.spairs'

Scene = Object:extend()

function Scene:new(thangs, musics)
    self.thangs = thangs
    self.musics = musics
end

function Scene:update(dt)
    for key, value in pairs(self.thangs) do
        value:update(dt)
        if key ~= 'pooperJr' then
            resolveCol(self.thangs.pooperJr,self.thangs[key])
        end
    end

end

function Scene:draw() 
    for key, value in spairs(self.thangs, function(t,a,b) return t[a].zpos < t[b].zpos end) do
        value:draw()
    end
end