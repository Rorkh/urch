local ffi = require("ffi")
local bit = require("bit")

local C = ffi.C

if ffi.abi'64bit' then
	ffi.cdef[[
		typedef int32_t  __int1632;
		typedef int64_t  __int3264;
		typedef uint32_t __uint1632;
		typedef uint64_t __uint3264;
	]]
else
	ffi.cdef[[
		typedef int16_t  __int1632;
		typedef int32_t  __int3264;
		typedef uint16_t __uint1632;
		typedef uint32_t __uint3264;
	]]
end

ffi.cdef[[
// defining this for compat. with terra which doesn't grok `unsigned __int64`
typedef uint64_t        __uint64;

typedef size_t          rsize_t;
typedef unsigned short  wctype_t;
typedef int             errno_t;
typedef long            __time32_t;
typedef __int64         __time64_t;

typedef unsigned long   ULONG;
typedef ULONG           *PULONG;
typedef unsigned short  USHORT;
typedef USHORT          *PUSHORT;
typedef unsigned char   UCHAR;
typedef UCHAR           *PUCHAR;
typedef char            *PSZ;
typedef unsigned long   DWORD;
typedef int             BOOL;
typedef unsigned char   BYTE;
typedef unsigned short  WORD;
typedef float           FLOAT;
typedef double          DOUBLE;
typedef FLOAT           *PFLOAT;
typedef BOOL            *PBOOL;
typedef BOOL            *LPBOOL;
typedef BYTE            *PBYTE;
typedef BYTE            *LPBYTE;
typedef int             *PINT;
typedef int             *LPINT;
typedef WORD            *PWORD;
typedef WORD            *LPWORD;
typedef long            *LPLONG;
typedef DWORD           *PDWORD;
typedef DWORD           *LPDWORD;
typedef void            VOID;
typedef VOID            *LPVOID;
typedef const VOID      *LPCVOID;
typedef int             INT;
typedef unsigned int    UINT;
typedef unsigned int    *PUINT;
typedef unsigned long   POINTER_64_INT;
typedef signed char     INT8, *PINT8;
typedef signed short    INT16, *PINT16;
typedef signed int      INT32, *PINT32;
typedef __int64         INT64, *PINT64;
typedef unsigned char   UINT8, *PUINT8;
typedef unsigned short  UINT16, *PUINT16;
typedef unsigned int    UINT32, *PUINT32;
typedef __uint64        UINT64, *PUINT64;
typedef signed int      LONG32, *PLONG32;
typedef unsigned int    ULONG32, *PULONG32;
typedef unsigned int    DWORD32, *PDWORD32;
typedef __int3264  INT_PTR, *PINT_PTR;
typedef __uint3264 UINT_PTR, *PUINT_PTR;
typedef __int3264  LONG_PTR, *PLONG_PTR;
typedef __uint3264 ULONG_PTR, *PULONG_PTR;
typedef __int1632  HALF_PTR, *PHALF_PTR;
typedef __uint1632 UHALF_PTR, *PUHALF_PTR;
typedef __int3264  SHANDLE_PTR;
typedef __uint3264 HANDLE_PTR;
typedef ULONG_PTR       SIZE_T, *PSIZE_T;
typedef LONG_PTR        SSIZE_T, *PSSIZE_T;
typedef ULONG_PTR       DWORD_PTR, *PDWORD_PTR;
typedef __int64         LONG64, *PLONG64;
typedef __uint64        ULONG64, *PULONG64;
typedef __uint64        DWORD64, *PDWORD64;
typedef VOID            *PVOID;
// typedef VOID* __ptr64   PVOID64; // disabled for compat with terra (not used anyway).
typedef char            CHAR;
typedef short           SHORT;
typedef long            LONG;
typedef int             INT;
typedef wchar_t         WCHAR;
typedef WCHAR           *PWCHAR, *LPWCH, *PWCH;
typedef const WCHAR     *LPCWCH, *PCWCH;
typedef WCHAR           *NWPSTR, *LPWSTR, *PWSTR;
typedef PWSTR           *PZPWSTR;
typedef const PWSTR     *PCZPWSTR;
typedef WCHAR           *LPUWSTR, *PUWSTR;
typedef const WCHAR     *LPCWSTR, *PCWSTR;
typedef PCWSTR          *PZPCWSTR;
typedef const WCHAR     *LPCUWSTR, *PCUWSTR;
typedef CHAR            *PCHAR, *LPCH, *PCH;
typedef const CHAR      *LPCCH, *PCCH;
typedef CHAR            *NPSTR, *LPSTR, *PSTR;
typedef PSTR            *PZPSTR;
typedef const PSTR      *PCZPSTR;
typedef const CHAR      *LPCSTR, *PCSTR;
typedef PCSTR           *PZPCSTR;
typedef char            TCHAR, *PTCHAR;
typedef unsigned char   TBYTE, *PTBYTE;
typedef LPCH            LPTCH, PTCH;
typedef LPSTR           PTSTR, LPTSTR, PUTSTR, LPUTSTR;
typedef LPCSTR          PCTSTR, LPCTSTR, PCUTSTR, LPCUTSTR;
typedef SHORT           *PSHORT;
typedef LONG            *PLONG;
typedef VOID            *HANDLE;
typedef HANDLE          *PHANDLE;
typedef BYTE            FCHAR;
typedef WORD            FSHORT;
typedef DWORD           FLONG;
typedef long            HRESULT;
typedef char            CCHAR;
typedef DWORD           LCID;
typedef PDWORD          PLCID;
typedef WORD            LANGID;
typedef __int64         LONGLONG;
typedef __uint64        ULONGLONG;
typedef LONGLONG        *PLONGLONG;
typedef ULONGLONG       *PULONGLONG;
typedef LONGLONG        USN;

typedef union _LARGE_INTEGER {
	struct {
		DWORD LowPart;
		LONG HighPart;
	};
	struct {
		DWORD LowPart;
		LONG HighPart;
	} u;
	LONGLONG QuadPart;
} LARGE_INTEGER;
typedef LARGE_INTEGER *PLARGE_INTEGER;
typedef union _ULARGE_INTEGER {
	struct {
		DWORD LowPart;
		DWORD HighPart;
	};
	struct {
		DWORD LowPart;
		DWORD HighPart;
	} u;
	ULONGLONG QuadPart;
} ULARGE_INTEGER;
typedef ULARGE_INTEGER *PULARGE_INTEGER;
typedef struct _LUID {
	DWORD LowPart;
	LONG HighPart;
} LUID, *PLUID;
typedef ULONGLONG  DWORDLONG;
typedef DWORDLONG *PDWORDLONG;
typedef BYTE  BOOLEAN;
typedef BOOLEAN *PBOOLEAN;

typedef int HFILE;

typedef struct _FILETIME {
    DWORD dwLowDateTime;
    DWORD dwHighDateTime;
} FILETIME, *PFILETIME, *LPFILETIME;

typedef HANDLE *SPHANDLE;
typedef HANDLE *LPHANDLE;
typedef HANDLE HGLOBAL;
typedef HANDLE HLOCAL;
typedef HANDLE GLOBALHANDLE;
typedef HANDLE LOCALHANDLE;

typedef struct _GUID {
    unsigned long  Data1;
    unsigned short Data2;
    unsigned short Data3;
    unsigned char  Data4[8];
} GUID, *LPGUID;

typedef GUID IID;
typedef IID *LPIID;
typedef GUID CLSID;
typedef CLSID *LPCLSID;
typedef GUID FMTID;
typedef FMTID *LPFMTID;
typedef IID* REFIID;
typedef GUID UUID;
typedef const GUID *LPCGUID;
typedef const GUID *REFGUID;
typedef GUID CLSID;
typedef CLSID *LPCLSID;
typedef const GUID *REFCLSID;

typedef UINT_PTR WPARAM;
typedef LONG_PTR LPARAM;
typedef LONG_PTR LRESULT;
struct HWND__ { int unused; }; typedef struct HWND__ *HWND;
struct HHOOK__ { int unused; }; typedef struct HHOOK__ *HHOOK;
typedef WORD   ATOM;
typedef HANDLE *SPHANDLE;
typedef HANDLE *LPHANDLE;
typedef HANDLE HGLOBAL;
typedef HANDLE HLOCAL;
typedef HANDLE GLOBALHANDLE;
typedef HANDLE LOCALHANDLE;
typedef int (*FARPROC)();
typedef int (*NEARPROC)();
typedef int (*PROC)();
typedef void *HGDIOBJ;

typedef LONG (__stdcall* WNDPROC)(HWND, UINT, WPARAM, LONG);

struct HACCEL__ { int unused; }; typedef struct HACCEL__ *HACCEL;
struct HBITMAP__ { int unused; }; typedef struct HBITMAP__ *HBITMAP;
struct HBRUSH__ { int unused; }; typedef struct HBRUSH__ *HBRUSH;
struct HCOLORSPACE__ { int unused; }; typedef struct HCOLORSPACE__ *HCOLORSPACE;
struct HDC__ { int unused; }; typedef struct HDC__ *HDC;
struct HGLRC__ { int unused; }; typedef struct HGLRC__ *HGLRC;
struct HDESK__ { int unused; }; typedef struct HDESK__ *HDESK;
struct HENHMETAFILE__ { int unused; }; typedef struct HENHMETAFILE__ *HENHMETAFILE;
struct HFONT__ { int unused; }; typedef struct HFONT__ *HFONT;
struct HICON__ { int unused; }; typedef struct HICON__ *HICON;
struct HMENU__ { int unused; }; typedef struct HMENU__ *HMENU;
struct HMETAFILE__ { int unused; }; typedef struct HMETAFILE__ *HMETAFILE;
struct HPALETTE__ { int unused; }; typedef struct HPALETTE__ *HPALETTE;
struct HPEN__ { int unused; }; typedef struct HPEN__ *HPEN;
struct HRGN__ { int unused; }; typedef struct HRGN__ *HRGN;
struct HRSRC__ { int unused; }; typedef struct HRSRC__ *HRSRC;
struct HSPRITE__ { int unused; }; typedef struct HSPRITE__ *HSPRITE;
struct HSTR__ { int unused; }; typedef struct HSTR__ *HSTR;
struct HTASK__ { int unused; }; typedef struct HTASK__ *HTASK;
struct HWINSTA__ { int unused; }; typedef struct HWINSTA__ *HWINSTA;
struct HKL__ { int unused; }; typedef struct HKL__ *HKL;
struct HWINEVENTHOOK__ { int unused; }; typedef struct HWINEVENTHOOK__ *HWINEVENTHOOK;
struct HMONITOR__ { int unused; }; typedef struct HMONITOR__ *HMONITOR;
struct HUMPD__ { int unused; }; typedef struct HUMPD__ *HUMPD;
typedef HICON HCURSOR;
typedef DWORD COLORREF;
typedef DWORD *LPCOLORREF;
struct HINSTANCE__ { int unused; }; typedef struct HINSTANCE__ *HINSTANCE;
typedef HINSTANCE HMODULE;

typedef struct tagRECT {
	union{
		struct{
			LONG left;
			LONG top;
			LONG right;
			LONG bottom;
		};
		struct{
			LONG x1;
			LONG y1;
			LONG x2;
			LONG y2;
		};
		struct{
			LONG x;
			LONG y;
		};
	};
} RECT, *PRECT,  *NPRECT,  *LPRECT;
typedef const RECT * LPCRECT;
typedef RECT RECTL, *PRECTL, *LPRECTL;
typedef const RECTL * LPCRECTL;

typedef struct tagPOINT {
	LONG  x;
	LONG  y;
} POINT, *PPOINT, *NPPOINT, *LPPOINT;

typedef struct _POINTL {
	LONG  x;
	LONG  y;
} POINTL, *PPOINTL;

typedef struct tagSIZE {
	union {
		struct {
			LONG w;
			LONG h;
		};
		struct {
			LONG cx;
			LONG cy;
		};
	};
} SIZE, *PSIZE, *LPSIZE;

typedef SIZE SIZEL;
typedef SIZE *PSIZEL, *LPSIZEL;

typedef struct tagPOINTS {
	SHORT x;
	SHORT y;
} POINTS, *PPOINTS, *LPPOINTS;

struct HKEY__ { int unused; }; typedef struct HKEY__ *HKEY;
typedef HKEY *PHKEY;
]]

