#include "portio.h"
#include "drivers/screen.h"

void main() {
    clear_screen_color(0x40);
    print_string("Hello Kernel!");
}
