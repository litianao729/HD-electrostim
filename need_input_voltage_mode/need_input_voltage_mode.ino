#include <SPI.h>
const int CS_PIN = 10;  // chip select pin for DAC
const int CNSVT_PIN2 = 8;
const int CNSVT_PIN1 = 0;
const int vmode = 20;
uint32_t val;
float voltage;
SPISettings settingsA(10E6, MSBFIRST, SPI_MODE0);
SPISettings settingsB(20E6, MSBFIRST, SPI_MODE0);

// timer variables
unsigned long t0;
unsigned long t;
unsigned long t1;
unsigned long t2;
unsigned long save_time;

//control signals for muxs and d-latch
const int E_control = 1;
const int D_control = 2;
const int S = 7;
const int S0 = 3;
const int S1 = 4;
const int S2 = 5;
const int S3 = 6;

// Commands to DAC
uint16_t updateA = 8192;      //command to update register A in DAC
uint16_t updateB = 12288;     //command to update register B in DAC
uint16_t outputDACs = 40960;  // command to output from DACs
uint16_t poweron = 57344;     //command to power on the DACs
uint16_t DAC_value = 0;
uint16_t to_send;  // added uint16_t (update command + DAC value) that is sent by SPI to the DAC

int MUXtable[32][5] = {
  { 0, 0, 0, 0, 0 },  //0 : e1 to ch1
  { 0, 0, 0, 0, 1 },  //1 : e2 to ch1
  { 0, 0, 0, 1, 0 },  //2 : e3 to ch1
  { 0, 0, 0, 1, 1 },  //3 : e4 to ch1
  { 0, 0, 1, 0, 0 },  //4 : e5 to ch1
  { 0, 0, 1, 0, 1 },  //5 : e6 to ch1
  { 0, 0, 1, 1, 0 },  //6 : e7 to ch1
  { 0, 0, 1, 1, 1 },  //7 : e8 to ch1
  { 0, 1, 0, 0, 0 },  //8 : e9 to ch1
  { 0, 1, 0, 0, 1 },  //9 : e10 to ch1
  { 0, 1, 0, 1, 0 },  //10 : e11 to ch1
  { 0, 1, 0, 1, 1 },  //11 : e12 to ch1
  { 0, 1, 1, 0, 0 },  //12 : e13 to ch1
  { 0, 1, 1, 0, 1 },  //13 : e14 to ch1
  { 0, 1, 1, 1, 0 },  //14 : e15 to ch1
  { 0, 1, 1, 1, 1 },  //15 : e16 to ch1
  { 1, 0, 0, 0, 0 },  //16 : e1 to ch2
  { 1, 0, 0, 0, 1 },  //17 : e2 to ch2
  { 1, 0, 0, 1, 0 },  //18 : e3 to ch2
  { 1, 0, 0, 1, 1 },  //19 : e4 to ch2
  { 1, 0, 1, 0, 0 },  //20 : e5 to ch2
  { 1, 0, 1, 0, 1 },  //21 : e6 to ch2
  { 1, 0, 1, 1, 0 },  //22 : e7 to ch2
  { 1, 0, 1, 1, 1 },  //23 : e8 to ch2
  { 1, 1, 0, 0, 0 },  //24 : e9 to ch2
  { 1, 1, 0, 0, 1 },  //25 : e10 to ch2
  { 1, 1, 0, 1, 0 },  //26 : e11 to ch2
  { 1, 1, 0, 1, 1 },  //27 : e12 to ch2
  { 1, 1, 1, 0, 0 },  //28 : e13 to ch2
  { 1, 1, 1, 0, 1 },  //29 : e14 to ch2
  { 1, 1, 1, 1, 0 },  //30 : e15 to ch2
  { 1, 1, 1, 1, 1 }   //31 : e16 to ch2
};

int signalpin[] = { S, S3, S2, S1, S0 };

