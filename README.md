# Online-scheduled-FPGA-based-lift-system
Objective:<br />
Design an elevator control system for 2 elevators which moves across 4 floors.<br />
Specifications:<br />
* The number of floors = 4. For each floor, a pair of slide switches represent UP and DOWN request buttons
on that floor. Total no. of slide switches used for this = 8. An equal number of LEDs are used to indicate
registration of these requests. Total no. of LEDs used for this = 8.<br />
* For each lift, 4 slide switches represent floor request buttons inside that lift. Total no. of slide switches used
for this = 8. An equal number of LEDs are used to indicate registration of these requests. Total no. of LEDs
used for this = 8.<br />
* Slide switches are used in a way that they are turned on, then immediately turned off (by the user).<br />
* For each lift, one 7-seg display shows the floor on which that lift is and another 7-seg display shows the
status of the lift - moving up (u) / moving down(d) / halted with door closed(c) / halted with door open(o). Use
the small letters to display the status of the lift on the Seven Segment Display (SSD). Total no. of 7-seg
displays used = 4. You can keep time delays for elevator going up(between adjacent floors)/down(between
adjacent floors)/door opening and door closing as 2s,2s, 0.5s and 0.5s respectively. Once the lift reaches the
destination floor, the doors are opened. If the lift has to serve more requests the door closes after 1 second
(can be overridden by door_closed, door_open) else, it remains open.<br />
* The lift number displayed on the Seven Segment Display (SSD) should change after the lift has reached
the certain floor, but before the door is opened.<br />
* For each lift, two push buttons are used for door open/close requests. Total no. of push buttons used for
this = 4. The door takes 0.5s to close after the door_close button is pressed and 0.1s to open if door_open is
pressed. If the lift has to serve more requests the door closes after 1 second (can be overridden by
door_closed, door_open) else, it remains open.<br />
* One push button may be used as a reset button to facilitate testing by bringing the system to a known state
(Both lifts at floor 0, all requests reset, doors open).<br />
* Direction must be maintained (A lift going up goes up first and a lift going down goes down first before
reversing direction). If a user requests a floor from inside the lift in the opposite direction of movement, the
request is registered but served only after completing requests in the original direction. The strategy is
described in the end.<br />
