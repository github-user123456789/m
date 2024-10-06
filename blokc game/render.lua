local render = {}
camera = {x = 0, y = 0, renderdist = 4}

blocksize = 16
scale = 2

function render:drawGraphic(sprite, x, y, rotate, myscale, anchorx, anchory)
	rotate = rotate or 0
	myscale = myscale or scale
	anchorx = anchorx or 0
	anchory = anchory or 0
	
	love.graphics.draw(sprite, (x - camera.x) * blocksize * scale + screenwidth / 2, -(y - camera.y) * blocksize * scale + screenheight / 2, rotate, myscale, myscale, anchorx, anchory)
	--love.graphics.draw(sprite, x - camera.x, y - camera.y, rotate, myscale, myscale, anchorx, anchory)
end

function render:renderChunks()
	local step = world.chunkwidth
	for xd = 1, camera.renderdist do
		local i = xd + 1
		local chk = world:getChunkAtPos((camera.x - step * camera.renderdist) + step * i)
		chk:draw()
	end
end

-- test

function render:testBlock()
	if not ok then
		ok = block.new(2)
		ok.x = 5
		ok.y = 22
	end
	
	self:drawGraphic(blocks[ok.id].sprite, ok.x, ok.y, 0, nil, blocksize / 2, blocksize / 2)
end

function render:testChunk()
	if not ok then
		ok = chunk.new(0)
		world:generate(ok)
	end
	
	ok:draw()
end

function render:testInfChunk()
	local chk = world:getChunkAtPos(camera.x)
	chk:draw()
end

function render:testCamera()
	--camera.x = camera.x + .2
	camera.y = math.sin(camera.x / 6) * .6
end

return render