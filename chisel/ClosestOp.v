module PointOps(
    input [63:0] io_p1x,
    input [63:0] io_p1y,
    input [3:0] io_operation,
    input [63:0] io_p2x,
    input [63:0] io_p2y,
    input [63:0] io_den,
    output[63:0] io_poutx,
    output[63:0] io_pouty,
    output[63:0] io_out
);

  wire[63:0] T0;
  wire[63:0] T1;
  wire[63:0] T2;
  wire[63:0] T3;
  wire[63:0] T4;
  wire T5;
  wire T6;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire[63:0] T15;
  wire[63:0] T16;
  wire[63:0] T17;
  wire[63:0] T18;
  wire[63:0] T19;
  wire T20;
  wire T21;
  wire[63:0] T22;
  wire T23;
  wire T24;
  wire[63:0] T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire[63:0] T30;
  wire[63:0] T31;
  wire[63:0] T32;
  wire[63:0] T33;
  wire[63:0] T34;
  wire[63:0] T35;
  wire[63:0] T36;


  assign io_out = T0;
  assign T0 = T5 ? T1 : 64'h0;
  assign T1 = dsqrt T2;
  assign T2 = T4 d+ T3;
  assign T3 = io_p1y d* io_p1y;
  assign T4 = io_p1x d* io_p1x;
  assign T5 = T7 & T6;
  assign T6 = io_operation == 4'h4;
  assign T7 = T8 ^ 1'h1;
  assign T8 = T10 | T9;
  assign T9 = io_operation == 4'h3;
  assign T10 = T12 | T11;
  assign T11 = io_operation == 4'h2;
  assign T12 = T14 | T13;
  assign T13 = io_operation == 4'h1;
  assign T14 = io_operation == 4'h0;
  assign io_pouty = T15;
  assign T15 = T28 ? 64'h0 : T16;
  assign T16 = T26 ? T25 : T17;
  assign T17 = T23 ? T22 : T18;
  assign T18 = T20 ? T19 : 64'h0;
  assign T19 = io_p1y d+ io_p2y;
  assign T20 = T21 & T13;
  assign T21 = T14 ^ 1'h1;
  assign T22 = io_p1y d- io_p2y;
  assign T23 = T24 & T11;
  assign T24 = T12 ^ 1'h1;
  assign T25 = io_p1y d/ io_den;
  assign T26 = T27 & T9;
  assign T27 = T10 ^ 1'h1;
  assign T28 = T29 ^ 1'h1;
  assign T29 = T8 | T6;
  assign io_poutx = T30;
  assign T30 = T28 ? 64'h0 : T31;
  assign T31 = T26 ? T36 : T32;
  assign T32 = T23 ? T35 : T33;
  assign T33 = T20 ? T34 : 64'h0;
  assign T34 = io_p1x d+ io_p2x;
  assign T35 = io_p1x d- io_p2x;
  assign T36 = io_p1x d/ io_den;
endmodule

