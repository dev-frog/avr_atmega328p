#include <avr/io.h>
#include <util/delay.h>

#define LED _BV(PD0)     // = (1 << PB0)
#define LED_DDR DDRD
#define LED_PORT PORTD

int main (void) {   
  LED_DDR = LED;   // Set the LED pin as an output

  for(;;) {
    LED_PORT ^= LED;   // Toggles just the LED pin
    _delay_ms(1000);
  }
}