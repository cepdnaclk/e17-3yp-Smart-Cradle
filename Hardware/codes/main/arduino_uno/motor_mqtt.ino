
#include <ESP8266WiFi.h>
#include <PubSubClient.h>


// Update these with values suitable for your network.

const char* ssid = "Eng-Student";
const char* password = "3nG5tuDt";
const char* mqtt_server = "broker.hivemq.com";

WiFiClient espClient;
PubSubClient client(espClient);
unsigned long lastMsg = 0;
#define MSG_BUFFER_SIZE  (50)
char msg[MSG_BUFFER_SIZE];
int value = 0;

// variables for motor
const int stepPin = 5; 
const int dirPin = 2; 
const int enPin = 8;
const int speed1 = 4900;
const int speed2 = 5000;
const int speed3 = 5200;

//function to setup wifi
void setup_wifi() {

  delay(10);
  // We start by connecting to a WiFi network
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  randomSeed(micros());

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

// turn on /off fan depending on the data comming from the subscribe topic 

void callback(char* topic, byte* payload, unsigned int length) {  //topic {speed , state}
  //Serial.print("Message arrived [");  
  //Serial.print(topic);
  //Serial.print("] ");

  
  for (int i = 0; i < length; i++) {
    Serial.print(i);
    Serial.print((char)payload[i]);
    Serial.print('\n');
  }
  Serial.println();

 // check for the the signals from fan
 if(strcmp(topic, "cradle/swing/pattern/state") == 0){

  if((char)payload[15] == 'n'){  // on 

      // cheching for patern
      if((char)payload[31] == '1'){

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
        
      }else if((char)payload[31] == '2'){

        digitalWrite(dirPin,HIGH); // Enables the motor to move in a particular direction
        for(int x = 0; x < 400; x++) {
          digitalWrite(stepPin,HIGH); 
          delayMicroseconds(speed2); 
          digitalWrite(stepPin,LOW); 
          delayMicroseconds(speed2); 
        }
        //delay(1000); // One second delay
        digitalWrite(dirPin,LOW); //Changes the direction of rotation
        for(int x = 0; x < 400; x++) {
          digitalWrite(stepPin,HIGH);
          delayMicroseconds(speed2);
          digitalWrite(stepPin,LOW);
          delayMicroseconds(speed2);
        }

      
          
      }else if((char)payload[31] == '3'){

        digitalWrite(dirPin,HIGH); // Enables the motor to move in a particular direction
        for(int x = 0; x < 400; x++) {
          digitalWrite(stepPin,HIGH); 
          delayMicroseconds(speed3); 
          digitalWrite(stepPin,LOW); 
          delayMicroseconds(speed3); 
        }
        //delay(1000); // One second delay
        digitalWrite(dirPin,LOW); //Changes the direction of rotation
        for(int x = 0; x < 400; x++) {
          digitalWrite(stepPin,HIGH);
          delayMicroseconds(speed3);
          digitalWrite(stepPin,LOW);
          delayMicroseconds(speed3);
        }
        

        
  
        
      } 
    
  }else if((char)payload[15] == 'f'){  //off

        // add off code here

  
  }
  
  }
}

void reconnect() {
  // Loop until we're reconnected
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    // Create a random client ID
    String clientId = "ESP8266Client-";
    clientId += String(random(0xffff), HEX);
    // Attempt to connect
    if (client.connect(clientId.c_str())) {
      Serial.println("connected");
      // Once connected, publish an announcement...
      //client.publish("cradle/temperature", "MQTT server is connected");
      // ... and resubscribe
      client.subscribe("cradle/swing/pattern/state");
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}

void setup() {
  //pinMode(BUILTIN_LED, OUTPUT);     // Initialize the BUILTIN_LED pin as an output
  //Serial.begin(115200);
  Serial.begin(9600);

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


/*
  //initialize pins related to temperature sensor
  Serial.begin(9600);
  Serial.println();
  Serial.println("Status\t\tHumidity (%)\t\tTemperature (C)\t");
  dht.setup(16, DHTesp::DHT11); // GPIO16

 */

  
  setup_wifi();
  client.setServer(mqtt_server, 1883);
  client.subscribe("cradle/swing/pattern/state");
  client.setCallback(callback);
}

void loop() {

  if (!client.connected()) {
    reconnect();
  }
  client.loop();
  

}