void setup() {
  // Setup teensy pins as outputs
  pinMode(CS_PIN, OUTPUT);  // chip select pin
  pinMode(CNSVT_PIN1, OUTPUT);
  pinMode(CNSVT_PIN2, OUTPUT);
  pinMode(vmode, OUTPUT);

  pinMode(S0, OUTPUT);
  pinMode(S1, OUTPUT);
  pinMode(S2, OUTPUT);
  pinMode(S3, OUTPUT);
  pinMode(S, OUTPUT);
  pinMode(D_control, OUTPUT);
  pinMode(E_control, OUTPUT);

  digitalWrite(CS_PIN, HIGH);
  digitalWrite(CNSVT_PIN1, HIGH);
  digitalWrite(CNSVT_PIN2, HIGH);

  digitalWrite(S0, LOW);
  digitalWrite(S1, LOW);
  digitalWrite(S2, LOW);
  digitalWrite(S3, LOW);
  digitalWrite(S, LOW);
  digitalWrite(D_control, LOW);
  digitalWrite(E_control, LOW);

  for (int i = 0; i < 32; i++) {
    for (int j = 0; j < 5; j++) {
      digitalWrite(signalpin[j], MUXtable[i][j]);
    }
    digitalWrite(E_control, HIGH);
    delay(10);
    digitalWrite(D_control, LOW);
    delay(10);
    digitalWrite(E_control, LOW);
    delay(10);
  }
  delay(100);

  // Begin SPI
  SPI.begin();
  Serial.begin(115200);

  digitalWrite(CNSVT_PIN1, LOW);
  SPI.beginTransaction(settingsA);
  SPI.transfer(00000000);
  SPI.endTransaction();
  digitalWrite(CNSVT_PIN1, HIGH);
  
  digitalWrite(CNSVT_PIN2, LOW);
  SPI.beginTransaction(settingsA);
  SPI.transfer(00000000);
  SPI.endTransaction();
  digitalWrite(CNSVT_PIN2, HIGH);

  // Power on both DACs
  digitalWrite(CS_PIN, LOW);        // disable chip select by default
  SPI.beginTransaction(settingsA);  // set the transaction settings
  SPI.transfer16(poweron);          // send the power on command
  SPI.endTransaction();
  digitalWrite(CS_PIN, HIGH);  // disable chip select by default

  digitalWrite(vmode, HIGH);
}
void loop() {
//this code is for voltage control mode
//a MATLAB live script controls this code to achieve real-time parameters modification


  setVoltages(2047, 2047);  // set voltages to 0 from the start

  // wait for message to start
  // look for 5 numbers sent by matlab in the following style "freq,amp,duration,electrode1,electrode2"
  while (Serial.available() > 0) {
    
    int freq = Serial.parseInt();//in Hz
    float amp = Serial.parseFloat();
    float T = 1e6 * (1.0 / freq);  //period in microseconds

    int dur = 0.5*1e6;//in microseconds
    unsigned long duration = dur;
    //How many 1/2 periods fit in the duration?


    float scaler = 1641;                                   //1236
    uint16_t DAC_value1 = 2047.0 + (scaler * amp / 32.0);  //1236
    uint16_t DAC_value2 = 2047.0 + (-scaler * amp / 32.0);



    switching(1,6);
    switching(2,11);
    

    // Connect ch1 to e1 and ch2 to e2
    //      (e1 ch 1)
    // digitalWrite(s0a, MUXtable[e1][0]);
    // digitalWrite(s3a, MUXtable[e1][3]);
    // digitalWrite(s4a, MUXtable[e1][2]);
    // digitalWrite(s5a, MUXtable[e1][1]);
    // //      (e2 ch 2)
    // digitalWrite(s0b, MUXtable[e2][0]);
    // digitalWrite(s3b, MUXtable[e2][3]);
    // digitalWrite(s4b, MUXtable[e2][2]);
    // digitalWrite(s5b, MUXtable[e2][1]);
    //if (1) {
    //start the main message once a new line is detected
    //digitalWrite(13, HIGH); // turn on indicator light
    //t = micros();  // record start time

    // while duration has not elapsed...
    if (Serial.read()=='\n') {
      t0 = micros();
      while (micros() - t0 < duration) {
        // every 1/2 period flip the phase
          t1 = micros();
          setVoltages(DAC_value1, DAC_value2);
          readADC_quiet();
          //delayMicroseconds(1);
          //readADC();
          while ((micros() - t1) < (T / 2)) {
            //delayMicroseconds(1);
            readADC();
          }  // wait for half a period to elapse
          

          t1 = micros();
          setVoltages(DAC_value2, DAC_value1);  // flip the voltages
          readADC_quiet();
          //delayMicroseconds(1);
          //readADC();
          while ((micros() - t1) < (T / 2)) {
            //delayMicroseconds(1);
            readADC();
          }  // wait for half a period to elapse
            

        
      }

      setVoltages(2047, 2047);
    }
  }
}

