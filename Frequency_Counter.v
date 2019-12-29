	`timescale 1ns / 1ps
	//////////////////////////////////////////////////////////////////////////////////
	// Company: 
	// Engineer: 
	// 
	// Create Date:    17:45:48 03/26/2017 
	// Design Name: 
	// Module Name:    Frequency_Counter 
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
	//////////////////////////////////////////////////////////////////////////////////
	module Frequency_Counter( 
	input clk4,
	input freq,
	input freq1,
	input [16:0] angle,
	input rotation,
	output LED1,
	output LED2,
	output LED3,
	output LED4,
	output LED5,
	output LED6,
	output LED7,
	output LED8,
	output RED,
	output BLUE,
	output GREEN,
	output PWMout_L,
	output PWMout_R,
	output reg holder,
	output reg [16:0] lock,
	output reg turner,
	output reg superturner,
	output reg indusoff
		 );
	 
	 reg tempLED1;
	 reg tempLED2;
	 reg tempLED3;
	 reg tempLED4;
	 reg tempLED5;
	 reg tempLED6;
	 reg tempLED7;
	 reg tempLED8;
	 /////////////////
	 reg currentvalue;
	 reg prevalue;
	 reg [15:0]count;
	 reg [3:0] ref;
	 reg [23:0] refer;
	 reg flag;
	 reg [3:0]count9;
	 reg [3:0]count10;
	 reg [3:0]count11;
	 reg [3:0]count12;
	 reg [2:0]count99;
	 reg [2:0]count100;
	 reg [2:0]count110;
	 reg [2:0]count120;
	 /////////////////
	 reg currentvalue1;
	 reg prevalue1;
	 reg [15:0]count1;
	 reg flag1;
	 reg [3:0]count9k;
	 reg [3:0]count10k;
	 reg [3:0]count11k;
	 reg [3:0]count12k;
	 reg [2:0]count99k;
	 reg [2:0]count100k;
	 reg [2:0]count110k;
	 reg [2:0]count120k;
	 //////////////////
	 reg [15:0] width_l;
	 reg [15:0] width_r;
	 reg  tempPWM_L;
	 reg  tempPWM_R;
	 reg [15:0] counter;
	 reg flaga;
	 reg [27:0] delay;
	 reg stopfreq;
	 reg stopfreq1;
	 reg [27:0] timer;
	 reg speedo;
	 //reg roti;
	 reg [2:0] countRED;
	 reg [2:0] countBLUE;
	 reg [2:0] countGREEN;
	 reg tempRED;
	 reg tempBLUE;
	 reg tempGREEN;
	 reg [27:0] countLED;
	 reg [8:0] spot;
	 
	 initial begin
	  width_l<=0;
		width_r<=0;
     tempPWM_L<=0;
	 tempPWM_R<=0;	
	 tempLED1 <=0;
	 tempLED2 <=0;
	 tempLED3 <=0;
	 tempLED4 <=0;
	 tempLED5 <=0;
	 tempLED6 <=0;
	 tempLED7 <=0;
	 tempLED8 <=0;
	 //////////////////
	 currentvalue<=0;
	 prevalue <=0;
	 count <=0;
	 flag<=1;
	 flaga<=0;
	 ref<=0;
	 refer<=0;
	 count9<=0;
	 count10<=0;
	 count11<=0;
	 count12<=0;
	 count99<=0;
	 count100<=0;
	 count110<=0;
	 count120<=0;
	 ///////////////////
	 currentvalue1<=0;
	 prevalue1 <=0;
	 count1 <=0;
	 flag1<=1;
	 count9k<=0;
	 count10k<=0;
	 count11k<=0;
	 count12k<=0;
	 count99k<=0;
	 count100k<=0;
	 count110k<=0;
	 count120k<=0;
	 ///////////////////
	 delay<=0;
	 counter<=0;
	 stopfreq<=0;
	 stopfreq1<=0;
	 lock<=0;
	speedo<=0;
	timer<=0;
//	roti<=0;
countRED<=0;
countBLUE<=0;
countGREEN<=0;
countLED<=0;
tempRED<=0;
tempGREEN<=0;
tempBLUE<=0;
spot<=0;
	 end
	 
	 //Assignments
	 assign LED1=tempLED1;
	 assign LED2=tempLED2;
	 assign LED3=tempLED3;
	 assign LED4=tempLED4;
	 assign LED5=tempLED5;
	 assign LED6=tempLED6;
	 assign LED7=tempLED7;
	 assign LED8=tempLED8;
//	assign PWMout_L= tempPWM_L;
//	assign PWMout_R= tempPWM_R;
//	 
	 always @ (posedge clk4)
	 begin
//////////////////////////////// Mic 1/////////////////////////////////////////////////////////////  
	 if (freq==1)
	 begin
	
	    if (stopfreq==1)
			 begin
			 currentvalue<=0;
			 end
	    else if (stopfreq==0)
				begin
					currentvalue<=1;
				end
	end
	
	else if (freq==0)
	begin
	//stopfreq1<=0;
	 currentvalue<=0;
	end
	
//////////////////////////////////// Mic 2/////////////////////////////////////////////////////////////
	if (freq1==1)
	 begin
	    if (stopfreq1==1)
			 begin
			 currentvalue1<=0;
			 end
	    else if (stopfreq1==0)
				begin
					currentvalue1<=1;
				end
	end
	
	else if (freq==0)
	begin
	//stopfreq<=0;
	 currentvalue1<=0;
	end
/////////////////////////////////////////////////MIC1///////////////////////////////////////////////////////////////////////	
	
		
		if ((currentvalue==0)&&(prevalue==0)) begin //keeps count from starting 
		//if there is no rise
			count<=0;
			prevalue<=currentvalue;
			flag<=1;
			end
		
		else if ((currentvalue==1)&&(prevalue==1)) begin //count continues if input stays high
			//count<=count+1;
			prevalue<=currentvalue;
			flag<=1;
			end
			
		else if ((prevalue==0)&&(currentvalue==1)) begin //starts count if input rises
		
		prevalue<=currentvalue;
		flag<=1;
		end
		
		else if ((prevalue==1)&&(currentvalue==0)) begin //stops count if input falls
		count<=count+0;
		prevalue<=currentvalue;
		flag<=0;
		end
		
	if (flag==0) begin
		
		
		 if (count>5559) begin //below 9kHz
		 tempLED1 <=0;
		 tempLED2 <=0;
		 tempLED3 <=0;
		 tempLED4 <=0;
		

		 count<=0;
		 end
		 
		 else if((count<=5559)&&(count>5552))begin // 9kHz range
		 tempLED1 <=1;
		 tempLED2 <=0;
		 tempLED3 <=0;
		 tempLED4 <=0;
		
			stopfreq1<=1;
		 count<=0;
		 count9<=count9+1;
		 end
		 
		  else if((count<=5552)&&(count>5003))begin // between 9kHz and 10kHz range
		 tempLED1 <=0;
		 tempLED2 <=0;
		 tempLED3 <=0;
		 tempLED4 <=0;
		

		 count<=0;
		 end
		 
		 else if((count<=5003)&&(count>4998)) begin //10kHz range
		 tempLED1 <=1;
		 tempLED2 <=1;
		 tempLED3 <=0;
		 tempLED4 <=0;
		
			stopfreq1<=1;
		 count<=0;
		  count10<=count10+1;
		 end
		 
		 else if((count<=4998)&&(count>4548)) begin // between 10kHz-11kHz range
		  tempLED1 <=0;
		 tempLED2 <=0;
		 tempLED3 <=0;
		 tempLED4 <=0;
		 

		 count<=0;
		 end
		 
		 else if((count<=4548)&&(count>4543)) begin //11 kHz range
		 tempLED1 <=1;
		 tempLED2 <=1;
		 tempLED3 <=1;
		 tempLED4 <=0;
		
			stopfreq1<=1;
		 count<=0;
		  count11<=count11+1;
		 end
		 
		 else if((count<=4543)&&(count>4168)) begin //11kHz-12kHz range
		  tempLED1 <=0;
		 tempLED2 <=0;
		 tempLED3 <=0;
		 tempLED4 <=0;
		 

		 count<=0;
		 end
		 
		 else if((count<=4168)&&(count>3845)) begin // 12kHz-13kHz range
		 tempLED1 <=1;
		 tempLED2 <=1;
		 tempLED3 <=1;
		 tempLED4 <=1;
		
		stopfreq1<=1;
		 count<=0;
		  count12<=count12+1;
		 end
		 
		 else if (count<=3845) begin //Above 13kHz range
		 tempLED1 <=0;
		 tempLED2 <=0;
		 tempLED3 <=0;
		 tempLED4 <=0;
		 

		 count<=0;
		 end

		 
		 end
		 
	else if (flag==1)
		count<=count+1;
		
if (count9==4) begin
	count99<=count99+1;
	stopfreq1<=1;
	count9<=0;
	ref<=ref+1;
	end
else if (count10==4) begin
	count100<=count100+1;
	count10<=0;
		stopfreq1<=1;
	ref<=ref+1;
	end
else if (count11==4) begin
	count110<=count110+1;
	count11<=0;
		stopfreq1<=1;
	ref<=ref+1;
	end
else if (count12==4) begin
	count120<=count120+1;
	count12<=0;
	ref<=ref+1;
		stopfreq1<=1;
	end

	
if (ref==5) begin //sample size count
		refer<=10000000;
		ref<=0;
		end
		
if (refer>0) begin //LED lights on depending on dominant frequency
	 refer<=refer-1;
	 	stopfreq1<=1;
		stopfreq<=1;
		
			 if ((count99>count100)&&(count99>count110)&&(count99>count120))
			 begin
			 tempLED5 <=1;
			 speedo<=0;
			 countBLUE<=countBLUE+1;
			 spot<=spot+1;
			 end
		
						
			else if ((count100>count99)&&(count100>count110)&&(count100>count120))
		  begin
		 tempLED6 <=1;
		 speedo<=0;
		 countRED<=countRED+1;
		 spot<=spot+1;
			end
			
			else if ((count110>count99)&&(count110>count100)&&(count110>count120))
		begin
		 tempLED7 <=1;
		 speedo<=0;
		 countGREEN<=countGREEN+1;
		 spot<=spot+1;
		 end
			
			
			else if ((count120>count99)&&(count120>count110)&&(count120>count100))
			begin
		 tempLED8 <=1;
		 speedo<=0;
		 end
		 
		 			else if ((count99k>count100k)&&(count99k>count110k)&&(count99k>count120k))
					begin
					speedo<=1;
			 tempLED5 <=1;
			 end
		
						
			else if ((count100k>count99k)&&(count100k>count110k)&&(count100k>count120k))
		  begin
		 tempLED6 <=1;
		 speedo<=1;
		 end
		 
				
			
			else if ((count110k>count99k)&&(count110k>count100k)&&(count110k>count120k))
		begin
		 tempLED7 <=1;
		 speedo<=1;
		 end
			
			
			else if ((count120k>count99k)&&(count120k>count110k)&&(count120k>count100k))
			begin
		 tempLED8 <=1;
			speedo<=1;
			end
	
	
	
end

else if (refer==0)
begin
count99<=0;
	 count100<=0;
	 count110<=0;
	 count120<=0;
	 count99k<=0;
	 count100k<=0;
	 count110k<=0;
	 count120k<=0;
	 tempLED5 <=0;
	 tempLED6 <=0;
	 tempLED7 <=0;
	 tempLED8 <=0;
end


//////////////////////////////////////////////////// MIC 2 ///////////////////////////////////////////////////////////////////////////////

	if ((currentvalue1==0)&&(prevalue1==0)) begin //keeps count from starting 
		//if there is no rise
			count1<=0;
			prevalue1<=currentvalue1;
			flag1<=1;
			end
		
		else if ((currentvalue1==1)&&(prevalue1==1)) begin //count continues if input stays high
			//count<=count+1;
			prevalue1<=currentvalue1;
			flag1<=1;
			end
			
		else if ((prevalue1==0)&&(currentvalue1==1)) begin //starts count if input rises
		
		prevalue1<=currentvalue1;
		flag1<=1;
		end
		
		else if ((prevalue1==1)&&(currentvalue1==0)) begin //stops count if input falls
		count1<=count1+0;
		prevalue1<=currentvalue1;
		flag1<=0;
		end
		
	if (flag1==0) begin
		
		
		 if (count1>5559) begin //below 9kHz
		 tempLED1 <=0;
		 tempLED2 <=0;
		 tempLED3 <=0;
		 tempLED4 <=0;
		

		 count<=0;
		 end
		 
		 else if((count1<=5559)&&(count1>5552))begin // 9kHz range
		 tempLED1 <=1;
		 tempLED2 <=0;
		 tempLED3 <=0;
		 tempLED4 <=0;
		
			stopfreq<=1;
		 count1<=0;
		 count9k<=count9k+1;
		 end
		 
		  else if((count1<=5552)&&(count1>5003))begin // between 9kHz and 10kHz range
		 tempLED1 <=0;
		 tempLED2 <=0;
		 tempLED3 <=0;
		 tempLED4 <=0;
		

		 count1<=0;
		 end
		 
		 else if((count1<=5003)&&(count1>4998)) begin //10kHz range
		 tempLED1 <=1;
		 tempLED2 <=1;
		 tempLED3 <=0;
		 tempLED4 <=0;
		
			stopfreq<=1;
		 count1<=0;
		  count10k<=count10k+1;
		 end
		 
		 else if((count1<=4998)&&(count1>4548)) begin // between 10kHz-11kHz range
		  tempLED1 <=0;
		 tempLED2 <=0;
		 tempLED3 <=0;
		 tempLED4 <=0;
		 

		 count1<=0;
		 end
		 
		 else if((count1<=4548)&&(count1>4543)) begin //11 kHz range
		 tempLED1 <=1;
		 tempLED2 <=1;
		 tempLED3 <=1;
		 tempLED4 <=0;
		
		stopfreq<=1;
		 count1<=0;
		  count11k<=count11k+1;
		 end
		 
		 else if((count1<=4543)&&(count1>4168)) begin //11kHz-12kHz range
		  tempLED1 <=0;
		 tempLED2 <=0;
		 tempLED3 <=0;
		 tempLED4 <=0;
		 

		 count1<=0;
		 end
		 
		 else if((count1<=4168)&&(count1>3845)) begin // 12kHz-13kHz range
		 tempLED1 <=1;
		 tempLED2 <=1;
		 tempLED3 <=1;
		 tempLED4 <=1;
		
			stopfreq<=1;
		 count1<=0;
		  count12k<=count12k+1;
		 end
		 
		 else if (count1<=3845) begin //Above 13kHz range
		 tempLED1 <=0;
		 tempLED2 <=0;
		 tempLED3 <=0;
		 tempLED4 <=0;
		 

		 count1<=0;
		 end

		 
		 end
		 
	else if (flag1==1)
		count1<=count1+1;
		
if (count9k==10) begin
	count99k<=count99k+1;
	count9k<=0;
	stopfreq<=1;
	ref<=ref+1;
	end
else if (count10k==10) begin
	count100k<=count100k+1;
	count10k<=0;
	stopfreq<=1;
	ref<=ref+1;
	end
else if (count11k==10) begin
	count110k<=count110k+1;
	count11k<=0;
	stopfreq<=1;
	ref<=ref+1;
	end
else if (count12k==10) begin
	count120k<=count120k+1;
	count12k<=0;
	stopfreq<=1;
	ref<=ref+1;
	end
		




/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	


////////////////////////////////////////////////// MOTOR MOVEMENT SECTION//////////////////////////////////////////////////////////////////////////
//////PUSH BUTTON///////
 if (rotation==1)
 begin
 flaga<=1;
 tempLED5<=1;
 speedo<=1;
 delay<=0;
 holder<=0;

 end
 

 

if ((tempLED5==1)||(tempLED6==1)||(tempLED7==1)||(tempLED8==1)||(flaga==1))// Flag is activated when filter produces required frequency
begin
flaga<=1;
holder<=1;
stopfreq<=1;
stopfreq1<=1;
end

else 
begin
flaga<=0;
holder<=0;
stopfreq<=0;
stopfreq1<=0;
end


			counter<=counter+1;			
	
			if(counter<width_l)
			tempPWM_L <=1;
			else
			tempPWM_L <=0;
			
			
	if(counter<width_r)
	tempPWM_R <=1;
	else
	tempPWM_R <=0;
	
	
	

if (flaga==1) // If flag is on, motor movement is initiated
begin

		  if (angle<=23000) // 0 degrees ( 90 degree turn to the left)
				  begin
				  
				  if (speedo==1)
						timer<=90000000;
				 else if (speedo==0)
						timer<=100000000;
				  
					if ((delay<timer)&&(timer==90000000))
						begin
							delay<=delay+1;
							width_l<=50000;
							width_r<=63000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
							superturner<=0;
						end
						
					else	if ((delay<timer)&&(timer==100000000))
						begin
							delay<=delay+1;
							width_l<=63000;
							width_r<=50000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
							superturner<=1;
						end
						
					else if (delay>=timer)
								begin
								delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					lock<=75002;
					turner<=0;
					superturner<=0;
							end
			 end
	
	
	else if (angle==28778) // 10 degrees ( 80 degree turn to the left)
				  begin
				  
				  if (speedo==1)
						timer<=90000000;
				 else if (speedo==0)
						timer<=88888889;
				  
					if ((delay<timer)&&(timer==90000000))
						begin
							delay<=delay+1;
							width_l<=50000;
							width_r<=63000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
							superturner<=0;
						end
						
					else	if ((delay<timer)&&(timer==88888889))
						begin
							delay<=delay+1;
							width_l<=63000;
							width_r<=50000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
							superturner<=1;
						end
						
					else if (delay>=timer)
								begin
								delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					lock<=75002;
					turner<=0;
					superturner<=0;
							end
			 end
			 
			
			
	else if (angle==34556) // 20 degrees ( 70 degree turn to the left)
				  begin
				  
				  if (speedo==1)
						timer<=90000000;
				 else if (speedo==0)
						timer<=77777778;
				  
				  
					
					if ((delay<timer)&&(timer==90000000))
						begin
							delay<=delay+1;
							width_l<=50000;
							width_r<=63000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
							superturner<=0;
						end
						
					else	if ((delay<timer)&&(timer==77777778))
						begin
							delay<=delay+1;
							width_l<=63000;
							width_r<=50000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
							superturner<=1;
						end
						
					else if (delay>=timer)
								begin
								delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					lock<=75002;
					turner<=0;
					superturner<=0;
							end
			 end
			 
	else if (angle==40334) // 30 degrees ( 60 degree turn to the left)
				  begin
				  
				    if (speedo==1)
						timer<=120000000;
				 else if (speedo==0)
						timer<=66666667;
						
						
						
					if (delay<timer) 
						begin
							delay<=delay+1;
							width_l<=63000;
							width_r<=50000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
							superturner<=1;
						end

					else if (delay>=timer)
					begin
					delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					lock<=75002;
					turner<=0;
					superturner<=0;
					end
			 end
	
			 
	else if (angle==46112) //40 degrees
				  begin
				  
				  if (speedo==1)
						timer<=130000000;
				 else if (speedo==0)
						timer<=55555556;
				  
					if (delay<timer) 
						begin
							delay<=delay+1;
							width_l<=63000;
							width_r<=50000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
							superturner<=1;
						end

					else if (delay>=timer)
					begin
					delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					lock<=75002;
					turner<=0;
					superturner<=0;
					end
			 end
			 
			 
else if (angle==51890) //50 degrees ( 40 degree turn to the left)
				  begin
				  
				   if (speedo==1)
						timer<=140000000;
				 else if (speedo==0)
						timer<=44444444;
				  
				if (delay<timer) 
						begin
							delay<=delay+1;
							width_l<=63000;
							width_r<=50000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
							superturner<=1;
						end

					else if (delay>=timer)
					begin
					delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					lock<=75002;
					turner<=0;
					superturner<=0;
					end
			 end
			 
			 
else if (angle==57668) //60 degrees ( 40 degree turn to the left)
				  begin
				  
				   if (speedo==1)
						timer<=150000000;
				 else if (speedo==0)
						timer<=33333333;
						
						
				  if (delay<timer) 
						begin
							delay<=delay+1;
							width_l<=63000;
							width_r<=50000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
							superturner<=1;
						end

					else if (delay>=timer)
					begin
					delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					lock<=75002;
					turner<=0;
					superturner<=0;
					end
			 end
			 
else if (angle==63446) //70 degrees ( 40 degree turn to the left)
				  begin
				  
				  if (speedo==1)
						timer<=160000000;
				 else if (speedo==0)
						timer<=22222222;
				  
				  
					if (delay<timer) 
						begin
							delay<=delay+1;
							width_l<=63000;
							width_r<=50000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
							superturner<=1;
						end

					else if (delay>=timer)
					begin
					delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					lock<=75002;
					turner<=0;
					superturner<=0;
					end
			 end
	

else if (angle==69224) //80 degrees ( 40 degree turn to the left)
				  begin
				  
				  if (speedo==1)
						timer<=180000000;
				 else if (speedo==0)
						timer<=11111111;
				  
					if (delay<timer) 
						begin
							delay<=delay+1;
							width_l<=63000;
							width_r<=50000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
							superturner<=1;
						end

					else if (delay>=timer)
					begin
					delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					lock<=75002;
					turner<=0;
					superturner<=0;
					end
			 end
			 	
			 
    else if ((angle>74900)&&(angle<75200)) // 90 degrees
		begin
					if (speedo==1)
						timer<=180000000;
				 else if (speedo==0)
						timer<=90000000;
						
						
					if ((delay<timer)&&(timer==180000000))
						begin
							delay<=delay+1;
							width_l<=50000;
							width_r<=63000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
					     superturner<=1;
						  indusoff<=1;
							
						end
						
					else	if ((delay<timer)&&(timer==90000000))
						begin
							delay<=delay+1;
							width_l<=36000;
							width_r<=36000;
							flaga<=1;
							holder<=1;
							stopfreq<=0;
							stopfreq1<=1;
							lock<=angle;
							turner<=0;
					    superturner<=0;
						 //indusoff<=0;
						end
						
					else if (delay>=timer)
								begin
								delay<=0;
					flaga<=0;
					holder<=0;
					stopfreq<=0;
					stopfreq1<=0;
					turner<=0;
					indusoff<=0;
					superturner<=0;
							end

	end
		
		
		else if (angle==80780) // 100 degrees ( 10 degree turn to the left)		
		
				  begin
				  if (speedo==1)
						timer<=140000000;
				 else if (speedo==0)
						timer<=11111111;
				  
				  
					if (delay<timer) 
						begin
							delay<=delay+1;
							width_l<=50000;
							width_r<=63000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
					    superturner<=0;
						end

					else if (delay>=timer)
					begin
					delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					lock<=75002;
					turner<=0;
					superturner<=0;
					end
			 end
			 
			 
			 
		else if (angle==86558) // 110 degrees ( 80 degree turn to the left)
				  begin
				  if (speedo==1)
						timer<=130000000;
				 else if (speedo==0)
						timer<=22222222;
				  
				  
					if (delay<timer) 
						begin
							delay<=delay+1;
							width_l<=50000;
							width_r<=63000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
					      superturner<=0;
						end

					else if (delay>=timer)
					begin
					delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					lock<=75002;
					turner<=0;
					superturner<=0;
					end
			 end
			 
		
		
		else if (angle==92336) // 120 degrees
				  begin
				  if (speedo==1)
						timer<=120000000;
				 else if (speedo==0)
						timer<=33333333;
				  
				  
					if (delay<timer) 
						begin
							delay<=delay+1;
							width_l<=50000;
							width_r<=63000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
					superturner<=0;
						end

					else if (delay>=timer)
					begin
					lock<=75002;
					delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					turner<=0;
					superturner<=0;
					end
			 end
			 
			 
			 
			 
	else if (angle==98114) // 130 degrees ( 60 degree turn to the left)
				  begin
				    if (speedo==1)
						timer<=110000000;
				 else if (speedo==0)
						timer<=44444444;
				  
				  
					if (delay<timer) 
						begin
							delay<=delay+1;
							width_l<=50000;
							width_r<=63000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
					superturner<=0;
						end

					else if (delay>=timer)
					begin
					delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					lock<=75002;
					turner<=0;
					superturner<=0;
					end
			 end
			 
	else if (angle==103892) // 140 degrees
				  begin
				  
				  if (speedo==1)
						timer<=100000000;
				 else if (speedo==0)
						timer<=55555556;
						
						
					if (delay<timer) 
						begin
							delay<=delay+1;
							width_l<=50000;
							width_r<=63000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
					superturner<=0;
						end

					else if (delay>=timer)
					begin
					delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					lock<=75002;
					turner<=0;
					superturner<=0;
					end
			 end
			 
			 
		else if (angle==109670) // 150 degrees ( 60 degree turn to the left)
				  begin
				  
				  if (speedo==1)
						timer<=95000000;
				 else if (speedo==0)
						timer<=66666667;
						
						
					if (delay<timer) 
						begin
							delay<=delay+1;
							width_l<=50000;
							width_r<=63000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
					superturner<=0;
						end

					else if (delay>=timer)
					begin
					delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					lock<=75002;
					turner<=0;
					superturner<=0;
					end
			 end
			
			else if (angle==115448) // 160 degrees ( 70 degree turn to the left)
				  begin
				  
				  if (speedo==1)
						timer<=90000000;
				 else if (speedo==0)
						timer<=77777778;
						
					if ((delay<timer)&&(timer==90000000))
						begin
							delay<=delay+1;
							width_l<=63000;
							width_r<=50000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
					superturner<=1;
						end
						
					else	if ((delay<timer)&&(timer==77777778))
						begin
							delay<=delay+1;
							width_l<=50000;
							width_r<=63000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
					superturner<=0;
						end
						
					else if (delay>=timer)
								begin
								delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					lock<=75002;
					turner<=0;
					superturner<=0;
							end
			 end
			
else if (angle==121226) // 170 degrees ( 80 degree turn to the left)
				  begin
				  
				    if (speedo==1)
						timer<=90000000;
				 else if (speedo==0)
						timer<=88888889;
						
					if ((delay<timer)&&(timer==90000000))
						begin
							delay<=delay+1;
							width_l<=63000;
							width_r<=50000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
					superturner<=0;
						end
						
					else	if ((delay<timer)&&(timer==88888889))
						begin
							delay<=delay+1;
							width_l<=50000;
							width_r<=63000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
					superturner<=1;
						end
						
					else if (delay>=timer)
								begin
								delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					lock<=75002;
					turner<=0;
					superturner<=0;
							end
			 end
			 			
		
		else if (angle>=127000) //180 degrees
		begin
				if (speedo==1)
						timer<=90000000;
				 else if (speedo==0)
						timer<=100000000;
						
						
					if ((delay<timer)&&(timer==90000000))
						begin
							delay<=delay+1;
							width_l<=63000;
							width_r<=50000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;		
							lock<=angle;
						end
						
					else	if ((delay<timer)&&(timer==100000000))
						begin
							delay<=delay+1;
							width_l<=50000;
							width_r<=63000;
							flaga<=1;
							holder<=1;
							stopfreq<=1;
							stopfreq1<=1;
							lock<=angle;
							turner<=1;
					superturner<=0;
						end
						
					else if (delay>=timer)
								begin
								delay<=0;
					flaga<=0;
					holder<=1;
					stopfreq<=0;
					stopfreq1<=0;
					lock<=75002;
					turner<=0;
					superturner<=0;
							end
		end
		
//	 else 
//	 begin
//				width_l<=0;
//				width_r<=0;
//				flaga<=0;
//				stopfreq<=0;
//				stopfreq1<=0;	
//				
//	end



end

else if (flaga==0)
begin
holder<=0;
width_l<=0;
width_r<=0;
turner<=0;
superturner<=0;
end

/////////////////////////////////////////////// LIGHT SENSING ////////////////////////////////////////////////////
if (spot==100)
countLED<=250000000;



if (countLED>0)
begin 
countLED<=countLED-1;

if ((countRED>countGREEN)&&(countRED>countBLUE))
begin
tempRED<=1;
tempGREEN<=0;
tempBLUE<=0;

end

else if ((countBLUE>countRED)&&(countBLUE>countGREEN))
begin
tempRED<=0;
tempGREEN<=0;
tempBLUE<=1;

end

else if((countGREEN>countRED)&&(countGREEN>countBLUE))
begin
tempRED<=0;
tempGREEN<=1;
tempBLUE<=0;

end

end


else if(count==0)
begin
tempRED<=0;
tempGREEN<=0;
tempBLUE<=0;
countRED<=0;
countGREEN<=0;
countBLUE<=0;
spot<=0;
end

end

assign PWMout_L= tempPWM_L;
assign PWMout_R= tempPWM_R;
assign RED=tempRED;
assign GREEN=tempGREEN;
assign BLUE=tempBLUE;



	
endmodule
