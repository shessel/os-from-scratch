#include "portio.h"
#include "drivers/screen.h"

void main() {
    clear_screen_color(0xf0);
    print_string("Hello Kernel!");
}