void setVoltages(uint16_t value1, uint16_t value2) {
  // Turn on DAC
  //Command 1: Update Input Register for Channel 1
  //digitalWrite(CNSVT_PIN, HIGH);
  digitalWrite(CS_PIN, LOW);
  SPI.beginTransaction(settingsA);
  to_send = updateA + value1;
  SPI.transfer16(to_send);
  SPI.endTransaction();
  digitalWrite(CS_PIN, HIGH);


  //Command 2: Update Input Register for Channel 2
  digitalWrite(CS_PIN, LOW);
  SPI.beginTransaction(settingsA);
  to_send = updateB + value2;
  SPI.transfer16(to_send);
  SPI.endTransaction();
  digitalWrite(CS_PIN, HIGH);


  //Command 3: Update both DAC Registers
  digitalWrite(CS_PIN, LOW);
  SPI.beginTransaction(settingsA);
  SPI.transfer16(outputDACs);
  SPI.endTransaction();
  digitalWrite(CS_PIN, HIGH);
}

void readADC() {
  digitalWrite(CS_PIN, HIGH);
  digitalWrite(CNSVT_PIN2, LOW);
  SPI.beginTransaction(settingsB);
  val = SPI.transfer32(0);
  SPI.endTransaction();
  val = val >> 14;
  voltage = val * 0.000038 - 5;
  //Serial.println(val * 0.000038 - 5);
  Serial.println(voltage);
  digitalWrite(CNSVT_PIN2, HIGH);
  
}

void readADC_quiet(){
  digitalWrite(CS_PIN, HIGH);
  digitalWrite(CNSVT_PIN2, LOW);
  SPI.beginTransaction(settingsB);
  val = SPI.transfer32(0);
  SPI.endTransaction();
  val = val >> 14;
  digitalWrite(CNSVT_PIN2, HIGH);
}

void readADC1() {
  digitalWrite(CS_PIN, HIGH);
  digitalWrite(CNSVT_PIN1, LOW);
  SPI.beginTransaction(settingsB);
  val = SPI.transfer32(0);
  SPI.endTransaction();
  val = val >> 14;
  voltage = val * 0.000038 - 5;
  Serial.println(voltage);
  digitalWrite(CNSVT_PIN1, HIGH);
  
}

void readADC_quiet1(){
  digitalWrite(CS_PIN, HIGH);
  digitalWrite(CNSVT_PIN1, LOW);
  SPI.beginTransaction(settingsB);
  val = SPI.transfer32(0);
  SPI.endTransaction();
  val = val >> 14;
  digitalWrite(CNSVT_PIN1, HIGH);
}

void switching(uint16_t ch, uint16_t e){
  uint16_t ind = (ch-1)*16 + e-1;
  //Serial.println(ind);
  for (int j = 0; j < 5; j++) {
    digitalWrite(signalpin[j], MUXtable[ind][j]);
  }
  digitalWrite(D_control, HIGH);
  delay(10);
  digitalWrite(E_control, HIGH);
  delay(10);
  digitalWrite(E_control, LOW);
  delay(10);
  digitalWrite(D_control, LOW);
  delay(10);
}
