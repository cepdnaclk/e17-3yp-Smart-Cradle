
// header files for mqtt
#include <ESP8266WiFi.h>
#include <PubSubClient.h>


// libraries for sound sensor
#include <Arduino.h>

#include "AudioFileSourcePROGMEM.h"
#include "AudioGeneratorWAV.h"
#include "AudioOutputI2SNoDAC.h"

// VIOLA sample taken from https://ccrma.stanford.edu/~jos/pasp/Sound_Examples.html
//#include "viola.h"
#include "Hasara.h"
AudioGeneratorWAV *wav;
AudioFileSourcePROGMEM *file;
AudioOutputI2SNoDAC *out;


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

      // subscribe topics
      client.subscribe("cradle/songs/song_name/state");
      
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
 if(strcmp(topic,"cradle/songs/song_name/state") == 0){ 
  int sum = 0;
  if((char)payload[21] == 'r'){  // on 

   // digitalWrite(BUILTIN_LED, LOW); 
   digitalWrite(4,HIGH);  
   Serial.printf("pqr\n");
      audioLogger = &Serial;
      file = new AudioFileSourcePROGMEM( viola, sizeof(viola) );
      out = new AudioOutputI2SNoDAC();
      wav = new AudioGeneratorWAV();
      wav->begin(file, out);
      delay(1000);


   while(sum<1035*4){
    
//      Serial.printf("WAV done\n");
//      audioLogger = &Serial;
//      file = new AudioFileSourcePROGMEM( viola, sizeof(viola) );
//      out = new AudioOutputI2SNoDAC();
//      wav = new AudioGeneratorWAV();
//      wav->begin(file, out);
//      delay(1000);
      
     if (wav->isRunning()) {
      Serial.print("abc");
      sum++;
      if (!wav->loop()) wav->stop();
    } else {
      Serial.printf("elser\n\n\n");
      Serial.print(sum);
      audioLogger = &Serial;
      file = new AudioFileSourcePROGMEM( viola, sizeof(viola) );
      out = new AudioOutputI2SNoDAC();
      wav = new AudioGeneratorWAV();
      wav->begin(file, out);
      delay(1000);
   }

   //delay(1500);
  }
    
   }

    
/*
    if (wav->isRunning()) {
      if (!wav->loop()) wav->stop();
    } else {
      Serial.printf("WAV done\n");
      audioLogger = &Serial;
      file = new AudioFileSourcePROGMEM( viola, sizeof(viola) );
      out = new AudioOutputI2SNoDAC();
      wav = new AudioGeneratorWAV();
      wav->begin(file, out);
      delay(1000);
   }
   */
    
   }else if((char)payload[17] == 'f'){  //off
        // code to stop playing song

        //digitalWrite(BUILTIN_LED,HIGH);  
         digitalWrite(4,LOW);

   
   }
  
  }
  //-------------------------------------------------------------------------------------------------   FAN-END

  





//================================================================================================================================//

void setup() {

  pinMode(BUILTIN_LED, OUTPUT); 
  pinMode(4,OUTPUT);

  Serial.begin(9600);
  delay(1000);

  
  Serial.printf("WAV start\n");

  audioLogger = &Serial;
  file = new AudioFileSourcePROGMEM( viola, sizeof(viola) );
  out = new AudioOutputI2SNoDAC();
  wav = new AudioGeneratorWAV();
  wav->begin(file, out);
  


                                                                                                    // hadling connection
  setup_wifi();
  client.setServer(mqtt_server, 1883);
  
  client.subscribe("cradle/songs/song_name/state");
  
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

  //client.setCallback(callback);
}

//======================================================================================================================================
