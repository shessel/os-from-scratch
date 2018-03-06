#ifndef DRIVERS_SCREEN_H
#define DRIVERS_SCREEN_H

#include <stdint.h>

void print_string(const char* const msg);
void clear_screen(const char color, const char symbol);
void clear_screen_color(const char color);
void clear_screen_def();

#endif
