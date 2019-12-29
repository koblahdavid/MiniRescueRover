`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:29 03/09/2017 
// Design Name: 
// Module Name:    CurrentSensor 
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
///////////////////////////////////////////////////////////////////////////////
module CurrentSensor(input clk1,
input KS_Circuit_out,
input KS_Circuit_outer,
	//input dir_l,
	input btn,
	input indusensor,
	input indie,
	input turner,
	input superturner,
	input indusoff,
   output IN_1,
	output IN_2,
	output IN_3,
	output IN_4,
	output reg rotation,
	output reg tune
	);
	
//	reg count;
//   reg count1;
//   reg [15:0] outer;
	reg  temp_IN1;
	reg  temp_IN2;
	reg  temp_IN3;
	reg  temp_IN4;
	reg  [25:0] x;
	reg  flag;
	reg jaja;
	reg [27:0] jeje;
	reg flaga;
	reg figi;
	reg [19:0] counter;
	reg [25:0] conte;
	
	initial begin
	x<=0;
	flag<=0;
	flaga<=0;
	jaja<=0;
	jeje<=0;
	figi<=0;
	temp_IN1<=0;
	temp_IN2<=0;
	temp_IN3<=0;
	temp_IN4<=1;
	conte <=0;
	rotation<=0;
	tune<=0;
	end
	
				
  assign IN_2=temp_IN2;
  assign IN_1=temp_IN1;
  assign IN_3=temp_IN3;
  assign IN_4=temp_IN4;
		
always @ (posedge clk1) 
begin
	 
	 if ((KS_Circuit_out==0)&&(KS_Circuit_outer==0))  //Input From Sense pin of H-bridge
	  flag<=0;
	  
	 else if((KS_Circuit_out==1)||(KS_Circuit_outer==1))
	 begin
	 if (conte==45000000) 
	 begin
		flag<=1;
		conte<=0;
	end
	
    else if(conte<45000000)
	 begin
		flag<=0;
		conte<= conte +1;
		end
	end
///////////////////////////////////////////////////////////////////////////////
	 if ((indusensor==0)&&(indie==0))
	 figi<=0;
	 
	 else if ((indusensor==1)||(indie==1))
	 begin
	 
	 if (counter==1000000)
	 begin
	 counter<=0;
		if (indusoff==1)
				 begin
					figi<=0;
				end
		else if (indusoff==0)
					begin
					
						figi<=1;
					end
	end
	
    else if(counter<1000000)
	 begin
		figi<=0;
		counter<= counter +1;
		end
	end
		
 
	 if (figi==1) 
	 begin 		
	 jaja<=1;
	 jeje<=28'd1;
		end
	 
		
	 else if (figi==0) 
	 begin
		if (jaja==0)
		jeje<=0;
		else if (jaja>0)
		jaja<=jaja+0;
		
	end
		
	////////////////////////////////////////////////////////////////////////////		
		

 if (jaja==0)
 begin


		if (flag==1) begin
		   if (x<=26'd49_999_999)
							begin 	// stops motor for 1 second using inputs						
							temp_IN1 <=1;
							temp_IN2 <=1;
							temp_IN4 <=1;
			            temp_IN3 <=1;
	
						   x<=x+1;
							flag<=1;
							end
		
	     else if (x==26'd49_999_999) 
	     begin
			flag<=0;
			x<=0;
			end
	 end
	
 else if (flag==0)
	begin //forward direction for motors
		if (turner==0)
		  begin
			 temp_IN1 <=1;
			 temp_IN2 <=0;
			 temp_IN4 <=1;
			temp_IN3 <=0;
	       x<=0;
			 tune<=0;
		  end
		
	else if (turner ==1)
		begin
			if (superturner==0) //Left turn
			begin
			temp_IN1 <=0;
			 temp_IN2 <=1;
			 temp_IN4 <=1;
			temp_IN3 <=0;
	       x<=0;
			end
			
			else if (superturner==1) //Right turn
			begin
			temp_IN1 <=1;
			 temp_IN2 <=0;
			 temp_IN4 <=0;
			temp_IN3 <=1;
	       x<=0;
			end
				
     end
   end	

end
		
else  if (jaja>0)
begin	
   
	
	if (jeje==1) //5-second count up
		flaga<=1;		
	else if (jeje==28'd250000000) // 5-second count down
	flaga<=0;
	
	
		 if (flaga==1)
		 
		 begin //5-second stop
		temp_IN1 <=1;
		temp_IN2 <=1;
		temp_IN4 <=1;
		temp_IN3 <=1;
		 jeje<=jeje+1;
		 end
		 
		 else if(flaga==0)
		 
		 begin     //permanent stop
		 flaga<=1;
		 jeje<=1;
		 end		
			
end
				

if (btn==1)
begin
jaja<=0;
jeje<=0;
tune<=1;
 rotation<=1;// throw output reg flag to Frequency_Counter to set value to 180- degree turn case
end

else if (btn==0)


rotation<=0;
end

	endmodule
