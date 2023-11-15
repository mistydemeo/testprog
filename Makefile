CC := gcc
RM := rm
EXEEXT := 

UNAME_S := $(shell uname -s)
CFLAGS :=

ifeq ($(UNAME_S), Darwin)
	ifneq (,$(findstring x86_64,$(CARGO_DIST_TARGET)))
		CFLAGS += -arch x86_64
	endif
	ifneq (,$(findstring aarch64,$(CARGO_DIST_TARGET)))
		CFLAGS += -arch arm64
	endif
endif

all: main$(EXEEXT)

main$(EXEEXT):
	$(CC) main.c $(CFLAGS) -o main$(EXEEXT)

clean:
	$(RM) -f main$(EXEEXT)

.PHONY: all clean
