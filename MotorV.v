`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Texas Tech University
// Engineer: David Selasi Koblah
// 
// Create Date:    15:53:43 02/18/2017 
// Design Name: 	PWM Design ; Motor Contol
// Module Name:    Motor 
// Project Name: 	Rover 5 Emergency Response Module 
// Target Devices: Basys 2 Board
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
module Motor(
	//input [3:0] sl, // Ports declared
	//input [3:0] sr,
	input clk,
	input KS_Circuit_out1,
	input KS_Circuit_out2,
	input btn3,
	input freq1,
	input freq,
	input indus,
	input indie,
	output PWM_out_L,
	output PWM_out_R,
	output GREEN,
	output RED,
	output BLUE,
	output IN1,
	output IN2,
	output IN3,
	output IN4,
	output servo,
	output LD1,
	output LD2,
	output LD3,
	output LD4,
	output LD5,
	output LD6,
	output LD7,
	output LD8
	);
	

wire [16:0] angleval;
wire hold;
wire [16:0] locker;
wire turner;
wire superturner;
wire rotation;
wire indusoff;
wire tune;

 
CurrentSensor inst(.clk1(clk), .KS_Circuit_out(KS_Circuit_out1), .KS_Circuit_outer(KS_Circuit_out2), .btn(btn3), .indusensor(indus), .indie(indie), .turner(turner), .superturner(superturner) , .indusoff(indusoff), .IN_1(IN1), .IN_2(IN2), .IN_3(IN3), .IN_4(IN4), .rotation(rotation), .tune(tune));	
 
//PWM_Mod inst1( .clk2(clk), .flaga(flagi), .tempLED5(tempLEDfive), .tempLED6(tempLEDsix),.tempLED7(tempLEDseven), .tempLED8(tempLEDeight) ,  .angle(angleval), .PWMout_L(PWM_out_L), .PWMout_R(PWM_out_R),  .holder(hold));

Servo_Motor_PWM inst2( .clk3(clk), .holder(hold), .tune(tune), .lock(locker),  .PWM_servo(servo), .angle(angleval));

Frequency_Counter inst3(.clk4(clk), .freq(freq), .freq1(freq1), .angle(angleval), .rotation(rotation), .LED1(LD1), .LED2(LD2), .LED3(LD3), .LED4(LD4), .LED5(LD5), .LED6(LD6), .LED7(LD7), .LED8(LD8), .RED(RED), .BLUE(BLUE), .GREEN(GREEN), .PWMout_L(PWM_out_L), .PWMout_R(PWM_out_R), .holder(hold), .lock(locker), .turner(turner), .superturner(superturner), .indusoff(indusoff));
endmodule


 