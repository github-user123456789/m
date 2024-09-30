--shared = {}

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

-- Habibi
render = require("render")
world = require("world")

function love.draw()
	--print("skibodyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy")
	love.graphics.setBackgroundColor(.6, .7, 1)
	
	screenwidth, screenheight = love.graphics.getDimensions()
	render:renderChunks()
	--render:testInfChunk()
	
	camera.x = camera.x + .2
	camera.y = math.sin(camera.x / 6) * .6
end










--require("test")

--print(shared.a)