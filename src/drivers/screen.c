char* const VIDEO_MEMORY = (char*) 0xb8000;
const unsigned char WIDTH = 80u;
const unsigned char HEIGHT = 25u;
const unsigned int NUM_CHARS = WIDTH * HEIGHT;

void print_string(const char* const msg) {
    unsigned int i = 0;
    char* videoMemory = VIDEO_MEMORY;
    const char* currentChar = msg;
    while (i++ < NUM_CHARS && *currentChar != 0) {
        *videoMemory++ = *currentChar++;
        *videoMemory++ = 0x0f;
        ++i;
    }
}

void clear_screen(const char color, const char symbol) {
    unsigned int i = 0;
    char* videoMemory = VIDEO_MEMORY;
    while (i++ < NUM_CHARS) {
        *videoMemory++ = symbol;
        *videoMemory++ = color;
    }
}

void clear_screen_color(const char color) {
    clear_screen(color, 0x0);
}

void clear_screen_def() {
    clear_screen(0x0, 0x0);
}
