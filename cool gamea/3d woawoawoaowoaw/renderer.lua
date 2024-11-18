local Renderer = {camera = nil}
screenW, screenH = love.graphics.getDimensions()

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function Renderer:DrawPixel()
	
end

function Renderer:DrawLine(x1, y1, x2, y2)
	love.graphics.line(x1, y1, x2, y2)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function Renderer:SetCamera(camera)
	self.camera = camera
end

function Renderer:SetPolys(polys)
	self.polys = polys
end

function Renderer:Cross2dPoints(x1, y1, x2, y2) -- 2D cross product calculation
	return x1 * y2 - y1 * x2
end

function Renderer:Intersection(x1, y1, x2, y2, x3, y3, x4, y4)
	local p = Vector2.new()
	
	p.x = self:Cross2dPoints(x1, y1, x2, y2)
	p.y = self:Cross2dPoints(x3, y3, x4, y4)
	local det = self:Cross2dPoints(x1 - x2, y1 - y2, x3 - x4, y3 - y4);
	p.x = self:Cross2dPoints(p.x, x1 - x2, p.y, x3 - x4) / det;
    p.y = self:Cross2dPoints(p.x, y1 - y2, p.y, y3 - y4) / det;
	
	return p
end

function Renderer:Render()
	local polygons = self.polys
	local cam = self.camera
	
	for polyIndexLua = 1, MAX_POLYS do
		local polyIndex = polyIndexLua - 1 -- poly array stuff starts at 0
		
		for i = 1, polygons[polyIndex].vertCnt - 1 do
			local p1 = polygons[polyIndex].vert[i - 1]
			local p2 = polygons[polyIndex].vert[i]
			local height = -polygons[polyIndex].height
			
			-- get distances to render
			local distX1 = p1.x - cam.camPos.x
            local distY1 = p1.y - cam.camPos.y
			local z1 = distX1 * math.cos(cam.camAngle) + distY1 * math.sin(cam.camAngle)
			
			local distX2 = p2.x - cam.camPos.x
            local distY2 = p2.y - cam.camPos.y
			local z2 = distX2 * math.cos(cam.camAngle) + distY2 * math.sin(cam.camAngle)
			
			distX1 = distX1 * math.sin(cam.camAngle) - distY1 * math.cos(cam.camAngle)
            distX2 = distX2 * math.sin(cam.camAngle) - distY2 * math.cos(cam.camAngle)
			
			local endDraw = false -- no continue without luau
			if (z1 > 0 or z2 > 0) then
				local i1 = self:Intersection(distX1, z1, distX2, z2,  -0.0001, 0.0001, -20, 5) --Vector2.new()
				local i2 = self:Intersection(distX1, z1, distX2, z2,  0.0001, 0.0001, 20, 5) --Vector2.new()
				
				if z1 <= 0 then
					if i1.y > 0 then
						distX1 = i1.x
						z1 = i1.y
					else
						distX1 = i2.x
						z1 = i2.y
					end
				end
				
				if z2 <= 0 then
					if i1.y > 0 then
						distX1 = i1.x
						z1 = i1.y
					else
						distX1 = i2.x
						z1 = i2.y
					end
				end
			else
				endDraw = true
				print("bye")
			end
			
			if not endDraw then
				local widthRatio = screenW / 2
				local heightRatio = (screenW * screenH) / 60.0
				local centerScreenH = screenH / 2
				local centerScreenW = screenW / 2
				
				-- get the on screen coordinates for line drawing
				local x1 = -distX1 * widthRatio / z1
				local x2 = -distX2 * widthRatio / z2
				local y1a = (height - heightRatio) / z1
				local y1b = heightRatio / z1
				local y2a = (height - heightRatio) / z2
				local y2b = heightRatio / z2
				
				-- draw the lines
				self:DrawLine(centerScreenW + x1, centerScreenH + y1a, centerScreenW + x2, centerScreenH + y2a)
				self:DrawLine(centerScreenW + x1, centerScreenH + y1b, centerScreenW + x2, centerScreenH + y2b)
				self:DrawLine(centerScreenW + x1, centerScreenH + y1a, centerScreenW + x1, centerScreenH + y1b)
				self:DrawLine(centerScreenW + x2, centerScreenH + y2a, centerScreenW + x2, centerScreenH + y2b)
			end
		end
	end
end

return Renderer