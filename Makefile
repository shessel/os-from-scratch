PROJ_DIR := $(realpath $(CURDIR))
SRC_DIR := $(PROJ_DIR)/src
BUILD_DIR := $(PROJ_DIR)/build

all: $(BUILD_DIR)/boot.img

run: all
	qemu-system-x86_64 -drive file=$(BUILD_DIR)/boot.img,format=raw,index=0,media=disk

$(BUILD_DIR)/kernel.bin : $(BUILD_DIR)/kernel_entry.o $(BUILD_DIR)/kernel.o $(BUILD_DIR)/portio.o $(BUILD_DIR)/drivers/screen.o
	ld -o $(BUILD_DIR)/kernel.bin --oformat binary -Ttext 0x1000 -m elf_i386 $^

$(BUILD_DIR)/drivers/screen.o : $(SRC_DIR)/drivers/screen.c
	clang -fno-pie -ffreestanding -c -m32 -o $@ $^

$(BUILD_DIR)/portio.o : $(SRC_DIR)/portio.c
	clang -fno-pie -ffreestanding -c -m32 -o $@ $^

$(BUILD_DIR)/kernel.o : $(SRC_DIR)/kernel.c
	clang -fno-pie -ffreestanding -c -m32 -o $@ $^

$(BUILD_DIR)/kernel_entry.o : $(SRC_DIR)/kernel_entry.s
	nasm -I$(SRC_DIR)/ -f elf -o $@ $^

$(BUILD_DIR)/hello_kernel.bin : $(SRC_DIR)/hello_kernel.s
	nasm -I$(SRC_DIR)/ -f bin -o $@ $^

$(BUILD_DIR)/boot.img : $(BUILD_DIR)/hello_kernel.bin $(BUILD_DIR)/kernel.bin
	cat $^ > $@

clean:
	rm $(BUILD_DIR)/*.bin $(BUILD_DIR)/*.o $(BUILD_DIR)/*.img
