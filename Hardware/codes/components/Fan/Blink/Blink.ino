
void setup() {
  pinMode(15, OUTPUT);     // Initialize the LED_BUILTIN pin as an output
}

// the loop function runs over and over again forever
void loop() {
//  analogWrite(15,30);
//  delay(5000);
  analogWrite(15,150);
  delay(5000);
  analogWrite(15,255);
  delay(5000);
 
  
}