ffi.cdef[[
UINT  GetKBCodePage(void);

SHORT GetKeyState(int nVirtKey);
SHORT GetAsyncKeyState(int vKey);

BOOL  GetKeyboardState(PBYTE lpKeyState);
BOOL  SetKeyboardState(LPBYTE lpKeyState);

int   GetKeyNameTextW(LONG lParam, LPWSTR lpString, int cchSize);
int   GetKeyboardType( int nTypeFlag);

int   ToAscii(UINT uVirtKey, UINT uScanCode, const BYTE *lpKeyState, LPWORD lpChar, UINT uFlags);
int   ToUnicode(UINT wVirtKey, UINT wScanCode, const BYTE *lpKeyState, LPWSTR pwszBuff, int cchBuff, UINT wFlags);

DWORD OemKeyScan(WORD wOemChar);
SHORT VkKeyScanW(WCHAR ch);
void  keybd_event(BYTE bVk, BYTE bScan, DWORD dwFlags, ULONG_PTR dwExtraInfo);

typedef struct tagMOUSEINPUT {
    LONG    dx;
    LONG    dy;
    DWORD   mouseData;
    DWORD   dwFlags;
    DWORD   time;
    ULONG_PTR dwExtraInfo;
} MOUSEINPUT, *PMOUSEINPUT, * LPMOUSEINPUT;

typedef struct tagKEYBDINPUT {
    WORD    wVk;
    WORD    wScan;
    DWORD   dwFlags;
    DWORD   time;
    ULONG_PTR dwExtraInfo;
} KEYBDINPUT, *PKEYBDINPUT, * LPKEYBDINPUT;

typedef struct tagHARDWAREINPUT {
    DWORD   uMsg;
    WORD    wParamL;
    WORD    wParamH;
} HARDWAREINPUT, *PHARDWAREINPUT, * LPHARDWAREINPUT;

typedef struct tagINPUT {
    DWORD   type;
    union
    {
        MOUSEINPUT      mi;
        KEYBDINPUT      ki;
        HARDWAREINPUT   hi;
    };
} INPUT, *PINPUT, * LPINPUT;

UINT SendInput(UINT cInputs, LPINPUT pInputs, int cbSize);

typedef struct tagLASTINPUTINFO {
    UINT cbSize;
    DWORD dwTime;
} LASTINPUTINFO, * PLASTINPUTINFO;

BOOL GetLastInputInfo(PLASTINPUTINFO plii);

UINT MapVirtualKeyW(UINT uCode, UINT uMapType);


// keyboard layouts

HKL  LoadKeyboardLayoutW(LPCWSTR pwszKLID, UINT Flags);
HKL  ActivateKeyboardLayout(HKL hkl, UINT Flags);
BOOL UnloadKeyboardLayout(HKL hkl);
BOOL GetKeyboardLayoutNameW(LPWSTR pwszKLID);
int  GetKeyboardLayoutList(int nBuff, HKL  *lpList);
HKL  GetKeyboardLayout(DWORD idThread);

int   ToAsciiEx(UINT uVirtKey, UINT uScanCode, const BYTE *lpKeyState, LPWORD lpChar, UINT uFlags, HKL dwhkl);
int   ToUnicodeEx(UINT wVirtKey, UINT wScanCode, const BYTE *lpKeyState,
						LPWSTR pwszBuff, int cchBuff, UINT wFlags, HKL dwhkl);
SHORT VkKeyScanExW(WCHAR ch, HKL dwhkl);
UINT  MapVirtualKeyExW(UINT uCode, UINT uMapType, HKL dwhkl);

]]

