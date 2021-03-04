MCU=atmega328p
BOARD=arduino
F_CPU=16000000
CC=avr-gcc
OBJCOPY=avr-objcopy
CFLAGS=-Wall -g -Os -mmcu=${MCU} -DF_CPU=${F_CPU} 
LDFLAGS=-Wl,-gc-sections -Wl,-relax
TARGET=main
OBJ_FILE=main.o

all: ${TARGET}.hex

clean:
	rm -f *.bin *.hex *.obj

%.hex: %.obj
	${OBJCOPY} -j .text -j .data -O ihex $< $@

%.obj: $(OBJ_FILE)
	${CC} ${CFLAGS} ${OBJ_FILE} ${LDFLAGS} -o $@

flash: ${TARGET}.hex
	sudo avrdude -p ${MCU} -c ${BOARD} -P /dev/ttyUSB0 -b 115200 -u -V -U flash:w:${TARGET}.hex
