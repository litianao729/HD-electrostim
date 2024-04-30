# A scalable, non-invasive, high-frequency stimulator for tactile sensory feedback


# Description
This project is used to support the thesis and paper. A scalable, non-invasive, high-frequency stimulator is developed in this work for tactile sensory feedback. The hardware design files, and software program files are contained in this GitHub project.
# Instruction
The folder named pcb contains three folders which correspond to three separate PCB boards of the stimulator. For each folder, the file with extension of .kicad_pro can be opened by KiCad software. One can modify the schematics and PCB layouts for a specific PCB design project. To utilize the design:
1.	Find the folder has “gerber” in its name. This folder contains the information to fabricate the board. 
2.	Upload that folder (or compress before uploading) to a PCB fabrication server such as PCBway. 
3.	Assemble the boards according to the components listed in the table with an extension name of .csv.
Software program codes to control the stimulator are saved in the rest folders. Folders named whole_time_current_pulse and whole_time_voltage_pulse only has Arduino IDE sketch. These sketches are example codes to run the stimulator producing endless square waveform with constant current or voltage amplitude. To utilize these codes:
1.	Download the entire folder and open the sketch (extension name is .ino) via Arduino IDE.
2.	Upload the sketch to the stimulator (connected with your laptop).
3.	Measure the signal from the electrode outputs (align with the settings in the sketch).
Folder named switching_speed_test only has Arduino sketch. This sketch is used to test the switch speed of the electrode switchboard of the stimulator. To utilize this code:
1.	Download the entire folder and open the sketch (extension name is .ino) via Arduino IDE.
2.	Upload the sketch to the stimulator (connected with your laptop).
3.	Measure the signal from the electrode outputs (align with the settings in the sketch) with a oscilloscope to observe the time delay between electrode disconnection and reconnection (electrode switching event is defined as a disconnection of the old electrode and a connection of another electrode)
Other folders contain not only Arduino IDE sketch but also MATLAB script (extension name: .m) or live script (extension name: .mlx). The MATLAB scripts determine the values of the parameters defined in the Arduino IDE sketches. By serial communication, these values are transferred to the IDE interface. For each folder, to utilize the codes:
Download the folder. Open the Arduino IDE sketch and MATLAB script with Arduino IDE and MATLAB respectively.
Upload the sketch to the stimulator (connected with your laptop).
Run the first section in the MATLAB script (to establish serial communication between MATLAB and Arduino IDE).
If there is no error, run the rest sections of the script.
For live script, interactive controls are used to define the parameter values. One can change the values as the program is running.

# Notifications and troubleshooting:
The connection between MATLAB and Arduino IDE is achieved through serial communication. When using MATLAB script as the parameter inputs, you cannot use Serial monitor tool of the Arduino IDE.
Sometimes error might occur when running the first section of the MATLAB script to establish serial communication. To solve this issue, you can check if serial monitor tool is being used and reupload the sketch.

