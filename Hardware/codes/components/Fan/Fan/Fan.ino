void setup() {
  // put your setup code here, to run once:
  pinMode(12 ,OUTPUT);
  pinMode(13 ,OUTPUT);
  

}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(12 , HIGH);
  digitalWrite( 13, LOW);
  analogWrite(15,255);
  delay(4000);
  analogWrite(15,150);
  delay(4000);
  analogWrite(15,100);
  delay(4000);
  analogWrite(15,0);
  delay(10000);
  

}