module DistanceOp(
    input [63:0] io_p1x,
    input [63:0] io_p1y,
    input [63:0] io_p2x,
    input [63:0] io_p2y,
    output[63:0] io_out
);

  wire[63:0] po1_io_poutx;
  wire[63:0] po1_io_pouty;
  wire[63:0] po2_io_out;


  assign io_out = po2_io_out;
  PointOps po1(
       .io_p1x( io_p1x ),
       .io_p1y( io_p1y ),
       .io_operation( 4'h2 ),
       .io_p2x( io_p2x ),
       .io_p2y( io_p2y ),
       //.io_den(  )
       .io_poutx( po1_io_poutx ),
       .io_pouty( po1_io_pouty )
       //.io_out(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign po1.io_den = {2{$random}};
// synthesis translate_on
`endif
  PointOps po2(
       .io_p1x( po1_io_poutx ),
       .io_p1y( po1_io_pouty ),
       .io_operation( 4'h4 ),
       //.io_p2x(  )
       //.io_p2y(  )
       //.io_den(  )
       //.io_poutx(  )
       //.io_pouty(  )
       .io_out( po2_io_out )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign po2.io_p2x = {2{$random}};
    assign po2.io_p2y = {2{$random}};
    assign po2.io_den = {2{$random}};
// synthesis translate_on
`endif
endmodule

module Min2Op_0(
    input [63:0] io_value,
    input [31:0] io_oldMin,
    input [63:0] io_oldValue,
    output[31:0] io_newMin,
    output[63:0] io_newValue
);

  wire[63:0] T0;
  wire T1;
  wire[31:0] T2;


  assign io_newValue = T0;
  assign T0 = T1 ? io_oldValue : io_value;
  assign T1 = io_value d>= io_oldValue;
  assign io_newMin = T2;
  assign T2 = T1 ? io_oldMin : 32'h1;
endmodule

module Min2Op_1(
    input [63:0] io_value,
    input [31:0] io_oldMin,
    input [63:0] io_oldValue,
    output[31:0] io_newMin,
    output[63:0] io_newValue
);

  wire[63:0] T0;
  wire T1;
  wire[31:0] T2;


  assign io_newValue = T0;
  assign T0 = T1 ? io_oldValue : io_value;
  assign T1 = io_value d>= io_oldValue;
  assign io_newMin = T2;
  assign T2 = T1 ? io_oldMin : 32'h2;
endmodule

module Min2Op_2(
    input [63:0] io_value,
    input [31:0] io_oldMin,
    input [63:0] io_oldValue,
    output[31:0] io_newMin,
    output[63:0] io_newValue
);

  wire[63:0] T0;
  wire T1;
  wire[31:0] T2;


  assign io_newValue = T0;
  assign T0 = T1 ? io_oldValue : io_value;
  assign T1 = io_value d>= io_oldValue;
  assign io_newMin = T2;
  assign T2 = T1 ? io_oldMin : 32'h3;
endmodule

module Min2Op_3(
    input [63:0] io_value,
    input [31:0] io_oldMin,
    input [63:0] io_oldValue,
    output[31:0] io_newMin,
    output[63:0] io_newValue
);

  wire[63:0] T0;
  wire T1;
  wire[31:0] T2;


  assign io_newValue = T0;
  assign T0 = T1 ? io_oldValue : io_value;
  assign T1 = io_value d>= io_oldValue;
  assign io_newMin = T2;
  assign T2 = T1 ? io_oldMin : 32'h4;
endmodule

module Min2Op_4(
    input [63:0] io_value,
    input [31:0] io_oldMin,
    input [63:0] io_oldValue,
    output[31:0] io_newMin,
    output[63:0] io_newValue
);

  wire[63:0] T0;
  wire T1;
  wire[31:0] T2;


  assign io_newValue = T0;
  assign T0 = T1 ? io_oldValue : io_value;
  assign T1 = io_value d>= io_oldValue;
  assign io_newMin = T2;
  assign T2 = T1 ? io_oldMin : 32'h5;
endmodule

module Min2Op_5(
    input [63:0] io_value,
    input [31:0] io_oldMin,
    input [63:0] io_oldValue,
    output[31:0] io_newMin,
    output[63:0] io_newValue
);

  wire[63:0] T0;
  wire T1;
  wire[31:0] T2;


  assign io_newValue = T0;
  assign T0 = T1 ? io_oldValue : io_value;
  assign T1 = io_value d>= io_oldValue;
  assign io_newMin = T2;
  assign T2 = T1 ? io_oldMin : 32'h6;
endmodule

module Min2Op_6(
    input [63:0] io_value,
    input [31:0] io_oldMin,
    input [63:0] io_oldValue,
    output[31:0] io_newMin,
    output[63:0] io_newValue
);

  wire[63:0] T0;
  wire T1;
  wire[31:0] T2;


  assign io_newValue = T0;
  assign T0 = T1 ? io_oldValue : io_value;
  assign T1 = io_value d>= io_oldValue;
  assign io_newMin = T2;
  assign T2 = T1 ? io_oldMin : 32'h7;
endmodule

module Min2Op_7(
    input [63:0] io_value,
    input [31:0] io_oldMin,
    input [63:0] io_oldValue,
    output[31:0] io_newMin,
    output[63:0] io_newValue
);

  wire[63:0] T0;
  wire T1;
  wire[31:0] T2;


  assign io_newValue = T0;
  assign T0 = T1 ? io_oldValue : io_value;
  assign T1 = io_value d>= io_oldValue;
  assign io_newMin = T2;
  assign T2 = T1 ? io_oldMin : 32'h8;
endmodule

module Min2Op_8(
    input [63:0] io_value,
    input [31:0] io_oldMin,
    input [63:0] io_oldValue,
    output[31:0] io_newMin,
    output[63:0] io_newValue
);

  wire[63:0] T0;
  wire T1;
  wire[31:0] T2;


  assign io_newValue = T0;
  assign T0 = T1 ? io_oldValue : io_value;
  assign T1 = io_value d>= io_oldValue;
  assign io_newMin = T2;
  assign T2 = T1 ? io_oldMin : 32'h9;
endmodule

module MinOp(
    input [63:0] io_values_9,
    input [63:0] io_values_8,
    input [63:0] io_values_7,
    input [63:0] io_values_6,
    input [63:0] io_values_5,
    input [63:0] io_values_4,
    input [63:0] io_values_3,
    input [63:0] io_values_2,
    input [63:0] io_values_1,
    input [63:0] io_values_0,
    output[31:0] io_out
);

  wire[31:0] Min2Op_io_newMin;
  wire[63:0] Min2Op_io_newValue;
  wire[31:0] Min2Op_1_io_newMin;
  wire[63:0] Min2Op_1_io_newValue;
  wire[31:0] Min2Op_2_io_newMin;
  wire[63:0] Min2Op_2_io_newValue;
  wire[31:0] Min2Op_3_io_newMin;
  wire[63:0] Min2Op_3_io_newValue;
  wire[31:0] Min2Op_4_io_newMin;
  wire[63:0] Min2Op_4_io_newValue;
  wire[31:0] Min2Op_5_io_newMin;
  wire[63:0] Min2Op_5_io_newValue;
  wire[31:0] Min2Op_6_io_newMin;
  wire[63:0] Min2Op_6_io_newValue;
  wire[31:0] Min2Op_7_io_newMin;
  wire[63:0] Min2Op_7_io_newValue;
  wire[31:0] Min2Op_8_io_newMin;


  assign io_out = Min2Op_8_io_newMin;
  Min2Op_0 Min2Op(
       .io_value( io_values_1 ),
       .io_oldMin( 32'h0 ),
       .io_oldValue( io_values_0 ),
       .io_newMin( Min2Op_io_newMin ),
       .io_newValue( Min2Op_io_newValue )
  );
  Min2Op_1 Min2Op_1(
       .io_value( io_values_2 ),
       .io_oldMin( Min2Op_io_newMin ),
       .io_oldValue( Min2Op_io_newValue ),
       .io_newMin( Min2Op_1_io_newMin ),
       .io_newValue( Min2Op_1_io_newValue )
  );
  Min2Op_2 Min2Op_2(
       .io_value( io_values_3 ),
       .io_oldMin( Min2Op_1_io_newMin ),
       .io_oldValue( Min2Op_1_io_newValue ),
       .io_newMin( Min2Op_2_io_newMin ),
       .io_newValue( Min2Op_2_io_newValue )
  );
  Min2Op_3 Min2Op_3(
       .io_value( io_values_4 ),
       .io_oldMin( Min2Op_2_io_newMin ),
       .io_oldValue( Min2Op_2_io_newValue ),
       .io_newMin( Min2Op_3_io_newMin ),
       .io_newValue( Min2Op_3_io_newValue )
  );
  Min2Op_4 Min2Op_4(
       .io_value( io_values_5 ),
       .io_oldMin( Min2Op_3_io_newMin ),
       .io_oldValue( Min2Op_3_io_newValue ),
       .io_newMin( Min2Op_4_io_newMin ),
       .io_newValue( Min2Op_4_io_newValue )
  );
  Min2Op_5 Min2Op_5(
       .io_value( io_values_6 ),
       .io_oldMin( Min2Op_4_io_newMin ),
       .io_oldValue( Min2Op_4_io_newValue ),
       .io_newMin( Min2Op_5_io_newMin ),
       .io_newValue( Min2Op_5_io_newValue )
  );
  Min2Op_6 Min2Op_6(
       .io_value( io_values_7 ),
       .io_oldMin( Min2Op_5_io_newMin ),
       .io_oldValue( Min2Op_5_io_newValue ),
       .io_newMin( Min2Op_6_io_newMin ),
       .io_newValue( Min2Op_6_io_newValue )
  );
  Min2Op_7 Min2Op_7(
       .io_value( io_values_8 ),
       .io_oldMin( Min2Op_6_io_newMin ),
       .io_oldValue( Min2Op_6_io_newValue ),
       .io_newMin( Min2Op_7_io_newMin ),
       .io_newValue( Min2Op_7_io_newValue )
  );
  Min2Op_8 Min2Op_8(
       .io_value( io_values_9 ),
       .io_oldMin( Min2Op_7_io_newMin ),
       .io_oldValue( Min2Op_7_io_newValue ),
       .io_newMin( Min2Op_8_io_newMin )
       //.io_newValue(  )
  );
endmodule

module ClosestOp(
    input [63:0] io_pointX,
    input [63:0] io_pointY,
    input [63:0] io_xs_9,
    input [63:0] io_xs_8,
    input [63:0] io_xs_7,
    input [63:0] io_xs_6,
    input [63:0] io_xs_5,
    input [63:0] io_xs_4,
    input [63:0] io_xs_3,
    input [63:0] io_xs_2,
    input [63:0] io_xs_1,
    input [63:0] io_xs_0,
    input [63:0] io_ys_9,
    input [63:0] io_ys_8,
    input [63:0] io_ys_7,
    input [63:0] io_ys_6,
    input [63:0] io_ys_5,
    input [63:0] io_ys_4,
    input [63:0] io_ys_3,
    input [63:0] io_ys_2,
    input [63:0] io_ys_1,
    input [63:0] io_ys_0,
    output[31:0] io_closest
);

  wire[63:0] DistanceOp_io_out;
  wire[63:0] DistanceOp_1_io_out;
  wire[63:0] DistanceOp_2_io_out;
  wire[63:0] DistanceOp_3_io_out;
  wire[63:0] DistanceOp_4_io_out;
  wire[63:0] DistanceOp_5_io_out;
  wire[63:0] DistanceOp_6_io_out;
  wire[63:0] DistanceOp_7_io_out;
  wire[63:0] DistanceOp_8_io_out;
  wire[63:0] DistanceOp_9_io_out;
  wire[31:0] mo_io_out;


  assign io_closest = mo_io_out;
  DistanceOp DistanceOp(
       .io_p1x( io_pointX ),
       .io_p1y( io_pointY ),
       .io_p2x( io_xs_0 ),
       .io_p2y( io_ys_0 ),
       .io_out( DistanceOp_io_out )
  );
  DistanceOp DistanceOp_1(
       .io_p1x( io_pointX ),
       .io_p1y( io_pointY ),
       .io_p2x( io_xs_1 ),
       .io_p2y( io_ys_1 ),
       .io_out( DistanceOp_1_io_out )
  );
  DistanceOp DistanceOp_2(
       .io_p1x( io_pointX ),
       .io_p1y( io_pointY ),
       .io_p2x( io_xs_2 ),
       .io_p2y( io_ys_2 ),
       .io_out( DistanceOp_2_io_out )
  );
  DistanceOp DistanceOp_3(
       .io_p1x( io_pointX ),
       .io_p1y( io_pointY ),
       .io_p2x( io_xs_3 ),
       .io_p2y( io_ys_3 ),
       .io_out( DistanceOp_3_io_out )
  );
  DistanceOp DistanceOp_4(
       .io_p1x( io_pointX ),
       .io_p1y( io_pointY ),
       .io_p2x( io_xs_4 ),
       .io_p2y( io_ys_4 ),
       .io_out( DistanceOp_4_io_out )
  );
  DistanceOp DistanceOp_5(
       .io_p1x( io_pointX ),
       .io_p1y( io_pointY ),
       .io_p2x( io_xs_5 ),
       .io_p2y( io_ys_5 ),
       .io_out( DistanceOp_5_io_out )
  );
  DistanceOp DistanceOp_6(
       .io_p1x( io_pointX ),
       .io_p1y( io_pointY ),
       .io_p2x( io_xs_6 ),
       .io_p2y( io_ys_6 ),
       .io_out( DistanceOp_6_io_out )
  );
  DistanceOp DistanceOp_7(
       .io_p1x( io_pointX ),
       .io_p1y( io_pointY ),
       .io_p2x( io_xs_7 ),
       .io_p2y( io_ys_7 ),
       .io_out( DistanceOp_7_io_out )
  );
  DistanceOp DistanceOp_8(
       .io_p1x( io_pointX ),
       .io_p1y( io_pointY ),
       .io_p2x( io_xs_8 ),
       .io_p2y( io_ys_8 ),
       .io_out( DistanceOp_8_io_out )
  );
  DistanceOp DistanceOp_9(
       .io_p1x( io_pointX ),
       .io_p1y( io_pointY ),
       .io_p2x( io_xs_9 ),
       .io_p2y( io_ys_9 ),
       .io_out( DistanceOp_9_io_out )
  );
  MinOp mo(
       .io_values_9( DistanceOp_9_io_out ),
       .io_values_8( DistanceOp_8_io_out ),
       .io_values_7( DistanceOp_7_io_out ),
       .io_values_6( DistanceOp_6_io_out ),
       .io_values_5( DistanceOp_5_io_out ),
       .io_values_4( DistanceOp_4_io_out ),
       .io_values_3( DistanceOp_3_io_out ),
       .io_values_2( DistanceOp_2_io_out ),
       .io_values_1( DistanceOp_1_io_out ),
       .io_values_0( DistanceOp_io_out ),
       .io_out( mo_io_out )
  );
endmodule

