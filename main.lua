require "input"

function love.load()
	global = {}
	global.x = 384
	global.y = 284
	global.w = 32
	global.h = 32
	
	input = Input()
	
	-- Set Keyboard Controls
	input:addButton("keyboard",	"press",	"escape",	function() love.event.push("quit") end)
	input:removeButton("keyboard","press",	"escape")
	
	input:addButton("keyboard",	"press",	"up",		function() global.y = global.y - 100 end)
	input:addButton("keyboard",	"press",	"down",		function() global.y = global.y + 100 end)
	input:addButton("keyboard",	"press",	"left",		function() global.x = global.x - 100 end)
	input:addButton("keyboard",	"press",	"right",	function() global.x = global.x + 100 end)
	
	input:addButton("keyboard",	"release",	"up",		function() global.y = global.y + 100 end)
	input:addButton("keyboard",	"release",	"down",		function() global.y = global.y - 100 end)
	input:addButton("keyboard",	"release",	"left",		function() global.x = global.x + 100 end)
	input:addButton("keyboard",	"release",	"right",	function() global.x = global.x - 100 end)
	
	-- Set Mouse Controls
	input:addButton("mouse",	"press",	"wu",		function() global.y = global.y - 100 end)
	input:addButton("mouse",	"press",	"wd",		function() global.y = global.y + 100 end)
	input:addButton("mouse",	"press",	"l",		function() global.x = global.x - 100 end)
	input:addButton("mouse",	"press",	"r",		function() global.x = global.x + 100 end)
	input:addButton("mouse",	"press",	"x1",		function() global.x = 0 end)
	input:addButton("mouse",	"press",	"x2",		function() global.y = 0 end)
	
	input:addButton("mouse",	"release",	"l",		function() global.x = global.x + 100 end)
	input:addButton("mouse",	"release",	"r",		function() global.x = global.x - 100 end)
	
	-- Set Joystick Controls
	input:addButton("joystick",	"press",	1,			function() global.y = global.y - 100 end, 1)
	input:addButton("joystick",	"press",	3,			function() global.y = global.y + 100 end, 1)
	input:addButton("joystick",	"press",	4,			function() global.x = global.x - 100 end, 1)
	input:addButton("joystick",	"press",	2,			function() global.x = global.x + 100 end, 1)
	
	input:addButton("joystick",	"release",	1,			function() global.y = global.y + 100 end, 1)
	input:addButton("joystick",	"release",	3,			function() global.y = global.y - 100 end, 1)
	input:addButton("joystick",	"release",	4,			function() global.x = global.x + 100 end, 1)
	input:addButton("joystick",	"release",	2,			function() global.x = global.x - 100 end, 1)
	
	input:addButton("joystick",	"hold",		5,			function() global.w = global.w + 1 global.h = global.h - 1 end, 1)
	input:addButton("joystick",	"hold",		6,			function() global.w = global.w - 1 global.h = global.h + 1 end, 1)
	
	input:addHat(1, 1, "c",		function(dt)global.w = 0 global.h = 0 end)
	input:removeHat(1, 1, "c")
	
	input:addHat(1, 1, "u",		function(dt) global.y = global.y - (60 * dt) end)
	input:addHat(1, 1, "d",		function(dt) global.y = global.y + (60 * dt) end)
	input:addHat(1, 1, "l",		function(dt) global.x = global.x - (60 * dt) end)
	input:addHat(1, 1, "r",		function(dt) global.x = global.x + (60 * dt) end)
	input:addHat(1, 1, "lu",	function(dt) global.x = global.x - (60 * dt) global.y = global.y - (60 * dt) end)
	input:addHat(1, 1, "ru",	function(dt) global.x = global.x + (60 * dt) global.y = global.y - (60 * dt) end)
	input:addHat(1, 1, "ld",	function(dt) global.x = global.x - (60 * dt) global.y = global.y + (60 * dt) end)
	input:addHat(1, 1, "rd",	function(dt) global.x = global.x + (60 * dt) global.y = global.y + (60 * dt) end)
	
	input:addAxis(1, 1, function(v, dt) global.x = 300 * v global.y = 200 * dt end)
	input:removeAxis(1, 1)
	
	input:addAxis(1, 1, function(v, dt) global.x = global.x + (60 * dt * v) end)
	input:addAxis(1, 2, function(v, dt) global.y = global.y + (60 * dt * v) end)
	input:addAxis(1, 3, function(v, dt) global.w = global.w + (60 * dt * v) end)
	input:addAxis(1, 4, function(v, dt) global.h = global.h + (60 * dt * v) end)
end

function love.keypressed(key, unicode)
	input:keypressed(key, unicode)
end

function love.keyreleased(key, unicode)
	input:keyreleased(key, unicode)
end

function love.mousepressed(x, y, button)
	input:mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	input:mousereleased(x, y, button)
end

function love.joystickpressed(joystick, button)
	input:joystickpressed(joystick, button)
end

function love.joystickreleased(joystick, button)
	input:joystickreleased(joystick, button)
end

function love.update(dt)
	input:update(dt)
end

function love.draw()
	love.graphics.rectangle("fill", global.x, global.y, global.w, global.h)
end