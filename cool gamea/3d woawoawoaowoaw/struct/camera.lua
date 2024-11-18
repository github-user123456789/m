Camera = {}

function Camera.new()
	return {
		camAngle = 0,
		stepWave = 0,
		
		camPos = Vector2.new(),
		oldCamPos = Vector2.new(),
	}
end

return Camera