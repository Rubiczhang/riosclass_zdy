module hehe_tb;

`ifndef WAV_FILE
`define WAV_FILE "waves.fsdb"
`endif

  parameter DRAM_SIZE = 1 << 18;
  parameter PERIOD = 20;
  parameter SIMU_TIME =30000;


  reg             clk;
  reg             rst;

  always #(PERIOD / 2) clk = ~clk;

  wire [31:0] dcache_mem_dat;   //dcache to mem, data
  wire [31:0] dcache_mem_adr;
  wire [31:0] mem_dcache_dat;
  reg mem_dcache_resp;          //response means there is data come back
  wire mem_dcache_ack;          //ack connects to the wishbone port of cache


  wire [3:0]  m2_wbd_sel_o;     //unused
  wire [9:0] m2_wbd_bl_o;       //unused
  wire m2_wbd_bry_o;            //burst ready unused
  wire m2_wbd_we_w;             //write enable
  wire m2_wbd_cyc_w;            //The cycle output [CYC_O]; when asserted; indicates that a valid bus cycle is in progress.
  wire m2_wbd_stb_w;            //The strobe output [STB_O] indicates a valid data transfer cycle. It is used to qualify various

  wire [31:0] icache_mem_adr;
  wire [31:0] mem_icache_dat;
  reg mem_icache_resp;
  wire mem_icache_ack;          //ack connects to the wishbone port of cache

  wire [3:0] m3_wbd_sel_o;
  wire [9:0] m3_wbd_bl_o;
  wire m3_wbd_bry_o;
  wire m3_wbd_we_w;
  wire m3_wbd_cyc_w;
  wire m3_wbd_stb_w;

  wire [3:0] dcache_mem_we;
  assign dcache_mem_we = {4{m2_wbd_we_w}};


  // always @(posedge clk) begin
  //   m2_wbd_cyc_reg <= m2_wbd_cyc_reg_w;
  //   m3_wbd_cyc_reg <= m3_wbd_cyc_reg_w;
  // end
  always @(posedge clk) begin //to-do
    mem_dcache_resp <= m2_wbd_cyc_w & m2_wbd_stb_w;
    mem_icache_resp <= m3_wbd_cyc_w & m3_wbd_stb_w;
  end

  assign mem_dcache_ack = mem_dcache_resp & m2_wbd_cyc_w;
  assign mem_icache_ack = mem_icache_resp & m3_wbd_cyc_w;
  hehe hehe_u(
    .clk(clk),
    .reset(rst),
    .meip(0),

    .m2_wbd_dat_o(dcache_mem_dat),
    .m2_wbd_adr_o(dcache_mem_adr),
    .m2_wbd_sel_o(m2_wbd_sel_o),
    .m2_wbd_bl_o(m2_wbd_bl_o),
    .m2_wbd_bry_o(m2_wbd_bry_o),
    .m2_wbd_we_o(m2_wbd_we_w),
    .m2_wbd_cyc_o(m2_wbd_cyc_w),
    .m2_wbd_stb_o(m2_wbd_stb_w),

    .m2_wbd_dat_i(mem_dcache_dat),
    .m2_wbd_ack_i(mem_dcache_ack),
    .m2_wbd_lack_i(0),
    .m2_wbd_err_i(0),

    .m3_wbd_adr_o(icache_mem_adr),
    .m3_wbd_sel_o(m3_wbd_sel_o),
    .m3_wbd_bl_o(m3_wbd_bl_o),
    .m3_wbd_bry_o(m3_wbd_bry_o),
    .m3_wbd_we_o(m3_wbd_we_w),
    .m3_wbd_cyc_o(m3_wbd_cyc_w),
    .m3_wbd_stb_o(m3_wbd_stb_w),

    .m3_wbd_dat_i(mem_icache_dat),
    .m3_wbd_ack_i(mem_icache_ack),
    .m3_wbd_lack_i(0),
    .m3_wbd_err_i(0)
  );

  dpram64 #(
    .SIZE(DRAM_SIZE),       //byte
    .AXI_DATA_WIDTH(32),
    .memfile(`HEX_FILE)
  ) dram_u(
    .clk(clk),
    .we_d(dcache_mem_we),
    .din_d(dcache_mem_dat),
    .waddr_d(dcache_mem_adr - 32'h8000_0000),
    .raddr_d(dcache_mem_adr - 32'h8000_0000),
    .dout_d(mem_dcache_dat),

    .raddr_instr(icache_mem_adr - 32'h8000_0000),
    .dout_instr(mem_icache_dat)
  );

  `ifdef COMMIT_LOG
  wire [ROB_INDEX_WIDTH-1 : 0] cmt_id;
  wire use_rd;
  wire cmt_rd;
  wire [63:0] cmt_rd_data;
  wire [PHY_REG_SIZE_WIDTH-1:0] cmt_prd;
  wire [63:0] cmt_lsu_addr_base, cmt_lsu_addr_offset;
  wire [4:0] cmt_lsu_op;
  wire cmt_is_ls;
  wire [63:0] cmt_sted_dat;    //commit stored data
  assign cmt_id = hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu.cm_rob_line;
  assign use_rd = hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu.rob_op_basic[cmt_id][1];
  assign cmt_rd = hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu.rob_rd[cmt_id];
  assign cmt_prd = hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu.rob_prd[cmt_id];
  assign cmt_rd_data = hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu.phy_reg.registers[cmt_prd];
  assign cmt_lsu_op = hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu.rob_op_lsu[cmt_id];
  assign cmt_lsu_addr_base = hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu.rob_debug_info[cmt_id][95:32];
  assign cmt_lsu_addr_offset[31:0] = hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu.rob_debug_info[cmt_id][31:0];
  assign cmt_lsu_addr_offset[63:32] = {32{cmt_lsu_addr_offset[31]}};
  assign cmt_is_ls = cmt_lsu_op[4] | cmt_lsu_op[3];
  assign cmt_sted_dat = hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu.rob_debug_info[cmt_id][159:96];

  always @(posedge clk) begin
    if(hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu.rob_cm_valid) begin
      $fdisplay (cmt_log_fd, "-----");
      $fdisplay (cmt_log_fd, "0x%0x\n", (hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu.rob_op_basic[cmt_id][67:36]));
      if(hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu.rob_rd[cmt_id] != 0 && use_rd) begin 
        //alu or csr instr commit
        $fdisplay (cmt_log_fd, "x%0x <- 0x%x\n", cmt_rd, cmt_rd_data);
      end else if(cmt_is_ls) begin
        //load instr
        $fdisplay (cmt_log_fd, "MEM[0x%0x] <- 0x%x\n", cmt_lsu_addr_base+cmt_lsu_addr_offset, cmt_sted_dat);
      end
    end
  end
  `endif

  wire valid = hehe_tb.hehe_u.dcache_req_valid;
  wire ready = hehe_tb.hehe_u.dcache_req_ready;
  wire [31:0] addr = hehe_tb.hehe_u.dcache_req_addr;
  wire we = hehe_tb.hehe_u.dcache_opcode;
  wire [31:0] data = hehe_tb.hehe_u.dcache_st_data[31:0];

  always @(posedge clk) begin //exiter
    if(valid && ready && (addr == 32'h8000_1000) &we) begin
      if(data == 32'b1) begin
        $display("Pass test");
      end else begin
        $display("fail test");
      end
      //$finish;
    end
  end

integer cmt_log_fd;
  initial begin
    rst = 1;
    clk = 0;

    #40000;
    rst = 0;
    `ifdef COMMIT_LOG 
    cmt_log_fd = $fopen("./rtl_cmt.log", "w");
    `endif

    $display ("%s", `HEX_FILE);
    #SIMU_TIME;

    $display ("%s", `HEX_FILE);
    $display ("simulation terminated");
    $fclose (cmt_log_fd);
    $finish;
  end
  //wave log
  initial begin
    string wav;
    wav = {`WAV_FILE};
    $display("wav_log = %s", wav);
    $fsdbDumpfile(wav);     //设置波形文件
    $fsdbDumpvars(0, hehe_tb);
    $fsdbDumpvars("+struct");
    $fsdbDumpvars("+mda");
    $fsdbDumpvars("+all");
    $fsdbDumpon;
  end

endmodule