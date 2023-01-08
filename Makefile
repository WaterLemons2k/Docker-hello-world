TARGET_ARCH := amd64
C_TARGETS := $(addsuffix hello, $(wildcard $(TARGET_ARCH)/))

CC := gcc
CFLAGS := -static -Os -nostartfiles -fno-asynchronous-unwind-tables
STRIP := strip

.PHONY: all
all: $(C_TARGETS)

$(C_TARGETS): hello.c
	$(CC) $(CFLAGS) -o '$@' -D DOCKER_ARCH='"$(TARGET_ARCH)"' '$<'
	$(STRIP) -R .comment -s '$@'

.PHONY: clean
clean:
	-rm -vrf $(C_TARGETS)