ffi.cdef[[
static const int INPUT_MOUSE			=0;
static const int INPUT_KEYBOARD			=1;

static const int KEYEVENTF_KEYDOWN     =0x0000;
static const int KEYEVENTF_EXTENDEDKEY =0x0001;
static const int KEYEVENTF_KEYUP       =0x0002;
static const int KEYEVENTF_UNICODE     =0x0004;
static const int KEYEVENTF_SCANCODE    =0x0008;
]]

ffi.cdef[[
static const int MOUSEEVENTF_MOVE        =  0x0001;
static const int MOUSEEVENTF_LEFTDOWN    = 0x0002;
static const int MOUSEEVENTF_LEFTUP      = 0x0004;
static const int MOUSEEVENTF_RIGHTDOWN   = 0x0008;
static const int MOUSEEVENTF_RIGHTUP     = 0x0010;
static const int MOUSEEVENTF_MIDDLEDOWN  = 0x0020;
static const int MOUSEEVENTF_MIDDLEUP    = 0x0040;
static const int MOUSEEVENTF_XDOWN       = 0x0080;
static const int MOUSEEVENTF_XUP         = 0x0100;
static const int MOUSEEVENTF_WHEEL       = 0x0800;

static const int MOUSEEVENTF_HWHEEL              = 0x01000;

static const int MOUSEEVENTF_MOVE_NOCOALESCE      = 0x2000;

static const int MOUSEEVENTF_VIRTUALDESK          = 0x4000;
static const int MOUSEEVENTF_ABSOLUTE             = 0x8000;

static const int XBUTTON1 = 0x0001;
static const int XBUTTON2 = 0x0002;
]]

