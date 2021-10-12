////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: top_synthesis.v
// /___/   /\     Timestamp: Fri Oct 08 16:17:33 2021
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim top.ngc top_synthesis.v 
// Device	: xc7a100t-3-csg324
// Input file	: top.ngc
// Output file	: C:\xlinxsource\Pract2FSM\netgen\synthesis\top_synthesis.v
// # of Modules	: 1
// Design Name	: top
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module top (
  clk, CPU_RESET, BTNC, BTNU, SW, LED
);
  input clk;
  input CPU_RESET;
  input BTNC;
  input BTNU;
  input [4 : 0] SW;
  output [3 : 0] LED;
  wire SW_3_IBUF_0;
  wire SW_2_IBUF_1;
  wire SW_1_IBUF_2;
  wire SW_0_IBUF_3;
  wire clk_BUFGP_4;
  wire CPU_RESET_IBUF_5;
  wire BTNU_IBUF_6;
  wire \FREQ_CO/co_7 ;
  wire \b_f_u/BTN_CEO_8 ;
  wire LED_3_OBUF_9;
  wire LED_2_OBUF_10;
  wire LED_1_OBUF_11;
  wire LED_0_OBUF_12;
  wire RST_I_13;
  wire CPU_RESET_inv;
  wire \FREQ_CO/GND_2_o_counter[16]_LessThan_1_o ;
  wire \FREQ_CO/GND_2_o_counter[16]_LessThan_1_o_inv ;
  wire \FREQ_CO/Mcount_counter ;
  wire \FREQ_CO/Mcount_counter1 ;
  wire \FREQ_CO/Mcount_counter2 ;
  wire \FREQ_CO/Mcount_counter3 ;
  wire \FREQ_CO/Mcount_counter4 ;
  wire \FREQ_CO/Mcount_counter5 ;
  wire \FREQ_CO/Mcount_counter6 ;
  wire \FREQ_CO/Mcount_counter7 ;
  wire \FREQ_CO/Mcount_counter8 ;
  wire \FREQ_CO/Mcount_counter9 ;
  wire \FREQ_CO/Mcount_counter10 ;
  wire \FREQ_CO/Mcount_counter11 ;
  wire \FREQ_CO/Mcount_counter12 ;
  wire \FREQ_CO/Mcount_counter13 ;
  wire \b_f_u/FLTR_CNT[3]_BTN_S1_AND_6_o1_73 ;
  wire \b_f_u/Mcount_FLTR_CNT3 ;
  wire \b_f_u/Mcount_FLTR_CNT2 ;
  wire \b_f_u/Mcount_FLTR_CNT1 ;
  wire \b_f_u/Mcount_FLTR_CNT ;
  wire \b_f_u/_n0023_inv ;
  wire \b_f_u/FLTR_CNT[3]_BTN_S1_AND_6_o ;
  wire \b_f_u/BTN_S2_84 ;
  wire \b_f_u/BTN_S1_85 ;
  wire \b_f_u/BTN_D_86 ;
  wire \FREQ_CO/GND_2_o_counter[16]_LessThan_1_o2 ;
  wire \FREQ_CO/GND_2_o_counter[16]_LessThan_1_o21_92 ;
  wire \FREQ_CO/GND_2_o_counter[16]_LessThan_1_o22_93 ;
  wire \b_f_u/BTN_S2_rstpot_105 ;
  wire N2;
  wire [14 : 0] \FREQ_CO/counter ;
  wire [13 : 0] \FREQ_CO/Mcount_counter_lut ;
  wire [12 : 0] \FREQ_CO/Mcount_counter_cy ;
  wire [3 : 0] \b_f_u/FLTR_CNT ;
  wire [3 : 0] \FSM1/state ;
  GND   XST_GND (
    .G(\FREQ_CO/counter [14])
  );
  FDP   RST_I (
    .C(clk_BUFGP_4),
    .D(\FREQ_CO/counter [14]),
    .PRE(CPU_RESET_inv),
    .Q(RST_I_13)
  );
  FDC   \FREQ_CO/co  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o ),
    .Q(\FREQ_CO/co_7 )
  );
  MUXCY   \FREQ_CO/Mcount_counter_cy<0>  (
    .CI(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o_inv ),
    .DI(\FREQ_CO/counter [14]),
    .S(\FREQ_CO/Mcount_counter_lut [0]),
    .O(\FREQ_CO/Mcount_counter_cy [0])
  );
  XORCY   \FREQ_CO/Mcount_counter_xor<0>  (
    .CI(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o_inv ),
    .LI(\FREQ_CO/Mcount_counter_lut [0]),
    .O(\FREQ_CO/Mcount_counter )
  );
  MUXCY   \FREQ_CO/Mcount_counter_cy<1>  (
    .CI(\FREQ_CO/Mcount_counter_cy [0]),
    .DI(\FREQ_CO/counter [14]),
    .S(\FREQ_CO/Mcount_counter_lut [1]),
    .O(\FREQ_CO/Mcount_counter_cy [1])
  );
  XORCY   \FREQ_CO/Mcount_counter_xor<1>  (
    .CI(\FREQ_CO/Mcount_counter_cy [0]),
    .LI(\FREQ_CO/Mcount_counter_lut [1]),
    .O(\FREQ_CO/Mcount_counter1 )
  );
  MUXCY   \FREQ_CO/Mcount_counter_cy<2>  (
    .CI(\FREQ_CO/Mcount_counter_cy [1]),
    .DI(\FREQ_CO/counter [14]),
    .S(\FREQ_CO/Mcount_counter_lut [2]),
    .O(\FREQ_CO/Mcount_counter_cy [2])
  );
  XORCY   \FREQ_CO/Mcount_counter_xor<2>  (
    .CI(\FREQ_CO/Mcount_counter_cy [1]),
    .LI(\FREQ_CO/Mcount_counter_lut [2]),
    .O(\FREQ_CO/Mcount_counter2 )
  );
  MUXCY   \FREQ_CO/Mcount_counter_cy<3>  (
    .CI(\FREQ_CO/Mcount_counter_cy [2]),
    .DI(\FREQ_CO/counter [14]),
    .S(\FREQ_CO/Mcount_counter_lut [3]),
    .O(\FREQ_CO/Mcount_counter_cy [3])
  );
  XORCY   \FREQ_CO/Mcount_counter_xor<3>  (
    .CI(\FREQ_CO/Mcount_counter_cy [2]),
    .LI(\FREQ_CO/Mcount_counter_lut [3]),
    .O(\FREQ_CO/Mcount_counter3 )
  );
  MUXCY   \FREQ_CO/Mcount_counter_cy<4>  (
    .CI(\FREQ_CO/Mcount_counter_cy [3]),
    .DI(\FREQ_CO/counter [14]),
    .S(\FREQ_CO/Mcount_counter_lut [4]),
    .O(\FREQ_CO/Mcount_counter_cy [4])
  );
  XORCY   \FREQ_CO/Mcount_counter_xor<4>  (
    .CI(\FREQ_CO/Mcount_counter_cy [3]),
    .LI(\FREQ_CO/Mcount_counter_lut [4]),
    .O(\FREQ_CO/Mcount_counter4 )
  );
  MUXCY   \FREQ_CO/Mcount_counter_cy<5>  (
    .CI(\FREQ_CO/Mcount_counter_cy [4]),
    .DI(\FREQ_CO/counter [14]),
    .S(\FREQ_CO/Mcount_counter_lut [5]),
    .O(\FREQ_CO/Mcount_counter_cy [5])
  );
  XORCY   \FREQ_CO/Mcount_counter_xor<5>  (
    .CI(\FREQ_CO/Mcount_counter_cy [4]),
    .LI(\FREQ_CO/Mcount_counter_lut [5]),
    .O(\FREQ_CO/Mcount_counter5 )
  );
  MUXCY   \FREQ_CO/Mcount_counter_cy<6>  (
    .CI(\FREQ_CO/Mcount_counter_cy [5]),
    .DI(\FREQ_CO/counter [14]),
    .S(\FREQ_CO/Mcount_counter_lut [6]),
    .O(\FREQ_CO/Mcount_counter_cy [6])
  );
  XORCY   \FREQ_CO/Mcount_counter_xor<6>  (
    .CI(\FREQ_CO/Mcount_counter_cy [5]),
    .LI(\FREQ_CO/Mcount_counter_lut [6]),
    .O(\FREQ_CO/Mcount_counter6 )
  );
  MUXCY   \FREQ_CO/Mcount_counter_cy<7>  (
    .CI(\FREQ_CO/Mcount_counter_cy [6]),
    .DI(\FREQ_CO/counter [14]),
    .S(\FREQ_CO/Mcount_counter_lut [7]),
    .O(\FREQ_CO/Mcount_counter_cy [7])
  );
  XORCY   \FREQ_CO/Mcount_counter_xor<7>  (
    .CI(\FREQ_CO/Mcount_counter_cy [6]),
    .LI(\FREQ_CO/Mcount_counter_lut [7]),
    .O(\FREQ_CO/Mcount_counter7 )
  );
  MUXCY   \FREQ_CO/Mcount_counter_cy<8>  (
    .CI(\FREQ_CO/Mcount_counter_cy [7]),
    .DI(\FREQ_CO/counter [14]),
    .S(\FREQ_CO/Mcount_counter_lut [8]),
    .O(\FREQ_CO/Mcount_counter_cy [8])
  );
  XORCY   \FREQ_CO/Mcount_counter_xor<8>  (
    .CI(\FREQ_CO/Mcount_counter_cy [7]),
    .LI(\FREQ_CO/Mcount_counter_lut [8]),
    .O(\FREQ_CO/Mcount_counter8 )
  );
  MUXCY   \FREQ_CO/Mcount_counter_cy<9>  (
    .CI(\FREQ_CO/Mcount_counter_cy [8]),
    .DI(\FREQ_CO/counter [14]),
    .S(\FREQ_CO/Mcount_counter_lut [9]),
    .O(\FREQ_CO/Mcount_counter_cy [9])
  );
  XORCY   \FREQ_CO/Mcount_counter_xor<9>  (
    .CI(\FREQ_CO/Mcount_counter_cy [8]),
    .LI(\FREQ_CO/Mcount_counter_lut [9]),
    .O(\FREQ_CO/Mcount_counter9 )
  );
  MUXCY   \FREQ_CO/Mcount_counter_cy<10>  (
    .CI(\FREQ_CO/Mcount_counter_cy [9]),
    .DI(\FREQ_CO/counter [14]),
    .S(\FREQ_CO/Mcount_counter_lut [10]),
    .O(\FREQ_CO/Mcount_counter_cy [10])
  );
  XORCY   \FREQ_CO/Mcount_counter_xor<10>  (
    .CI(\FREQ_CO/Mcount_counter_cy [9]),
    .LI(\FREQ_CO/Mcount_counter_lut [10]),
    .O(\FREQ_CO/Mcount_counter10 )
  );
  MUXCY   \FREQ_CO/Mcount_counter_cy<11>  (
    .CI(\FREQ_CO/Mcount_counter_cy [10]),
    .DI(\FREQ_CO/counter [14]),
    .S(\FREQ_CO/Mcount_counter_lut [11]),
    .O(\FREQ_CO/Mcount_counter_cy [11])
  );
  XORCY   \FREQ_CO/Mcount_counter_xor<11>  (
    .CI(\FREQ_CO/Mcount_counter_cy [10]),
    .LI(\FREQ_CO/Mcount_counter_lut [11]),
    .O(\FREQ_CO/Mcount_counter11 )
  );
  MUXCY   \FREQ_CO/Mcount_counter_cy<12>  (
    .CI(\FREQ_CO/Mcount_counter_cy [11]),
    .DI(\FREQ_CO/counter [14]),
    .S(\FREQ_CO/Mcount_counter_lut [12]),
    .O(\FREQ_CO/Mcount_counter_cy [12])
  );
  XORCY   \FREQ_CO/Mcount_counter_xor<12>  (
    .CI(\FREQ_CO/Mcount_counter_cy [11]),
    .LI(\FREQ_CO/Mcount_counter_lut [12]),
    .O(\FREQ_CO/Mcount_counter12 )
  );
  XORCY   \FREQ_CO/Mcount_counter_xor<13>  (
    .CI(\FREQ_CO/Mcount_counter_cy [12]),
    .LI(\FREQ_CO/Mcount_counter_lut [13]),
    .O(\FREQ_CO/Mcount_counter13 )
  );
  FDC   \FREQ_CO/counter_0  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\FREQ_CO/Mcount_counter ),
    .Q(\FREQ_CO/counter [0])
  );
  FDC   \FREQ_CO/counter_1  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\FREQ_CO/Mcount_counter1 ),
    .Q(\FREQ_CO/counter [1])
  );
  FDC   \FREQ_CO/counter_2  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\FREQ_CO/Mcount_counter2 ),
    .Q(\FREQ_CO/counter [2])
  );
  FDC   \FREQ_CO/counter_3  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\FREQ_CO/Mcount_counter3 ),
    .Q(\FREQ_CO/counter [3])
  );
  FDC   \FREQ_CO/counter_4  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\FREQ_CO/Mcount_counter4 ),
    .Q(\FREQ_CO/counter [4])
  );
  FDC   \FREQ_CO/counter_5  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\FREQ_CO/Mcount_counter5 ),
    .Q(\FREQ_CO/counter [5])
  );
  FDC   \FREQ_CO/counter_6  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\FREQ_CO/Mcount_counter6 ),
    .Q(\FREQ_CO/counter [6])
  );
  FDC   \FREQ_CO/counter_7  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\FREQ_CO/Mcount_counter7 ),
    .Q(\FREQ_CO/counter [7])
  );
  FDC   \FREQ_CO/counter_8  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\FREQ_CO/Mcount_counter8 ),
    .Q(\FREQ_CO/counter [8])
  );
  FDC   \FREQ_CO/counter_9  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\FREQ_CO/Mcount_counter9 ),
    .Q(\FREQ_CO/counter [9])
  );
  FDC   \FREQ_CO/counter_10  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\FREQ_CO/Mcount_counter10 ),
    .Q(\FREQ_CO/counter [10])
  );
  FDC   \FREQ_CO/counter_11  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\FREQ_CO/Mcount_counter11 ),
    .Q(\FREQ_CO/counter [11])
  );
  FDC   \FREQ_CO/counter_12  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\FREQ_CO/Mcount_counter12 ),
    .Q(\FREQ_CO/counter [12])
  );
  FDC   \FREQ_CO/counter_13  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\FREQ_CO/Mcount_counter13 ),
    .Q(\FREQ_CO/counter [13])
  );
  FDCE   \b_f_u/FLTR_CNT_3  (
    .C(clk_BUFGP_4),
    .CE(\b_f_u/_n0023_inv ),
    .CLR(RST_I_13),
    .D(\b_f_u/Mcount_FLTR_CNT3 ),
    .Q(\b_f_u/FLTR_CNT [3])
  );
  FDCE   \b_f_u/FLTR_CNT_2  (
    .C(clk_BUFGP_4),
    .CE(\b_f_u/_n0023_inv ),
    .CLR(RST_I_13),
    .D(\b_f_u/Mcount_FLTR_CNT2 ),
    .Q(\b_f_u/FLTR_CNT [2])
  );
  FDCE   \b_f_u/FLTR_CNT_1  (
    .C(clk_BUFGP_4),
    .CE(\b_f_u/_n0023_inv ),
    .CLR(RST_I_13),
    .D(\b_f_u/Mcount_FLTR_CNT1 ),
    .Q(\b_f_u/FLTR_CNT [1])
  );
  FDCE   \b_f_u/FLTR_CNT_0  (
    .C(clk_BUFGP_4),
    .CE(\b_f_u/_n0023_inv ),
    .CLR(RST_I_13),
    .D(\b_f_u/Mcount_FLTR_CNT ),
    .Q(\b_f_u/FLTR_CNT [0])
  );
  FDC   \b_f_u/BTN_S1  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\b_f_u/BTN_D_86 ),
    .Q(\b_f_u/BTN_S1_85 )
  );
  FDC   \b_f_u/BTN_D  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(BTNU_IBUF_6),
    .Q(\b_f_u/BTN_D_86 )
  );
  FDC   \b_f_u/BTN_CEO  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\b_f_u/FLTR_CNT[3]_BTN_S1_AND_6_o ),
    .Q(\b_f_u/BTN_CEO_8 )
  );
  FDCE   \FSM1/state_3  (
    .C(clk_BUFGP_4),
    .CE(\b_f_u/BTN_CEO_8 ),
    .CLR(RST_I_13),
    .D(SW_3_IBUF_0),
    .Q(\FSM1/state [3])
  );
  FDCE   \FSM1/state_2  (
    .C(clk_BUFGP_4),
    .CE(\b_f_u/BTN_CEO_8 ),
    .CLR(RST_I_13),
    .D(SW_2_IBUF_1),
    .Q(\FSM1/state [2])
  );
  FDCE   \FSM1/state_1  (
    .C(clk_BUFGP_4),
    .CE(\b_f_u/BTN_CEO_8 ),
    .CLR(RST_I_13),
    .D(SW_1_IBUF_2),
    .Q(\FSM1/state [1])
  );
  FDCE   \FSM1/state_0  (
    .C(clk_BUFGP_4),
    .CE(\b_f_u/BTN_CEO_8 ),
    .CLR(RST_I_13),
    .D(SW_0_IBUF_3),
    .Q(\FSM1/state [0])
  );
  LUT6 #(
    .INIT ( 64'h00007F807F800000 ))
  \b_f_u/Mcount_FLTR_CNT_xor<3>11  (
    .I0(\b_f_u/FLTR_CNT [0]),
    .I1(\b_f_u/FLTR_CNT [1]),
    .I2(\b_f_u/FLTR_CNT [2]),
    .I3(\b_f_u/FLTR_CNT [3]),
    .I4(\b_f_u/BTN_S1_85 ),
    .I5(\b_f_u/BTN_S2_84 ),
    .O(\b_f_u/Mcount_FLTR_CNT3 )
  );
  LUT5 #(
    .INIT ( 32'h00787800 ))
  \b_f_u/Mcount_FLTR_CNT_xor<2>11  (
    .I0(\b_f_u/FLTR_CNT [0]),
    .I1(\b_f_u/FLTR_CNT [1]),
    .I2(\b_f_u/FLTR_CNT [2]),
    .I3(\b_f_u/BTN_S1_85 ),
    .I4(\b_f_u/BTN_S2_84 ),
    .O(\b_f_u/Mcount_FLTR_CNT2 )
  );
  LUT4 #(
    .INIT ( 16'h0660 ))
  \b_f_u/Mcount_FLTR_CNT_xor<1>11  (
    .I0(\b_f_u/FLTR_CNT [0]),
    .I1(\b_f_u/FLTR_CNT [1]),
    .I2(\b_f_u/BTN_S1_85 ),
    .I3(\b_f_u/BTN_S2_84 ),
    .O(\b_f_u/Mcount_FLTR_CNT1 )
  );
  LUT3 #(
    .INIT ( 8'h14 ))
  \b_f_u/Mcount_FLTR_CNT_xor<0>11  (
    .I0(\b_f_u/FLTR_CNT [0]),
    .I1(\b_f_u/BTN_S1_85 ),
    .I2(\b_f_u/BTN_S2_84 ),
    .O(\b_f_u/Mcount_FLTR_CNT )
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  \b_f_u/FLTR_CNT[3]_BTN_S1_AND_6_o11  (
    .I0(\FREQ_CO/co_7 ),
    .I1(\b_f_u/FLTR_CNT [3]),
    .I2(\b_f_u/FLTR_CNT [0]),
    .I3(\b_f_u/FLTR_CNT [1]),
    .I4(\b_f_u/FLTR_CNT [2]),
    .O(\b_f_u/FLTR_CNT[3]_BTN_S1_AND_6_o1_73 )
  );
  LUT3 #(
    .INIT ( 8'hEB ))
  \b_f_u/_n0023_inv1  (
    .I0(\FREQ_CO/co_7 ),
    .I1(\b_f_u/BTN_S1_85 ),
    .I2(\b_f_u/BTN_S2_84 ),
    .O(\b_f_u/_n0023_inv )
  );
  LUT4 #(
    .INIT ( 16'h2268 ))
  \FSM1/seq<0>1  (
    .I0(\FSM1/state [0]),
    .I1(\FSM1/state [2]),
    .I2(\FSM1/state [1]),
    .I3(\FSM1/state [3]),
    .O(LED_0_OBUF_12)
  );
  LUT4 #(
    .INIT ( 16'h495C ))
  \FSM1/seq<1>1  (
    .I0(\FSM1/state [2]),
    .I1(\FSM1/state [0]),
    .I2(\FSM1/state [3]),
    .I3(\FSM1/state [1]),
    .O(LED_1_OBUF_11)
  );
  LUT4 #(
    .INIT ( 16'h014D ))
  \FSM1/beh/Mram_Y31  (
    .I0(\FSM1/state [1]),
    .I1(\FSM1/state [2]),
    .I2(\FSM1/state [3]),
    .I3(\FSM1/state [0]),
    .O(LED_3_OBUF_9)
  );
  LUT4 #(
    .INIT ( 16'h56B1 ))
  \FSM1/beh/Mram_Y21  (
    .I0(\FSM1/state [1]),
    .I1(\FSM1/state [3]),
    .I2(\FSM1/state [2]),
    .I3(\FSM1/state [0]),
    .O(LED_2_OBUF_10)
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \FREQ_CO/GND_2_o_counter[16]_LessThan_1_o21  (
    .I0(\FREQ_CO/counter [10]),
    .I1(\FREQ_CO/counter [8]),
    .I2(\FREQ_CO/counter [9]),
    .O(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o2 )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \FREQ_CO/GND_2_o_counter[16]_LessThan_1_o22  (
    .I0(\FREQ_CO/counter [6]),
    .I1(\FREQ_CO/counter [7]),
    .I2(\FREQ_CO/counter [4]),
    .I3(\FREQ_CO/counter [5]),
    .O(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o21_92 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \FREQ_CO/GND_2_o_counter[16]_LessThan_1_o23  (
    .I0(\FREQ_CO/counter [2]),
    .I1(\FREQ_CO/counter [3]),
    .I2(\FREQ_CO/counter [0]),
    .I3(\FREQ_CO/counter [1]),
    .O(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o22_93 )
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAAAAAA8880 ))
  \FREQ_CO/GND_2_o_counter[16]_LessThan_1_o24  (
    .I0(\FREQ_CO/counter [13]),
    .I1(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o2 ),
    .I2(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o21_92 ),
    .I3(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o22_93 ),
    .I4(\FREQ_CO/counter [12]),
    .I5(\FREQ_CO/counter [11]),
    .O(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o )
  );
  IBUF   SW_3_IBUF (
    .I(SW[3]),
    .O(SW_3_IBUF_0)
  );
  IBUF   SW_2_IBUF (
    .I(SW[2]),
    .O(SW_2_IBUF_1)
  );
  IBUF   SW_1_IBUF (
    .I(SW[1]),
    .O(SW_1_IBUF_2)
  );
  IBUF   SW_0_IBUF (
    .I(SW[0]),
    .O(SW_0_IBUF_3)
  );
  IBUF   CPU_RESET_IBUF (
    .I(CPU_RESET),
    .O(CPU_RESET_IBUF_5)
  );
  IBUF   BTNU_IBUF (
    .I(BTNU),
    .O(BTNU_IBUF_6)
  );
  OBUF   LED_3_OBUF (
    .I(LED_3_OBUF_9),
    .O(LED[3])
  );
  OBUF   LED_2_OBUF (
    .I(LED_2_OBUF_10),
    .O(LED[2])
  );
  OBUF   LED_1_OBUF (
    .I(LED_1_OBUF_11),
    .O(LED[1])
  );
  OBUF   LED_0_OBUF (
    .I(LED_0_OBUF_12),
    .O(LED[0])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \b_f_u/BTN_S2_rstpot  (
    .I0(\b_f_u/FLTR_CNT[3]_BTN_S1_AND_6_o1_73 ),
    .I1(\b_f_u/BTN_S2_84 ),
    .I2(\b_f_u/BTN_S1_85 ),
    .O(\b_f_u/BTN_S2_rstpot_105 )
  );
  FDC   \b_f_u/BTN_S2  (
    .C(clk_BUFGP_4),
    .CLR(RST_I_13),
    .D(\b_f_u/BTN_S2_rstpot_105 ),
    .Q(\b_f_u/BTN_S2_84 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \FREQ_CO/Mcount_counter_lut<11>  (
    .I0(\FREQ_CO/counter [13]),
    .I1(\FREQ_CO/counter [11]),
    .O(\FREQ_CO/Mcount_counter_lut [11])
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \FREQ_CO/Mcount_counter_lut<12>  (
    .I0(\FREQ_CO/counter [13]),
    .I1(\FREQ_CO/counter [12]),
    .O(\FREQ_CO/Mcount_counter_lut [12])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \FREQ_CO/GND_2_o_counter[16]_LessThan_1_o24_SW0  (
    .I0(\FREQ_CO/counter [12]),
    .I1(\FREQ_CO/counter [11]),
    .O(N2)
  );
  LUT6 #(
    .INIT ( 64'h222A222A222A2A2A ))
  \FREQ_CO/Mcount_counter_lut<0>  (
    .I0(\FREQ_CO/counter [0]),
    .I1(\FREQ_CO/counter [13]),
    .I2(N2),
    .I3(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o2 ),
    .I4(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o22_93 ),
    .I5(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o21_92 ),
    .O(\FREQ_CO/Mcount_counter_lut [0])
  );
  LUT6 #(
    .INIT ( 64'h222A222A222A2A2A ))
  \FREQ_CO/Mcount_counter_lut<1>  (
    .I0(\FREQ_CO/counter [1]),
    .I1(\FREQ_CO/counter [13]),
    .I2(N2),
    .I3(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o2 ),
    .I4(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o22_93 ),
    .I5(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o21_92 ),
    .O(\FREQ_CO/Mcount_counter_lut [1])
  );
  LUT6 #(
    .INIT ( 64'h222A222A222A2A2A ))
  \FREQ_CO/Mcount_counter_lut<2>  (
    .I0(\FREQ_CO/counter [2]),
    .I1(\FREQ_CO/counter [13]),
    .I2(N2),
    .I3(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o2 ),
    .I4(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o22_93 ),
    .I5(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o21_92 ),
    .O(\FREQ_CO/Mcount_counter_lut [2])
  );
  LUT6 #(
    .INIT ( 64'h222A222A222A2A2A ))
  \FREQ_CO/Mcount_counter_lut<3>  (
    .I0(\FREQ_CO/counter [3]),
    .I1(\FREQ_CO/counter [13]),
    .I2(N2),
    .I3(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o2 ),
    .I4(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o22_93 ),
    .I5(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o21_92 ),
    .O(\FREQ_CO/Mcount_counter_lut [3])
  );
  LUT6 #(
    .INIT ( 64'h222A222A222A2A2A ))
  \FREQ_CO/Mcount_counter_lut<4>  (
    .I0(\FREQ_CO/counter [4]),
    .I1(\FREQ_CO/counter [13]),
    .I2(N2),
    .I3(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o2 ),
    .I4(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o22_93 ),
    .I5(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o21_92 ),
    .O(\FREQ_CO/Mcount_counter_lut [4])
  );
  LUT6 #(
    .INIT ( 64'h222A222A222A2A2A ))
  \FREQ_CO/Mcount_counter_lut<5>  (
    .I0(\FREQ_CO/counter [5]),
    .I1(\FREQ_CO/counter [13]),
    .I2(N2),
    .I3(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o2 ),
    .I4(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o22_93 ),
    .I5(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o21_92 ),
    .O(\FREQ_CO/Mcount_counter_lut [5])
  );
  LUT6 #(
    .INIT ( 64'h222A222A222A2A2A ))
  \FREQ_CO/Mcount_counter_lut<6>  (
    .I0(\FREQ_CO/counter [6]),
    .I1(\FREQ_CO/counter [13]),
    .I2(N2),
    .I3(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o2 ),
    .I4(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o22_93 ),
    .I5(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o21_92 ),
    .O(\FREQ_CO/Mcount_counter_lut [6])
  );
  LUT6 #(
    .INIT ( 64'h0F1F0F1F0F1F1F1F ))
  \FREQ_CO/GND_2_o_counter[16]_LessThan_1_o_inv1  (
    .I0(\FREQ_CO/counter [12]),
    .I1(\FREQ_CO/counter [11]),
    .I2(\FREQ_CO/counter [13]),
    .I3(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o2 ),
    .I4(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o21_92 ),
    .I5(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o22_93 ),
    .O(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o_inv )
  );
  LUT6 #(
    .INIT ( 64'h222A222A222A2A2A ))
  \FREQ_CO/Mcount_counter_lut<7>  (
    .I0(\FREQ_CO/counter [7]),
    .I1(\FREQ_CO/counter [13]),
    .I2(N2),
    .I3(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o2 ),
    .I4(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o22_93 ),
    .I5(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o21_92 ),
    .O(\FREQ_CO/Mcount_counter_lut [7])
  );
  LUT6 #(
    .INIT ( 64'h222A222A222A2A2A ))
  \FREQ_CO/Mcount_counter_lut<8>  (
    .I0(\FREQ_CO/counter [8]),
    .I1(\FREQ_CO/counter [13]),
    .I2(N2),
    .I3(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o2 ),
    .I4(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o22_93 ),
    .I5(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o21_92 ),
    .O(\FREQ_CO/Mcount_counter_lut [8])
  );
  LUT6 #(
    .INIT ( 64'h222A222A222A2A2A ))
  \FREQ_CO/Mcount_counter_lut<9>  (
    .I0(\FREQ_CO/counter [9]),
    .I1(\FREQ_CO/counter [13]),
    .I2(N2),
    .I3(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o2 ),
    .I4(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o22_93 ),
    .I5(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o21_92 ),
    .O(\FREQ_CO/Mcount_counter_lut [9])
  );
  LUT6 #(
    .INIT ( 64'h222A222A222A2A2A ))
  \FREQ_CO/Mcount_counter_lut<10>  (
    .I0(\FREQ_CO/counter [10]),
    .I1(\FREQ_CO/counter [13]),
    .I2(N2),
    .I3(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o2 ),
    .I4(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o22_93 ),
    .I5(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o21_92 ),
    .O(\FREQ_CO/Mcount_counter_lut [10])
  );
  LUT6 #(
    .INIT ( 64'h0000001010101010 ))
  \FREQ_CO/Mcount_counter_lut<13>  (
    .I0(\FREQ_CO/counter [12]),
    .I1(\FREQ_CO/counter [11]),
    .I2(\FREQ_CO/counter [13]),
    .I3(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o21_92 ),
    .I4(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o22_93 ),
    .I5(\FREQ_CO/GND_2_o_counter[16]_LessThan_1_o2 ),
    .O(\FREQ_CO/Mcount_counter_lut [13])
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \b_f_u/FLTR_CNT[3]_BTN_S1_AND_6_o1  (
    .I0(\b_f_u/BTN_S1_85 ),
    .I1(\FREQ_CO/co_7 ),
    .I2(\b_f_u/FLTR_CNT [3]),
    .I3(\b_f_u/FLTR_CNT [0]),
    .I4(\b_f_u/FLTR_CNT [1]),
    .I5(\b_f_u/FLTR_CNT [2]),
    .O(\b_f_u/FLTR_CNT[3]_BTN_S1_AND_6_o )
  );
  BUFGP   clk_BUFGP (
    .I(clk),
    .O(clk_BUFGP_4)
  );
  INV   CPU_RESET_inv1_INV_0 (
    .I(CPU_RESET_IBUF_5),
    .O(CPU_RESET_inv)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

