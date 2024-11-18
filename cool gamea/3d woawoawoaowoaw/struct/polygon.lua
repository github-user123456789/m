Polygon = {}

function Polygon.new()
	return {
		vert = Util.FillWithStructC({}, Vector2, MAX_VERTS), -- fill with Vector2
		vertCnt = 0,
		height = 0,
		curDist = 0,
	}
end

return Polygon