ffi.cdef[[
int __stdcall GetSystemMetrics(int nIndex);

static const int SM_CXSCREEN           =  0;
static const int SM_CYSCREEN           =  1;
]]

ffi.cdef[[
struct POINT
 	{
        long  x;
        long  y;
    };

void Sleep(int ms);
int __stdcall GetCursorPos(struct POINT* lpPoint);
]]

ffi.cdef[[
SHORT GetAsyncKeyState(int vKey);
]]

local backend = {}

local sizeof = ffi.sizeof
local ffi_new = ffi.new

local SendInput = C.SendInput
local MapVirtualKeyW = C.MapVirtualKeyW
local GetSystemMetrics = C.GetSystemMetrics

local INPUT_MOUSE = C.INPUT_MOUSE

local EVENT_KEYUP = C.KEYEVENTF_KEYUP
local EVENT_KEYDOWN = C.KEYEVENTF_KEYDOWN
local EVENT_SCANCODE = C.KEYEVENTF_SCANCODE
local EVENT_RIGHTDOWN = C.MOUSEEVENTF_RIGHTDOWN
local EVENT_RIGHTUP = C.MOUSEEVENTF_RIGHTUP
local EVENT_LEFTDOWN = C.MOUSEEVENTF_LEFTDOWN
local EVENT_LEFTUP = C.MOUSEEVENTF_LEFTUP
local EVENT_XDOWN = C.MOUSEEVENTF_XDOWN
local EVENT_XUP = C.MOUSEEVENTF_XUP
local EVENT_MIDDLEDOWN = C.MOUSEEVENTF_MIDDLEDOWN
local EVENT_MIDDLEUP = C.MOUSEEVENTF_MIDDLEUP
local EVENT_MOVE = C.MOUSEEVENTF_MOVE
local EVENT_WHEEL = C.MOUSEEVENTF_WHEEL

