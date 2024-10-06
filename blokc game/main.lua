--shared = {}
screenwidth, screenheight = love.graphics.getDimensions()

-- ☺
shared = require("shared")
blocks = require("blocks")
for i,v in ipairs(blocks) do
	if v.t then
		v.sprite = love.graphics.newImage(shared.txtfolder ..v.t)
		v.sprite:setFilter("nearest")
	end
end

-- class
block = require("class/block")
chunk = require("class/chunk")
entity = require("class/entity")

-- Habibi
render = require("render")
world = require("world")

-- I... Am Steve.            jak blak
player = entity.new(-100, 0)
player.velx = .2

function love.update()
	player:step()
	
	camera.x = player.x
	camera.y = player.y
	
	--print(player.y, player.collisionStatus)
end

function love.draw()
	love.graphics.setBackgroundColor(.6, .7, 1)
	
	screenwidth, screenheight = love.graphics.getDimensions()
	render:renderChunks()
	player:draw()
	--render:testCamera()
end

-- todo rep;ace
function love.keypressed(key)
	player.velx = 0
    if key == "w" then
        player.vely = .2
    elseif key == "s" then
        player.vely = -.2
    elseif key == "a" then
        player.velx = -.1
    elseif key == "d" then
        player.velx = .1
    end
end






--require("test")

--print(shared.a)