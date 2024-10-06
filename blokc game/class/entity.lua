local class = {}

function class.new(x, y)
	local entity = {}
	entity.x, entity.y = x or 0, y or 0
	entity.velx, entity.vely = 0, 0
	
	entity.height = 1
	entity.width = 1
	
	entity.debugHitbox = love.graphics.newImage(shared.txtfolder .."block/test.png")
	
	local unique_id = world:generateId()
	function entity:checkCollision()
		local curChunk = world:getChunkAtPos(self.x)
		--print(curChunk.x)
		
		for i,v in next, (curChunk.blocks) do
			if v > 1 then --and v ~= 2 then
				--local realPosition = curChunk:blockToXY(i)
				local realX, realY = curChunk:blockToXY(i)
				-- check floor
				local blockBl, entBl = {realX - blocksize / 2, realY - blocksize / 2}, {entity.x - entity.width / 2, entity.y - entity.height / 2}
				local blockBr, entBr = {realX + blocksize / 2, realY - blocksize / 2}, {entity.x + entity.width / 2, entity.y - entity.height / 2}
				
				local blockTl, entTl = {realX - blocksize / 2, realY + blocksize / 2}, {entity.x - entity.width / 2, entity.y + entity.height / 2}
				local blockTr, entTr = {realX + blocksize / 2, realY + blocksize / 2}, {entity.x + entity.width / 2, entity.y + entity.height / 2}
				
				--if blockBl[1] <= entBl[1] and blockBr[1] >= entBr[1] then
				if math.abs(self.x - realX) < 1 then
					print(self.x, realX, math.abs(self.x - realX))
				--if AABB(blockTl[1], blockTl[2], blocksize, blocksize, entTl[1], entTl[2], entity.width, entity.height) then
					if blockTl[2] >= entBl[2] then
						entity.y = blockTl[2] + entity.height / 2
						--print(v)
						entity.vely = 0
						return "floor"
					end
				end
			end
		end
	end
	
	function entity:step()
		self.vely = self.vely - shared.physics.gravity
		
		self.collisionStatus = self:checkCollision()
		
		self.x = self.x + self.velx
		self.y = self.y + self.vely
	end
	
	function entity:draw()
		render:drawGraphic(self.debugHitbox, self.x, self.y + self.height / 2, 0, nil, blocksize / 2, blocksize / 2)
	end
	
	function entity:remove()
		shared.entities[unique_id] = nil
	end
	
	shared.entities[unique_id] = entity
	return entity
end

return class