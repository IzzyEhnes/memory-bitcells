// Izzy Ehnes
// DQ4.v -- array of 4 DQ F/F
// Version: Icarus Verilog v. 11.0
// Compile: $ iverilog -o DQ4 DQ4.v
// Run: $ vvp DQ4

module SR(S, R, O);
    input S, R;
    output O;

    wire top, bot;

    nor(top, S, bot);
    nor(bot, R, top);

    assign #1 O = bot;
endmodule

module DQ(D, en, Q);
    input D, en;
    output Q;

    SR SR0((D & en), (en & ~D), Q);
endmodule

module DQ4(D, en, Q);
    input en;
    input [0:3] D;
    output [0:3] Q;

    DQ myDQ0(D[0], en, Q[0]);
    DQ myDQ1(D[1], en, Q[1]);
    DQ myDQ2(D[2], en, Q[2]);
    DQ myDQ3(D[3], en, Q[3]);
endmodule

module TestMod;
   reg [0:3] D;
   reg en;
   wire [0:3] Q;

   DQ4 myDQ4(D, en, Q);

   initial begin
      $monitor("%4d  %b  %b  %b", $time, D, en, Q);
      $display("Time  D...  en Q...");
      $display("----  ----  -  ----");
   end

   always begin
      #1; D = 4'b0000; #1; en = 1; #1; en = 0; #1;
      #1; D = 4'b0001; #1; en = 1; #1; en = 0; #1;
      #1; D = 4'b0010; #1; en = 1; #1; en = 0; #1;
      #1; D = 4'b0011; #1; en = 1; #1; en = 0; #1;
      #1; D = 4'b0100; #1; en = 1; #1; en = 0; #1;
      #1; D = 4'b0101; #1; en = 1; #1; en = 0; #1;
      #1; D = 4'b0110; #1; en = 1; #1; en = 0; #1;
      #1; D = 4'b0111; #1; en = 1; #1; en = 0; #1;
      #1; D = 4'b1000; #1; en = 1; #1; en = 0; #1;
      #1; D = 4'b1001; #1; en = 1; #1; en = 0; #1;
      #1; D = 4'b1010; #1; en = 1; #1; en = 0; #1;
      #1; D = 4'b1011; #1; en = 1; #1; en = 0; #1;
      #1; D = 4'b1100; #1; en = 1; #1; en = 0; #1;
      #1; D = 4'b1101; #1; en = 1; #1; en = 0; #1;
      #1; D = 4'b1110; #1; en = 1; #1; en = 0; #1;
      #1; D = 4'b1111; #1; en = 1; #1; en = 0; #1;
   end

   initial #69 $finish;
endmodule
