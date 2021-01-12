require 'thang'
require 'tree'
require 'person'
require 'pooperJr'
require 'scene'
require 'bigstuff'

Coords = require 'looks/coords'

local atlasBigStuff = love.graphics.newImage('looks/atlasBigStuff.png')
local atlasFog = love.graphics.newImage('looks/atlasFog.png')
local atlasTree = love.graphics.newImage('looks/atlasTree.png')
local dudeYa = love.graphics.newImage('looks/dudeYa.png')

local thangs = {
    sky = BigStuff(0,0,-9999, atlasBigStuff, Coords.atlasBigStuff.sky.x, Coords.atlasBigStuff.sky.y,Coords.atlasBigStuff.sky.width, Coords.atlasBigStuff.sky.height),
    ground = BigStuff(0,0, -9998,atlasBigStuff, Coords.atlasBigStuff.ground.x,Coords.atlasBigStuff.ground.y, Coords.atlasBigStuff.ground.width, Coords.atlasBigStuff.ground.height),
    mistCover = BigStuff(0,0, 100, atlasBigStuff, Coords.atlasBigStuff.mistCover.x,Coords.atlasBigStuff.mistCover.y,Coords.atlasBigStuff.mistCover.width,Coords.atlasBigStuff.mistCover.height),
    pooperJr = PooperJr(300,0,-300, 40, 100, 30, 'right', 100, dudeYa,Coords.dude.dudeYa.x,Coords.dude.dudeYa.y),
    tree5 = Tree(500,0,-100, nil,nil,50, atlasTree,Coords.atlasTrees.tree5.x,Coords.atlasTrees.tree5.y,Coords.atlasTrees.tree5.width,Coords.atlasTrees.tree5.height),
    tree = Tree(200, 0,-300, nil,nil, 50, atlasTree,Coords.atlasTrees.tree.x,Coords.atlasTrees.tree.y,Coords.atlasTrees.tree.width,Coords.atlasTrees.tree.height)

}

local musics = {
    music1 = 'music'
}

pinkTreeScene = Scene(thangs, musics)