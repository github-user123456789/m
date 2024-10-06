local class = {}

function class.new(id, x, y)
	local block = {}
	block.id = id
	block.x, block.y = x or 0, y or 0

	return block
end

return class