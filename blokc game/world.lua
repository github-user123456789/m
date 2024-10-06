local world = {}

world.chunkwidth = 16
world.chunkheight = 16
world.chunks = {}

function world:getChunkAtPos(x)
	x = math.floor(x / self.chunkwidth)
	if self.chunks[x] then
		return self.chunks[x]
	else
		local new = chunk.new(x)
		self.chunks[x] = new
		self:generate(new)
		return new
	end
end

function world:generate(this)
	for y = 0, self.chunkheight do
		for x = 1, self.chunkwidth do
			--this:addBlock(x, y, math.random(2, 3))
			
			--height = love.math.noise((x + (this.x * self.chunkwidth)) / 6, shared.yseed * (x + this.x * self.chunkwidth), shared.seed) * 5 + 3
			height = love.math.noise((x + (this.x * self.chunkwidth)) / 11, shared.seed) * 5 + 3
			--height = x % 7 > 0 and world.chunkheight or -5
			--this:addBlock(x, y, y > height and 2 or 1)
			
			if y >= height then
				if not this.blocks[this:xyToBlock(x, y - 1)] then
					this:addBlock(x, y, 3)
				else
					this:addBlock(x, y, 2)
				end
			else
				this:addBlock(x, y, 1)
			end
		end
	end
end

function world:generateId()
	local a = tostring(math.random())
	for i = 1,33 do
		a = a ..string.char(math.random(133, 176))
	end
	return a
end

return world