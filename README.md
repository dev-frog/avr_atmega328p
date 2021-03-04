# avr_atmega328p_blink


## avr Compile

```bash

$ avr-gcc -g -Os -mmcu=atmega328p -c main.c
$ avr-gcc -g -mmcu=atmega328p -o main.bin main.o
$ avr-objcopy -j .text -j .data -O ihex main.bin main.hex


$ avrdude -c arduino -p atmega328p -P /dev/tyyUSB0 -b 115200 -u -V -U flash:w:main.hex



```