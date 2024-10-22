MAKEFLAGS += -s

GCC     = x86_64-w64-mingw32-gcc

INC     = -I include
CORE    = $(wildcard *.c)

CFLAGS  = -w -Wall -s -Os -Wextra -masm=intel -fPIC -e __main2
CFLAGS += -fno-asynchronous-unwind-tables -nostdlib -fno-diagnostics-show-caret
CFLAGS += -fdata-sections -ffunction-sections -Wl,--gc-sections

OUT     = -o bin/xorHelper.exe

LINKFLAGS	= -lkernel32 -lmsvcrt
WINDOWFLAGS	= -mwindows

rdll:
	$(GCC) $(INC) $(CFLAGS) $(CORE) $(OUT) $(LINKFLAGS)
