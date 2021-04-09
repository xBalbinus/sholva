// this file was generated by ./codegen/tbgen on 2021-04-08 18:33:06 -0400
// do NOT edit it by hand
module decode_tb();
reg clk, reset;
reg [31:0] current_vec, error_count;
reg [521:0] test_vectors [127:0];
reg [95:0] raw_instr;
reg [31:0] eax;
reg [31:0] ebx;
reg [31:0] ecx;
reg [31:0] edx;
reg [31:0] esi;
reg [31:0] edi;
reg [31:0] esp;
reg [31:0] ebp;
reg [5:0] exp_opc;
wire [5:0] opc;
reg [31:0] exp_opnd0_r;
wire [31:0] opnd0_r;
reg [31:0] exp_opnd1_r;
wire [31:0] opnd1_r;
reg [31:0] exp_opnd2_r;
wire [31:0] opnd2_r;
reg [1:0] exp_dest0_kind;
wire [1:0] dest0_kind;
reg [1:0] exp_dest1_kind;
wire [1:0] dest1_kind;
reg [31:0] exp_dest0_sel;
wire [31:0] dest0_sel;
reg [31:0] exp_dest1_sel;
wire [31:0] dest1_sel;
decode dut(
.raw_instr(raw_instr),
.eax(eax),
.ebx(ebx),
.ecx(ecx),
.edx(edx),
.esi(esi),
.edi(edi),
.esp(esp),
.ebp(ebp),
.opc(opc),
.opnd0_r(opnd0_r),
.opnd1_r(opnd1_r),
.opnd2_r(opnd2_r),
.dest0_kind(dest0_kind),
.dest1_kind(dest1_kind),
.dest0_sel(dest0_sel),
.dest1_sel(dest1_sel)
);
always
  begin
    clk = 1; #5; clk = 0; #5;
  end
initial
  begin
    $dumpfile("decode.tb.vcd");
    $dumpvars(0, decode_tb);
    $readmemb("decode.tv", test_vectors);
    current_vec = 0; error_count = 0;
    reset = 1; #10; reset = 0;
  end
always @(posedge clk)
  begin
    #1; { raw_instr, eax, ebx, ecx, edx, esi, edi, esp, ebp, exp_opc, exp_opnd0_r, exp_opnd1_r, exp_opnd2_r, exp_dest0_kind, exp_dest1_kind, exp_dest0_sel, exp_dest1_sel } = test_vectors[current_vec];
  end
always @(negedge clk)
  begin
    if (~reset) begin
      if (exp_opc === opc || exp_opc === 6'bx) begin
  $display("TBGEN-PASS decode:%0d opc", current_vec);
end else begin
  $display("TBGEN-FAIL decode:%0d expected opc to be 0x%h, was 0x%h", current_vec, exp_opc, opc);
  error_count = error_count + 1;
end

if (exp_opnd0_r === opnd0_r || exp_opnd0_r === 32'bx) begin
  $display("TBGEN-PASS decode:%0d opnd0_r", current_vec);
end else begin
  $display("TBGEN-FAIL decode:%0d expected opnd0_r to be 0x%h, was 0x%h", current_vec, exp_opnd0_r, opnd0_r);
  error_count = error_count + 1;
end

if (exp_opnd1_r === opnd1_r || exp_opnd1_r === 32'bx) begin
  $display("TBGEN-PASS decode:%0d opnd1_r", current_vec);
end else begin
  $display("TBGEN-FAIL decode:%0d expected opnd1_r to be 0x%h, was 0x%h", current_vec, exp_opnd1_r, opnd1_r);
  error_count = error_count + 1;
end

if (exp_opnd2_r === opnd2_r || exp_opnd2_r === 32'bx) begin
  $display("TBGEN-PASS decode:%0d opnd2_r", current_vec);
end else begin
  $display("TBGEN-FAIL decode:%0d expected opnd2_r to be 0x%h, was 0x%h", current_vec, exp_opnd2_r, opnd2_r);
  error_count = error_count + 1;
end

if (exp_dest0_kind === dest0_kind || exp_dest0_kind === 2'bx) begin
  $display("TBGEN-PASS decode:%0d dest0_kind", current_vec);
end else begin
  $display("TBGEN-FAIL decode:%0d expected dest0_kind to be 0x%h, was 0x%h", current_vec, exp_dest0_kind, dest0_kind);
  error_count = error_count + 1;
end

if (exp_dest1_kind === dest1_kind || exp_dest1_kind === 2'bx) begin
  $display("TBGEN-PASS decode:%0d dest1_kind", current_vec);
end else begin
  $display("TBGEN-FAIL decode:%0d expected dest1_kind to be 0x%h, was 0x%h", current_vec, exp_dest1_kind, dest1_kind);
  error_count = error_count + 1;
end

if (exp_dest0_sel === dest0_sel || exp_dest0_sel === 32'bx) begin
  $display("TBGEN-PASS decode:%0d dest0_sel", current_vec);
end else begin
  $display("TBGEN-FAIL decode:%0d expected dest0_sel to be 0x%h, was 0x%h", current_vec, exp_dest0_sel, dest0_sel);
  error_count = error_count + 1;
end

if (exp_dest1_sel === dest1_sel || exp_dest1_sel === 32'bx) begin
  $display("TBGEN-PASS decode:%0d dest1_sel", current_vec);
end else begin
  $display("TBGEN-FAIL decode:%0d expected dest1_sel to be 0x%h, was 0x%h", current_vec, exp_dest1_sel, dest1_sel);
  error_count = error_count + 1;
end

      current_vec = current_vec + 1;

      if (test_vectors[current_vec] === 522'bx) begin
        $display("TBGEN-DONE decode %0d errors=%0d", current_vec, error_count);
        $finish;
      end
    end
  end
endmodule
