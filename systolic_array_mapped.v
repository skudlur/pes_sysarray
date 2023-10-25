/* Generated by Yosys 0.32+51 (git sha1 6405bbab1, gcc 12.3.0-1ubuntu1~22.04 -fPIC -Os) */

(* top =  1  *)
(* src = "systolic_array.v:24.1-88.10" *)
module systolic_array(inp_west0, inp_west4, inp_west8, inp_west12, inp_north0, inp_north1, inp_north2, inp_north3, clk, rst, done);
  (* src = "systolic_array.v:70.2-85.5" *)
  wire [3:0] _00_;
  (* src = "systolic_array.v:70.2-85.5" *)
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  (* src = "systolic_array.v:70.2-85.5" *)
  wire _10_;
  (* src = "systolic_array.v:70.2-85.5" *)
  wire _11_;
  (* src = "systolic_array.v:70.2-85.5" *)
  wire _12_;
  (* src = "systolic_array.v:70.2-85.5" *)
  wire _13_;
  (* src = "systolic_array.v:70.2-85.5" *)
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  (* src = "systolic_array.v:32.12-32.17" *)
  wire _20_;
  (* src = "systolic_array.v:32.12-32.17" *)
  wire _21_;
  (* src = "systolic_array.v:32.12-32.17" *)
  wire _22_;
  (* src = "systolic_array.v:32.12-32.17" *)
  wire _23_;
  wire _24_;
  wire _25_;
  wire _26_;
  wire _27_;
  wire _28_;
  wire _29_;
  (* src = "systolic_array.v:31.13-31.16" *)
  wire _30_;
  wire _31_;
  wire _32_;
  wire _33_;
  wire _34_;
  wire _35_;
  (* src = "systolic_array.v:31.8-31.11" *)
  input clk;
  wire clk;
  (* src = "systolic_array.v:32.12-32.17" *)
  wire [3:0] count;
  (* src = "systolic_array.v:30.13-30.17" *)
  output done;
  wire done;
  (* src = "systolic_array.v:29.9-29.19" *)
  input [31:0] inp_north0;
  wire [31:0] inp_north0;
  (* src = "systolic_array.v:29.21-29.31" *)
  input [31:0] inp_north1;
  wire [31:0] inp_north1;
  (* src = "systolic_array.v:29.33-29.43" *)
  input [31:0] inp_north2;
  wire [31:0] inp_north2;
  (* src = "systolic_array.v:29.45-29.55" *)
  input [31:0] inp_north3;
  wire [31:0] inp_north3;
  (* src = "systolic_array.v:28.15-28.24" *)
  input [31:0] inp_west0;
  wire [31:0] inp_west0;
  (* src = "systolic_array.v:28.48-28.58" *)
  input [31:0] inp_west12;
  wire [31:0] inp_west12;
  (* src = "systolic_array.v:28.26-28.35" *)
  input [31:0] inp_west4;
  wire [31:0] inp_west4;
  (* src = "systolic_array.v:28.37-28.46" *)
  input [31:0] inp_west8;
  wire [31:0] inp_west8;
  (* src = "systolic_array.v:31.13-31.16" *)
  input rst;
  wire rst;
  sky130_fd_sc_hd__clkinv_1 _36_ (
    .A(_20_),
    .Y(_10_)
  );
  sky130_fd_sc_hd__clkinv_1 _37_ (
    .A(_21_),
    .Y(_24_)
  );
  sky130_fd_sc_hd__clkinv_1 _38_ (
    .A(_30_),
    .Y(_15_)
  );
  sky130_fd_sc_hd__nand2b_1 _39_ (
    .A_N(_22_),
    .B(_23_),
    .Y(_25_)
  );
  sky130_fd_sc_hd__nor3_1 _40_ (
    .A(_10_),
    .B(_21_),
    .C(_25_),
    .Y(_14_)
  );
  sky130_fd_sc_hd__nand3_1 _41_ (
    .A(_20_),
    .B(_24_),
    .C(_25_),
    .Y(_26_)
  );
  sky130_fd_sc_hd__o21ai_0 _42_ (
    .A1(_20_),
    .A2(_24_),
    .B1(_26_),
    .Y(_11_)
  );
  sky130_fd_sc_hd__a21oi_1 _43_ (
    .A1(_20_),
    .A2(_21_),
    .B1(_22_),
    .Y(_27_)
  );
  sky130_fd_sc_hd__nand3_1 _44_ (
    .A(_20_),
    .B(_21_),
    .C(_22_),
    .Y(_28_)
  );
  sky130_fd_sc_hd__nor2b_1 _45_ (
    .A(_27_),
    .B_N(_28_),
    .Y(_12_)
  );
  sky130_fd_sc_hd__xor2_1 _46_ (
    .A(_23_),
    .B(_28_),
    .X(_29_)
  );
  sky130_fd_sc_hd__nor2_1 _47_ (
    .A(_14_),
    .B(_29_),
    .Y(_13_)
  );
  sky130_fd_sc_hd__clkinv_1 _48_ (
    .A(_30_),
    .Y(_16_)
  );
  sky130_fd_sc_hd__clkinv_1 _49_ (
    .A(_30_),
    .Y(_17_)
  );
  sky130_fd_sc_hd__clkinv_1 _50_ (
    .A(_30_),
    .Y(_18_)
  );
  sky130_fd_sc_hd__clkinv_1 _51_ (
    .A(_30_),
    .Y(_19_)
  );
  (* src = "systolic_array.v:70.2-85.5" *)
  sky130_fd_sc_hd__dfrtp_1 _52_ (
    .CLK(clk),
    .D(_01_),
    .Q(done),
    .RESET_B(_31_)
  );
  (* src = "systolic_array.v:70.2-85.5" *)
  sky130_fd_sc_hd__dfrtp_1 _53_ (
    .CLK(clk),
    .D(_00_[0]),
    .Q(count[0]),
    .RESET_B(_32_)
  );
  (* src = "systolic_array.v:70.2-85.5" *)
  sky130_fd_sc_hd__dfrtp_1 _54_ (
    .CLK(clk),
    .D(_00_[1]),
    .Q(count[1]),
    .RESET_B(_33_)
  );
  (* src = "systolic_array.v:70.2-85.5" *)
  sky130_fd_sc_hd__dfrtp_1 _55_ (
    .CLK(clk),
    .D(_00_[2]),
    .Q(count[2]),
    .RESET_B(_34_)
  );
  (* src = "systolic_array.v:70.2-85.5" *)
  sky130_fd_sc_hd__dfrtp_1 _56_ (
    .CLK(clk),
    .D(_00_[3]),
    .Q(count[3]),
    .RESET_B(_35_)
  );
  assign _20_ = count[0];
  assign _21_ = count[1];
  assign _22_ = count[2];
  assign _23_ = count[3];
  assign _01_ = _14_;
  assign _00_[0] = _10_;
  assign _00_[1] = _11_;
  assign _00_[2] = _12_;
  assign _00_[3] = _13_;
  assign _30_ = rst;
  assign _31_ = _15_;
  assign _32_ = _16_;
  assign _33_ = _17_;
  assign _34_ = _18_;
  assign _35_ = _19_;
endmodule