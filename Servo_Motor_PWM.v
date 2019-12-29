`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:	 22:19:19 03/18/2017 
// Design Name: 
// Module Name:	 Servo_Motor_PWM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
/////////////////////////////////////////////////////////////////////////////////
module Servo_Motor_PWM(

input clk3,
input holder,
input tune,
input [16:0] lock,
output PWM_servo,
output reg [16:0] angle
	 );
	  
	  
	 reg [19:0] counter;
	 //reg [16:0] ref;
	 reg PWM;
   reg [26:0] val;
	reg flag;
	
	
  initial begin
	 angle<=23000;
	 val<=0;
	 flag<=1;
	 
	 
	 end
	 
	 assign PWM_servo= PWM; // Pulse providing direction
	
	 
	 always @ (posedge clk3)
	 begin
	 
	 counter<=counter+1;
	 
	 if (counter==1000000) //pulse required every two seconds for servo motor to function
		counter<=0;
	
	if (angle>=127000) // Upper limit of direction (180 degrees)
		flag<=0;		
	else if (angle<=23000) // lower Limit of direction (0 degrees)
	flag<=1;
	

if (holder==0) 
begin	

	if (val==30000000)
	begin //count per change in angle
	    val<=0;
		 if (flag==1) 
		 begin//Flag switching direction of count
		if (tune==0)
		 angle<=angle+5778;
		else if (tune==1)
		angle<=75002;//8667 for fifteen-degree increments
		end
		
		 else if(flag==0)
		 begin
		 if (tune==0)
		 angle<=23000;
		else if (tune==1)
		angle<=75002;// fifteen-degree decrements
		end
	end
	
	else if (val<30000000) 
	begin //controls rate of change of PWM controlling speed
		 if (tune==0)
		 val<=val+1;
		else if (tune==1)
		begin
		angle<=75002;
		val<=0;// fifteen-degree decrements
		end
	end
	
end


else if (holder==1)
begin
if (tune==0)
begin
val<=0;
angle<=lock;
end
else if (tune==1)
begin
val<=0;
angle<=75002;
end
end
	
	if(counter<angle)
			PWM <=1;
			
			
			else
			PWM <=0;
			
		end
		
	
	
	endmodule
	