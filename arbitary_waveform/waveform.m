%% arbitary waveform
clear all
clc
s = serialport('/dev/cu.usbmodem128183101',12E6);

%% sine wave
sine_wave = 2047+700*sin(2*pi*linspace(0,1,100));
sine_wave = fix(sine_wave);

Nw = length(sine_wave);

wave_string = [];
for i=1:Nw-1
    wave_string = [wave_string, num2str(sine_wave(i)),','];
end
wave_string = [wave_string, num2str(sine_wave(Nw))];
message = string([num2str(Nw),',',wave_string]);

writeline(s,message);

%% triangle wave
triangle_wave = 2047+700*sawtooth(2*pi*linspace(0,1,100),1/2);
triangle_wave = fix(triangle_wave);

Nw = length(triangle_wave);

wave_string = [];
for i=1:Nw-1
    wave_string = [wave_string, num2str(triangle_wave(i)),','];
end
wave_string = [wave_string, num2str(triangle_wave(Nw))];
message = string([num2str(Nw),',',wave_string]);

writeline(s,message);


