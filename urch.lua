local ffi = require("ffi")
local isWindows = ffi.os == "Windows"

local backend = isWindows and require("backend.windows") or require("backend.linux")

local urch = {key = isWindows and require("keys.windows") or require("keys.linux")}

urch.ScreenWidth = backend.ScreenWidth
urch.ScreenHeight = backend.ScreenHeight

urch.KeyDown = backend.KeyDown
urch.KeyUp = backend.KeyUp
urch.KeyPress = backend.KeyPress

urch.IsKeyPressed = backend.IsKeyPressed
urch.TrapKey = backend.TrapKey

urch.GetCursorPos = backend.GetCursorPos

urch.MouseDown = backend.MouseDown
urch.MouseUp = backend.MouseUp
urch.MouseMove = backend.MouseMove
urch.MouseClick = backend.MouseClick

return urch
