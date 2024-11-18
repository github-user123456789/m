Util = {}

MAX_POLYS = 10
MAX_VERTS = 8

function Util.FillWithStruct(fillTable, struct, amount)
	-- adds [struct] to fillTable [amount] times
	for i = 1, amount do
		fillTable[i] = struct.new() -- create new [struct]
	end
	
	return fillTable
end

function Util.FillWithStructC(fillTable, struct, amount)
	-- same as above but starts from 0
	for i = 0, amount - 1 do
		fillTable[i] = struct.new()
	end
	
	return fillTable
end

return Util