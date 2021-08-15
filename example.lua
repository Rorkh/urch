local urch = require("urch")

--[[urch.KeyDown(urch.key.LSHIFT)
urch.KeyDown(urch.key.H)
urch.KeyUp(urch.key.H)
urch.KeyUp(urch.key.LSHIFT)

urch.KeyDown(urch.key.E)
urch.KeyDown(urch.key.L)
urch.KeyDown(urch.key.L)
urch.KeyDown(urch.key.O)

urch.KeyDown(urch.key.SPACE)

urch.KeyDown(urch.key.W)
urch.KeyDown(urch.key.O)
urch.KeyDown(urch.key.R)
urch.KeyDown(urch.key.L)
urch.KeyDown(urch.key.D)

urch.MouseMove(100, 0, true)

urch.KeyDown(urch.key.LSHIFT)
urch.KeyDown(urch.key[1])
urch.KeyUp(urch.key[1])
urch.KeyUp(urch.key.LSHIFT)

local x, y = urch.GetCursorPos()
print(x, y)--]]

urch.TrapKey(urch.key.Q, function()
	urch.MouseWheel(-100)
end)