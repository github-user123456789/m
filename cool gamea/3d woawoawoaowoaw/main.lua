Util = require("util")
-- structs
require("struct/vector2")
require("struct/lineseg")
require("struct/polygon")
require("struct/screenspacepoly")
require("struct/camera")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Renderer = require("renderer")

cam = Camera.new()
polys = Util.FillWithStructC({}, Polygon, MAX_POLYS)

function Init()
	Renderer:SetCamera(cam)
	Renderer:SetPolys(polys)
	
	print("loading test map")
	cam.camAngle = 0.42;
    cam.camPos.x = 451.96;
    cam.camPos.y = 209.24;

    polys[0].vert[0].x = 141.00;

    polys[0].vert[0].y = 84.00;

    polys[0].vert[1].x = 496.00;

    polys[0].vert[1].y = 81.00;

    polys[0].vert[2].x = 553.00;

    polys[0].vert[2].y = 136.00;

    polys[0].vert[3].x = 135.00;

    polys[0].vert[3].y = 132.00;

    polys[0].vert[4].x = 141.00;

    polys[0].vert[4].y = 84.00;

    polys[0].height = 50000;

    polys[0].vertCnt = 5;

    polys[1].vert[0].x = 133.00;

    polys[1].vert[0].y = 441.00;

    polys[1].vert[1].x = 576.00;

    polys[1].vert[1].y = 438.00;

    polys[1].vert[2].x = 519.00;

    polys[1].vert[2].y = 493.00;

    polys[1].vert[3].x = 123.00;

    polys[1].vert[3].y = 497.00;

    polys[1].vert[4].x = 133.00;

    polys[1].vert[4].y = 441.00;

    polys[1].height = 50000;

    polys[1].vertCnt = 5;

    polys[2].vert[0].x = 691.00;

    polys[2].vert[0].y = 165.00;

    polys[2].vert[1].x = 736.00;

    polys[2].vert[1].y = 183.00;

    polys[2].vert[2].x = 737.00;

    polys[2].vert[2].y = 229.00;

    polys[2].vert[3].x = 697.00;

    polys[2].vert[3].y = 247.00;

    polys[2].vert[4].x = 656.00;

    polys[2].vert[4].y = 222.00;

    polys[2].vert[5].x = 653.00;

    polys[2].vert[5].y = 183.00;

    polys[2].vert[6].x = 691.00;

    polys[2].vert[6].y = 165.00;

    polys[2].height = 10000;

    polys[2].vertCnt = 7;

    polys[3].vert[0].x = 698.00;

    polys[3].vert[0].y = 330.00;

    polys[3].vert[1].x = 741.00;

    polys[3].vert[1].y = 350.00;

    polys[3].vert[2].x = 740.00;

    polys[3].vert[2].y = 392.00;

    polys[3].vert[3].x = 699.00;

    polys[3].vert[3].y = 414.00;

    polys[3].vert[4].x = 654.00;

    polys[3].vert[4].y = 384.00;

    polys[3].vert[5].x = 652.00;

    polys[3].vert[5].y = 348.00;

    polys[3].vert[6].x = 698.00;

    polys[3].vert[6].y = 330.00;

    polys[3].height = 10000;

    polys[3].vertCnt = 7;

    polys[4].vert[0].x = 419.00;

    polys[4].vert[0].y = 311.00;

    polys[4].vert[1].x = 461.00;

    polys[4].vert[1].y = 311.00;

    polys[4].vert[2].x = 404.00;

    polys[4].vert[2].y = 397.00;

    polys[4].vert[3].x = 346.00;

    polys[4].vert[3].y = 395.00;

    polys[4].vert[4].x = 348.00;

    polys[4].vert[4].y = 337.00;

    polys[4].vert[5].x = 419.00;

    polys[4].vert[5].y = 311.00;

    polys[4].height = 50000;

    polys[4].vertCnt = 6;

    polys[5].vert[0].x = 897.00;

    polys[5].vert[0].y = 98.00;

    polys[5].vert[1].x = 1079.00;

    polys[5].vert[1].y = 294.00;

    polys[5].vert[2].x = 1028.00;

    polys[5].vert[2].y = 297.00;

    polys[5].vert[3].x = 851.00;

    polys[5].vert[3].y = 96.00;

    polys[5].vert[4].x = 897.00;

    polys[5].vert[4].y = 98.00;

    polys[5].height = 10000;

    polys[5].vertCnt = 5;

    polys[6].vert[0].x = 1025.00;

    polys[6].vert[0].y = 294.00;

    polys[6].vert[1].x = 1080.00;

    polys[6].vert[1].y = 292.00;

    polys[6].vert[2].x = 1149.00;

    polys[6].vert[2].y = 485.00;

    polys[6].vert[3].x = 1072.00;

    polys[6].vert[3].y = 485.00;

    polys[6].vert[4].x = 1025.00;

    polys[6].vert[4].y = 294.00;

    polys[6].height = 1000;

    polys[6].vertCnt = 5;

    polys[7].vert[0].x = 1070.00;

    polys[7].vert[0].y = 483.00;

    polys[7].vert[1].x = 1148.00;

    polys[7].vert[1].y = 484.00;

    polys[7].vert[2].x = 913.00;

    polys[7].vert[2].y = 717.00;

    polys[7].vert[3].x = 847.00;

    polys[7].vert[3].y = 718.00;

    polys[7].vert[4].x = 1070.00;

    polys[7].vert[4].y = 483.00;

    polys[7].height = 1000;

    polys[7].vertCnt = 5;

    polys[8].vert[0].x = 690.00;

    polys[8].vert[0].y = 658.00;

    polys[8].vert[1].x = 807.00;

    polys[8].vert[1].y = 789.00;

    polys[8].vert[2].x = 564.00;

    polys[8].vert[2].y = 789.00;

    polys[8].vert[3].x = 690.00;

    polys[8].vert[3].y = 658.00;

    polys[8].height = 10000;

    polys[8].vertCnt = 4;

    polys[9].vert[0].x = 1306.00;

    polys[9].vert[0].y = 598.00;

    polys[9].vert[1].x = 1366.00;

    polys[9].vert[1].y = 624.00;

    polys[9].vert[2].x = 1369.00;

    polys[9].vert[2].y = 678.00;

    polys[9].vert[3].x = 1306.00;

    polys[9].vert[3].y = 713.00;

    polys[9].vert[4].x = 1245.00;

    polys[9].vert[4].y = 673.00;

    polys[9].vert[5].x = 1242.00;

    polys[9].vert[5].y = 623.00;

    polys[9].vert[6].x = 1306.00;

    polys[9].vert[6].y = 598.00;

    polys[9].height = 50000;

    polys[9].vertCnt = 7;
end; Init()

function love.update()
	
end

function love.draw()
	--love.graphics.setBackgroundColor(.5, .6, 1)
	cam.camAngle = cam.camAngle + .001
	Renderer:Render()
end