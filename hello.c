#include <sys/syscall.h>

#ifndef DOCKER_ARCH
	#define DOCKER_ARCH "amd64"
#endif

const char message[] =
	"Hello from Docker! ("DOCKER_ARCH")\n";

void _start() {
        syscall(SYS_write, 1, message, sizeof(message) - 1);
        syscall(SYS_exit, 0);
}
