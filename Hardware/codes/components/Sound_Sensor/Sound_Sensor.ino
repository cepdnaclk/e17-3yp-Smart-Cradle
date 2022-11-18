//int led = D7;
//int sound_digital = 8;
#define sound_analog  A0

void setup(){
  Serial.begin(9600);
  //pinMode(led, OUTPUT);
  //pinMode(sound_digital, INPUT);  
  pinMode(sound_analog,INPUT);  
  delay(10);
}

void loop(){
  //int val_digital = digitalRead(sound_digital);
  int val_analog = analogRead(sound_analog);
  if(val_analog>100){
      Serial.print(val_analog);
      Serial.print("\n");
  }
  delay(100);
  //Serial.println(val_digital);

}
