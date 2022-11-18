
const int stepPin = 5; 
const int dirPin = 2; 
const int enPin = 8;
const int speed1 = 4900;

void setup() {
  pinMode(stepPin,OUTPUT); 
  pinMode(dirPin,OUTPUT);
  pinMode(enPin,OUTPUT);
  digitalWrite(enPin,LOW);
  digitalWrite(dirPin,LOW); // Enables the motor to move in a particular direction
  for(int x = 0; x < 200; x++) {
    digitalWrite(stepPin,HIGH); 
    delayMicroseconds(speed1); 
    digitalWrite(stepPin,LOW); 
    delayMicroseconds(speed1); 
  }
  
  
}

void loop() {
  digitalWrite(dirPin,HIGH); // Enables the motor to move in a particular direction
  for(int x = 0; x < 400; x++) {
    digitalWrite(stepPin,HIGH); 
    delayMicroseconds(speed1); 
    digitalWrite(stepPin,LOW); 
    delayMicroseconds(speed1); 
  }
  //delay(1000); // One second delay
  digitalWrite(dirPin,LOW); //Changes the direction of rotation
  for(int x = 0; x < 400; x++) {
    digitalWrite(stepPin,HIGH);
    delayMicroseconds(speed1);
    digitalWrite(stepPin,LOW);
    delayMicroseconds(speed1);
  }
  //delay(1000); 
}
