#include <avr/io.h>
#include <stdio.h>
#include <util/delay.h>

#include "main.h"
#include "uart.h"

int main(void){
  uart_init();

  stdout = &uart_output;
  stdin = &uart_input;

  while(1){
    // Arduino digital pin 13
    PORTB ^= _BV(PORTB5);
    puts("Hello Wordl :) \n");
    _delay_ms(500);
  }
  return 0;

}
