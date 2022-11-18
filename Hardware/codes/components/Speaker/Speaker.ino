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

void setup()
{
  Serial.begin(9600);
  delay(1000);
  Serial.printf("WAV start\n");

  audioLogger = &Serial;
  file = new AudioFileSourcePROGMEM( viola, sizeof(viola) );
  out = new AudioOutputI2SNoDAC();
  wav = new AudioGeneratorWAV();
  wav->begin(file, out);
}

void loop()
{
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
}
