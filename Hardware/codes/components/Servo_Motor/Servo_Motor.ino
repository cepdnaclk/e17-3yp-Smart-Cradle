const int stepPin = 5;
const int dirPin = 2;
const int enPin = 8;

void setup(){
  pinMode(stepPin,OUTPUT);
  pinMode(dirPin,OUTPUT);
  pinMode(enPin,OUTPUT);
  digitalWrite(enPin,LOW);
}

void loop(){

  //Fading the LED
  for(int i=0; i<255; i++){
    analogWrite(stepPin, i);
    delay(5);
  }
  for(int i=255; i>0; i--){
    analogWrite(stepPin, i);
    delay(5);
  }
}
