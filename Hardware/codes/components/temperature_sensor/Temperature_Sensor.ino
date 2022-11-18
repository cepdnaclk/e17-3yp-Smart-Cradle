#include "DHTesp.h"
DHTesp dht;
void setup()
{
  Serial.begin(9600);
  Serial.println();
  Serial.println("Status\t\tHumidity (%)\t\tTemperature (C)\t");
  dht.setup(16, DHTesp::DHT11); // GPIO16
}
void loop()
{
  //delay(dht.getMinimumSamplingPeriod() + 100);
  delay(1500);
  float humidity = dht.getHumidity();
  float temperature = dht.getTemperature();
  Serial.print("Status: ");
  Serial.print(dht.getStatusString());
  Serial.print("\t");
  Serial.print("Humidity (%): ");
  Serial.print(humidity, 1);
  Serial.print("\t");
  Serial.print("Temperature (C): ");
  Serial.print(temperature, 1);
  Serial.print("\t");
  Serial.println();
}