local XBUTTON1 = C.XBUTTON1
local XBUTTON2 = C.XBUTTON2

local EVENT_ABSOLUTE = C.MOUSEEVENTF_ABSOLUTE

backend.ScreenWidth = GetSystemMetrics(C.SM_CXSCREEN)
backend.ScreenHeight = GetSystemMetrics(C.SM_CYSCREEN)

function backend.KeyDown(key)
	local input = ffi_new("INPUT")
		input.type = 1
		input.ki.wVk = 0
		input.ki.wScan = MapVirtualKeyW(key, 0)
		input.ki.dwFlags = bit.bor(EVENT_KEYDOWN, EVENT_SCANCODE)

	SendInput(1, input, sizeof(input))
end

function backend.KeyUp(key)
	local input = ffi_new("INPUT")
		input.type = 1
		input.ki.wVk = 0
		input.ki.wScan = MapVirtualKeyW(key, 0)
		input.ki.dwFlags = bit.bor(EVENT_KEYUP, EVENT_SCANCODE)

	SendInput(1, input, sizeof(input))
end

function backend.KeyPress(key, delay)
	delay = delay or 50

	backend.KeyDown(key)
	C.Sleep(delay)
	backend.KeyUp(key)
end

function backend.IsKeyPressed(key)
	return C.GetAsyncKeyState(key) ~= 0
end

function backend.TrapKey(key, callback)
	while true do
		if backend.IsKeyPressed(key) then callback() end
		C.Sleep(50)
	end
end

function backend.TrapKeys(keys, callback)
	while true do
		for _, key in ipairs(keys) do if backend.IsKeyPressed(key) then callback(key) end end
		C.Sleep(50)
	end
end

function backend.TrapMouse(keycode, callback)
	while true do
		if backend.IsKeyPressed(keycode) then callback() end
		C.Sleep(150)
	end
end

function backend.GetCursorPos()
	local point = ffi_new("struct POINT")
	C.GetCursorPos(point)

	return point.x, point.y
end

