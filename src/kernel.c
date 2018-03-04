char* const VIDEO_MEMORY = (char*) 0xb8000;

char test() {
    return 'X';
}

void main() {
    char* videoMemory = VIDEO_MEMORY;
    videoMemory[0] = 'H';
    videoMemory[1] = 0xf0;
    videoMemory[2] = 'e';
    videoMemory[3] = 0xf0;
    videoMemory[4] = 'l';
    videoMemory[5] = 0xf0;
    videoMemory[6] = 'l';
    videoMemory[7] = 0xf0;
    videoMemory[8] = 'o';
    videoMemory[9] = 0xf0;
    videoMemory[10] = test();
    videoMemory[11] = 0xf0;
}
