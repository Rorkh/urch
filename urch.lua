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

urch.MouseMove = backend.MouseMove

urch.RightMouseDown = backend.RightMouseDown
urch.RightMouseUp = backend.RightMouseUp
urch.RightMouseClick = backend.RightMouseClick

urch.LeftMouseDown = backend.LeftMouseDown
urch.LeftMouseUp = backend.LeftMouseUp
urch.LeftMouseClick = backend.LeftMouseClick

urch.X1MouseDown = backend.X1MouseDown
urch.X1MouseUp = backend.X1MouseUp
urch.X1MouseClick = backend.X1MouseClick

urch.X2MouseDown = backend.X2MouseDown
urch.X2MouseUp = backend.X2MouseUp
urch.X2MouseClick = backend.X2MouseClick

urch.MouseWheel = backend.MouseWheel

urch.MouseDown = urch.LeftMouseDown
urch.MouseUp = urch.LeftMouseUp
urch.MouseClick = urch.LeftMouseClick

return urch
