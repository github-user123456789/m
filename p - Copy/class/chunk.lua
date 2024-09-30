local class = {}

function class.new(x)
	local chunk = {}
	chunk.x = x
	chunk.blocks = {}
	
	function chunk:xyToBlock(x, y)
		--return (x + math.floor(y / world.chunkwidth)) + 1
		return x + (y * world.chunkwidth) + 1
	end
	
	function chunk:blockToXY(index)
		index = index - 2
		return index % world.chunkwidth, math.floor(index / world.chunkwidth)
	end
	
	function chunk:addBlock(x, y, id)
		chunk.blocks[self:xyToBlock(x, y)] = id
	end
	
	function chunk:draw()
		--print("leviathans are coming")
		for i,v in next, (self.blocks) do
			if v > 1 then
				-- TODO draw in block class
				print(x, y)
				
				local x, y = self:blockToXY(i)
				render:drawGraphic(blocks[v].sprite, x + chunk.x * world.chunkwidth, -y + world.chunkheight / 2, 0, nil, blocksize / 2, blocksize / 2)
			end
		end
	end
	
	return chunk
end

return class