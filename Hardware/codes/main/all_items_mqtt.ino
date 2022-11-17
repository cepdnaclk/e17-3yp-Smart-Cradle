
// header files for mqtt
#include <ESP8266WiFi.h>
#include <PubSubClient.h>

// pin for sound sensor
#define sound_analog  A0

// libraries for the temperature sensor
#include "DHTesp.h"
DHTesp dht;

// wifi connection
const char* ssid = "Eng-Student";
const char* password = "3nG5tuDt";
const char* mqtt_server = "broker.hivemq.com";

WiFiClient espClient;
PubSubClient client(espClient);
unsigned long lastMsg = 0;
#define MSG_BUFFER_SIZE  (50)
char msg[MSG_BUFFER_SIZE];
int value = 0;

//=============================================================================================//




//=============================================================================================//
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
//=====================================================================================================//


//=====================================================================================================//
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

      // publish topics 
      client.publish("cradle/temperature", "MQTT server is connected");
      client.publish("cradle/soundsensor", "MQTT server is connected");

      // subscribe topics
      client.subscribe("cradle/fan/speed/state");
      
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}

//=================================================================================================================//


// ==============================================================================================================================// 

void callback(char* topic, byte* payload, unsigned int length) {  
  
  //Serial.print("Message arrived [");  
  //Serial.print(topic);
  //Serial.print("] ");

  for (int i = 0; i < length; i++) {
    Serial.print(i);
    Serial.print((char)payload[i]);
    Serial.print('\n');
  }
  Serial.println();

 // check for the the signals from fan ---------------------------------------------------------------------------  FAN
 if(strcmp(topic, "cradle/fan/speed/state") == 0){ 

  digitalWrite(12 , HIGH);
  digitalWrite(13, LOW);

  if((char)payload[15] == 'n'){  // on 

   // digitalWrite(BUILTIN_LED,LOW);
   
    // cheching for speed
    if((char)payload[31] == '1'){
      analogWrite(15,160);
      delay(5000);
      
    }else if((char)payload[31] == '2'){

      analogWrite(15,200);
      delay(5000);
        
    }else if((char)payload[31] == '3'){

      analogWrite(15,255);
      delay(5000);
      
    }
    
   }else if((char)payload[15] == 'f'){  //off

    //digitalWrite(BUILTIN_LED,HIGH);

     analogWrite(15,0);
   // delay(5000);  
   }
  
  }
  //-------------------------------------------------------------------------------------------------   FAN-END

  
}




//================================================================================================================================//

void setup() {


                                                                                                    //initialize pins related to temperature sensor
  Serial.begin(9600);
  Serial.println();

  // temperature sensor
  Serial.println("Status\t\tHumidity (%)\t\tTemperature (C)\t");
  dht.setup(16, DHTesp::DHT11); // GPIO16


  // fan
  pinMode(12 ,OUTPUT);
  pinMode(13 ,OUTPUT);
  pinMode(15, OUTPUT);

  // sound sensor
  pinMode(sound_analog,INPUT);  
  delay(10);

                                                                                                    // hadling connection
  setup_wifi();
  client.setServer(mqtt_server, 1883);
  
  client.subscribe("cradle/fan/speed/state");
  
  client.setCallback(callback);

}
//============================================================================================================================================//



//=========================================================================================================================================================//
void loop() {

                                                                                                              // connection hadling

  if (!client.connected()) {
    reconnect();
  }
  client.loop();

 

  //-------------------------------------------------------------

   // temperature sensor
  delay(1500);
  //float humidity = dht.getHumidity();
  float temperature = dht.getTemperature();
  snprintf(msg,MSG_BUFFER_SIZE,"Temperature is:%.2f",temperature);
  Serial.print("Publish message: ");
  Serial.println(msg);
  client.publish("cradle/temperature",msg);

  //-------------------------------------------------------------
  // sound sensor
  int sound_val_analog = analogRead(sound_analog);
  if(sound_val_analog>100){
      //Serial.print(val_analog);
      //Serial.print("\n");
      snprintf(msg,MSG_BUFFER_SIZE,"frequency is:%ld",sound_val_analog);
      Serial.print("Publish message: ");
      Serial.println(msg);
      client.publish("cradle/soundsensor",msg);
  }
  delay(100);
  


}

//======================================================================================================================================
