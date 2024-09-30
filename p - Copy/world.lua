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
		for x = 0, self.chunkwidth do
			--this:addBlock(x, y, math.random(2, 3))
			
			height = love.math.noise((x + (this.x * self.chunkwidth)) / 15, shared.seed) * 5 + 4
			--this:addBlock(x, y, y > height and 2 or 1)
			
			if y > height then
				if not this.blocks[this:xyToBlock(x, y - 1)] then
					this:addBlock(x, y, 3)
				else
					this:addBlock(x, y, 2)
				end
			end
		end
	end
end

return world