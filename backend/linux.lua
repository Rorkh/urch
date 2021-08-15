local ffi = require("ffi")

-- sudo apt-get install libxtst-dev
-- sudo apt-get install libx11-dev

local CX = ffi.load("X11.so.6")
local CXT = ffi.load("libXtst.so")

local C = ffi.C

ffi.cdef[[
void free(void *ptr);

typedef unsigned char KeyCode;
typedef unsigned long KeySym;
typedef unsigned long Window;

struct _XDisplay;
typedef struct {
	int width, height;
} Screen;
typedef struct _XDisplay Display;
Display *XOpenDisplay(
	const char*
);
Screen *XDefaultScreenOfDisplay(
	Display*
);
int XWidthOfScreen(
	Screen*
);
int XHeightOfScreen(
	Screen*
);
KeyCode XKeysymToKeycode(
	Display*,
	KeySym
);
int XTestFakeKeyEvent(
	Display *dpy,
	unsigned int keycode,
	int is_press,
	unsigned long delay
);
int XTestFakeButtonEvent(
	Display *display,
	unsigned int button,
	int is_press,
	unsigned long delay 
);
int XTestFakeMotionEvent(
	Display *display,
	int screen_number,
	int x,
	int y,
	unsigned long delay
);
int XTestFakeRelativeMotionEvent(
	Display *display,
	int screen_number,
	int x,
	int y,
	unsigned long delay
);
int XFlush(
	Display*
);
int XWarpPointer(
	Display *display, 
	Window src_w, 
	Window dest_w, 
	int src_x, 
	int src_y, 
	unsigned int src_width, 
	unsigned int src_height, 
	int dest_x, 
	int dest_y
);
int XQueryPointer(
	Display* ,
	Window ,
	Window* ,
	Window* ,
	int* ,
	int* ,
	int* ,
	int* ,
	unsigned int*
);
Window XRootWindow(
	Display* ,
	int
);
int XGetInputFocus(
	Display* ,
	Window* ,
	int*
);
]]

local backend = {}

local sizeof = ffi.sizeof

local function ptr(p)
	return ffi.gc(p, ffi.C.free)
end

local display = ptr(CX.XOpenDisplay(jit.NULL))
local screen = ptr(CX.XDefaultScreenOfDisplay(display))

backend.ScreenWidth = CX.XWidthOfScreen(screen)
backend.ScreenHeight = CX.XHeightOfScreen(screen)

display = nil
screen = nil

-- TODO: Do something with strange XTestFakeKeyEvent behavior
function backend.KeyDown(key)
	local display = ptr(CX.XOpenDisplay(jit.NULL))
	local keycode = CX.XKeysymToKeycode(display, key)
	
	CXT.XTestFakeKeyEvent(display, keycode, true, 0)
	CX.XFlush(display)
end

function backend.KeyUp(key)
	local display = ptr(CX.XOpenDisplay(jit.NULL))
	local keycode = CX.XKeysymToKeycode(display, key)
	
	CXT.XTestFakeKeyEvent(display, keycode, false, 0)
	
	CX.XFlush(display)
end

function backend.KeyPress(key, delay)
	delay = delay or 50
	
	local display = ptr(CX.XOpenDisplay(jit.NULL))
	local keycode = CX.XKeysymToKeycode(display, key)
	
	CXT.XTestFakeKeyEvent(display, keycode, false, 0)
	CXT.XTestFakeKeyEvent(display, keycode, true, delay)
	
	CX.XFlush(display)
end

function backend.IsKeyPressed(key)
	error("IsKeyPressed is not implemented for Linux yet!")
end

function backend.TrapKey(key, callback)
	error("TrapKey is not implemented for Linux yet!")
end

function backend.GetCursorPos()
	error("GetCursorPos is not implemented for Linux yet!")
end

function backend.LeftMouseDown(relative)
	local display = ptr(CX.XOpenDisplay(jit.NULL))
	
	CXT.XTestFakeButtonEvent(display, 1, true, 0)
	
	CX.XFlush(display)
end

function backend.LeftMouseUp(relative)
	local display = ptr(CX.XOpenDisplay(jit.NULL))
	
	CXT.XTestFakeButtonEvent(display, 1, false, 0)
	
	CX.XFlush(display)
end

function backend.RightMouseDown(relative)
	local display = ptr(CX.XOpenDisplay(jit.NULL))
	
	CXT.XTestFakeButtonEvent(display, 3, true, 0)
	
	CX.XFlush(display)
end

function backend.RightMouseUp(relative)
	local display = ptr(CX.XOpenDisplay(jit.NULL))
	
	CXT.XTestFakeButtonEvent(display, 3, false, 0)
	
	CX.XFlush(display)
end

-- TOTHINK: XTestFakeRelativeMotionEvent doesn't work as intended
function backend.MouseMove(x, y, relative)
	local display = ptr(CX.XOpenDisplay(jit.NULL))
	
	CXT.XTestFakeMotionEvent(display, 0, x, y, 0)
	
	CX.XFlush(display)
end

-- TODO: Move out of backend
function backend.LeftMouseClick(x, y, relative)
	backend.MouseMove(x, y, relative)
	backend.LeftMouseDown(relative)
	backend.LeftMouseUp(relative)
end

function backend.RightMouseClick(x, y, relative)
	backend.MouseMove(x, y, relative)
	backend.RightMouseDown(relative)
	backend.RightMouseUp(relative)
end

function backend.MouseWheel(amount)
	error("MouseWheel is not implemented for Linux yet!")
end

return backend
