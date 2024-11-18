ScreenSpacePoly = {}

function ScreenSpacePoly.new()
	return {
		vert = Util.FillWithStructC({}, Vector2, 2), --{Vector2.new(), Vector2.new(), Vector2.new(), Vector2.new()}, -- a plane has 4 vertices
		distFromCamera = 0,
		planeIdInPoly = 0,
	}
end

return ScreenSpacePoly