function backend.LeftMouseDown()
	local x, y = backend.GetCursorPos()
	
	local input = ffi_new("INPUT")
		input.type = INPUT_MOUSE
		input.mi.dx = x
		input.mi.dy = y
		input.mi.mouseData = 0
		input.mi.dwFlags = bit.bor(EVENT_ABSOLUTE, EVENT_LEFTDOWN)
	
	SendInput(1, input, sizeof(input))
end

function backend.LeftMouseUp()
	local x, y = backend.GetCursorPos()
	
	local input = ffi_new("INPUT")
		input.type = INPUT_MOUSE
		input.mi.dx = x
		input.mi.dy = y
		input.mi.mouseData = 0
		input.mi.dwFlags = bit.bor(EVENT_ABSOLUTE, EVENT_LEFTUP)
	
	SendInput(1, input, sizeof(input))
end

function backend.RightMouseDown()
	local x, y = backend.GetCursorPos()
	
	local input = ffi_new("INPUT")
		input.type = INPUT_MOUSE
		input.mi.dx = x
		input.mi.dy = y
		input.mi.mouseData = 0
		input.mi.dwFlags = bit.bor(EVENT_ABSOLUTE, EVENT_RIGHTDOWN)
	
	SendInput(1, input, sizeof(input))
end

function backend.RightMouseUp()
	local x, y = backend.GetCursorPos()
	
	local input = ffi_new("INPUT")
		input.type = INPUT_MOUSE
		input.mi.dx = x
		input.mi.dy = y
		input.mi.mouseData = 0
		input.mi.dwFlags = bit.bor(EVENT_ABSOLUTE, EVENT_RIGHTUP)
	
	SendInput(1, input, sizeof(input))
end

function backend.X1MouseDown()	
	local input = ffi_new("INPUT")
		input.type = INPUT_MOUSE
		input.mi.mouseData = XBUTTON1
		input.mi.dwFlags = EVENT_XDOWN
	
	SendInput(1, input, sizeof(input))
end

function backend.X1MouseUp()	
	local input = ffi_new("INPUT")
		input.type = INPUT_MOUSE
		input.mi.mouseData = XBUTTON1
		input.mi.dwFlags = EVENT_XUP
	
	SendInput(1, input, sizeof(input))
end

function backend.X2MouseDown(relative)	
	local input = ffi_new("INPUT")
		input.type = INPUT_MOUSE
		input.mi.mouseData = XBUTTON2
		input.mi.dwFlags = EVENT_XDOWN
	
	SendInput(1, input, sizeof(input))
end

function backend.X2MouseUp()	
	local input = ffi_new("INPUT")
		input.type = INPUT_MOUSE
		input.mi.mouseData = XBUTTON2
		input.mi.dwFlags = EVENT_XUP
	
	SendInput(1, input, sizeof(input))
end

function backend.MiddleMouseDown(relative)	
	local input = ffi_new("INPUT")
		input.type = INPUT_MOUSE
		input.mi.dwFlags = EVENT_MIDDLEDOWN
	
	SendInput(1, input, sizeof(input))
end

function backend.MiddleMouseUp()	
	local input = ffi_new("INPUT")
		input.type = INPUT_MOUSE
		input.mi.dwFlags = EVENT_MIDDLEUP
	
	SendInput(1, input, sizeof(input))
end

-- TODO: Fix wrong absolute move
function backend.MouseMove(x, y, relative)
	if not x then x, y = backend.GetCursorPos() end

	local input = ffi_new("INPUT")
		input.type = INPUT_MOUSE
		input.mi.dx = x
		input.mi.dy = y
		input.mi.mouseData = 0
		input.mi.dwFlags = relative and EVENT_MOVE or bit.bor(EVENT_ABSOLUTE, EVENT_MOVE)
	
	SendInput(1, input, sizeof(input))
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

function backend.X1MouseClick()
	backend.X1MouseDown()
	backend.X1MouseUp()
end

function backend.X2MouseClick()
	backend.X2MouseDown()
	backend.X2MouseUp()
end

function backend.MiddleMouseClick()
	backend.MiddleMouseDown()
	backend.MiddleMouseUp()
end

function backend.MouseWheel(amount)
	local input = ffi_new("INPUT")
		input.type = INPUT_MOUSE
		input.mi.mouseData = amount or 0
		input.mi.dwFlags = EVENT_WHEEL

	SendInput(1, input, sizeof(input))
end

return backend
