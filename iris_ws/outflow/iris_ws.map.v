
//
// Verific Verilog Description of module top
//

module top (gpio_clk_27m, rxd, txd, led, hdmi_tx_locked, hdmi_tx_slow_clk, 
            tmds_data0_o, tmds_data1_o, tmds_data2_o, tmds_clk_o, tmds_data0_TX_OE, 
            tmds_data1_TX_OE, tmds_data2_TX_OE, tmds_clk_TX_OE, tmds_data0_TX_RST, 
            tmds_data1_TX_RST, tmds_data2_TX_RST, tmds_clk_TX_RST) /* verific EFX_ATTRIBUTE_NETLIST__EFINITY_VERSION=2026.1.132.4.5 */ ;
    input gpio_clk_27m /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(8)
    input rxd /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(11)
    output txd /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(12)
    output [3:0]led /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(15)
    input hdmi_tx_locked /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(18)
    input hdmi_tx_slow_clk /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(19)
    output [9:0]tmds_data0_o /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(20)
    output [9:0]tmds_data1_o /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(21)
    output [9:0]tmds_data2_o /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(22)
    output [9:0]tmds_clk_o /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(23)
    output tmds_data0_TX_OE /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(24)
    output tmds_data1_TX_OE /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(25)
    output tmds_data2_TX_OE /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(26)
    output tmds_clk_TX_OE /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(27)
    output tmds_data0_TX_RST /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(28)
    output tmds_data1_TX_RST /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(29)
    output tmds_data2_TX_RST /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(30)
    output tmds_clk_TX_RST /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(31)
    
    wire [9:0]tmds_data0;
    wire [26:0]n6;
    wire [9:0]tmds_data1;
    wire [9:0]tmds_data2;
    wire [7:0]tx_data;
    wire video_de;
    wire video_vs;
    wire video_hs;
    wire [7:0]video_b;
    wire [7:0]video_g;
    wire [7:0]video_r;
    wire [7:0]\DC_FIFO_inst/WrRdAddr_meta  /* verific async_reg="true" */ ;
    wire [7:0]\DC_FIFO_inst/WrRdAddr  /* verific async_reg="true" */ ;
    wire [7:0]\DC_FIFO_inst/RdWrAddr_meta  /* verific async_reg="true" */ ;
    wire \DC_FIFO_inst/FullFlag ;
    wire [7:0]\DC_FIFO_inst/RdWrAddr  /* verific async_reg="true" */ ;
    wire [7:0]\DC_FIFO_inst/FifoWrAddr  /* verific async_reg="true" */ ;
    wire \DC_FIFO_inst/U2_RdAddrCnt/n4 ;
    wire [7:0]\DC_FIFO_inst/WrNextAddr ;
    wire tx_valid;
    wire [7:0]\DC_FIFO_inst/RdNextAddr ;
    wire [7:0]\DC_FIFO_inst/FifoRdAddr  /* verific async_reg="true" */ ;
    wire [7:0]rx_data;
    wire rx_valid;
    wire \uart_rx_tx_inst/tx_busy ;
    wire \uart_rx_tx_inst/tx_over ;
    wire txd_2;
    wire tx_req;
    wire sys_rst_n /* verific async_reg="true" */ ;
    wire \inst_rst/r_srst_1P[1]  /* verific async_reg="true" */ ;
    wire \inst_rst/r_srst_1P[0]  /* verific async_reg="true" */ ;
    wire n76;
    wire \DC_FIFO_inst/FifoWrEn ;
    wire [26:0]led_cnt;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(37)
    
    wire \add_27/n4 , \add_27/n2 ;
    wire [4:0]\dvi_encoder_m0/encb/cnt ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(118)
    
    wire \dvi_encoder_m0/encb/de_q , \dvi_encoder_m0/encb/de_reg , \dvi_encoder_m0/encb/c0_q , 
        \dvi_encoder_m0/encb/c0_reg , \dvi_encoder_m0/encb/c1_q , \dvi_encoder_m0/encb/c1_reg ;
    wire [7:0]\dvi_encoder_m0/encb/din_q ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(63)
    wire [4:0]\dvi_encoder_m0/encb/n232 ;
    
    wire \dvi_encoder_m0/encb/add_83/n2 ;
    wire [4:0]\dvi_encoder_m0/encb/n273 ;
    
    wire \dvi_encoder_m0/encb/add_89/n2 , \dvi_encoder_m0/encb/add_93/n2 , 
        \dvi_encoder_m0/encb/sub_82/add_2/n2 , n957;
    wire [4:0]\dvi_encoder_m0/encr/n232 ;
    
    wire \dvi_encoder_m0/encr/add_83/n6 ;
    wire [3:0]\dvi_encoder_m0/encb/n1q_m ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(107)
    wire [3:0]\dvi_encoder_m0/encb/n0q_m ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(107)
    
    wire \dvi_encoder_m0/encr/add_83/n4 ;
    wire [4:0]\dvi_encoder_m0/encr/n219 ;
    
    wire \dvi_encoder_m0/encr/add_81/n8 , \dvi_encoder_m0/encr/add_81/n6 , 
        \dvi_encoder_m0/encr/add_81/n4 ;
    wire [4:0]\dvi_encoder_m0/encr/cnt ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(118)
    wire [7:0]\dvi_encoder_m0/encr/din_q ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(63)
    
    wire \dvi_encoder_m0/encr/add_83/n2 ;
    wire [4:0]\dvi_encoder_m0/encr/n273 ;
    
    wire \dvi_encoder_m0/encr/add_89/n2 , \dvi_encoder_m0/encr/add_93/n2 , 
        \dvi_encoder_m0/encr/sub_82/add_2/n2 , n956;
    wire [4:0]\dvi_encoder_m0/encg/n232 ;
    
    wire \dvi_encoder_m0/encg/add_83/n8 ;
    wire [3:0]\dvi_encoder_m0/encr/n1q_m ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(107)
    wire [3:0]\dvi_encoder_m0/encr/n0q_m ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(107)
    
    wire \dvi_encoder_m0/encg/add_83/n6 , \dvi_encoder_m0/encg/add_83/n4 ;
    wire [4:0]\dvi_encoder_m0/encg/n219 ;
    
    wire \dvi_encoder_m0/encg/add_81/n8 , \dvi_encoder_m0/encg/add_81/n6 , 
        \dvi_encoder_m0/encg/add_81/n4 ;
    wire [4:0]\dvi_encoder_m0/encg/cnt ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(118)
    wire [7:0]\dvi_encoder_m0/encg/din_q ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(63)
    
    wire \dvi_encoder_m0/encg/add_83/n2 ;
    wire [4:0]\dvi_encoder_m0/encg/n273 ;
    
    wire \dvi_encoder_m0/encg/add_89/n2 , \dvi_encoder_m0/encg/add_93/n2 , 
        \dvi_encoder_m0/encg/sub_82/add_2/n2 , n955;
    wire [3:0]\dvi_encoder_m0/encg/n1q_m ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(107)
    wire [3:0]\dvi_encoder_m0/encg/n0q_m ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(107)
    wire [15:0]\u_color_bar_rgb/v_cnt ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(26)
    
    wire \u_color_bar_rgb/h_state[0] , \u_color_bar_rgb/v_state[0] ;
    wire [15:0]\u_color_bar_rgb/h_cnt ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(25)
    wire [15:0]\uart_rx_tx_inst/uart_tx01/n52 ;
    
    wire \uart_rx_tx_inst/uart_tx01/add_72/n28 , \uart_rx_tx_inst/uart_tx01/add_72/n26 , 
        \uart_rx_tx_inst/uart_tx01/add_72/n24 , \uart_rx_tx_inst/uart_tx01/add_72/n22 , 
        \uart_rx_tx_inst/uart_tx01/add_72/n20 , \uart_rx_tx_inst/uart_tx01/add_72/n18 , 
        \uart_rx_tx_inst/uart_tx01/add_72/n16 , \uart_rx_tx_inst/uart_tx01/add_72/n14 , 
        \uart_rx_tx_inst/uart_tx01/add_72/n12 , \uart_rx_tx_inst/uart_tx01/add_72/n10 , 
        \uart_rx_tx_inst/uart_tx01/add_72/n8 , \uart_rx_tx_inst/uart_tx01/add_72/n6 ;
    wire [1:0]\u_color_bar_rgb/v_state ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(79)
    wire [1:0]\u_color_bar_rgb/h_state ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(78)
    
    wire \dvi_encoder_m0/encg/sub_92/add_2/n8 , \DC_FIFO_inst/WrClkRstGen[0] , 
        \uart_rx_tx_inst/uart_tx01/add_72/n4 , \DC_FIFO_inst/WrClkRst , 
        n954, n953, \uart_rx_tx_inst/uart_tx01/add_72/n2 ;
    wire [7:0]\DC_FIFO_inst/WrRdAddrReg ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(327)
    
    wire \DC_FIFO_inst/WrFullClr , \DC_FIFO_inst/RdAHighNext ;
    wire [7:0]\DC_FIFO_inst/RdWrAddrReg ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(456)
    
    wire \DC_FIFO_inst/EmptyClr , \DC_FIFO_inst/WrAHighNext , \DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/GrayCnt[0] , 
        \DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/GrayCnt[0] , \DC_FIFO_inst/WrClkRstGen[1] , 
        \dvi_encoder_m0/encg/sub_88/add_2/n8 ;
    wire [15:0]\uart_rx_tx_inst/uart01_rx/bw_cnt_r ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(49)
    
    wire \uart_rx_tx_inst/uart01_rx/cnt_en , n952, n951, \uart_rx_tx_inst/uart01_rx/bit_over_r ;
    wire [4:0]\dvi_encoder_m0/encg/n238 ;
    
    wire \uart_rx_tx_inst/uart01_rx/rxd_r[0] , \dvi_encoder_m0/encg/sub_84/add_2/n8 ;
    wire [3:0]\uart_rx_tx_inst/uart01_rx/bit_cnt_r ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(77)
    
    wire \dvi_encoder_m0/encg/sub_84/add_2/n6 ;
    wire [4:0]\uart_rx_tx_inst/uart01_rx/capture_p1_en_dly ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(115)
    
    wire \dvi_encoder_m0/encg/sub_84/add_2/n4 ;
    wire [4:0]\dvi_encoder_m0/encg/n225 ;
    
    wire \dvi_encoder_m0/encg/sub_82/add_2/n8 , \dvi_encoder_m0/encg/sub_82/add_2/n6 , 
        \dvi_encoder_m0/encg/sub_82/add_2/n4 ;
    wire [4:0]\dvi_encoder_m0/encg/n292 ;
    
    wire \dvi_encoder_m0/encg/add_93/n8 , \dvi_encoder_m0/encg/add_93/n6 , 
        \dvi_encoder_m0/encg/add_93/n4 , \dvi_encoder_m0/encg/add_89/n8 , 
        \dvi_encoder_m0/encg/add_89/n6 , \dvi_encoder_m0/encg/add_89/n4 , 
        \dvi_encoder_m0/encr/sub_92/add_2/n8 , n950, n949, \dvi_encoder_m0/encr/sub_88/add_2/n8 , 
        n948, n947;
    wire [4:0]\dvi_encoder_m0/encr/n238 ;
    
    wire \dvi_encoder_m0/encr/sub_84/add_2/n8 , \dvi_encoder_m0/encr/sub_84/add_2/n6 , 
        \dvi_encoder_m0/encr/sub_84/add_2/n4 ;
    wire [4:0]\dvi_encoder_m0/encr/n225 ;
    
    wire \dvi_encoder_m0/encr/sub_82/add_2/n8 , \dvi_encoder_m0/encr/sub_82/add_2/n6 , 
        \dvi_encoder_m0/encr/sub_82/add_2/n4 ;
    wire [4:0]\dvi_encoder_m0/encr/n292 ;
    
    wire \dvi_encoder_m0/encr/add_93/n8 , \dvi_encoder_m0/encr/add_93/n6 , 
        \dvi_encoder_m0/encr/add_93/n4 , \dvi_encoder_m0/encr/add_89/n8 , 
        \dvi_encoder_m0/encr/add_89/n6 , \dvi_encoder_m0/encr/add_89/n4 , 
        \dvi_encoder_m0/encr/add_83/n8 , \dvi_encoder_m0/encb/sub_92/add_2/n8 , 
        n946, n945;
    wire [1:0]\uart_rx_tx_inst/uart01_rx/temp_cap_r ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(102)
    
    wire \uart_rx_tx_inst/uart01_rx/rxd_r[1] , \dvi_encoder_m0/encb/sub_88/add_2/n8 , 
        n944;
    wire [15:0]\uart_rx_tx_inst/uart_tx01/tx_cnt ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(66)
    wire [3:0]\uart_rx_tx_inst/uart_tx01/bite_cnt ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(19)
    wire [7:0]\uart_rx_tx_inst/uart_tx01/tx_data_r ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(34)
    
    wire n943;
    wire [4:0]\dvi_encoder_m0/encb/n238 ;
    
    wire \dvi_encoder_m0/encb/sub_84/add_2/n8 , \dvi_encoder_m0/encb/sub_84/add_2/n6 , 
        \dvi_encoder_m0/encb/sub_84/add_2/n4 ;
    wire [7:0]\uart_rx_tx_inst/uart_tx01/tx_valid_dly ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(44)
    wire [4:0]\dvi_encoder_m0/encb/n225 ;
    
    wire \dvi_encoder_m0/encb/sub_82/add_2/n8 , \dvi_encoder_m0/encb/sub_82/add_2/n6 , 
        \dvi_encoder_m0/encb/sub_82/add_2/n4 ;
    wire [4:0]\dvi_encoder_m0/encb/n292 ;
    
    wire \dvi_encoder_m0/encb/add_93/n8 , \dvi_encoder_m0/encb/add_93/n6 , 
        \dvi_encoder_m0/encb/add_93/n4 , \dvi_encoder_m0/encb/add_89/n8 , 
        \dvi_encoder_m0/encb/add_89/n6 , \dvi_encoder_m0/encb/add_89/n4 , 
        \dvi_encoder_m0/encb/add_83/n8 , \dvi_encoder_m0/encb/add_83/n6 , 
        \dvi_encoder_m0/encb/add_83/n4 ;
    wire [4:0]\dvi_encoder_m0/encb/n219 ;
    
    wire \dvi_encoder_m0/encb/add_81/n8 , \dvi_encoder_m0/encb/add_81/n6 , 
        \dvi_encoder_m0/encb/add_81/n4 , \add_27/n46 , \add_27/n44 , \add_27/n42 , 
        \add_27/n40 , \add_27/n38 , \add_27/n36 , \add_27/n34 , \add_27/n32 , 
        \add_27/n30 , \add_27/n28 , \add_27/n26 , \add_27/n24 , \add_27/n22 , 
        \add_27/n20 , \add_27/n18 , \add_27/n16 , \add_27/n14 , \add_27/n12 , 
        \add_27/n10 , \add_27/n8 , \add_27/n6 ;
    wire [3:0]\uart_rx_tx_inst/uart_tx01/BIT_NUM ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(32)
    
    wire n942, n941, n940, n939;
    wire [9:0]\dvi_encoder_m0/encb/n339 ;
    
    wire n938, n937;
    wire [4:0]\dvi_encoder_m0/encb/n350 ;
    wire [9:0]\dvi_encoder_m0/encr/n339 ;
    
    wire n936;
    wire [4:0]\dvi_encoder_m0/encr/n350 ;
    
    wire n935, n934, n933;
    wire [9:0]\dvi_encoder_m0/encg/n339 ;
    
    wire n932;
    wire [4:0]\dvi_encoder_m0/encg/n350 ;
    
    wire n931, n930, n929;
    wire [15:0]\u_color_bar_rgb/n454 ;
    
    wire ceg_net39, ceg_net40, ceg_net41, \u_color_bar_rgb/n719 , \u_color_bar_rgb/equal_99/n3 , 
        \u_color_bar_rgb/equal_105/n3 ;
    wire [23:0]\u_color_bar_rgb/n664 ;
    wire [15:0]\u_color_bar_rgb/n163 ;
    
    wire \u_color_bar_rgb/n823 , \u_color_bar_rgb/n868 , \u_color_bar_rgb/n873 , 
        \u_color_bar_rgb/n878 , \u_color_bar_rgb/n883 , \u_color_bar_rgb/n888 , 
        \DC_FIFO_inst/n523 , \DC_FIFO_inst/n21 , \DC_FIFO_inst/n7 , \DC_FIFO_inst/not_equal_52/n13 , 
        \DC_FIFO_inst/RdAHighRise , \DC_FIFO_inst/n253 , ceg_net24, \DC_FIFO_inst/not_equal_92/n13 , 
        \DC_FIFO_inst/WrAHighRise , \DC_FIFO_inst/n407 , ceg_net26, \DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n124 , 
        \DC_FIFO_inst/U1_WrAddrCnt/n87 , \DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n144 , 
        \DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n139 , \DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n134 , 
        \DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n149 , \DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n119 , 
        \DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n129 , \DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n114 , 
        \DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n124 , \DC_FIFO_inst/U2_RdAddrCnt/n87 , 
        \DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n144 , \DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n139 , 
        \DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n134 , \DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n149 , 
        \DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n119 , \DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n129 , 
        \DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n114 , n928, \uart_rx_tx_inst/uart01_rx/n440 , 
        \uart_rx_tx_inst/uart01_rx/n562 , \uart_rx_tx_inst/uart01_rx/equal_9/n3 , 
        \uart_rx_tx_inst/uart01_rx/n435 , \uart_rx_tx_inst/uart01_rx/n430 , 
        \uart_rx_tx_inst/uart01_rx/n622 , \uart_rx_tx_inst/uart01_rx/n425 , 
        \uart_rx_tx_inst/uart01_rx/equal_16/n31 , \uart_rx_tx_inst/uart01_rx/n420 , 
        \uart_rx_tx_inst/uart01_rx/n415 , n927, \uart_rx_tx_inst/uart01_rx/n410 , 
        \uart_rx_tx_inst/uart01_rx/n405 , \uart_rx_tx_inst/uart01_rx/n400 , 
        \uart_rx_tx_inst/uart01_rx/equal_35/n31 , \uart_rx_tx_inst/uart01_rx/n249 , 
        \uart_rx_tx_inst/uart01_rx/n395 , \uart_rx_tx_inst/uart01_rx/n390 , 
        \uart_rx_tx_inst/uart01_rx/n385 , \uart_rx_tx_inst/uart01_rx/n380 , 
        \uart_rx_tx_inst/uart01_rx/n370 , \uart_rx_tx_inst/uart01_rx/n375 , 
        \dvi_encoder_m0/encg/n628 , \dvi_encoder_m0/encg/n623 , \dvi_encoder_m0/encg/LessThan_63/n7 , 
        \dvi_encoder_m0/encg/n618 , \dvi_encoder_m0/encg/n694 , \dvi_encoder_m0/encr/n628 , 
        \dvi_encoder_m0/encr/n623 , \dvi_encoder_m0/encr/LessThan_63/n7 , 
        \dvi_encoder_m0/encr/n618 , \dvi_encoder_m0/encr/n694 , \uart_rx_tx_inst/uart01_rx/n620 , 
        \uart_rx_tx_inst/uart01_rx/n617 , \uart_rx_tx_inst/uart01_rx/n615 , 
        \uart_rx_tx_inst/uart01_rx/n612 , \uart_rx_tx_inst/uart01_rx/n607 , 
        \uart_rx_tx_inst/uart01_rx/n604 , \uart_rx_tx_inst/uart01_rx/n602 , 
        \uart_rx_tx_inst/uart01_rx/n488 , \uart_rx_tx_inst/uart01_rx/n495 , 
        \uart_rx_tx_inst/uart01_rx/n500 , \uart_rx_tx_inst/uart01_rx/n592 , 
        \uart_rx_tx_inst/uart_tx01/n227 , \uart_rx_tx_inst/uart_tx01/equal_21/n31 , 
        \uart_rx_tx_inst/uart_tx01/n153 , \uart_rx_tx_inst/uart_tx01/n171 , 
        \uart_rx_tx_inst/uart_tx01/equal_4/n9 , \dvi_encoder_m0/encb/n628 , 
        \dvi_encoder_m0/encb/n623 , \dvi_encoder_m0/encb/LessThan_63/n7 , 
        \dvi_encoder_m0/encb/n618 , \dvi_encoder_m0/encb/n694 , \uart_rx_tx_inst/uart_tx01/n252 , 
        \uart_rx_tx_inst/uart_tx01/n259 , \uart_rx_tx_inst/uart_tx01/n264 , 
        n926, n767, n768, n769, n770, n771, n772, n773, n774, 
        n775, n776, n777, n778, n779, n780, n781, n782, n783, 
        n784, n785, n786, n787, n788, n789, n790, n791, n792, 
        n793, n794, n795, n796, n797, n798, n799, n800, n801, 
        n802, n803, n804, n805, n806, n807, n808, n809, n810, 
        n811, n812, n813, n814, n815, n816, n817, n818, n819, 
        n820, n821, n822, n823, n824, n825, n826, n827, n828, 
        n829, n830, n831, n832, n833, n834, n835, n836, n837, 
        n838, n839, n840, n841, n842, n843, n844, n845, n846, 
        n847, n848, n849, n850, n851, n852, n853, n854, n855, 
        n856, n857, n858, n859, n860, n861, n862, n863, n864, 
        n865, n866, n867, n868, n869, n870, n871, n872, n873, 
        n874, n875, n876, n877, n878, n879, n880, n881, n882, 
        n883, n884, n885, n886, n887, n888, n889, n890, n891, 
        n892, n893, n894, n895, n896, n897, n898, n899, n900, 
        n901, n902, n903, n904, n905, n906, n907, n908, n909, 
        n910, n911, n912, n913, n914, n915, n916, n917, n918, 
        n919, n920, n921, n922, n923, n924, n925, n958, n959, 
        n960, n961;
    
    assign led[0] = rxd /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(11)
    assign txd = led[1] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(12)
    assign tmds_data0_o[5] = tmds_data0_o[7] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(20)
    assign tmds_data0_o[4] = tmds_data0_o[6] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(20)
    assign tmds_data0_o[3] = tmds_data0_o[7] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(20)
    assign tmds_data0_o[2] = tmds_data0_o[6] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(20)
    assign tmds_data0_o[1] = tmds_data0_o[7] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(20)
    assign tmds_data0_o[0] = tmds_data0_o[7] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(20)
    assign tmds_data1_o[5] = tmds_data1_o[7] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(21)
    assign tmds_data1_o[4] = tmds_data1_o[6] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(21)
    assign tmds_data1_o[3] = tmds_data1_o[7] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(21)
    assign tmds_data1_o[2] = tmds_data1_o[6] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(21)
    assign tmds_data1_o[1] = tmds_data1_o[7] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(21)
    assign tmds_data1_o[0] = tmds_data1_o[7] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(21)
    assign tmds_data2_o[5] = tmds_data2_o[7] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(22)
    assign tmds_data2_o[4] = tmds_data2_o[6] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(22)
    assign tmds_data2_o[3] = tmds_data2_o[7] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(22)
    assign tmds_data2_o[2] = tmds_data2_o[6] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(22)
    assign tmds_data2_o[1] = tmds_data2_o[7] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(22)
    assign tmds_data2_o[0] = tmds_data2_o[7] /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(22)
    assign tmds_clk_o[9] = 1'b0 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(23)
    assign tmds_clk_o[8] = 1'b0 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(23)
    assign tmds_clk_o[7] = 1'b0 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(23)
    assign tmds_clk_o[6] = 1'b0 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(23)
    assign tmds_clk_o[5] = 1'b0 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(23)
    assign tmds_clk_o[4] = 1'b1 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(23)
    assign tmds_clk_o[3] = 1'b1 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(23)
    assign tmds_clk_o[1] = 1'b1 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(23)
    assign tmds_clk_o[0] = 1'b1 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(23)
    assign tmds_data0_TX_OE = 1'b1 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(24)
    assign tmds_data1_TX_OE = 1'b1 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(25)
    assign tmds_data2_TX_OE = 1'b1 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(26)
    assign tmds_clk_TX_OE = 1'b1 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(27)
    assign tmds_data1_TX_RST = 1'b0 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(29)
    assign tmds_data2_TX_RST = 1'b0 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(30)
    assign tmds_clk_TX_RST = 1'b0 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(31)
    assign tmds_clk_o[2] = 1'b1 /* verific EFX_ATTRIBUTE_CELL_NAME=VCC */ ;
    assign tmds_data0_TX_RST = 1'b0 /* verific EFX_ATTRIBUTE_CELL_NAME=GND */ ;
    EFX_FF \tmds_data0[7]~FF  (.D(\dvi_encoder_m0/encb/n339 [0]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(tmds_data0[7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \tmds_data0[7]~FF .CLK_POLARITY = 1'b1;
    defparam \tmds_data0[7]~FF .CE_POLARITY = 1'b1;
    defparam \tmds_data0[7]~FF .SR_POLARITY = 1'b0;
    defparam \tmds_data0[7]~FF .D_POLARITY = 1'b1;
    defparam \tmds_data0[7]~FF .SR_SYNC = 1'b0;
    defparam \tmds_data0[7]~FF .SR_VALUE = 1'b0;
    defparam \tmds_data0[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[0]~FF  (.D(led_cnt[0]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[0]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[0]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[0]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[0]~FF .D_POLARITY = 1'b0;
    defparam \led_cnt[0]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[0]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tmds_data0[6]~FF  (.D(\dvi_encoder_m0/encb/n339 [2]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(tmds_data0[6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \tmds_data0[6]~FF .CLK_POLARITY = 1'b1;
    defparam \tmds_data0[6]~FF .CE_POLARITY = 1'b1;
    defparam \tmds_data0[6]~FF .SR_POLARITY = 1'b0;
    defparam \tmds_data0[6]~FF .D_POLARITY = 1'b1;
    defparam \tmds_data0[6]~FF .SR_SYNC = 1'b0;
    defparam \tmds_data0[6]~FF .SR_VALUE = 1'b0;
    defparam \tmds_data0[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tmds_data0[9]~FF  (.D(\dvi_encoder_m0/encb/n339 [9]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(tmds_data0[9])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \tmds_data0[9]~FF .CLK_POLARITY = 1'b1;
    defparam \tmds_data0[9]~FF .CE_POLARITY = 1'b1;
    defparam \tmds_data0[9]~FF .SR_POLARITY = 1'b0;
    defparam \tmds_data0[9]~FF .D_POLARITY = 1'b1;
    defparam \tmds_data0[9]~FF .SR_SYNC = 1'b0;
    defparam \tmds_data0[9]~FF .SR_VALUE = 1'b0;
    defparam \tmds_data0[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tmds_data0[8]~FF  (.D(\dvi_encoder_m0/encb/n339 [8]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(tmds_data0[8])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \tmds_data0[8]~FF .CLK_POLARITY = 1'b1;
    defparam \tmds_data0[8]~FF .CE_POLARITY = 1'b1;
    defparam \tmds_data0[8]~FF .SR_POLARITY = 1'b0;
    defparam \tmds_data0[8]~FF .D_POLARITY = 1'b1;
    defparam \tmds_data0[8]~FF .SR_SYNC = 1'b0;
    defparam \tmds_data0[8]~FF .SR_VALUE = 1'b0;
    defparam \tmds_data0[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encb/cnt[0]~FF  (.D(\dvi_encoder_m0/encb/n350 [0]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\dvi_encoder_m0/encb/cnt [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \dvi_encoder_m0/encb/cnt[0]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/cnt[0]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/cnt[0]~FF .SR_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encb/cnt[0]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/cnt[0]~FF .SR_SYNC = 1'b0;
    defparam \dvi_encoder_m0/encb/cnt[0]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encb/cnt[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encb/de_q~FF  (.D(video_de), .CE(1'b1), .CLK(hdmi_tx_slow_clk), 
           .SR(1'b0), .Q(\dvi_encoder_m0/encb/de_q )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(145)
    defparam \dvi_encoder_m0/encb/de_q~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/de_q~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/de_q~FF .SR_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/de_q~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/de_q~FF .SR_SYNC = 1'b1;
    defparam \dvi_encoder_m0/encb/de_q~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encb/de_q~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encb/de_reg~FF  (.D(\dvi_encoder_m0/encb/de_q ), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(1'b0), .Q(\dvi_encoder_m0/encb/de_reg )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(145)
    defparam \dvi_encoder_m0/encb/de_reg~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/de_reg~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/de_reg~FF .SR_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/de_reg~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/de_reg~FF .SR_SYNC = 1'b1;
    defparam \dvi_encoder_m0/encb/de_reg~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encb/de_reg~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encb/c0_q~FF  (.D(video_hs), .CE(1'b1), .CLK(hdmi_tx_slow_clk), 
           .SR(1'b0), .Q(\dvi_encoder_m0/encb/c0_q )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(145)
    defparam \dvi_encoder_m0/encb/c0_q~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/c0_q~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/c0_q~FF .SR_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/c0_q~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/c0_q~FF .SR_SYNC = 1'b1;
    defparam \dvi_encoder_m0/encb/c0_q~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encb/c0_q~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encb/c0_reg~FF  (.D(\dvi_encoder_m0/encb/c0_q ), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(1'b0), .Q(\dvi_encoder_m0/encb/c0_reg )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(145)
    defparam \dvi_encoder_m0/encb/c0_reg~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/c0_reg~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/c0_reg~FF .SR_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/c0_reg~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/c0_reg~FF .SR_SYNC = 1'b1;
    defparam \dvi_encoder_m0/encb/c0_reg~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encb/c0_reg~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encb/c1_q~FF  (.D(video_vs), .CE(1'b1), .CLK(hdmi_tx_slow_clk), 
           .SR(1'b0), .Q(\dvi_encoder_m0/encb/c1_q )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(145)
    defparam \dvi_encoder_m0/encb/c1_q~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/c1_q~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/c1_q~FF .SR_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/c1_q~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/c1_q~FF .SR_SYNC = 1'b1;
    defparam \dvi_encoder_m0/encb/c1_q~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encb/c1_q~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encb/c1_reg~FF  (.D(\dvi_encoder_m0/encb/c1_q ), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(1'b0), .Q(\dvi_encoder_m0/encb/c1_reg )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(145)
    defparam \dvi_encoder_m0/encb/c1_reg~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/c1_reg~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/c1_reg~FF .SR_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/c1_reg~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/c1_reg~FF .SR_SYNC = 1'b1;
    defparam \dvi_encoder_m0/encb/c1_reg~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encb/c1_reg~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encb/din_q[0]~FF  (.D(video_b[0]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(1'b0), .Q(\dvi_encoder_m0/encb/din_q [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(69)
    defparam \dvi_encoder_m0/encb/din_q[0]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/din_q[0]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/din_q[0]~FF .SR_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/din_q[0]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/din_q[0]~FF .SR_SYNC = 1'b1;
    defparam \dvi_encoder_m0/encb/din_q[0]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encb/din_q[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encb/cnt[1]~FF  (.D(\dvi_encoder_m0/encb/n350 [1]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\dvi_encoder_m0/encb/cnt [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \dvi_encoder_m0/encb/cnt[1]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/cnt[1]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/cnt[1]~FF .SR_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encb/cnt[1]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/cnt[1]~FF .SR_SYNC = 1'b0;
    defparam \dvi_encoder_m0/encb/cnt[1]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encb/cnt[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encb/cnt[2]~FF  (.D(\dvi_encoder_m0/encb/n350 [2]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\dvi_encoder_m0/encb/cnt [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \dvi_encoder_m0/encb/cnt[2]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/cnt[2]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/cnt[2]~FF .SR_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encb/cnt[2]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/cnt[2]~FF .SR_SYNC = 1'b0;
    defparam \dvi_encoder_m0/encb/cnt[2]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encb/cnt[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encb/cnt[3]~FF  (.D(\dvi_encoder_m0/encb/n350 [3]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\dvi_encoder_m0/encb/cnt [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \dvi_encoder_m0/encb/cnt[3]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/cnt[3]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/cnt[3]~FF .SR_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encb/cnt[3]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/cnt[3]~FF .SR_SYNC = 1'b0;
    defparam \dvi_encoder_m0/encb/cnt[3]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encb/cnt[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encb/cnt[4]~FF  (.D(\dvi_encoder_m0/encb/n350 [4]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\dvi_encoder_m0/encb/cnt [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \dvi_encoder_m0/encb/cnt[4]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/cnt[4]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/cnt[4]~FF .SR_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encb/cnt[4]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/cnt[4]~FF .SR_SYNC = 1'b0;
    defparam \dvi_encoder_m0/encb/cnt[4]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encb/cnt[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encb/n1q_m[3]~FF  (.D(\dvi_encoder_m0/encb/din_q [0]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(1'b0), .Q(\dvi_encoder_m0/encb/n1q_m [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(111)
    defparam \dvi_encoder_m0/encb/n1q_m[3]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/n1q_m[3]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/n1q_m[3]~FF .SR_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/n1q_m[3]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/n1q_m[3]~FF .SR_SYNC = 1'b1;
    defparam \dvi_encoder_m0/encb/n1q_m[3]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encb/n1q_m[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encb/n0q_m[3]~FF  (.D(\dvi_encoder_m0/encb/din_q [0]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(1'b0), .Q(\dvi_encoder_m0/encb/n0q_m [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(111)
    defparam \dvi_encoder_m0/encb/n0q_m[3]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/n0q_m[3]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/n0q_m[3]~FF .SR_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/n0q_m[3]~FF .D_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encb/n0q_m[3]~FF .SR_SYNC = 1'b1;
    defparam \dvi_encoder_m0/encb/n0q_m[3]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encb/n0q_m[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tmds_data1[7]~FF  (.D(\dvi_encoder_m0/encr/n339 [7]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(tmds_data1[7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \tmds_data1[7]~FF .CLK_POLARITY = 1'b1;
    defparam \tmds_data1[7]~FF .CE_POLARITY = 1'b1;
    defparam \tmds_data1[7]~FF .SR_POLARITY = 1'b0;
    defparam \tmds_data1[7]~FF .D_POLARITY = 1'b1;
    defparam \tmds_data1[7]~FF .SR_SYNC = 1'b0;
    defparam \tmds_data1[7]~FF .SR_VALUE = 1'b0;
    defparam \tmds_data1[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tmds_data1[6]~FF  (.D(\dvi_encoder_m0/encr/n339 [2]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(tmds_data1[6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \tmds_data1[6]~FF .CLK_POLARITY = 1'b1;
    defparam \tmds_data1[6]~FF .CE_POLARITY = 1'b1;
    defparam \tmds_data1[6]~FF .SR_POLARITY = 1'b0;
    defparam \tmds_data1[6]~FF .D_POLARITY = 1'b1;
    defparam \tmds_data1[6]~FF .SR_SYNC = 1'b0;
    defparam \tmds_data1[6]~FF .SR_VALUE = 1'b0;
    defparam \tmds_data1[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tmds_data1[9]~FF  (.D(\dvi_encoder_m0/encr/n339 [9]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(tmds_data1[9])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \tmds_data1[9]~FF .CLK_POLARITY = 1'b1;
    defparam \tmds_data1[9]~FF .CE_POLARITY = 1'b1;
    defparam \tmds_data1[9]~FF .SR_POLARITY = 1'b0;
    defparam \tmds_data1[9]~FF .D_POLARITY = 1'b1;
    defparam \tmds_data1[9]~FF .SR_SYNC = 1'b0;
    defparam \tmds_data1[9]~FF .SR_VALUE = 1'b0;
    defparam \tmds_data1[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tmds_data1[8]~FF  (.D(\dvi_encoder_m0/encr/n339 [8]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(tmds_data1[8])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \tmds_data1[8]~FF .CLK_POLARITY = 1'b1;
    defparam \tmds_data1[8]~FF .CE_POLARITY = 1'b1;
    defparam \tmds_data1[8]~FF .SR_POLARITY = 1'b0;
    defparam \tmds_data1[8]~FF .D_POLARITY = 1'b1;
    defparam \tmds_data1[8]~FF .SR_SYNC = 1'b0;
    defparam \tmds_data1[8]~FF .SR_VALUE = 1'b0;
    defparam \tmds_data1[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encr/cnt[0]~FF  (.D(\dvi_encoder_m0/encr/n350 [0]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\dvi_encoder_m0/encr/cnt [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \dvi_encoder_m0/encr/cnt[0]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/cnt[0]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/cnt[0]~FF .SR_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encr/cnt[0]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/cnt[0]~FF .SR_SYNC = 1'b0;
    defparam \dvi_encoder_m0/encr/cnt[0]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encr/cnt[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encr/din_q[0]~FF  (.D(video_g[0]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(1'b0), .Q(\dvi_encoder_m0/encr/din_q [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(69)
    defparam \dvi_encoder_m0/encr/din_q[0]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/din_q[0]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/din_q[0]~FF .SR_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/din_q[0]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/din_q[0]~FF .SR_SYNC = 1'b1;
    defparam \dvi_encoder_m0/encr/din_q[0]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encr/din_q[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encr/cnt[1]~FF  (.D(\dvi_encoder_m0/encr/n350 [1]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\dvi_encoder_m0/encr/cnt [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \dvi_encoder_m0/encr/cnt[1]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/cnt[1]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/cnt[1]~FF .SR_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encr/cnt[1]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/cnt[1]~FF .SR_SYNC = 1'b0;
    defparam \dvi_encoder_m0/encr/cnt[1]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encr/cnt[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encr/cnt[2]~FF  (.D(\dvi_encoder_m0/encr/n350 [2]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\dvi_encoder_m0/encr/cnt [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \dvi_encoder_m0/encr/cnt[2]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/cnt[2]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/cnt[2]~FF .SR_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encr/cnt[2]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/cnt[2]~FF .SR_SYNC = 1'b0;
    defparam \dvi_encoder_m0/encr/cnt[2]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encr/cnt[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encr/cnt[3]~FF  (.D(\dvi_encoder_m0/encr/n350 [3]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\dvi_encoder_m0/encr/cnt [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \dvi_encoder_m0/encr/cnt[3]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/cnt[3]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/cnt[3]~FF .SR_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encr/cnt[3]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/cnt[3]~FF .SR_SYNC = 1'b0;
    defparam \dvi_encoder_m0/encr/cnt[3]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encr/cnt[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encr/cnt[4]~FF  (.D(\dvi_encoder_m0/encr/n350 [4]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\dvi_encoder_m0/encr/cnt [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \dvi_encoder_m0/encr/cnt[4]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/cnt[4]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/cnt[4]~FF .SR_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encr/cnt[4]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/cnt[4]~FF .SR_SYNC = 1'b0;
    defparam \dvi_encoder_m0/encr/cnt[4]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encr/cnt[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encr/n1q_m[3]~FF  (.D(\dvi_encoder_m0/encr/din_q [0]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(1'b0), .Q(\dvi_encoder_m0/encr/n1q_m [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(111)
    defparam \dvi_encoder_m0/encr/n1q_m[3]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/n1q_m[3]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/n1q_m[3]~FF .SR_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/n1q_m[3]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/n1q_m[3]~FF .SR_SYNC = 1'b1;
    defparam \dvi_encoder_m0/encr/n1q_m[3]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encr/n1q_m[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encr/n0q_m[3]~FF  (.D(\dvi_encoder_m0/encr/din_q [0]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(1'b0), .Q(\dvi_encoder_m0/encr/n0q_m [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(111)
    defparam \dvi_encoder_m0/encr/n0q_m[3]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/n0q_m[3]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/n0q_m[3]~FF .SR_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/n0q_m[3]~FF .D_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encr/n0q_m[3]~FF .SR_SYNC = 1'b1;
    defparam \dvi_encoder_m0/encr/n0q_m[3]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encr/n0q_m[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tmds_data2[7]~FF  (.D(\dvi_encoder_m0/encg/n339 [7]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(tmds_data2[7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \tmds_data2[7]~FF .CLK_POLARITY = 1'b1;
    defparam \tmds_data2[7]~FF .CE_POLARITY = 1'b1;
    defparam \tmds_data2[7]~FF .SR_POLARITY = 1'b0;
    defparam \tmds_data2[7]~FF .D_POLARITY = 1'b1;
    defparam \tmds_data2[7]~FF .SR_SYNC = 1'b0;
    defparam \tmds_data2[7]~FF .SR_VALUE = 1'b0;
    defparam \tmds_data2[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tmds_data2[6]~FF  (.D(\dvi_encoder_m0/encg/n339 [2]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(tmds_data2[6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \tmds_data2[6]~FF .CLK_POLARITY = 1'b1;
    defparam \tmds_data2[6]~FF .CE_POLARITY = 1'b1;
    defparam \tmds_data2[6]~FF .SR_POLARITY = 1'b0;
    defparam \tmds_data2[6]~FF .D_POLARITY = 1'b1;
    defparam \tmds_data2[6]~FF .SR_SYNC = 1'b0;
    defparam \tmds_data2[6]~FF .SR_VALUE = 1'b0;
    defparam \tmds_data2[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tmds_data2[9]~FF  (.D(\dvi_encoder_m0/encg/n339 [9]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(tmds_data2[9])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \tmds_data2[9]~FF .CLK_POLARITY = 1'b1;
    defparam \tmds_data2[9]~FF .CE_POLARITY = 1'b1;
    defparam \tmds_data2[9]~FF .SR_POLARITY = 1'b0;
    defparam \tmds_data2[9]~FF .D_POLARITY = 1'b1;
    defparam \tmds_data2[9]~FF .SR_SYNC = 1'b0;
    defparam \tmds_data2[9]~FF .SR_VALUE = 1'b0;
    defparam \tmds_data2[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tmds_data2[8]~FF  (.D(\dvi_encoder_m0/encg/n339 [8]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(tmds_data2[8])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \tmds_data2[8]~FF .CLK_POLARITY = 1'b1;
    defparam \tmds_data2[8]~FF .CE_POLARITY = 1'b1;
    defparam \tmds_data2[8]~FF .SR_POLARITY = 1'b0;
    defparam \tmds_data2[8]~FF .D_POLARITY = 1'b1;
    defparam \tmds_data2[8]~FF .SR_SYNC = 1'b0;
    defparam \tmds_data2[8]~FF .SR_VALUE = 1'b0;
    defparam \tmds_data2[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encg/cnt[0]~FF  (.D(\dvi_encoder_m0/encg/n350 [0]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\dvi_encoder_m0/encg/cnt [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \dvi_encoder_m0/encg/cnt[0]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/cnt[0]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/cnt[0]~FF .SR_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encg/cnt[0]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/cnt[0]~FF .SR_SYNC = 1'b0;
    defparam \dvi_encoder_m0/encg/cnt[0]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encg/cnt[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encg/din_q[0]~FF  (.D(video_r[0]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(1'b0), .Q(\dvi_encoder_m0/encg/din_q [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(69)
    defparam \dvi_encoder_m0/encg/din_q[0]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/din_q[0]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/din_q[0]~FF .SR_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/din_q[0]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/din_q[0]~FF .SR_SYNC = 1'b1;
    defparam \dvi_encoder_m0/encg/din_q[0]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encg/din_q[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encg/cnt[1]~FF  (.D(\dvi_encoder_m0/encg/n350 [1]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\dvi_encoder_m0/encg/cnt [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \dvi_encoder_m0/encg/cnt[1]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/cnt[1]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/cnt[1]~FF .SR_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encg/cnt[1]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/cnt[1]~FF .SR_SYNC = 1'b0;
    defparam \dvi_encoder_m0/encg/cnt[1]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encg/cnt[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encg/cnt[2]~FF  (.D(\dvi_encoder_m0/encg/n350 [2]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\dvi_encoder_m0/encg/cnt [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \dvi_encoder_m0/encg/cnt[2]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/cnt[2]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/cnt[2]~FF .SR_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encg/cnt[2]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/cnt[2]~FF .SR_SYNC = 1'b0;
    defparam \dvi_encoder_m0/encg/cnt[2]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encg/cnt[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encg/cnt[3]~FF  (.D(\dvi_encoder_m0/encg/n350 [3]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\dvi_encoder_m0/encg/cnt [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \dvi_encoder_m0/encg/cnt[3]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/cnt[3]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/cnt[3]~FF .SR_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encg/cnt[3]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/cnt[3]~FF .SR_SYNC = 1'b0;
    defparam \dvi_encoder_m0/encg/cnt[3]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encg/cnt[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encg/cnt[4]~FF  (.D(\dvi_encoder_m0/encg/n350 [4]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\dvi_encoder_m0/encg/cnt [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(188)
    defparam \dvi_encoder_m0/encg/cnt[4]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/cnt[4]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/cnt[4]~FF .SR_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encg/cnt[4]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/cnt[4]~FF .SR_SYNC = 1'b0;
    defparam \dvi_encoder_m0/encg/cnt[4]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encg/cnt[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encg/n1q_m[3]~FF  (.D(\dvi_encoder_m0/encg/din_q [0]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(1'b0), .Q(\dvi_encoder_m0/encg/n1q_m [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(111)
    defparam \dvi_encoder_m0/encg/n1q_m[3]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/n1q_m[3]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/n1q_m[3]~FF .SR_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/n1q_m[3]~FF .D_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/n1q_m[3]~FF .SR_SYNC = 1'b1;
    defparam \dvi_encoder_m0/encg/n1q_m[3]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encg/n1q_m[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \dvi_encoder_m0/encg/n0q_m[3]~FF  (.D(\dvi_encoder_m0/encg/din_q [0]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(1'b0), .Q(\dvi_encoder_m0/encg/n0q_m [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(111)
    defparam \dvi_encoder_m0/encg/n0q_m[3]~FF .CLK_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/n0q_m[3]~FF .CE_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/n0q_m[3]~FF .SR_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/n0q_m[3]~FF .D_POLARITY = 1'b0;
    defparam \dvi_encoder_m0/encg/n0q_m[3]~FF .SR_SYNC = 1'b1;
    defparam \dvi_encoder_m0/encg/n0q_m[3]~FF .SR_VALUE = 1'b0;
    defparam \dvi_encoder_m0/encg/n0q_m[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_cnt[0]~FF  (.D(\u_color_bar_rgb/n454 [0]), .CE(ceg_net39), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_cnt [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_cnt[0]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[0]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[0]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[0]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[0]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[0]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_state[0]~FF  (.D(\u_color_bar_rgb/h_state [1]), 
           .CE(ceg_net40), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_state[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_state[0]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_state[0]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_state[0]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_state[0]~FF .D_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_state[0]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_state[0]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_state[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_state[0]~FF  (.D(\u_color_bar_rgb/v_state [1]), 
           .CE(ceg_net41), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_state[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_state[0]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_state[0]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_state[0]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_state[0]~FF .D_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_state[0]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_state[0]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_state[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_cnt[0]~FF  (.D(\u_color_bar_rgb/h_cnt [0]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_cnt [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_cnt[0]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[0]~FF .CE_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[0]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[0]~FF .D_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[0]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[0]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \video_de~FF  (.D(\u_color_bar_rgb/n719 ), .CE(1'b1), .CLK(hdmi_tx_slow_clk), 
           .SR(sys_rst_n), .Q(video_de)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(335)
    defparam \video_de~FF .CLK_POLARITY = 1'b1;
    defparam \video_de~FF .CE_POLARITY = 1'b1;
    defparam \video_de~FF .SR_POLARITY = 1'b0;
    defparam \video_de~FF .D_POLARITY = 1'b1;
    defparam \video_de~FF .SR_SYNC = 1'b0;
    defparam \video_de~FF .SR_VALUE = 1'b0;
    defparam \video_de~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \video_vs~FF  (.D(\u_color_bar_rgb/equal_99/n3 ), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(video_vs)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(345)
    defparam \video_vs~FF .CLK_POLARITY = 1'b1;
    defparam \video_vs~FF .CE_POLARITY = 1'b1;
    defparam \video_vs~FF .SR_POLARITY = 1'b0;
    defparam \video_vs~FF .D_POLARITY = 1'b0;
    defparam \video_vs~FF .SR_SYNC = 1'b0;
    defparam \video_vs~FF .SR_VALUE = 1'b0;
    defparam \video_vs~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \video_hs~FF  (.D(\u_color_bar_rgb/equal_105/n3 ), .CE(sys_rst_n), 
           .CLK(hdmi_tx_slow_clk), .SR(1'b0), .Q(video_hs)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(354)
    defparam \video_hs~FF .CLK_POLARITY = 1'b1;
    defparam \video_hs~FF .CE_POLARITY = 1'b1;
    defparam \video_hs~FF .SR_POLARITY = 1'b1;
    defparam \video_hs~FF .D_POLARITY = 1'b0;
    defparam \video_hs~FF .SR_SYNC = 1'b1;
    defparam \video_hs~FF .SR_VALUE = 1'b0;
    defparam \video_hs~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \video_b[0]~FF  (.D(\u_color_bar_rgb/n664 [0]), .CE(1'b1), .CLK(hdmi_tx_slow_clk), 
           .SR(sys_rst_n), .Q(video_b[0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(312)
    defparam \video_b[0]~FF .CLK_POLARITY = 1'b1;
    defparam \video_b[0]~FF .CE_POLARITY = 1'b1;
    defparam \video_b[0]~FF .SR_POLARITY = 1'b0;
    defparam \video_b[0]~FF .D_POLARITY = 1'b1;
    defparam \video_b[0]~FF .SR_SYNC = 1'b0;
    defparam \video_b[0]~FF .SR_VALUE = 1'b0;
    defparam \video_b[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \video_g[0]~FF  (.D(\u_color_bar_rgb/n664 [8]), .CE(1'b1), .CLK(hdmi_tx_slow_clk), 
           .SR(sys_rst_n), .Q(video_g[0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(312)
    defparam \video_g[0]~FF .CLK_POLARITY = 1'b1;
    defparam \video_g[0]~FF .CE_POLARITY = 1'b1;
    defparam \video_g[0]~FF .SR_POLARITY = 1'b0;
    defparam \video_g[0]~FF .D_POLARITY = 1'b1;
    defparam \video_g[0]~FF .SR_SYNC = 1'b0;
    defparam \video_g[0]~FF .SR_VALUE = 1'b0;
    defparam \video_g[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \video_r[0]~FF  (.D(\u_color_bar_rgb/n664 [16]), .CE(1'b1), .CLK(hdmi_tx_slow_clk), 
           .SR(sys_rst_n), .Q(video_r[0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(312)
    defparam \video_r[0]~FF .CLK_POLARITY = 1'b1;
    defparam \video_r[0]~FF .CE_POLARITY = 1'b1;
    defparam \video_r[0]~FF .SR_POLARITY = 1'b0;
    defparam \video_r[0]~FF .D_POLARITY = 1'b1;
    defparam \video_r[0]~FF .SR_SYNC = 1'b0;
    defparam \video_r[0]~FF .SR_VALUE = 1'b0;
    defparam \video_r[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_cnt[1]~FF  (.D(\u_color_bar_rgb/n163 [1]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_cnt [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_cnt[1]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[1]~FF .CE_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[1]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[1]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[1]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[1]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_cnt[2]~FF  (.D(\u_color_bar_rgb/n823 ), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_cnt [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_cnt[2]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[2]~FF .CE_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[2]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[2]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[2]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[2]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_cnt[3]~FF  (.D(\u_color_bar_rgb/n163 [3]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_cnt [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_cnt[3]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[3]~FF .CE_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[3]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[3]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[3]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[3]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_cnt[4]~FF  (.D(\u_color_bar_rgb/n163 [4]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_cnt [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_cnt[4]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[4]~FF .CE_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[4]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[4]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[4]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[4]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_cnt[5]~FF  (.D(\u_color_bar_rgb/n163 [5]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_cnt [5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_cnt[5]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[5]~FF .CE_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[5]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[5]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[5]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[5]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_cnt[6]~FF  (.D(\u_color_bar_rgb/n163 [6]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_cnt [6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_cnt[6]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[6]~FF .CE_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[6]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[6]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[6]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[6]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_cnt[7]~FF  (.D(\u_color_bar_rgb/n163 [7]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_cnt [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_cnt[7]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[7]~FF .CE_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[7]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[7]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[7]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[7]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_cnt[8]~FF  (.D(\u_color_bar_rgb/n163 [8]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_cnt [8])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_cnt[8]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[8]~FF .CE_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[8]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[8]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[8]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[8]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_cnt[9]~FF  (.D(\u_color_bar_rgb/n163 [9]), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_cnt [9])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_cnt[9]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[9]~FF .CE_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[9]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[9]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[9]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[9]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_cnt[10]~FF  (.D(\u_color_bar_rgb/n163 [10]), 
           .CE(1'b1), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_cnt [10])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_cnt[10]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[10]~FF .CE_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[10]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[10]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[10]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[10]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[10]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_cnt[11]~FF  (.D(\u_color_bar_rgb/n868 ), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_cnt [11])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_cnt[11]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[11]~FF .CE_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[11]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[11]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[11]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[11]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[11]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_cnt[12]~FF  (.D(\u_color_bar_rgb/n873 ), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_cnt [12])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_cnt[12]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[12]~FF .CE_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[12]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[12]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[12]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[12]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[12]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_cnt[13]~FF  (.D(\u_color_bar_rgb/n878 ), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_cnt [13])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_cnt[13]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[13]~FF .CE_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[13]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[13]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[13]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[13]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[13]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_cnt[14]~FF  (.D(\u_color_bar_rgb/n883 ), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_cnt [14])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_cnt[14]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[14]~FF .CE_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[14]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[14]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[14]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[14]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[14]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_cnt[15]~FF  (.D(\u_color_bar_rgb/n888 ), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_cnt [15])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_cnt[15]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[15]~FF .CE_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[15]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[15]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_cnt[15]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[15]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_cnt[15]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_cnt[1]~FF  (.D(\u_color_bar_rgb/n454 [1]), .CE(ceg_net39), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_cnt [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_cnt[1]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[1]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[1]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[1]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[1]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[1]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_cnt[2]~FF  (.D(\u_color_bar_rgb/n454 [2]), .CE(ceg_net39), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_cnt [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_cnt[2]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[2]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[2]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[2]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[2]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[2]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_cnt[3]~FF  (.D(\u_color_bar_rgb/n454 [3]), .CE(ceg_net39), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_cnt [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_cnt[3]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[3]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[3]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[3]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[3]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[3]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_cnt[4]~FF  (.D(\u_color_bar_rgb/n454 [4]), .CE(ceg_net39), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_cnt [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_cnt[4]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[4]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[4]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[4]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[4]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[4]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_cnt[5]~FF  (.D(\u_color_bar_rgb/n454 [5]), .CE(ceg_net39), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_cnt [5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_cnt[5]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[5]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[5]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[5]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[5]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[5]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_cnt[6]~FF  (.D(\u_color_bar_rgb/n454 [6]), .CE(ceg_net39), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_cnt [6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_cnt[6]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[6]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[6]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[6]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[6]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[6]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_cnt[7]~FF  (.D(\u_color_bar_rgb/n454 [7]), .CE(ceg_net39), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_cnt [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_cnt[7]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[7]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[7]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[7]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[7]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[7]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_cnt[8]~FF  (.D(\u_color_bar_rgb/n454 [8]), .CE(ceg_net39), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_cnt [8])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_cnt[8]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[8]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[8]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[8]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[8]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[8]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_cnt[9]~FF  (.D(\u_color_bar_rgb/n454 [9]), .CE(ceg_net39), 
           .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_cnt [9])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_cnt[9]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[9]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[9]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[9]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[9]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[9]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_cnt[10]~FF  (.D(\u_color_bar_rgb/n454 [10]), 
           .CE(ceg_net39), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_cnt [10])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_cnt[10]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[10]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[10]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[10]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[10]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[10]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[10]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_cnt[11]~FF  (.D(\u_color_bar_rgb/n454 [11]), 
           .CE(ceg_net39), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_cnt [11])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_cnt[11]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[11]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[11]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[11]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[11]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[11]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[11]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_cnt[12]~FF  (.D(\u_color_bar_rgb/n454 [12]), 
           .CE(ceg_net39), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_cnt [12])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_cnt[12]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[12]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[12]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[12]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[12]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[12]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[12]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_cnt[13]~FF  (.D(\u_color_bar_rgb/n454 [13]), 
           .CE(ceg_net39), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_cnt [13])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_cnt[13]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[13]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[13]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[13]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[13]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[13]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[13]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_cnt[14]~FF  (.D(\u_color_bar_rgb/n454 [14]), 
           .CE(ceg_net39), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_cnt [14])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_cnt[14]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[14]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[14]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[14]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[14]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[14]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[14]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_cnt[15]~FF  (.D(\u_color_bar_rgb/n454 [15]), 
           .CE(ceg_net39), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_cnt [15])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_cnt[15]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[15]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[15]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[15]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_cnt[15]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[15]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_cnt[15]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/v_state[1]~FF  (.D(\u_color_bar_rgb/v_state[0] ), 
           .CE(ceg_net41), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/v_state [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(178)
    defparam \u_color_bar_rgb/v_state[1]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_state[1]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_state[1]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/v_state[1]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/v_state[1]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/v_state[1]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/v_state[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \u_color_bar_rgb/h_state[1]~FF  (.D(\u_color_bar_rgb/h_state[0] ), 
           .CE(ceg_net40), .CLK(hdmi_tx_slow_clk), .SR(sys_rst_n), .Q(\u_color_bar_rgb/h_state [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(126)
    defparam \u_color_bar_rgb/h_state[1]~FF .CLK_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_state[1]~FF .CE_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_state[1]~FF .SR_POLARITY = 1'b0;
    defparam \u_color_bar_rgb/h_state[1]~FF .D_POLARITY = 1'b1;
    defparam \u_color_bar_rgb/h_state[1]~FF .SR_SYNC = 1'b0;
    defparam \u_color_bar_rgb/h_state[1]~FF .SR_VALUE = 1'b0;
    defparam \u_color_bar_rgb/h_state[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrClkRstGen[0]~FF  (.D(\DC_FIFO_inst/n523 ), .CE(\DC_FIFO_inst/n21 ), 
           .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/n21 ), .Q(\DC_FIFO_inst/WrClkRstGen[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(160)
    defparam \DC_FIFO_inst/WrClkRstGen[0]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrClkRstGen[0]~FF .CE_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrClkRstGen[0]~FF .SR_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrClkRstGen[0]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrClkRstGen[0]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrClkRstGen[0]~FF .SR_VALUE = 1'b1;
    defparam \DC_FIFO_inst/WrClkRstGen[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrClkRst~FF  (.D(\DC_FIFO_inst/n7 ), .CE(1'b1), 
           .CLK(gpio_clk_27m), .SR(1'b0), .Q(\DC_FIFO_inst/WrClkRst )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(176)
    defparam \DC_FIFO_inst/WrClkRst~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrClkRst~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrClkRst~FF .SR_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrClkRst~FF .D_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrClkRst~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrClkRst~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrClkRst~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddr_meta[0]~FF  (.D(\DC_FIFO_inst/FifoRdAddr [0]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddr_meta [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(292)
    defparam \DC_FIFO_inst/WrRdAddr_meta[0]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[0]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[0]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr_meta[0]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[0]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[0]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr_meta[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddr[0]~FF  (.D(\DC_FIFO_inst/WrRdAddr_meta [0]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddr [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(292)
    defparam \DC_FIFO_inst/WrRdAddr[0]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[0]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[0]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr[0]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[0]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[0]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddrReg[0]~FF  (.D(\DC_FIFO_inst/WrRdAddr [0]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddrReg [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(334)
    defparam \DC_FIFO_inst/WrRdAddrReg[0]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[0]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[0]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddrReg[0]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[0]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[0]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddrReg[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddr_meta[0]~FF  (.D(\DC_FIFO_inst/FifoWrAddr [0]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddr_meta [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(402)
    defparam \DC_FIFO_inst/RdWrAddr_meta[0]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[0]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[0]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr_meta[0]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[0]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[0]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr_meta[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrFullClr~FF  (.D(\DC_FIFO_inst/not_equal_52/n13 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrFullClr )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(339)
    defparam \DC_FIFO_inst/WrFullClr~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrFullClr~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrFullClr~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrFullClr~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrFullClr~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrFullClr~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrFullClr~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdAHighNext~FF  (.D(\DC_FIFO_inst/WrRdAddr [7]), 
           .CE(\DC_FIFO_inst/RdAHighRise ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdAHighNext )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(351)
    defparam \DC_FIFO_inst/RdAHighNext~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdAHighNext~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdAHighNext~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdAHighNext~FF .D_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdAHighNext~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdAHighNext~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdAHighNext~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/FullFlag~FF  (.D(\DC_FIFO_inst/n253 ), .CE(ceg_net24), 
           .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), .Q(\DC_FIFO_inst/FullFlag )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(364)
    defparam \DC_FIFO_inst/FullFlag~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FullFlag~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FullFlag~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/FullFlag~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FullFlag~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/FullFlag~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/FullFlag~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddr[0]~FF  (.D(\DC_FIFO_inst/RdWrAddr_meta [0]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddr [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(402)
    defparam \DC_FIFO_inst/RdWrAddr[0]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[0]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[0]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr[0]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[0]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[0]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddrReg[0]~FF  (.D(\DC_FIFO_inst/RdWrAddr [0]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddrReg [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(463)
    defparam \DC_FIFO_inst/RdWrAddrReg[0]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[0]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[0]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddrReg[0]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[0]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[0]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddrReg[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/FifoWrAddr[0]~FF  (.D(\DC_FIFO_inst/WrNextAddr [0]), 
           .CE(\DC_FIFO_inst/FifoWrEn ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/FifoWrAddr [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(631)
    defparam \DC_FIFO_inst/FifoWrAddr[0]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[0]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[0]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/FifoWrAddr[0]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[0]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[0]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/FifoWrAddr[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/EmptyClr~FF  (.D(\DC_FIFO_inst/not_equal_92/n13 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/EmptyClr )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(468)
    defparam \DC_FIFO_inst/EmptyClr~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/EmptyClr~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/EmptyClr~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/EmptyClr~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/EmptyClr~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/EmptyClr~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/EmptyClr~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrAHighNext~FF  (.D(\DC_FIFO_inst/RdWrAddr [7]), 
           .CE(\DC_FIFO_inst/WrAHighRise ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrAHighNext )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(484)
    defparam \DC_FIFO_inst/WrAHighNext~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrAHighNext~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrAHighNext~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrAHighNext~FF .D_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrAHighNext~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrAHighNext~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrAHighNext~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/U2_RdAddrCnt/n4~FF  (.D(\DC_FIFO_inst/n407 ), .CE(ceg_net26), 
           .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), .Q(\DC_FIFO_inst/U2_RdAddrCnt/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(497)
    defparam \DC_FIFO_inst/U2_RdAddrCnt/n4~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/U2_RdAddrCnt/n4~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/U2_RdAddrCnt/n4~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/U2_RdAddrCnt/n4~FF .D_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/U2_RdAddrCnt/n4~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/U2_RdAddrCnt/n4~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/U2_RdAddrCnt/n4~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrNextAddr[1]~FF  (.D(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n124 ), 
           .CE(\DC_FIFO_inst/FifoWrEn ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrNextAddr [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(708)
    defparam \DC_FIFO_inst/WrNextAddr[1]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[1]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[1]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrNextAddr[1]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[1]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[1]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrNextAddr[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrNextAddr[7]~FF  (.D(\DC_FIFO_inst/U1_WrAddrCnt/n87 ), 
           .CE(\DC_FIFO_inst/FifoWrEn ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrNextAddr [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(622)
    defparam \DC_FIFO_inst/WrNextAddr[7]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[7]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[7]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrNextAddr[7]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[7]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[7]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrNextAddr[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_valid~FF  (.D(n76), .CE(1'b1), .CLK(gpio_clk_27m), .SR(1'b0), 
           .Q(tx_valid)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(537)
    defparam \tx_valid~FF .CLK_POLARITY = 1'b1;
    defparam \tx_valid~FF .CE_POLARITY = 1'b1;
    defparam \tx_valid~FF .SR_POLARITY = 1'b1;
    defparam \tx_valid~FF .D_POLARITY = 1'b1;
    defparam \tx_valid~FF .SR_SYNC = 1'b1;
    defparam \tx_valid~FF .SR_VALUE = 1'b0;
    defparam \tx_valid~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrNextAddr[5]~FF  (.D(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n144 ), 
           .CE(\DC_FIFO_inst/FifoWrEn ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrNextAddr [5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(708)
    defparam \DC_FIFO_inst/WrNextAddr[5]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[5]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[5]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrNextAddr[5]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[5]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[5]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrNextAddr[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrNextAddr[4]~FF  (.D(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n139 ), 
           .CE(\DC_FIFO_inst/FifoWrEn ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrNextAddr [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(708)
    defparam \DC_FIFO_inst/WrNextAddr[4]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[4]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[4]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrNextAddr[4]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[4]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[4]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrNextAddr[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrNextAddr[3]~FF  (.D(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n134 ), 
           .CE(\DC_FIFO_inst/FifoWrEn ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrNextAddr [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(708)
    defparam \DC_FIFO_inst/WrNextAddr[3]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[3]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[3]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrNextAddr[3]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[3]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[3]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrNextAddr[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrNextAddr[6]~FF  (.D(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n149 ), 
           .CE(\DC_FIFO_inst/FifoWrEn ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrNextAddr [6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(734)
    defparam \DC_FIFO_inst/WrNextAddr[6]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[6]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[6]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrNextAddr[6]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[6]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[6]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrNextAddr[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrNextAddr[0]~FF  (.D(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n119 ), 
           .CE(\DC_FIFO_inst/FifoWrEn ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrNextAddr [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(708)
    defparam \DC_FIFO_inst/WrNextAddr[0]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[0]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[0]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrNextAddr[0]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[0]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[0]~FF .SR_VALUE = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrNextAddr[2]~FF  (.D(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n129 ), 
           .CE(\DC_FIFO_inst/FifoWrEn ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrNextAddr [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(708)
    defparam \DC_FIFO_inst/WrNextAddr[2]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[2]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[2]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrNextAddr[2]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[2]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrNextAddr[2]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrNextAddr[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/GrayCnt[0]~FF  (.D(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n114 ), 
           .CE(\DC_FIFO_inst/FifoWrEn ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/GrayCnt[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(708)
    defparam \DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/GrayCnt[0]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/GrayCnt[0]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/GrayCnt[0]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/GrayCnt[0]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/GrayCnt[0]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/GrayCnt[0]~FF .SR_VALUE = 1'b1;
    defparam \DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/GrayCnt[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/FifoWrAddr[1]~FF  (.D(\DC_FIFO_inst/WrNextAddr [1]), 
           .CE(\DC_FIFO_inst/FifoWrEn ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/FifoWrAddr [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(631)
    defparam \DC_FIFO_inst/FifoWrAddr[1]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[1]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[1]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/FifoWrAddr[1]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[1]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[1]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/FifoWrAddr[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/FifoWrAddr[2]~FF  (.D(\DC_FIFO_inst/WrNextAddr [2]), 
           .CE(\DC_FIFO_inst/FifoWrEn ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/FifoWrAddr [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(631)
    defparam \DC_FIFO_inst/FifoWrAddr[2]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[2]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[2]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/FifoWrAddr[2]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[2]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[2]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/FifoWrAddr[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/FifoWrAddr[3]~FF  (.D(\DC_FIFO_inst/WrNextAddr [3]), 
           .CE(\DC_FIFO_inst/FifoWrEn ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/FifoWrAddr [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(631)
    defparam \DC_FIFO_inst/FifoWrAddr[3]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[3]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[3]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/FifoWrAddr[3]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[3]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[3]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/FifoWrAddr[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/FifoWrAddr[4]~FF  (.D(\DC_FIFO_inst/WrNextAddr [4]), 
           .CE(\DC_FIFO_inst/FifoWrEn ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/FifoWrAddr [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(631)
    defparam \DC_FIFO_inst/FifoWrAddr[4]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[4]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[4]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/FifoWrAddr[4]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[4]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[4]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/FifoWrAddr[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/FifoWrAddr[5]~FF  (.D(\DC_FIFO_inst/WrNextAddr [5]), 
           .CE(\DC_FIFO_inst/FifoWrEn ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/FifoWrAddr [5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(631)
    defparam \DC_FIFO_inst/FifoWrAddr[5]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[5]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[5]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/FifoWrAddr[5]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[5]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[5]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/FifoWrAddr[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/FifoWrAddr[6]~FF  (.D(\DC_FIFO_inst/WrNextAddr [6]), 
           .CE(\DC_FIFO_inst/FifoWrEn ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/FifoWrAddr [6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(631)
    defparam \DC_FIFO_inst/FifoWrAddr[6]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[6]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[6]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/FifoWrAddr[6]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[6]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[6]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/FifoWrAddr[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/FifoWrAddr[7]~FF  (.D(\DC_FIFO_inst/WrNextAddr [7]), 
           .CE(\DC_FIFO_inst/FifoWrEn ), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/FifoWrAddr [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(631)
    defparam \DC_FIFO_inst/FifoWrAddr[7]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[7]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[7]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/FifoWrAddr[7]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[7]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/FifoWrAddr[7]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/FifoWrAddr[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdNextAddr[1]~FF  (.D(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n124 ), 
           .CE(n76), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdNextAddr [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(708)
    defparam \DC_FIFO_inst/RdNextAddr[1]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[1]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[1]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdNextAddr[1]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[1]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[1]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdNextAddr[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/FifoRdAddr[0]~FF  (.D(\DC_FIFO_inst/RdNextAddr [0]), 
           .CE(n76), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/FifoRdAddr [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(631)
    defparam \DC_FIFO_inst/FifoRdAddr[0]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[0]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[0]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/FifoRdAddr[0]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[0]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[0]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/FifoRdAddr[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdNextAddr[7]~FF  (.D(\DC_FIFO_inst/U2_RdAddrCnt/n87 ), 
           .CE(n76), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdNextAddr [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(622)
    defparam \DC_FIFO_inst/RdNextAddr[7]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[7]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[7]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdNextAddr[7]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[7]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[7]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdNextAddr[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdNextAddr[5]~FF  (.D(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n144 ), 
           .CE(n76), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdNextAddr [5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(708)
    defparam \DC_FIFO_inst/RdNextAddr[5]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[5]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[5]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdNextAddr[5]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[5]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[5]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdNextAddr[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdNextAddr[4]~FF  (.D(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n139 ), 
           .CE(n76), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdNextAddr [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(708)
    defparam \DC_FIFO_inst/RdNextAddr[4]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[4]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[4]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdNextAddr[4]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[4]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[4]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdNextAddr[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdNextAddr[3]~FF  (.D(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n134 ), 
           .CE(n76), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdNextAddr [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(708)
    defparam \DC_FIFO_inst/RdNextAddr[3]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[3]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[3]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdNextAddr[3]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[3]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[3]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdNextAddr[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdNextAddr[6]~FF  (.D(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n149 ), 
           .CE(n76), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdNextAddr [6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(734)
    defparam \DC_FIFO_inst/RdNextAddr[6]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[6]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[6]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdNextAddr[6]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[6]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[6]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdNextAddr[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdNextAddr[0]~FF  (.D(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n119 ), 
           .CE(n76), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdNextAddr [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(708)
    defparam \DC_FIFO_inst/RdNextAddr[0]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[0]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[0]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdNextAddr[0]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[0]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[0]~FF .SR_VALUE = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdNextAddr[2]~FF  (.D(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n129 ), 
           .CE(n76), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdNextAddr [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(708)
    defparam \DC_FIFO_inst/RdNextAddr[2]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[2]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[2]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdNextAddr[2]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[2]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdNextAddr[2]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdNextAddr[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/GrayCnt[0]~FF  (.D(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n114 ), 
           .CE(n76), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/GrayCnt[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(708)
    defparam \DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/GrayCnt[0]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/GrayCnt[0]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/GrayCnt[0]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/GrayCnt[0]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/GrayCnt[0]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/GrayCnt[0]~FF .SR_VALUE = 1'b1;
    defparam \DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/GrayCnt[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/FifoRdAddr[1]~FF  (.D(\DC_FIFO_inst/RdNextAddr [1]), 
           .CE(n76), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/FifoRdAddr [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(631)
    defparam \DC_FIFO_inst/FifoRdAddr[1]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[1]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[1]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/FifoRdAddr[1]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[1]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[1]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/FifoRdAddr[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/FifoRdAddr[2]~FF  (.D(\DC_FIFO_inst/RdNextAddr [2]), 
           .CE(n76), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/FifoRdAddr [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(631)
    defparam \DC_FIFO_inst/FifoRdAddr[2]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[2]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[2]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/FifoRdAddr[2]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[2]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[2]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/FifoRdAddr[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/FifoRdAddr[3]~FF  (.D(\DC_FIFO_inst/RdNextAddr [3]), 
           .CE(n76), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/FifoRdAddr [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(631)
    defparam \DC_FIFO_inst/FifoRdAddr[3]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[3]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[3]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/FifoRdAddr[3]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[3]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[3]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/FifoRdAddr[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/FifoRdAddr[4]~FF  (.D(\DC_FIFO_inst/RdNextAddr [4]), 
           .CE(n76), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/FifoRdAddr [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(631)
    defparam \DC_FIFO_inst/FifoRdAddr[4]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[4]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[4]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/FifoRdAddr[4]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[4]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[4]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/FifoRdAddr[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/FifoRdAddr[5]~FF  (.D(\DC_FIFO_inst/RdNextAddr [5]), 
           .CE(n76), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/FifoRdAddr [5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(631)
    defparam \DC_FIFO_inst/FifoRdAddr[5]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[5]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[5]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/FifoRdAddr[5]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[5]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[5]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/FifoRdAddr[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/FifoRdAddr[6]~FF  (.D(\DC_FIFO_inst/RdNextAddr [6]), 
           .CE(n76), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/FifoRdAddr [6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(631)
    defparam \DC_FIFO_inst/FifoRdAddr[6]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[6]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[6]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/FifoRdAddr[6]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[6]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[6]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/FifoRdAddr[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/FifoRdAddr[7]~FF  (.D(\DC_FIFO_inst/RdNextAddr [7]), 
           .CE(n76), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/FifoRdAddr [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(631)
    defparam \DC_FIFO_inst/FifoRdAddr[7]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[7]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[7]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/FifoRdAddr[7]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[7]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/FifoRdAddr[7]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/FifoRdAddr[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddr_meta[1]~FF  (.D(\DC_FIFO_inst/FifoRdAddr [1]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddr_meta [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(292)
    defparam \DC_FIFO_inst/WrRdAddr_meta[1]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[1]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[1]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr_meta[1]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[1]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[1]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr_meta[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddr_meta[2]~FF  (.D(\DC_FIFO_inst/FifoRdAddr [2]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddr_meta [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(292)
    defparam \DC_FIFO_inst/WrRdAddr_meta[2]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[2]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[2]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr_meta[2]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[2]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[2]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr_meta[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddr_meta[3]~FF  (.D(\DC_FIFO_inst/FifoRdAddr [3]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddr_meta [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(292)
    defparam \DC_FIFO_inst/WrRdAddr_meta[3]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[3]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[3]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr_meta[3]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[3]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[3]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr_meta[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddr_meta[4]~FF  (.D(\DC_FIFO_inst/FifoRdAddr [4]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddr_meta [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(292)
    defparam \DC_FIFO_inst/WrRdAddr_meta[4]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[4]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[4]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr_meta[4]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[4]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[4]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr_meta[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddr_meta[5]~FF  (.D(\DC_FIFO_inst/FifoRdAddr [5]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddr_meta [5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(292)
    defparam \DC_FIFO_inst/WrRdAddr_meta[5]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[5]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[5]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr_meta[5]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[5]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[5]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr_meta[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddr_meta[6]~FF  (.D(\DC_FIFO_inst/FifoRdAddr [6]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddr_meta [6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(292)
    defparam \DC_FIFO_inst/WrRdAddr_meta[6]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[6]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[6]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr_meta[6]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[6]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[6]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr_meta[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddr_meta[7]~FF  (.D(\DC_FIFO_inst/FifoRdAddr [7]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddr_meta [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(292)
    defparam \DC_FIFO_inst/WrRdAddr_meta[7]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[7]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[7]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr_meta[7]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[7]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr_meta[7]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr_meta[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddr[1]~FF  (.D(\DC_FIFO_inst/WrRdAddr_meta [1]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddr [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(292)
    defparam \DC_FIFO_inst/WrRdAddr[1]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[1]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[1]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr[1]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[1]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[1]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddr[2]~FF  (.D(\DC_FIFO_inst/WrRdAddr_meta [2]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddr [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(292)
    defparam \DC_FIFO_inst/WrRdAddr[2]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[2]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[2]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr[2]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[2]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[2]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddr[3]~FF  (.D(\DC_FIFO_inst/WrRdAddr_meta [3]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddr [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(292)
    defparam \DC_FIFO_inst/WrRdAddr[3]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[3]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[3]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr[3]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[3]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[3]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddr[4]~FF  (.D(\DC_FIFO_inst/WrRdAddr_meta [4]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddr [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(292)
    defparam \DC_FIFO_inst/WrRdAddr[4]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[4]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[4]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr[4]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[4]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[4]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddr[5]~FF  (.D(\DC_FIFO_inst/WrRdAddr_meta [5]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddr [5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(292)
    defparam \DC_FIFO_inst/WrRdAddr[5]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[5]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[5]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr[5]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[5]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[5]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddr[6]~FF  (.D(\DC_FIFO_inst/WrRdAddr_meta [6]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddr [6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(292)
    defparam \DC_FIFO_inst/WrRdAddr[6]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[6]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[6]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr[6]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[6]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[6]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddr[7]~FF  (.D(\DC_FIFO_inst/WrRdAddr_meta [7]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddr [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(292)
    defparam \DC_FIFO_inst/WrRdAddr[7]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[7]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[7]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr[7]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[7]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddr[7]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddr[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddrReg[1]~FF  (.D(\DC_FIFO_inst/WrRdAddr [1]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddrReg [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(334)
    defparam \DC_FIFO_inst/WrRdAddrReg[1]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[1]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[1]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddrReg[1]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[1]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[1]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddrReg[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddrReg[2]~FF  (.D(\DC_FIFO_inst/WrRdAddr [2]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddrReg [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(334)
    defparam \DC_FIFO_inst/WrRdAddrReg[2]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[2]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[2]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddrReg[2]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[2]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[2]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddrReg[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddrReg[3]~FF  (.D(\DC_FIFO_inst/WrRdAddr [3]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddrReg [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(334)
    defparam \DC_FIFO_inst/WrRdAddrReg[3]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[3]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[3]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddrReg[3]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[3]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[3]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddrReg[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddrReg[4]~FF  (.D(\DC_FIFO_inst/WrRdAddr [4]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddrReg [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(334)
    defparam \DC_FIFO_inst/WrRdAddrReg[4]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[4]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[4]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddrReg[4]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[4]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[4]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddrReg[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddrReg[5]~FF  (.D(\DC_FIFO_inst/WrRdAddr [5]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddrReg [5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(334)
    defparam \DC_FIFO_inst/WrRdAddrReg[5]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[5]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[5]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddrReg[5]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[5]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[5]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddrReg[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddrReg[6]~FF  (.D(\DC_FIFO_inst/WrRdAddr [6]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddrReg [6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(334)
    defparam \DC_FIFO_inst/WrRdAddrReg[6]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[6]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[6]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddrReg[6]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[6]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[6]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddrReg[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrRdAddrReg[7]~FF  (.D(\DC_FIFO_inst/WrRdAddr [7]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/WrRdAddrReg [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(334)
    defparam \DC_FIFO_inst/WrRdAddrReg[7]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[7]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[7]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddrReg[7]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[7]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrRdAddrReg[7]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrRdAddrReg[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddr_meta[1]~FF  (.D(\DC_FIFO_inst/FifoWrAddr [1]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddr_meta [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(402)
    defparam \DC_FIFO_inst/RdWrAddr_meta[1]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[1]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[1]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr_meta[1]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[1]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[1]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr_meta[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddr_meta[2]~FF  (.D(\DC_FIFO_inst/FifoWrAddr [2]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddr_meta [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(402)
    defparam \DC_FIFO_inst/RdWrAddr_meta[2]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[2]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[2]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr_meta[2]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[2]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[2]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr_meta[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddr_meta[3]~FF  (.D(\DC_FIFO_inst/FifoWrAddr [3]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddr_meta [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(402)
    defparam \DC_FIFO_inst/RdWrAddr_meta[3]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[3]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[3]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr_meta[3]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[3]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[3]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr_meta[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddr_meta[4]~FF  (.D(\DC_FIFO_inst/FifoWrAddr [4]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddr_meta [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(402)
    defparam \DC_FIFO_inst/RdWrAddr_meta[4]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[4]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[4]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr_meta[4]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[4]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[4]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr_meta[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddr_meta[5]~FF  (.D(\DC_FIFO_inst/FifoWrAddr [5]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddr_meta [5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(402)
    defparam \DC_FIFO_inst/RdWrAddr_meta[5]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[5]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[5]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr_meta[5]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[5]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[5]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr_meta[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddr_meta[6]~FF  (.D(\DC_FIFO_inst/FifoWrAddr [6]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddr_meta [6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(402)
    defparam \DC_FIFO_inst/RdWrAddr_meta[6]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[6]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[6]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr_meta[6]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[6]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[6]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr_meta[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddr_meta[7]~FF  (.D(\DC_FIFO_inst/FifoWrAddr [7]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddr_meta [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(402)
    defparam \DC_FIFO_inst/RdWrAddr_meta[7]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[7]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[7]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr_meta[7]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[7]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr_meta[7]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr_meta[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddr[1]~FF  (.D(\DC_FIFO_inst/RdWrAddr_meta [1]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddr [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(402)
    defparam \DC_FIFO_inst/RdWrAddr[1]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[1]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[1]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr[1]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[1]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[1]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddr[2]~FF  (.D(\DC_FIFO_inst/RdWrAddr_meta [2]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddr [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(402)
    defparam \DC_FIFO_inst/RdWrAddr[2]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[2]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[2]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr[2]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[2]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[2]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddr[3]~FF  (.D(\DC_FIFO_inst/RdWrAddr_meta [3]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddr [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(402)
    defparam \DC_FIFO_inst/RdWrAddr[3]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[3]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[3]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr[3]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[3]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[3]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddr[4]~FF  (.D(\DC_FIFO_inst/RdWrAddr_meta [4]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddr [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(402)
    defparam \DC_FIFO_inst/RdWrAddr[4]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[4]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[4]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr[4]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[4]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[4]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddr[5]~FF  (.D(\DC_FIFO_inst/RdWrAddr_meta [5]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddr [5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(402)
    defparam \DC_FIFO_inst/RdWrAddr[5]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[5]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[5]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr[5]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[5]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[5]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddr[6]~FF  (.D(\DC_FIFO_inst/RdWrAddr_meta [6]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddr [6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(402)
    defparam \DC_FIFO_inst/RdWrAddr[6]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[6]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[6]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr[6]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[6]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[6]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddr[7]~FF  (.D(\DC_FIFO_inst/RdWrAddr_meta [7]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddr [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(402)
    defparam \DC_FIFO_inst/RdWrAddr[7]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[7]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[7]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr[7]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[7]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddr[7]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddr[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddrReg[1]~FF  (.D(\DC_FIFO_inst/RdWrAddr [1]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddrReg [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(463)
    defparam \DC_FIFO_inst/RdWrAddrReg[1]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[1]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[1]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddrReg[1]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[1]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[1]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddrReg[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddrReg[2]~FF  (.D(\DC_FIFO_inst/RdWrAddr [2]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddrReg [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(463)
    defparam \DC_FIFO_inst/RdWrAddrReg[2]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[2]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[2]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddrReg[2]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[2]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[2]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddrReg[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddrReg[3]~FF  (.D(\DC_FIFO_inst/RdWrAddr [3]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddrReg [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(463)
    defparam \DC_FIFO_inst/RdWrAddrReg[3]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[3]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[3]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddrReg[3]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[3]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[3]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddrReg[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddrReg[4]~FF  (.D(\DC_FIFO_inst/RdWrAddr [4]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddrReg [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(463)
    defparam \DC_FIFO_inst/RdWrAddrReg[4]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[4]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[4]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddrReg[4]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[4]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[4]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddrReg[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddrReg[5]~FF  (.D(\DC_FIFO_inst/RdWrAddr [5]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddrReg [5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(463)
    defparam \DC_FIFO_inst/RdWrAddrReg[5]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[5]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[5]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddrReg[5]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[5]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[5]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddrReg[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddrReg[6]~FF  (.D(\DC_FIFO_inst/RdWrAddr [6]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddrReg [6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(463)
    defparam \DC_FIFO_inst/RdWrAddrReg[6]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[6]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[6]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddrReg[6]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[6]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[6]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddrReg[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/RdWrAddrReg[7]~FF  (.D(\DC_FIFO_inst/RdWrAddr [7]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/WrClkRst ), 
           .Q(\DC_FIFO_inst/RdWrAddrReg [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(463)
    defparam \DC_FIFO_inst/RdWrAddrReg[7]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[7]~FF .CE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[7]~FF .SR_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddrReg[7]~FF .D_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[7]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/RdWrAddrReg[7]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/RdWrAddrReg[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \DC_FIFO_inst/WrClkRstGen[1]~FF  (.D(\DC_FIFO_inst/n21 ), .CE(\DC_FIFO_inst/n21 ), 
           .CLK(gpio_clk_27m), .SR(\DC_FIFO_inst/n21 ), .Q(\DC_FIFO_inst/WrClkRstGen[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(160)
    defparam \DC_FIFO_inst/WrClkRstGen[1]~FF .CLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrClkRstGen[1]~FF .CE_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrClkRstGen[1]~FF .SR_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/WrClkRstGen[1]~FF .D_POLARITY = 1'b0;
    defparam \DC_FIFO_inst/WrClkRstGen[1]~FF .SR_SYNC = 1'b1;
    defparam \DC_FIFO_inst/WrClkRstGen[1]~FF .SR_VALUE = 1'b0;
    defparam \DC_FIFO_inst/WrClkRstGen[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bw_cnt_r[15]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n440 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart01_rx/n562 ), 
           .Q(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [15])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(74)
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[15]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[15]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[15]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[15]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[15]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[15]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[15]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/cnt_en~FF  (.D(1'b0), .CE(rx_valid), 
           .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart01_rx/equal_9/n3 ), 
           .Q(\uart_rx_tx_inst/uart01_rx/cnt_en )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(64)
    defparam \uart_rx_tx_inst/uart01_rx/cnt_en~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/cnt_en~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/cnt_en~FF .SR_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/cnt_en~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/cnt_en~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/cnt_en~FF .SR_VALUE = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/cnt_en~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bw_cnt_r[14]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n435 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart01_rx/n562 ), 
           .Q(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [14])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(74)
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[14]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[14]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[14]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[14]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[14]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[14]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[14]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bw_cnt_r[13]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n430 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart01_rx/n562 ), 
           .Q(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [13])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(74)
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[13]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[13]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[13]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[13]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[13]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[13]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[13]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_data[0]~FF  (.D(\uart_rx_tx_inst/uart01_rx/temp_cap_r [1]), 
           .CE(\uart_rx_tx_inst/uart01_rx/n622 ), .CLK(gpio_clk_27m), .SR(1'b0), 
           .Q(rx_data[0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(144)
    defparam \rx_data[0]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_data[0]~FF .CE_POLARITY = 1'b1;
    defparam \rx_data[0]~FF .SR_POLARITY = 1'b1;
    defparam \rx_data[0]~FF .D_POLARITY = 1'b1;
    defparam \rx_data[0]~FF .SR_SYNC = 1'b1;
    defparam \rx_data[0]~FF .SR_VALUE = 1'b0;
    defparam \rx_data[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bw_cnt_r[12]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n425 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart01_rx/n562 ), 
           .Q(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [12])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(74)
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[12]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[12]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[12]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[12]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[12]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[12]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[12]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bit_over_r~FF  (.D(\uart_rx_tx_inst/uart01_rx/equal_16/n31 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(1'b0), .Q(\uart_rx_tx_inst/uart01_rx/bit_over_r )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(74)
    defparam \uart_rx_tx_inst/uart01_rx/bit_over_r~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_over_r~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_over_r~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_over_r~FF .D_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bit_over_r~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_over_r~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bit_over_r~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bw_cnt_r[11]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n420 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart01_rx/n562 ), 
           .Q(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [11])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(74)
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[11]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[11]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[11]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[11]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[11]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[11]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[11]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bw_cnt_r[10]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n415 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart01_rx/n562 ), 
           .Q(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [10])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(74)
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[10]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[10]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[10]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[10]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[10]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[10]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[10]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/rxd_r[0]~FF  (.D(led[0]), .CE(1'b1), 
           .CLK(gpio_clk_27m), .SR(1'b0), .Q(\uart_rx_tx_inst/uart01_rx/rxd_r[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(42)
    defparam \uart_rx_tx_inst/uart01_rx/rxd_r[0]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/rxd_r[0]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/rxd_r[0]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/rxd_r[0]~FF .D_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/rxd_r[0]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/rxd_r[0]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/rxd_r[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bw_cnt_r[9]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n410 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart01_rx/n562 ), 
           .Q(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [9])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(74)
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[9]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[9]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[9]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[9]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[9]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[9]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bit_cnt_r[0]~FF  (.D(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [0]), 
           .CE(\uart_rx_tx_inst/uart01_rx/bit_over_r ), .CLK(gpio_clk_27m), 
           .SR(\uart_rx_tx_inst/uart01_rx/cnt_en ), .Q(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(83)
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[0]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[0]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[0]~FF .SR_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[0]~FF .D_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[0]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[0]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bw_cnt_r[8]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n405 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart01_rx/n562 ), 
           .Q(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [8])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(74)
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[8]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[8]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[8]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[8]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[8]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[8]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bw_cnt_r[7]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n400 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart01_rx/n562 ), 
           .Q(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(74)
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[7]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[7]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[7]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[7]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[7]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[7]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bw_cnt_r[0]~FF  (.D(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [0]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart01_rx/n562 ), 
           .Q(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(74)
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[0]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[0]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[0]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[0]~FF .D_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[0]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[0]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/capture_p1_en_dly[0]~FF  (.D(\uart_rx_tx_inst/uart01_rx/equal_35/n31 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(1'b0), .Q(\uart_rx_tx_inst/uart01_rx/capture_p1_en_dly [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(119)
    defparam \uart_rx_tx_inst/uart01_rx/capture_p1_en_dly[0]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/capture_p1_en_dly[0]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/capture_p1_en_dly[0]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/capture_p1_en_dly[0]~FF .D_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/capture_p1_en_dly[0]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/capture_p1_en_dly[0]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/capture_p1_en_dly[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_valid~FF  (.D(\uart_rx_tx_inst/uart01_rx/n249 ), .CE(1'b1), 
           .CLK(gpio_clk_27m), .SR(1'b0), .Q(rx_valid)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(154)
    defparam \rx_valid~FF .CLK_POLARITY = 1'b1;
    defparam \rx_valid~FF .CE_POLARITY = 1'b1;
    defparam \rx_valid~FF .SR_POLARITY = 1'b1;
    defparam \rx_valid~FF .D_POLARITY = 1'b1;
    defparam \rx_valid~FF .SR_SYNC = 1'b1;
    defparam \rx_valid~FF .SR_VALUE = 1'b0;
    defparam \rx_valid~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bw_cnt_r[6]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n395 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart01_rx/n562 ), 
           .Q(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(74)
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[6]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[6]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[6]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[6]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[6]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[6]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bw_cnt_r[5]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n390 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart01_rx/n562 ), 
           .Q(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(74)
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[5]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[5]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[5]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[5]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[5]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[5]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bw_cnt_r[4]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n385 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart01_rx/n562 ), 
           .Q(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(74)
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[4]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[4]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[4]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[4]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[4]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[4]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bw_cnt_r[3]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n380 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart01_rx/n562 ), 
           .Q(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(74)
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[3]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[3]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[3]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[3]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[3]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[3]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bw_cnt_r[1]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n370 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart01_rx/n562 ), 
           .Q(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(74)
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[1]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[1]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[1]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[1]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[1]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[1]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bw_cnt_r[2]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n375 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart01_rx/n562 ), 
           .Q(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(74)
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[2]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[2]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[2]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[2]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[2]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[2]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bw_cnt_r[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_data[1]~FF  (.D(\uart_rx_tx_inst/uart01_rx/temp_cap_r [1]), 
           .CE(\uart_rx_tx_inst/uart01_rx/n620 ), .CLK(gpio_clk_27m), .SR(1'b0), 
           .Q(rx_data[1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(144)
    defparam \rx_data[1]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_data[1]~FF .CE_POLARITY = 1'b0;
    defparam \rx_data[1]~FF .SR_POLARITY = 1'b1;
    defparam \rx_data[1]~FF .D_POLARITY = 1'b1;
    defparam \rx_data[1]~FF .SR_SYNC = 1'b1;
    defparam \rx_data[1]~FF .SR_VALUE = 1'b0;
    defparam \rx_data[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_data[2]~FF  (.D(\uart_rx_tx_inst/uart01_rx/temp_cap_r [1]), 
           .CE(\uart_rx_tx_inst/uart01_rx/n617 ), .CLK(gpio_clk_27m), .SR(1'b0), 
           .Q(rx_data[2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(144)
    defparam \rx_data[2]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_data[2]~FF .CE_POLARITY = 1'b1;
    defparam \rx_data[2]~FF .SR_POLARITY = 1'b1;
    defparam \rx_data[2]~FF .D_POLARITY = 1'b1;
    defparam \rx_data[2]~FF .SR_SYNC = 1'b1;
    defparam \rx_data[2]~FF .SR_VALUE = 1'b0;
    defparam \rx_data[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_data[3]~FF  (.D(\uart_rx_tx_inst/uart01_rx/temp_cap_r [1]), 
           .CE(\uart_rx_tx_inst/uart01_rx/n615 ), .CLK(gpio_clk_27m), .SR(1'b0), 
           .Q(rx_data[3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(144)
    defparam \rx_data[3]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_data[3]~FF .CE_POLARITY = 1'b0;
    defparam \rx_data[3]~FF .SR_POLARITY = 1'b1;
    defparam \rx_data[3]~FF .D_POLARITY = 1'b1;
    defparam \rx_data[3]~FF .SR_SYNC = 1'b1;
    defparam \rx_data[3]~FF .SR_VALUE = 1'b0;
    defparam \rx_data[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_data[4]~FF  (.D(\uart_rx_tx_inst/uart01_rx/temp_cap_r [1]), 
           .CE(\uart_rx_tx_inst/uart01_rx/n612 ), .CLK(gpio_clk_27m), .SR(1'b0), 
           .Q(rx_data[4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(144)
    defparam \rx_data[4]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_data[4]~FF .CE_POLARITY = 1'b1;
    defparam \rx_data[4]~FF .SR_POLARITY = 1'b1;
    defparam \rx_data[4]~FF .D_POLARITY = 1'b1;
    defparam \rx_data[4]~FF .SR_SYNC = 1'b1;
    defparam \rx_data[4]~FF .SR_VALUE = 1'b0;
    defparam \rx_data[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_data[5]~FF  (.D(\uart_rx_tx_inst/uart01_rx/temp_cap_r [1]), 
           .CE(\uart_rx_tx_inst/uart01_rx/n607 ), .CLK(gpio_clk_27m), .SR(1'b0), 
           .Q(rx_data[5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(144)
    defparam \rx_data[5]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_data[5]~FF .CE_POLARITY = 1'b0;
    defparam \rx_data[5]~FF .SR_POLARITY = 1'b1;
    defparam \rx_data[5]~FF .D_POLARITY = 1'b1;
    defparam \rx_data[5]~FF .SR_SYNC = 1'b1;
    defparam \rx_data[5]~FF .SR_VALUE = 1'b0;
    defparam \rx_data[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_data[6]~FF  (.D(\uart_rx_tx_inst/uart01_rx/temp_cap_r [1]), 
           .CE(\uart_rx_tx_inst/uart01_rx/n604 ), .CLK(gpio_clk_27m), .SR(1'b0), 
           .Q(rx_data[6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(144)
    defparam \rx_data[6]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_data[6]~FF .CE_POLARITY = 1'b1;
    defparam \rx_data[6]~FF .SR_POLARITY = 1'b1;
    defparam \rx_data[6]~FF .D_POLARITY = 1'b1;
    defparam \rx_data[6]~FF .SR_SYNC = 1'b1;
    defparam \rx_data[6]~FF .SR_VALUE = 1'b0;
    defparam \rx_data[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_data[7]~FF  (.D(\uart_rx_tx_inst/uart01_rx/temp_cap_r [1]), 
           .CE(\uart_rx_tx_inst/uart01_rx/n602 ), .CLK(gpio_clk_27m), .SR(1'b0), 
           .Q(rx_data[7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(144)
    defparam \rx_data[7]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_data[7]~FF .CE_POLARITY = 1'b0;
    defparam \rx_data[7]~FF .SR_POLARITY = 1'b1;
    defparam \rx_data[7]~FF .D_POLARITY = 1'b1;
    defparam \rx_data[7]~FF .SR_SYNC = 1'b1;
    defparam \rx_data[7]~FF .SR_VALUE = 1'b0;
    defparam \rx_data[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/capture_p1_en_dly[1]~FF  (.D(\uart_rx_tx_inst/uart01_rx/capture_p1_en_dly [0]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(1'b0), .Q(\uart_rx_tx_inst/uart01_rx/capture_p1_en_dly [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(119)
    defparam \uart_rx_tx_inst/uart01_rx/capture_p1_en_dly[1]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/capture_p1_en_dly[1]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/capture_p1_en_dly[1]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/capture_p1_en_dly[1]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/capture_p1_en_dly[1]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/capture_p1_en_dly[1]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/capture_p1_en_dly[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bit_cnt_r[1]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n488 ), 
           .CE(\uart_rx_tx_inst/uart01_rx/bit_over_r ), .CLK(gpio_clk_27m), 
           .SR(\uart_rx_tx_inst/uart01_rx/cnt_en ), .Q(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(83)
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[1]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[1]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[1]~FF .SR_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[1]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[1]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[1]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bit_cnt_r[2]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n495 ), 
           .CE(\uart_rx_tx_inst/uart01_rx/bit_over_r ), .CLK(gpio_clk_27m), 
           .SR(\uart_rx_tx_inst/uart01_rx/cnt_en ), .Q(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(83)
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[2]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[2]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[2]~FF .SR_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[2]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[2]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[2]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/bit_cnt_r[3]~FF  (.D(\uart_rx_tx_inst/uart01_rx/n500 ), 
           .CE(\uart_rx_tx_inst/uart01_rx/bit_over_r ), .CLK(gpio_clk_27m), 
           .SR(\uart_rx_tx_inst/uart01_rx/cnt_en ), .Q(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(83)
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[3]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[3]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[3]~FF .SR_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[3]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[3]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[3]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/bit_cnt_r[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/temp_cap_r[1]~FF  (.D(\uart_rx_tx_inst/uart01_rx/rxd_r[0] ), 
           .CE(\uart_rx_tx_inst/uart01_rx/n592 ), .CLK(gpio_clk_27m), .SR(1'b0), 
           .Q(\uart_rx_tx_inst/uart01_rx/temp_cap_r [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(109)
    defparam \uart_rx_tx_inst/uart01_rx/temp_cap_r[1]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/temp_cap_r[1]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/temp_cap_r[1]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/temp_cap_r[1]~FF .D_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/temp_cap_r[1]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/temp_cap_r[1]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/temp_cap_r[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart01_rx/rxd_r[1]~FF  (.D(\uart_rx_tx_inst/uart01_rx/rxd_r[0] ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(1'b0), .Q(\uart_rx_tx_inst/uart01_rx/rxd_r[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(42)
    defparam \uart_rx_tx_inst/uart01_rx/rxd_r[1]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/rxd_r[1]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/rxd_r[1]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/rxd_r[1]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/rxd_r[1]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart01_rx/rxd_r[1]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart01_rx/rxd_r[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_cnt[15]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n52 [15]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart_tx01/n227 ), 
           .Q(\uart_rx_tx_inst/uart_tx01/tx_cnt [15])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(75)
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[15]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[15]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[15]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[15]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[15]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[15]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[15]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/bite_cnt[0]~FF  (.D(\uart_rx_tx_inst/uart_tx01/bite_cnt [0]), 
           .CE(\uart_rx_tx_inst/uart_tx01/equal_21/n31 ), .CLK(gpio_clk_27m), 
           .SR(\uart_rx_tx_inst/tx_busy ), .Q(\uart_rx_tx_inst/uart_tx01/bite_cnt [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(88)
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[0]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[0]~FF .CE_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[0]~FF .SR_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[0]~FF .D_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[0]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[0]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_cnt[2]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n52 [2]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart_tx01/n227 ), 
           .Q(\uart_rx_tx_inst/uart_tx01/tx_cnt [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(75)
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[2]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[2]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[2]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[2]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[2]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[2]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_cnt[14]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n52 [14]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart_tx01/n227 ), 
           .Q(\uart_rx_tx_inst/uart_tx01/tx_cnt [14])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(75)
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[14]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[14]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[14]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[14]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[14]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[14]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[14]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_data_r[0]~FF  (.D(tx_data[0]), .CE(tx_valid), 
           .CLK(gpio_clk_27m), .SR(1'b0), .Q(\uart_rx_tx_inst/uart_tx01/tx_data_r [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(56)
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[0]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[0]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[0]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[0]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[0]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[0]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_cnt[13]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n52 [13]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart_tx01/n227 ), 
           .Q(\uart_rx_tx_inst/uart_tx01/tx_cnt [13])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(75)
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[13]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[13]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[13]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[13]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[13]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[13]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[13]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_cnt[12]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n52 [12]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart_tx01/n227 ), 
           .Q(\uart_rx_tx_inst/uart_tx01/tx_cnt [12])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(75)
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[12]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[12]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[12]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[12]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[12]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[12]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[12]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/tx_busy~FF  (.D(1'b0), .CE(\uart_rx_tx_inst/tx_over ), 
           .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart_tx01/tx_valid_dly [0]), 
           .Q(\uart_rx_tx_inst/tx_busy )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(65)
    defparam \uart_rx_tx_inst/tx_busy~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/tx_busy~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/tx_busy~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/tx_busy~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/tx_busy~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/tx_busy~FF .SR_VALUE = 1'b1;
    defparam \uart_rx_tx_inst/tx_busy~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_cnt[11]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n52 [11]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart_tx01/n227 ), 
           .Q(\uart_rx_tx_inst/uart_tx01/tx_cnt [11])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(75)
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[11]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[11]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[11]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[11]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[11]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[11]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[11]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_cnt[10]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n52 [10]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart_tx01/n227 ), 
           .Q(\uart_rx_tx_inst/uart_tx01/tx_cnt [10])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(75)
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[10]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[10]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[10]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[10]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[10]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[10]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[10]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_cnt[4]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n52 [4]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart_tx01/n227 ), 
           .Q(\uart_rx_tx_inst/uart_tx01/tx_cnt [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(75)
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[4]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[4]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[4]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[4]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[4]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[4]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_cnt[3]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n52 [3]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart_tx01/n227 ), 
           .Q(\uart_rx_tx_inst/uart_tx01/tx_cnt [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(75)
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[3]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[3]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[3]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[3]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[3]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[3]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_cnt[9]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n52 [9]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart_tx01/n227 ), 
           .Q(\uart_rx_tx_inst/uart_tx01/tx_cnt [9])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(75)
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[9]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[9]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[9]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[9]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[9]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[9]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_cnt[5]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n52 [5]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart_tx01/n227 ), 
           .Q(\uart_rx_tx_inst/uart_tx01/tx_cnt [5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(75)
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[5]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[5]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[5]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[5]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[5]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[5]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/tx_over~FF  (.D(\uart_rx_tx_inst/uart_tx01/n153 ), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(1'b0), .Q(\uart_rx_tx_inst/tx_over )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(101)
    defparam \uart_rx_tx_inst/tx_over~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/tx_over~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/tx_over~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/tx_over~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/tx_over~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/tx_over~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/tx_over~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_cnt[8]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n52 [8]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart_tx01/n227 ), 
           .Q(\uart_rx_tx_inst/uart_tx01/tx_cnt [8])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(75)
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[8]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[8]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[8]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[8]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[8]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[8]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \txd_2~FF  (.D(\uart_rx_tx_inst/uart_tx01/n171 ), .CE(1'b1), 
           .CLK(gpio_clk_27m), .SR(1'b0), .Q(txd_2)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(122)
    defparam \txd_2~FF .CLK_POLARITY = 1'b1;
    defparam \txd_2~FF .CE_POLARITY = 1'b1;
    defparam \txd_2~FF .SR_POLARITY = 1'b1;
    defparam \txd_2~FF .D_POLARITY = 1'b0;
    defparam \txd_2~FF .SR_SYNC = 1'b1;
    defparam \txd_2~FF .SR_VALUE = 1'b0;
    defparam \txd_2~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_cnt[1]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n52 [1]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart_tx01/n227 ), 
           .Q(\uart_rx_tx_inst/uart_tx01/tx_cnt [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(75)
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[1]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[1]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[1]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[1]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[1]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[1]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_cnt[7]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n52 [7]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart_tx01/n227 ), 
           .Q(\uart_rx_tx_inst/uart_tx01/tx_cnt [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(75)
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[7]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[7]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[7]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[7]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[7]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[7]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_valid_dly[0]~FF  (.D(tx_valid), .CE(1'b1), 
           .CLK(gpio_clk_27m), .SR(1'b0), .Q(\uart_rx_tx_inst/uart_tx01/tx_valid_dly [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(49)
    defparam \uart_rx_tx_inst/uart_tx01/tx_valid_dly[0]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_valid_dly[0]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_valid_dly[0]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_valid_dly[0]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_valid_dly[0]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_valid_dly[0]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_valid_dly[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_cnt[0]~FF  (.D(\uart_rx_tx_inst/uart_tx01/tx_cnt [0]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart_tx01/n227 ), 
           .Q(\uart_rx_tx_inst/uart_tx01/tx_cnt [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(75)
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[0]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[0]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[0]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[0]~FF .D_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[0]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[0]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_cnt[6]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n52 [6]), 
           .CE(1'b1), .CLK(gpio_clk_27m), .SR(\uart_rx_tx_inst/uart_tx01/n227 ), 
           .Q(\uart_rx_tx_inst/uart_tx01/tx_cnt [6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(75)
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[6]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[6]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[6]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[6]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[6]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[6]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_cnt[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_req~FF  (.D(\uart_rx_tx_inst/uart_tx01/equal_4/n9 ), .CE(1'b1), 
           .CLK(gpio_clk_27m), .SR(1'b0), .Q(tx_req)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(28)
    defparam \tx_req~FF .CLK_POLARITY = 1'b1;
    defparam \tx_req~FF .CE_POLARITY = 1'b1;
    defparam \tx_req~FF .SR_POLARITY = 1'b1;
    defparam \tx_req~FF .D_POLARITY = 1'b0;
    defparam \tx_req~FF .SR_SYNC = 1'b1;
    defparam \tx_req~FF .SR_VALUE = 1'b0;
    defparam \tx_req~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_data_r[1]~FF  (.D(tx_data[1]), .CE(tx_valid), 
           .CLK(gpio_clk_27m), .SR(1'b0), .Q(\uart_rx_tx_inst/uart_tx01/tx_data_r [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(56)
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[1]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[1]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[1]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[1]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[1]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[1]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_data_r[2]~FF  (.D(tx_data[2]), .CE(tx_valid), 
           .CLK(gpio_clk_27m), .SR(1'b0), .Q(\uart_rx_tx_inst/uart_tx01/tx_data_r [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(56)
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[2]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[2]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[2]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[2]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[2]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[2]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_data_r[3]~FF  (.D(tx_data[3]), .CE(tx_valid), 
           .CLK(gpio_clk_27m), .SR(1'b0), .Q(\uart_rx_tx_inst/uart_tx01/tx_data_r [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(56)
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[3]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[3]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[3]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[3]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[3]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[3]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_data_r[4]~FF  (.D(tx_data[4]), .CE(tx_valid), 
           .CLK(gpio_clk_27m), .SR(1'b0), .Q(\uart_rx_tx_inst/uart_tx01/tx_data_r [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(56)
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[4]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[4]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[4]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[4]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[4]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[4]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_data_r[5]~FF  (.D(tx_data[5]), .CE(tx_valid), 
           .CLK(gpio_clk_27m), .SR(1'b0), .Q(\uart_rx_tx_inst/uart_tx01/tx_data_r [5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(56)
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[5]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[5]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[5]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[5]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[5]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[5]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_data_r[6]~FF  (.D(tx_data[6]), .CE(tx_valid), 
           .CLK(gpio_clk_27m), .SR(1'b0), .Q(\uart_rx_tx_inst/uart_tx01/tx_data_r [6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(56)
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[6]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[6]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[6]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[6]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[6]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[6]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/tx_data_r[7]~FF  (.D(tx_data[7]), .CE(tx_valid), 
           .CLK(gpio_clk_27m), .SR(1'b0), .Q(\uart_rx_tx_inst/uart_tx01/tx_data_r [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(56)
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[7]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[7]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[7]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[7]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[7]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[7]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/tx_data_r[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/BIT_NUM[3]~FF  (.D(1'b1), .CE(1'b1), 
           .CLK(gpio_clk_27m), .SR(1'b0), .Q(\uart_rx_tx_inst/uart_tx01/BIT_NUM [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(42)
    defparam \uart_rx_tx_inst/uart_tx01/BIT_NUM[3]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/BIT_NUM[3]~FF .CE_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/BIT_NUM[3]~FF .SR_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/BIT_NUM[3]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/BIT_NUM[3]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/BIT_NUM[3]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/BIT_NUM[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/bite_cnt[1]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n252 ), 
           .CE(\uart_rx_tx_inst/uart_tx01/equal_21/n31 ), .CLK(gpio_clk_27m), 
           .SR(\uart_rx_tx_inst/tx_busy ), .Q(\uart_rx_tx_inst/uart_tx01/bite_cnt [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(88)
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[1]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[1]~FF .CE_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[1]~FF .SR_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[1]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[1]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[1]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/bite_cnt[2]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n259 ), 
           .CE(\uart_rx_tx_inst/uart_tx01/equal_21/n31 ), .CLK(gpio_clk_27m), 
           .SR(\uart_rx_tx_inst/tx_busy ), .Q(\uart_rx_tx_inst/uart_tx01/bite_cnt [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(88)
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[2]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[2]~FF .CE_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[2]~FF .SR_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[2]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[2]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[2]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uart_rx_tx_inst/uart_tx01/bite_cnt[3]~FF  (.D(\uart_rx_tx_inst/uart_tx01/n264 ), 
           .CE(\uart_rx_tx_inst/uart_tx01/equal_21/n31 ), .CLK(gpio_clk_27m), 
           .SR(\uart_rx_tx_inst/tx_busy ), .Q(\uart_rx_tx_inst/uart_tx01/bite_cnt [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(88)
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[3]~FF .CLK_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[3]~FF .CE_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[3]~FF .SR_POLARITY = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[3]~FF .D_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[3]~FF .SR_SYNC = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[3]~FF .SR_VALUE = 1'b0;
    defparam \uart_rx_tx_inst/uart_tx01/bite_cnt[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[1]~FF  (.D(n6[1]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[1]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[1]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[1]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[1]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[1]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[1]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[2]~FF  (.D(n6[2]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[2]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[2]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[2]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[2]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[2]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[2]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[3]~FF  (.D(n6[3]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[3]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[3]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[3]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[3]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[3]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[3]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[4]~FF  (.D(n6[4]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[4]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[4]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[4]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[4]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[4]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[4]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[5]~FF  (.D(n6[5]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[5]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[5]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[5]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[5]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[5]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[5]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[6]~FF  (.D(n6[6]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[6]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[6]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[6]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[6]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[6]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[6]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[7]~FF  (.D(n6[7]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[7]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[7]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[7]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[7]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[7]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[7]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[8]~FF  (.D(n6[8]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[8])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[8]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[8]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[8]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[8]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[8]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[8]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[9]~FF  (.D(n6[9]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[9])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[9]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[9]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[9]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[9]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[9]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[9]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[10]~FF  (.D(n6[10]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[10])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[10]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[10]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[10]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[10]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[10]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[10]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[10]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[11]~FF  (.D(n6[11]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[11])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[11]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[11]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[11]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[11]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[11]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[11]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[11]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[12]~FF  (.D(n6[12]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[12])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[12]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[12]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[12]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[12]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[12]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[12]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[12]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[13]~FF  (.D(n6[13]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[13])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[13]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[13]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[13]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[13]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[13]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[13]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[13]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[14]~FF  (.D(n6[14]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[14])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[14]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[14]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[14]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[14]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[14]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[14]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[14]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[15]~FF  (.D(n6[15]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[15])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[15]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[15]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[15]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[15]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[15]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[15]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[15]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[16]~FF  (.D(n6[16]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[16])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[16]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[16]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[16]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[16]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[16]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[16]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[16]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[17]~FF  (.D(n6[17]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[17])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[17]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[17]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[17]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[17]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[17]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[17]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[17]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[18]~FF  (.D(n6[18]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[18])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[18]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[18]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[18]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[18]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[18]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[18]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[18]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[19]~FF  (.D(n6[19]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[19])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[19]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[19]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[19]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[19]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[19]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[19]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[19]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[20]~FF  (.D(n6[20]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[20])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[20]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[20]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[20]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[20]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[20]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[20]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[20]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[21]~FF  (.D(n6[21]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[21])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[21]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[21]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[21]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[21]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[21]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[21]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[21]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_cnt[22]~FF  (.D(n6[22]), .CE(1'b1), .CLK(gpio_clk_27m), 
           .SR(1'b0), .Q(led_cnt[22])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led_cnt[22]~FF .CLK_POLARITY = 1'b1;
    defparam \led_cnt[22]~FF .CE_POLARITY = 1'b1;
    defparam \led_cnt[22]~FF .SR_POLARITY = 1'b1;
    defparam \led_cnt[22]~FF .D_POLARITY = 1'b1;
    defparam \led_cnt[22]~FF .SR_SYNC = 1'b1;
    defparam \led_cnt[22]~FF .SR_VALUE = 1'b0;
    defparam \led_cnt[22]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led[3]~FF  (.D(n6[23]), .CE(1'b1), .CLK(gpio_clk_27m), .SR(1'b0), 
           .Q(led[3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led[3]~FF .CLK_POLARITY = 1'b1;
    defparam \led[3]~FF .CE_POLARITY = 1'b1;
    defparam \led[3]~FF .SR_POLARITY = 1'b1;
    defparam \led[3]~FF .D_POLARITY = 1'b1;
    defparam \led[3]~FF .SR_SYNC = 1'b1;
    defparam \led[3]~FF .SR_VALUE = 1'b0;
    defparam \led[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led[2]~FF  (.D(n6[24]), .CE(1'b1), .CLK(gpio_clk_27m), .SR(1'b0), 
           .Q(led[2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \led[2]~FF .CLK_POLARITY = 1'b1;
    defparam \led[2]~FF .CE_POLARITY = 1'b1;
    defparam \led[2]~FF .SR_POLARITY = 1'b1;
    defparam \led[2]~FF .D_POLARITY = 1'b1;
    defparam \led[2]~FF .SR_SYNC = 1'b1;
    defparam \led[2]~FF .SR_VALUE = 1'b0;
    defparam \led[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \sys_rst_n~FF  (.D(\inst_rst/r_srst_1P[1] ), .CE(1'b1), .CLK(hdmi_tx_slow_clk), 
           .SR(hdmi_tx_locked), .Q(sys_rst_n)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/reset.v(37)
    defparam \sys_rst_n~FF .CLK_POLARITY = 1'b1;
    defparam \sys_rst_n~FF .CE_POLARITY = 1'b1;
    defparam \sys_rst_n~FF .SR_POLARITY = 1'b0;
    defparam \sys_rst_n~FF .D_POLARITY = 1'b1;
    defparam \sys_rst_n~FF .SR_SYNC = 1'b0;
    defparam \sys_rst_n~FF .SR_VALUE = 1'b0;
    defparam \sys_rst_n~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \inst_rst/r_srst_1P[1]~FF  (.D(\inst_rst/r_srst_1P[0] ), .CE(1'b1), 
           .CLK(hdmi_tx_slow_clk), .SR(hdmi_tx_locked), .Q(\inst_rst/r_srst_1P[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/reset.v(37)
    defparam \inst_rst/r_srst_1P[1]~FF .CLK_POLARITY = 1'b1;
    defparam \inst_rst/r_srst_1P[1]~FF .CE_POLARITY = 1'b1;
    defparam \inst_rst/r_srst_1P[1]~FF .SR_POLARITY = 1'b0;
    defparam \inst_rst/r_srst_1P[1]~FF .D_POLARITY = 1'b1;
    defparam \inst_rst/r_srst_1P[1]~FF .SR_SYNC = 1'b0;
    defparam \inst_rst/r_srst_1P[1]~FF .SR_VALUE = 1'b0;
    defparam \inst_rst/r_srst_1P[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \inst_rst/r_srst_1P[0]~FF  (.D(1'b1), .CE(1'b1), .CLK(hdmi_tx_slow_clk), 
           .SR(hdmi_tx_locked), .Q(\inst_rst/r_srst_1P[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0, async_reg="true" */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/reset.v(37)
    defparam \inst_rst/r_srst_1P[0]~FF .CLK_POLARITY = 1'b1;
    defparam \inst_rst/r_srst_1P[0]~FF .CE_POLARITY = 1'b1;
    defparam \inst_rst/r_srst_1P[0]~FF .SR_POLARITY = 1'b0;
    defparam \inst_rst/r_srst_1P[0]~FF .D_POLARITY = 1'b1;
    defparam \inst_rst/r_srst_1P[0]~FF .SR_SYNC = 1'b0;
    defparam \inst_rst/r_srst_1P[0]~FF .SR_VALUE = 1'b0;
    defparam \inst_rst/r_srst_1P[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_ADD \add_27/i2  (.I0(led_cnt[2]), .I1(1'b0), .CI(\add_27/n2 ), 
            .O(n6[2]), .CO(\add_27/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i2 .I0_POLARITY = 1'b1;
    defparam \add_27/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i1  (.I0(led_cnt[1]), .I1(led_cnt[0]), .CI(1'b0), 
            .O(n6[1]), .CO(\add_27/n2 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i1 .I0_POLARITY = 1'b1;
    defparam \add_27/i1 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_83/i1  (.I0(\dvi_encoder_m0/encb/cnt [0]), 
            .I1(1'b0), .CI(1'b0), .O(\dvi_encoder_m0/encb/n232 [0]), .CO(n926)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/add_83/i1 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_83/i1 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_89/i1  (.I0(\dvi_encoder_m0/encb/cnt [0]), 
            .I1(1'b0), .CI(n929), .O(\dvi_encoder_m0/encb/n273 [0]), .CO(\dvi_encoder_m0/encb/add_89/n2 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encb/add_89/i1 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_89/i1 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_93/i1  (.I0(\dvi_encoder_m0/encb/cnt [0]), 
            .I1(1'b0), .CI(1'b0), .CO(\dvi_encoder_m0/encb/add_93/n2 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encb/add_93/i1 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_93/i1 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/sub_82/add_2/i1  (.I0(\dvi_encoder_m0/encb/n232 [0]), 
            .I1(1'b1), .CI(n930), .CO(n931)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/sub_82/add_2/i1 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_82/add_2/i1 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/sub_88/add_2/i4__AUX_ADD_CO  (.I0(1'b0), 
            .I1(1'b0), .CI(n957), .O(\dvi_encoder_m0/encr/sub_88/add_2/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encr/sub_88/add_2/i4__AUX_ADD_CO .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_88/add_2/i4__AUX_ADD_CO .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_83/i3  (.I0(\dvi_encoder_m0/encr/cnt [2]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encr/add_83/n4 ), .O(\dvi_encoder_m0/encr/n232 [2]), 
            .CO(\dvi_encoder_m0/encr/add_83/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/add_83/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_83/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_83/i2  (.I0(\dvi_encoder_m0/encr/cnt [1]), 
            .I1(1'b0), .CI(n936), .O(\dvi_encoder_m0/encr/n232 [1]), .CO(\dvi_encoder_m0/encr/add_83/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/add_83/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_83/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_81/i5  (.I0(\dvi_encoder_m0/encr/cnt [4]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encr/add_81/n8 ), .O(\dvi_encoder_m0/encr/n219 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/add_81/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_81/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_81/i4  (.I0(\dvi_encoder_m0/encr/cnt [3]), 
            .I1(\dvi_encoder_m0/encr/n0q_m [3]), .CI(\dvi_encoder_m0/encr/add_81/n6 ), 
            .O(\dvi_encoder_m0/encr/n219 [3]), .CO(\dvi_encoder_m0/encr/add_81/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/add_81/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_81/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_81/i3  (.I0(\dvi_encoder_m0/encr/cnt [2]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encr/add_81/n4 ), .O(\dvi_encoder_m0/encr/n219 [2]), 
            .CO(\dvi_encoder_m0/encr/add_81/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/add_81/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_81/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_81/i2  (.I0(\dvi_encoder_m0/encr/cnt [1]), 
            .I1(1'b0), .CI(n935), .O(\dvi_encoder_m0/encr/n219 [1]), .CO(\dvi_encoder_m0/encr/add_81/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/add_81/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_81/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_83/i1  (.I0(\dvi_encoder_m0/encr/cnt [0]), 
            .I1(1'b0), .CI(1'b0), .O(\dvi_encoder_m0/encr/n232 [0]), .CO(n934)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/add_83/i1 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_83/i1 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_89/i1  (.I0(\dvi_encoder_m0/encr/cnt [0]), 
            .I1(1'b0), .CI(n937), .O(\dvi_encoder_m0/encr/n273 [0]), .CO(\dvi_encoder_m0/encr/add_89/n2 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encr/add_89/i1 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_89/i1 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_93/i1  (.I0(\dvi_encoder_m0/encr/cnt [0]), 
            .I1(1'b0), .CI(1'b0), .CO(\dvi_encoder_m0/encr/add_93/n2 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encr/add_93/i1 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_93/i1 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/sub_82/add_2/i1  (.I0(\dvi_encoder_m0/encr/n232 [0]), 
            .I1(1'b1), .CI(n938), .CO(n939)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/sub_82/add_2/i1 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_82/add_2/i1 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/sub_88/add_2/i4__AUX_ADD_CI  (.I0(1'b1), 
            .I1(1'b1), .CI(1'b0), .CO(n956)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encr/sub_88/add_2/i4__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_88/add_2/i4__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_83/i4  (.I0(\dvi_encoder_m0/encg/cnt [3]), 
            .I1(\dvi_encoder_m0/encg/n1q_m [3]), .CI(\dvi_encoder_m0/encg/add_83/n6 ), 
            .O(\dvi_encoder_m0/encg/n232 [3]), .CO(\dvi_encoder_m0/encg/add_83/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/add_83/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_83/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_83/i3  (.I0(\dvi_encoder_m0/encg/cnt [2]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encg/add_83/n4 ), .O(\dvi_encoder_m0/encg/n232 [2]), 
            .CO(\dvi_encoder_m0/encg/add_83/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/add_83/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_83/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_83/i2  (.I0(\dvi_encoder_m0/encg/cnt [1]), 
            .I1(1'b0), .CI(n944), .O(\dvi_encoder_m0/encg/n232 [1]), .CO(\dvi_encoder_m0/encg/add_83/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/add_83/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_83/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_81/i5  (.I0(\dvi_encoder_m0/encg/cnt [4]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encg/add_81/n8 ), .O(\dvi_encoder_m0/encg/n219 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/add_81/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_81/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_81/i4  (.I0(\dvi_encoder_m0/encg/cnt [3]), 
            .I1(\dvi_encoder_m0/encg/n0q_m [3]), .CI(\dvi_encoder_m0/encg/add_81/n6 ), 
            .O(\dvi_encoder_m0/encg/n219 [3]), .CO(\dvi_encoder_m0/encg/add_81/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/add_81/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_81/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_81/i3  (.I0(\dvi_encoder_m0/encg/cnt [2]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encg/add_81/n4 ), .O(\dvi_encoder_m0/encg/n219 [2]), 
            .CO(\dvi_encoder_m0/encg/add_81/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/add_81/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_81/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_81/i2  (.I0(\dvi_encoder_m0/encg/cnt [1]), 
            .I1(1'b0), .CI(n943), .O(\dvi_encoder_m0/encg/n219 [1]), .CO(\dvi_encoder_m0/encg/add_81/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/add_81/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_81/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_83/i1  (.I0(\dvi_encoder_m0/encg/cnt [0]), 
            .I1(1'b0), .CI(1'b0), .O(\dvi_encoder_m0/encg/n232 [0]), .CO(n942)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/add_83/i1 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_83/i1 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_89/i1  (.I0(\dvi_encoder_m0/encg/cnt [0]), 
            .I1(1'b0), .CI(n945), .O(\dvi_encoder_m0/encg/n273 [0]), .CO(\dvi_encoder_m0/encg/add_89/n2 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encg/add_89/i1 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_89/i1 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_93/i1  (.I0(\dvi_encoder_m0/encg/cnt [0]), 
            .I1(1'b0), .CI(1'b0), .CO(\dvi_encoder_m0/encg/add_93/n2 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encg/add_93/i1 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_93/i1 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/sub_82/add_2/i1  (.I0(\dvi_encoder_m0/encg/n232 [0]), 
            .I1(1'b1), .CI(n946), .CO(n947)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/sub_82/add_2/i1 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_82/add_2/i1 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/sub_92/add_2/i4__AUX_ADD_CO  (.I0(1'b0), 
            .I1(1'b0), .CI(n955), .O(\dvi_encoder_m0/encr/sub_92/add_2/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encr/sub_92/add_2/i4__AUX_ADD_CO .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_92/add_2/i4__AUX_ADD_CO .I1_POLARITY = 1'b1;
    EFX_ADD \uart_rx_tx_inst/uart_tx01/add_72/i15  (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [15]), 
            .I1(1'b0), .CI(\uart_rx_tx_inst/uart_tx01/add_72/n28 ), .O(\uart_rx_tx_inst/uart_tx01/n52 [15])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(74)
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i15 .I0_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i15 .I1_POLARITY = 1'b1;
    EFX_ADD \uart_rx_tx_inst/uart_tx01/add_72/i14  (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [14]), 
            .I1(1'b0), .CI(\uart_rx_tx_inst/uart_tx01/add_72/n26 ), .O(\uart_rx_tx_inst/uart_tx01/n52 [14]), 
            .CO(\uart_rx_tx_inst/uart_tx01/add_72/n28 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(74)
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i14 .I0_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i14 .I1_POLARITY = 1'b1;
    EFX_ADD \uart_rx_tx_inst/uart_tx01/add_72/i13  (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [13]), 
            .I1(1'b0), .CI(\uart_rx_tx_inst/uart_tx01/add_72/n24 ), .O(\uart_rx_tx_inst/uart_tx01/n52 [13]), 
            .CO(\uart_rx_tx_inst/uart_tx01/add_72/n26 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(74)
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i13 .I0_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i13 .I1_POLARITY = 1'b1;
    EFX_ADD \uart_rx_tx_inst/uart_tx01/add_72/i12  (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [12]), 
            .I1(1'b0), .CI(\uart_rx_tx_inst/uart_tx01/add_72/n22 ), .O(\uart_rx_tx_inst/uart_tx01/n52 [12]), 
            .CO(\uart_rx_tx_inst/uart_tx01/add_72/n24 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(74)
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i12 .I0_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i12 .I1_POLARITY = 1'b1;
    EFX_ADD \uart_rx_tx_inst/uart_tx01/add_72/i11  (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [11]), 
            .I1(1'b0), .CI(\uart_rx_tx_inst/uart_tx01/add_72/n20 ), .O(\uart_rx_tx_inst/uart_tx01/n52 [11]), 
            .CO(\uart_rx_tx_inst/uart_tx01/add_72/n22 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(74)
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i11 .I0_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i11 .I1_POLARITY = 1'b1;
    EFX_ADD \uart_rx_tx_inst/uart_tx01/add_72/i10  (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [10]), 
            .I1(1'b0), .CI(\uart_rx_tx_inst/uart_tx01/add_72/n18 ), .O(\uart_rx_tx_inst/uart_tx01/n52 [10]), 
            .CO(\uart_rx_tx_inst/uart_tx01/add_72/n20 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(74)
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i10 .I0_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i10 .I1_POLARITY = 1'b1;
    EFX_ADD \uart_rx_tx_inst/uart_tx01/add_72/i9  (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [9]), 
            .I1(1'b0), .CI(\uart_rx_tx_inst/uart_tx01/add_72/n16 ), .O(\uart_rx_tx_inst/uart_tx01/n52 [9]), 
            .CO(\uart_rx_tx_inst/uart_tx01/add_72/n18 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(74)
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i9 .I0_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i9 .I1_POLARITY = 1'b1;
    EFX_ADD \uart_rx_tx_inst/uart_tx01/add_72/i8  (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [8]), 
            .I1(1'b0), .CI(\uart_rx_tx_inst/uart_tx01/add_72/n14 ), .O(\uart_rx_tx_inst/uart_tx01/n52 [8]), 
            .CO(\uart_rx_tx_inst/uart_tx01/add_72/n16 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(74)
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i8 .I0_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i8 .I1_POLARITY = 1'b1;
    EFX_ADD \uart_rx_tx_inst/uart_tx01/add_72/i7  (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [7]), 
            .I1(1'b0), .CI(\uart_rx_tx_inst/uart_tx01/add_72/n12 ), .O(\uart_rx_tx_inst/uart_tx01/n52 [7]), 
            .CO(\uart_rx_tx_inst/uart_tx01/add_72/n14 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(74)
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i7 .I0_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i7 .I1_POLARITY = 1'b1;
    EFX_ADD \uart_rx_tx_inst/uart_tx01/add_72/i6  (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [6]), 
            .I1(1'b0), .CI(\uart_rx_tx_inst/uart_tx01/add_72/n10 ), .O(\uart_rx_tx_inst/uart_tx01/n52 [6]), 
            .CO(\uart_rx_tx_inst/uart_tx01/add_72/n12 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(74)
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i6 .I0_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i6 .I1_POLARITY = 1'b1;
    EFX_ADD \uart_rx_tx_inst/uart_tx01/add_72/i5  (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [5]), 
            .I1(1'b0), .CI(\uart_rx_tx_inst/uart_tx01/add_72/n8 ), .O(\uart_rx_tx_inst/uart_tx01/n52 [5]), 
            .CO(\uart_rx_tx_inst/uart_tx01/add_72/n10 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(74)
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i5 .I0_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \uart_rx_tx_inst/uart_tx01/add_72/i4  (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [4]), 
            .I1(1'b0), .CI(\uart_rx_tx_inst/uart_tx01/add_72/n6 ), .O(\uart_rx_tx_inst/uart_tx01/n52 [4]), 
            .CO(\uart_rx_tx_inst/uart_tx01/add_72/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(74)
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i4 .I0_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \uart_rx_tx_inst/uart_tx01/add_72/i3  (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [3]), 
            .I1(1'b0), .CI(\uart_rx_tx_inst/uart_tx01/add_72/n4 ), .O(\uart_rx_tx_inst/uart_tx01/n52 [3]), 
            .CO(\uart_rx_tx_inst/uart_tx01/add_72/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(74)
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i3 .I0_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/sub_92/add_2/i4  (.I0(\dvi_encoder_m0/encg/n1q_m [3]), 
            .I1(\dvi_encoder_m0/encg/n0q_m [3]), .CI(n950), .CO(n951)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encg/sub_92/add_2/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_92/add_2/i4 .I1_POLARITY = 1'b0;
    EFX_ADD \uart_rx_tx_inst/uart_tx01/add_72/i2  (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [2]), 
            .I1(1'b0), .CI(\uart_rx_tx_inst/uart_tx01/add_72/n2 ), .O(\uart_rx_tx_inst/uart_tx01/n52 [2]), 
            .CO(\uart_rx_tx_inst/uart_tx01/add_72/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(74)
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i2 .I0_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/sub_92/add_2/i4__AUX_ADD_CI  (.I0(1'b1), 
            .I1(1'b1), .CI(1'b0), .CO(n954)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encr/sub_92/add_2/i4__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_92/add_2/i4__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/sub_88/add_2/i4__AUX_ADD_CO  (.I0(1'b0), 
            .I1(1'b0), .CI(n953), .O(\dvi_encoder_m0/encg/sub_88/add_2/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encg/sub_88/add_2/i4__AUX_ADD_CO .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_88/add_2/i4__AUX_ADD_CO .I1_POLARITY = 1'b1;
    EFX_ADD \uart_rx_tx_inst/uart_tx01/add_72/i1  (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [1]), 
            .I1(\uart_rx_tx_inst/uart_tx01/tx_cnt [0]), .CI(1'b0), .O(\uart_rx_tx_inst/uart_tx01/n52 [1]), 
            .CO(\uart_rx_tx_inst/uart_tx01/add_72/n2 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(74)
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i1 .I0_POLARITY = 1'b1;
    defparam \uart_rx_tx_inst/uart_tx01/add_72/i1 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/sub_88/add_2/i4  (.I0(\dvi_encoder_m0/encg/n0q_m [3]), 
            .I1(\dvi_encoder_m0/encg/n1q_m [3]), .CI(n952), .CO(n953)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encg/sub_88/add_2/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_88/add_2/i4 .I1_POLARITY = 1'b0;
    EFX_ADD \dvi_encoder_m0/encg/sub_88/add_2/i4__AUX_ADD_CI  (.I0(1'b1), 
            .I1(1'b1), .CI(1'b0), .CO(n952)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encg/sub_88/add_2/i4__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_88/add_2/i4__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/sub_92/add_2/i4__AUX_ADD_CO  (.I0(1'b0), 
            .I1(1'b0), .CI(n951), .O(\dvi_encoder_m0/encg/sub_92/add_2/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encg/sub_92/add_2/i4__AUX_ADD_CO .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_92/add_2/i4__AUX_ADD_CO .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/sub_84/add_2/i5  (.I0(\dvi_encoder_m0/encg/n232 [4]), 
            .I1(1'b1), .CI(\dvi_encoder_m0/encg/sub_84/add_2/n8 ), .O(\dvi_encoder_m0/encg/n238 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/sub_84/add_2/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_84/add_2/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/sub_84/add_2/i4  (.I0(\dvi_encoder_m0/encg/n232 [3]), 
            .I1(\dvi_encoder_m0/encg/n0q_m [3]), .CI(\dvi_encoder_m0/encg/sub_84/add_2/n6 ), 
            .O(\dvi_encoder_m0/encg/n238 [3]), .CO(\dvi_encoder_m0/encg/sub_84/add_2/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/sub_84/add_2/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_84/add_2/i4 .I1_POLARITY = 1'b0;
    EFX_ADD \dvi_encoder_m0/encg/sub_84/add_2/i3  (.I0(\dvi_encoder_m0/encg/n232 [2]), 
            .I1(1'b1), .CI(\dvi_encoder_m0/encg/sub_84/add_2/n4 ), .O(\dvi_encoder_m0/encg/n238 [2]), 
            .CO(\dvi_encoder_m0/encg/sub_84/add_2/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/sub_84/add_2/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_84/add_2/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/sub_84/add_2/i2  (.I0(\dvi_encoder_m0/encg/n232 [1]), 
            .I1(1'b1), .CI(n948), .O(\dvi_encoder_m0/encg/n238 [1]), .CO(\dvi_encoder_m0/encg/sub_84/add_2/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/sub_84/add_2/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_84/add_2/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/sub_82/add_2/i5  (.I0(\dvi_encoder_m0/encg/n219 [4]), 
            .I1(1'b1), .CI(\dvi_encoder_m0/encg/sub_82/add_2/n8 ), .O(\dvi_encoder_m0/encg/n225 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/sub_82/add_2/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_82/add_2/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/sub_82/add_2/i4  (.I0(\dvi_encoder_m0/encg/n219 [3]), 
            .I1(\dvi_encoder_m0/encg/n1q_m [3]), .CI(\dvi_encoder_m0/encg/sub_82/add_2/n6 ), 
            .O(\dvi_encoder_m0/encg/n225 [3]), .CO(\dvi_encoder_m0/encg/sub_82/add_2/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/sub_82/add_2/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_82/add_2/i4 .I1_POLARITY = 1'b0;
    EFX_ADD \dvi_encoder_m0/encg/sub_82/add_2/i3  (.I0(\dvi_encoder_m0/encg/n219 [2]), 
            .I1(1'b1), .CI(\dvi_encoder_m0/encg/sub_82/add_2/n4 ), .O(\dvi_encoder_m0/encg/n225 [2]), 
            .CO(\dvi_encoder_m0/encg/sub_82/add_2/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/sub_82/add_2/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_82/add_2/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/sub_82/add_2/i2  (.I0(\dvi_encoder_m0/encg/n219 [1]), 
            .I1(1'b1), .CI(n949), .O(\dvi_encoder_m0/encg/n225 [1]), .CO(\dvi_encoder_m0/encg/sub_82/add_2/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/sub_82/add_2/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_82/add_2/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_93/i5  (.I0(\dvi_encoder_m0/encg/n628 ), 
            .I1(\dvi_encoder_m0/encg/sub_92/add_2/n8 ), .CI(\dvi_encoder_m0/encg/add_93/n8 ), 
            .O(\dvi_encoder_m0/encg/n292 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encg/add_93/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_93/i5 .I1_POLARITY = 1'b0;
    EFX_ADD \dvi_encoder_m0/encg/add_93/i4  (.I0(\dvi_encoder_m0/encg/n623 ), 
            .I1(\dvi_encoder_m0/encg/LessThan_63/n7 ), .CI(\dvi_encoder_m0/encg/add_93/n6 ), 
            .O(\dvi_encoder_m0/encg/n292 [3]), .CO(\dvi_encoder_m0/encg/add_93/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encg/add_93/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_93/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_93/i3  (.I0(\dvi_encoder_m0/encg/n618 ), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encg/add_93/n4 ), .CO(\dvi_encoder_m0/encg/add_93/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encg/add_93/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_93/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_93/i2  (.I0(\dvi_encoder_m0/encg/n694 ), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encg/add_93/n2 ), .CO(\dvi_encoder_m0/encg/add_93/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encg/add_93/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_93/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_89/i5  (.I0(\dvi_encoder_m0/encg/cnt [4]), 
            .I1(\dvi_encoder_m0/encg/sub_88/add_2/n8 ), .CI(\dvi_encoder_m0/encg/add_89/n8 ), 
            .O(\dvi_encoder_m0/encg/n273 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encg/add_89/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_89/i5 .I1_POLARITY = 1'b0;
    EFX_ADD \dvi_encoder_m0/encg/add_89/i4  (.I0(\dvi_encoder_m0/encg/cnt [3]), 
            .I1(\dvi_encoder_m0/encg/LessThan_63/n7 ), .CI(\dvi_encoder_m0/encg/add_89/n6 ), 
            .O(\dvi_encoder_m0/encg/n273 [3]), .CO(\dvi_encoder_m0/encg/add_89/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encg/add_89/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_89/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_89/i3  (.I0(\dvi_encoder_m0/encg/cnt [2]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encg/add_89/n4 ), .O(\dvi_encoder_m0/encg/n273 [2]), 
            .CO(\dvi_encoder_m0/encg/add_89/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encg/add_89/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_89/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_89/i2  (.I0(\dvi_encoder_m0/encg/cnt [1]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encg/add_89/n2 ), .O(\dvi_encoder_m0/encg/n273 [1]), 
            .CO(\dvi_encoder_m0/encg/add_89/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encg/add_89/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_89/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_83/i5  (.I0(\dvi_encoder_m0/encg/cnt [4]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encg/add_83/n8 ), .O(\dvi_encoder_m0/encg/n232 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/add_83/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_83/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/sub_92/add_2/i4  (.I0(\dvi_encoder_m0/encr/n1q_m [3]), 
            .I1(\dvi_encoder_m0/encr/n0q_m [3]), .CI(n954), .CO(n955)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encr/sub_92/add_2/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_92/add_2/i4 .I1_POLARITY = 1'b0;
    EFX_ADD \dvi_encoder_m0/encg/sub_92/add_2/i4__AUX_ADD_CI  (.I0(1'b1), 
            .I1(1'b1), .CI(1'b0), .CO(n950)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encg/sub_92/add_2/i4__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_92/add_2/i4__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/sub_82/add_2/i2__AUX_ADD_CI  (.I0(\dvi_encoder_m0/encg/sub_82/add_2/n2 ), 
            .I1(1'b1), .CI(1'b0), .CO(n949)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/sub_82/add_2/i2__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_82/add_2/i2__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/sub_88/add_2/i4  (.I0(\dvi_encoder_m0/encr/n0q_m [3]), 
            .I1(\dvi_encoder_m0/encr/n1q_m [3]), .CI(n956), .CO(n957)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encr/sub_88/add_2/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_88/add_2/i4 .I1_POLARITY = 1'b0;
    EFX_ADD \dvi_encoder_m0/encg/sub_84/add_2/i2__AUX_ADD_CI  (.I0(\dvi_encoder_m0/encg/sub_82/add_2/n2 ), 
            .I1(1'b1), .CI(1'b0), .CO(n948)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/sub_84/add_2/i2__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_84/add_2/i2__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/sub_82/add_2/i1__AUX_ADD_CO  (.I0(1'b0), 
            .I1(1'b0), .CI(n947), .O(\dvi_encoder_m0/encg/sub_82/add_2/n2 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/sub_82/add_2/i1__AUX_ADD_CO .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_82/add_2/i1__AUX_ADD_CO .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/sub_84/add_2/i5  (.I0(\dvi_encoder_m0/encr/n232 [4]), 
            .I1(1'b1), .CI(\dvi_encoder_m0/encr/sub_84/add_2/n8 ), .O(\dvi_encoder_m0/encr/n238 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/sub_84/add_2/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_84/add_2/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/sub_84/add_2/i4  (.I0(\dvi_encoder_m0/encr/n232 [3]), 
            .I1(\dvi_encoder_m0/encr/n0q_m [3]), .CI(\dvi_encoder_m0/encr/sub_84/add_2/n6 ), 
            .O(\dvi_encoder_m0/encr/n238 [3]), .CO(\dvi_encoder_m0/encr/sub_84/add_2/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/sub_84/add_2/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_84/add_2/i4 .I1_POLARITY = 1'b0;
    EFX_ADD \dvi_encoder_m0/encr/sub_84/add_2/i3  (.I0(\dvi_encoder_m0/encr/n232 [2]), 
            .I1(1'b1), .CI(\dvi_encoder_m0/encr/sub_84/add_2/n4 ), .O(\dvi_encoder_m0/encr/n238 [2]), 
            .CO(\dvi_encoder_m0/encr/sub_84/add_2/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/sub_84/add_2/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_84/add_2/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/sub_84/add_2/i2  (.I0(\dvi_encoder_m0/encr/n232 [1]), 
            .I1(1'b1), .CI(n940), .O(\dvi_encoder_m0/encr/n238 [1]), .CO(\dvi_encoder_m0/encr/sub_84/add_2/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/sub_84/add_2/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_84/add_2/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/sub_82/add_2/i5  (.I0(\dvi_encoder_m0/encr/n219 [4]), 
            .I1(1'b1), .CI(\dvi_encoder_m0/encr/sub_82/add_2/n8 ), .O(\dvi_encoder_m0/encr/n225 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/sub_82/add_2/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_82/add_2/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/sub_82/add_2/i4  (.I0(\dvi_encoder_m0/encr/n219 [3]), 
            .I1(\dvi_encoder_m0/encr/n1q_m [3]), .CI(\dvi_encoder_m0/encr/sub_82/add_2/n6 ), 
            .O(\dvi_encoder_m0/encr/n225 [3]), .CO(\dvi_encoder_m0/encr/sub_82/add_2/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/sub_82/add_2/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_82/add_2/i4 .I1_POLARITY = 1'b0;
    EFX_ADD \dvi_encoder_m0/encr/sub_82/add_2/i3  (.I0(\dvi_encoder_m0/encr/n219 [2]), 
            .I1(1'b1), .CI(\dvi_encoder_m0/encr/sub_82/add_2/n4 ), .O(\dvi_encoder_m0/encr/n225 [2]), 
            .CO(\dvi_encoder_m0/encr/sub_82/add_2/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/sub_82/add_2/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_82/add_2/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/sub_82/add_2/i2  (.I0(\dvi_encoder_m0/encr/n219 [1]), 
            .I1(1'b1), .CI(n941), .O(\dvi_encoder_m0/encr/n225 [1]), .CO(\dvi_encoder_m0/encr/sub_82/add_2/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/sub_82/add_2/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_82/add_2/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_93/i5  (.I0(\dvi_encoder_m0/encr/n628 ), 
            .I1(\dvi_encoder_m0/encr/sub_92/add_2/n8 ), .CI(\dvi_encoder_m0/encr/add_93/n8 ), 
            .O(\dvi_encoder_m0/encr/n292 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encr/add_93/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_93/i5 .I1_POLARITY = 1'b0;
    EFX_ADD \dvi_encoder_m0/encr/add_93/i4  (.I0(\dvi_encoder_m0/encr/n623 ), 
            .I1(\dvi_encoder_m0/encr/LessThan_63/n7 ), .CI(\dvi_encoder_m0/encr/add_93/n6 ), 
            .O(\dvi_encoder_m0/encr/n292 [3]), .CO(\dvi_encoder_m0/encr/add_93/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encr/add_93/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_93/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_93/i3  (.I0(\dvi_encoder_m0/encr/n618 ), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encr/add_93/n4 ), .CO(\dvi_encoder_m0/encr/add_93/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encr/add_93/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_93/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_93/i2  (.I0(\dvi_encoder_m0/encr/n694 ), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encr/add_93/n2 ), .CO(\dvi_encoder_m0/encr/add_93/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encr/add_93/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_93/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_89/i5  (.I0(\dvi_encoder_m0/encr/cnt [4]), 
            .I1(\dvi_encoder_m0/encr/sub_88/add_2/n8 ), .CI(\dvi_encoder_m0/encr/add_89/n8 ), 
            .O(\dvi_encoder_m0/encr/n273 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encr/add_89/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_89/i5 .I1_POLARITY = 1'b0;
    EFX_ADD \dvi_encoder_m0/encr/add_89/i4  (.I0(\dvi_encoder_m0/encr/cnt [3]), 
            .I1(\dvi_encoder_m0/encr/LessThan_63/n7 ), .CI(\dvi_encoder_m0/encr/add_89/n6 ), 
            .O(\dvi_encoder_m0/encr/n273 [3]), .CO(\dvi_encoder_m0/encr/add_89/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encr/add_89/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_89/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_89/i3  (.I0(\dvi_encoder_m0/encr/cnt [2]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encr/add_89/n4 ), .O(\dvi_encoder_m0/encr/n273 [2]), 
            .CO(\dvi_encoder_m0/encr/add_89/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encr/add_89/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_89/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_89/i2  (.I0(\dvi_encoder_m0/encr/cnt [1]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encr/add_89/n2 ), .O(\dvi_encoder_m0/encr/n273 [1]), 
            .CO(\dvi_encoder_m0/encr/add_89/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encr/add_89/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_89/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_83/i5  (.I0(\dvi_encoder_m0/encr/cnt [4]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encr/add_83/n8 ), .O(\dvi_encoder_m0/encr/n232 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/add_83/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_83/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_83/i4  (.I0(\dvi_encoder_m0/encr/cnt [3]), 
            .I1(\dvi_encoder_m0/encr/n1q_m [3]), .CI(\dvi_encoder_m0/encr/add_83/n6 ), 
            .O(\dvi_encoder_m0/encr/n232 [3]), .CO(\dvi_encoder_m0/encr/add_83/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/add_83/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_83/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/sub_92/add_2/i4  (.I0(\dvi_encoder_m0/encb/n1q_m [3]), 
            .I1(\dvi_encoder_m0/encb/n0q_m [3]), .CI(n958), .CO(n959)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encb/sub_92/add_2/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_92/add_2/i4 .I1_POLARITY = 1'b0;
    EFX_ADD \dvi_encoder_m0/encg/sub_82/add_2/i1__AUX_ADD_CI  (.I0(1'b1), 
            .I1(1'b1), .CI(1'b0), .CO(n946)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/sub_82/add_2/i1__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/sub_82/add_2/i1__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_89/i1__AUX_ADD_CI  (.I0(\dvi_encoder_m0/encg/n0q_m [3]), 
            .I1(1'b1), .CI(1'b0), .CO(n945)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encg/add_89/i1__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_89/i1__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/sub_88/add_2/i4  (.I0(\dvi_encoder_m0/encb/n0q_m [3]), 
            .I1(\dvi_encoder_m0/encb/n1q_m [3]), .CI(n960), .CO(n961)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encb/sub_88/add_2/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_88/add_2/i4 .I1_POLARITY = 1'b0;
    EFX_ADD \dvi_encoder_m0/encg/add_83/i2__AUX_ADD_CI  (.I0(\dvi_encoder_m0/encg/add_83/n2 ), 
            .I1(1'b1), .CI(1'b0), .CO(n944)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/add_83/i2__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_83/i2__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encg/add_81/i2__AUX_ADD_CI  (.I0(\dvi_encoder_m0/encg/add_83/n2 ), 
            .I1(1'b1), .CI(1'b0), .CO(n943)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/add_81/i2__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_81/i2__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/sub_84/add_2/i5  (.I0(\dvi_encoder_m0/encb/n232 [4]), 
            .I1(1'b1), .CI(\dvi_encoder_m0/encb/sub_84/add_2/n8 ), .O(\dvi_encoder_m0/encb/n238 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/sub_84/add_2/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_84/add_2/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/sub_84/add_2/i4  (.I0(\dvi_encoder_m0/encb/n232 [3]), 
            .I1(\dvi_encoder_m0/encb/n0q_m [3]), .CI(\dvi_encoder_m0/encb/sub_84/add_2/n6 ), 
            .O(\dvi_encoder_m0/encb/n238 [3]), .CO(\dvi_encoder_m0/encb/sub_84/add_2/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/sub_84/add_2/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_84/add_2/i4 .I1_POLARITY = 1'b0;
    EFX_ADD \dvi_encoder_m0/encb/sub_84/add_2/i3  (.I0(\dvi_encoder_m0/encb/n232 [2]), 
            .I1(1'b1), .CI(\dvi_encoder_m0/encb/sub_84/add_2/n4 ), .O(\dvi_encoder_m0/encb/n238 [2]), 
            .CO(\dvi_encoder_m0/encb/sub_84/add_2/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/sub_84/add_2/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_84/add_2/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/sub_84/add_2/i2  (.I0(\dvi_encoder_m0/encb/n232 [1]), 
            .I1(1'b1), .CI(n932), .O(\dvi_encoder_m0/encb/n238 [1]), .CO(\dvi_encoder_m0/encb/sub_84/add_2/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/sub_84/add_2/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_84/add_2/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/sub_82/add_2/i5  (.I0(\dvi_encoder_m0/encb/n219 [4]), 
            .I1(1'b1), .CI(\dvi_encoder_m0/encb/sub_82/add_2/n8 ), .O(\dvi_encoder_m0/encb/n225 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/sub_82/add_2/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_82/add_2/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/sub_82/add_2/i4  (.I0(\dvi_encoder_m0/encb/n219 [3]), 
            .I1(\dvi_encoder_m0/encb/n1q_m [3]), .CI(\dvi_encoder_m0/encb/sub_82/add_2/n6 ), 
            .O(\dvi_encoder_m0/encb/n225 [3]), .CO(\dvi_encoder_m0/encb/sub_82/add_2/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/sub_82/add_2/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_82/add_2/i4 .I1_POLARITY = 1'b0;
    EFX_ADD \dvi_encoder_m0/encb/sub_82/add_2/i3  (.I0(\dvi_encoder_m0/encb/n219 [2]), 
            .I1(1'b1), .CI(\dvi_encoder_m0/encb/sub_82/add_2/n4 ), .O(\dvi_encoder_m0/encb/n225 [2]), 
            .CO(\dvi_encoder_m0/encb/sub_82/add_2/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/sub_82/add_2/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_82/add_2/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/sub_82/add_2/i2  (.I0(\dvi_encoder_m0/encb/n219 [1]), 
            .I1(1'b1), .CI(n933), .O(\dvi_encoder_m0/encb/n225 [1]), .CO(\dvi_encoder_m0/encb/sub_82/add_2/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/sub_82/add_2/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_82/add_2/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_93/i5  (.I0(\dvi_encoder_m0/encb/n628 ), 
            .I1(\dvi_encoder_m0/encb/sub_92/add_2/n8 ), .CI(\dvi_encoder_m0/encb/add_93/n8 ), 
            .O(\dvi_encoder_m0/encb/n292 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encb/add_93/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_93/i5 .I1_POLARITY = 1'b0;
    EFX_ADD \dvi_encoder_m0/encb/add_93/i4  (.I0(\dvi_encoder_m0/encb/n623 ), 
            .I1(\dvi_encoder_m0/encb/LessThan_63/n7 ), .CI(\dvi_encoder_m0/encb/add_93/n6 ), 
            .O(\dvi_encoder_m0/encb/n292 [3]), .CO(\dvi_encoder_m0/encb/add_93/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encb/add_93/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_93/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_93/i3  (.I0(\dvi_encoder_m0/encb/n618 ), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encb/add_93/n4 ), .CO(\dvi_encoder_m0/encb/add_93/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encb/add_93/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_93/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_93/i2  (.I0(\dvi_encoder_m0/encb/n694 ), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encb/add_93/n2 ), .CO(\dvi_encoder_m0/encb/add_93/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encb/add_93/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_93/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_89/i5  (.I0(\dvi_encoder_m0/encb/cnt [4]), 
            .I1(\dvi_encoder_m0/encb/sub_88/add_2/n8 ), .CI(\dvi_encoder_m0/encb/add_89/n8 ), 
            .O(\dvi_encoder_m0/encb/n273 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encb/add_89/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_89/i5 .I1_POLARITY = 1'b0;
    EFX_ADD \dvi_encoder_m0/encb/add_89/i4  (.I0(\dvi_encoder_m0/encb/cnt [3]), 
            .I1(\dvi_encoder_m0/encb/LessThan_63/n7 ), .CI(\dvi_encoder_m0/encb/add_89/n6 ), 
            .O(\dvi_encoder_m0/encb/n273 [3]), .CO(\dvi_encoder_m0/encb/add_89/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encb/add_89/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_89/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_89/i3  (.I0(\dvi_encoder_m0/encb/cnt [2]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encb/add_89/n4 ), .O(\dvi_encoder_m0/encb/n273 [2]), 
            .CO(\dvi_encoder_m0/encb/add_89/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encb/add_89/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_89/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_89/i2  (.I0(\dvi_encoder_m0/encb/cnt [1]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encb/add_89/n2 ), .O(\dvi_encoder_m0/encb/n273 [1]), 
            .CO(\dvi_encoder_m0/encb/add_89/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encb/add_89/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_89/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_83/i5  (.I0(\dvi_encoder_m0/encb/cnt [4]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encb/add_83/n8 ), .O(\dvi_encoder_m0/encb/n232 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/add_83/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_83/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_83/i4  (.I0(\dvi_encoder_m0/encb/cnt [3]), 
            .I1(\dvi_encoder_m0/encb/n1q_m [3]), .CI(\dvi_encoder_m0/encb/add_83/n6 ), 
            .O(\dvi_encoder_m0/encb/n232 [3]), .CO(\dvi_encoder_m0/encb/add_83/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/add_83/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_83/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_83/i3  (.I0(\dvi_encoder_m0/encb/cnt [2]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encb/add_83/n4 ), .O(\dvi_encoder_m0/encb/n232 [2]), 
            .CO(\dvi_encoder_m0/encb/add_83/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/add_83/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_83/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_83/i2  (.I0(\dvi_encoder_m0/encb/cnt [1]), 
            .I1(1'b0), .CI(n927), .O(\dvi_encoder_m0/encb/n232 [1]), .CO(\dvi_encoder_m0/encb/add_83/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/add_83/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_83/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_81/i5  (.I0(\dvi_encoder_m0/encb/cnt [4]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encb/add_81/n8 ), .O(\dvi_encoder_m0/encb/n219 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/add_81/i5 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_81/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_81/i4  (.I0(\dvi_encoder_m0/encb/cnt [3]), 
            .I1(\dvi_encoder_m0/encb/n0q_m [3]), .CI(\dvi_encoder_m0/encb/add_81/n6 ), 
            .O(\dvi_encoder_m0/encb/n219 [3]), .CO(\dvi_encoder_m0/encb/add_81/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/add_81/i4 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_81/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_81/i3  (.I0(\dvi_encoder_m0/encb/cnt [2]), 
            .I1(1'b0), .CI(\dvi_encoder_m0/encb/add_81/n4 ), .O(\dvi_encoder_m0/encb/n219 [2]), 
            .CO(\dvi_encoder_m0/encb/add_81/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/add_81/i3 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_81/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_81/i2  (.I0(\dvi_encoder_m0/encb/cnt [1]), 
            .I1(1'b0), .CI(n928), .O(\dvi_encoder_m0/encb/n219 [1]), .CO(\dvi_encoder_m0/encb/add_81/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/add_81/i2 .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_81/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i24  (.I0(led[2]), .I1(1'b0), .CI(\add_27/n46 ), .O(n6[24])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i24 .I0_POLARITY = 1'b1;
    defparam \add_27/i24 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i23  (.I0(led[3]), .I1(1'b0), .CI(\add_27/n44 ), .O(n6[23]), 
            .CO(\add_27/n46 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i23 .I0_POLARITY = 1'b1;
    defparam \add_27/i23 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i22  (.I0(led_cnt[22]), .I1(1'b0), .CI(\add_27/n42 ), 
            .O(n6[22]), .CO(\add_27/n44 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i22 .I0_POLARITY = 1'b1;
    defparam \add_27/i22 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i21  (.I0(led_cnt[21]), .I1(1'b0), .CI(\add_27/n40 ), 
            .O(n6[21]), .CO(\add_27/n42 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i21 .I0_POLARITY = 1'b1;
    defparam \add_27/i21 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i20  (.I0(led_cnt[20]), .I1(1'b0), .CI(\add_27/n38 ), 
            .O(n6[20]), .CO(\add_27/n40 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i20 .I0_POLARITY = 1'b1;
    defparam \add_27/i20 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i19  (.I0(led_cnt[19]), .I1(1'b0), .CI(\add_27/n36 ), 
            .O(n6[19]), .CO(\add_27/n38 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i19 .I0_POLARITY = 1'b1;
    defparam \add_27/i19 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i18  (.I0(led_cnt[18]), .I1(1'b0), .CI(\add_27/n34 ), 
            .O(n6[18]), .CO(\add_27/n36 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i18 .I0_POLARITY = 1'b1;
    defparam \add_27/i18 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i17  (.I0(led_cnt[17]), .I1(1'b0), .CI(\add_27/n32 ), 
            .O(n6[17]), .CO(\add_27/n34 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i17 .I0_POLARITY = 1'b1;
    defparam \add_27/i17 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i16  (.I0(led_cnt[16]), .I1(1'b0), .CI(\add_27/n30 ), 
            .O(n6[16]), .CO(\add_27/n32 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i16 .I0_POLARITY = 1'b1;
    defparam \add_27/i16 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i15  (.I0(led_cnt[15]), .I1(1'b0), .CI(\add_27/n28 ), 
            .O(n6[15]), .CO(\add_27/n30 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i15 .I0_POLARITY = 1'b1;
    defparam \add_27/i15 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i14  (.I0(led_cnt[14]), .I1(1'b0), .CI(\add_27/n26 ), 
            .O(n6[14]), .CO(\add_27/n28 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i14 .I0_POLARITY = 1'b1;
    defparam \add_27/i14 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i13  (.I0(led_cnt[13]), .I1(1'b0), .CI(\add_27/n24 ), 
            .O(n6[13]), .CO(\add_27/n26 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i13 .I0_POLARITY = 1'b1;
    defparam \add_27/i13 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i12  (.I0(led_cnt[12]), .I1(1'b0), .CI(\add_27/n22 ), 
            .O(n6[12]), .CO(\add_27/n24 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i12 .I0_POLARITY = 1'b1;
    defparam \add_27/i12 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i11  (.I0(led_cnt[11]), .I1(1'b0), .CI(\add_27/n20 ), 
            .O(n6[11]), .CO(\add_27/n22 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i11 .I0_POLARITY = 1'b1;
    defparam \add_27/i11 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i10  (.I0(led_cnt[10]), .I1(1'b0), .CI(\add_27/n18 ), 
            .O(n6[10]), .CO(\add_27/n20 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i10 .I0_POLARITY = 1'b1;
    defparam \add_27/i10 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i9  (.I0(led_cnt[9]), .I1(1'b0), .CI(\add_27/n16 ), 
            .O(n6[9]), .CO(\add_27/n18 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i9 .I0_POLARITY = 1'b1;
    defparam \add_27/i9 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i8  (.I0(led_cnt[8]), .I1(1'b0), .CI(\add_27/n14 ), 
            .O(n6[8]), .CO(\add_27/n16 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i8 .I0_POLARITY = 1'b1;
    defparam \add_27/i8 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i7  (.I0(led_cnt[7]), .I1(1'b0), .CI(\add_27/n12 ), 
            .O(n6[7]), .CO(\add_27/n14 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i7 .I0_POLARITY = 1'b1;
    defparam \add_27/i7 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i6  (.I0(led_cnt[6]), .I1(1'b0), .CI(\add_27/n10 ), 
            .O(n6[6]), .CO(\add_27/n12 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i6 .I0_POLARITY = 1'b1;
    defparam \add_27/i6 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i5  (.I0(led_cnt[5]), .I1(1'b0), .CI(\add_27/n8 ), 
            .O(n6[5]), .CO(\add_27/n10 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i5 .I0_POLARITY = 1'b1;
    defparam \add_27/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i4  (.I0(led_cnt[4]), .I1(1'b0), .CI(\add_27/n6 ), 
            .O(n6[4]), .CO(\add_27/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i4 .I0_POLARITY = 1'b1;
    defparam \add_27/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \add_27/i3  (.I0(led_cnt[3]), .I1(1'b0), .CI(\add_27/n4 ), 
            .O(n6[3]), .CO(\add_27/n6 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(39)
    defparam \add_27/i3 .I0_POLARITY = 1'b1;
    defparam \add_27/i3 .I1_POLARITY = 1'b1;
    EFX_RAM10 \DC_FIFO_inst/FifoBuff  (.WCLK(gpio_clk_27m), .RCLK(gpio_clk_27m), 
            .WCLKE(1'b1), .RE(n76), .RST(1'b0), .WADDREN(1'b1), .RADDREN(1'b1), 
            .WE({1'b0, \DC_FIFO_inst/FifoWrEn }), .WDATA({rx_data}), .WADDR({3'b000, 
            \DC_FIFO_inst/FifoWrAddr [6:0]}), .RADDR({3'b000, \DC_FIFO_inst/FifoRdAddr [6:0]}), 
            .RDATA({tx_data})) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM10, READ_WIDTH=8, WRITE_WIDTH=8, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=2'b11, WADDREN_POLARITY=1'b1, RADDREN_POLARITY=1'b1, RST_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", RESET_RAM="ASYNC", RESET_OUTREG="ASYNC", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_14=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_15=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_16=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_17=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_18=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_19=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_20=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_21=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_22=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_23=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_24=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_25=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_26=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_27=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;
    defparam \DC_FIFO_inst/FifoBuff .READ_WIDTH = 8;
    defparam \DC_FIFO_inst/FifoBuff .WRITE_WIDTH = 8;
    defparam \DC_FIFO_inst/FifoBuff .WCLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoBuff .WCLKE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoBuff .WE_POLARITY = 2'b11;
    defparam \DC_FIFO_inst/FifoBuff .RCLK_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoBuff .RST_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoBuff .WADDREN_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoBuff .RADDREN_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoBuff .RESET_RAM = "ASYNC";
    defparam \DC_FIFO_inst/FifoBuff .RESET_OUTREG = "ASYNC";
    defparam \DC_FIFO_inst/FifoBuff .RE_POLARITY = 1'b1;
    defparam \DC_FIFO_inst/FifoBuff .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .OUTPUT_REG = 1'b0;
    defparam \DC_FIFO_inst/FifoBuff .WRITE_MODE = "READ_FIRST";
    defparam \DC_FIFO_inst/FifoBuff .INIT_14 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_15 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_16 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_17 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_18 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_19 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_1A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_1B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_1C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_1D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_1E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_1F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_20 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_21 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_22 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_23 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_24 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_25 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_26 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \DC_FIFO_inst/FifoBuff .INIT_27 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    EFX_LUT4 LUT__1697 (.I0(\dvi_encoder_m0/encb/cnt [4]), .I1(\dvi_encoder_m0/encb/LessThan_63/n7 ), 
            .I2(\dvi_encoder_m0/encb/c0_reg ), .I3(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encb/n339 [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbb0f */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1697.LUTMASK = 16'hbb0f;
    EFX_LUT4 LUT__1698 (.I0(\dvi_encoder_m0/encb/n1q_m [3]), .I1(\dvi_encoder_m0/encb/n0q_m [3]), 
            .I2(\dvi_encoder_m0/encb/cnt [4]), .O(n767)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1698.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1699 (.I0(n767), .I1(\dvi_encoder_m0/encb/c0_reg ), .I2(\dvi_encoder_m0/encb/c1_reg ), 
            .I3(\dvi_encoder_m0/encb/de_reg ), .O(\dvi_encoder_m0/encb/n339 [9])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h55c3 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1699.LUTMASK = 16'h55c3;
    EFX_LUT4 LUT__1700 (.I0(\dvi_encoder_m0/encb/n0q_m [3]), .I1(\dvi_encoder_m0/encb/c0_reg ), 
            .I2(\dvi_encoder_m0/encb/de_reg ), .O(\dvi_encoder_m0/encb/n339 [8])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'ha3a3 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1700.LUTMASK = 16'ha3a3;
    EFX_LUT4 LUT__1701 (.I0(\dvi_encoder_m0/encb/cnt [4]), .I1(\dvi_encoder_m0/encb/n0q_m [3]), 
            .I2(\dvi_encoder_m0/encb/n1q_m [3]), .O(n768)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'he7e7 */ ;
    defparam LUT__1701.LUTMASK = 16'he7e7;
    EFX_LUT4 LUT__1702 (.I0(\dvi_encoder_m0/encb/cnt [0]), .I1(\dvi_encoder_m0/encb/n273 [0]), 
            .I2(n768), .I3(\dvi_encoder_m0/encb/de_reg ), .O(\dvi_encoder_m0/encb/n350 [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hac00 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1702.LUTMASK = 16'hac00;
    EFX_LUT4 LUT__1703 (.I0(\dvi_encoder_m0/encb/n238 [1]), .I1(\dvi_encoder_m0/encb/n225 [1]), 
            .I2(\dvi_encoder_m0/encb/n0q_m [3]), .O(n769)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1703.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1704 (.I0(\dvi_encoder_m0/encb/cnt [1]), .I1(\dvi_encoder_m0/encb/n0q_m [3]), 
            .O(\dvi_encoder_m0/encb/n694 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9999 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/dvi_encoder.v(23)
    defparam LUT__1704.LUTMASK = 16'h9999;
    EFX_LUT4 LUT__1705 (.I0(\dvi_encoder_m0/encb/n694 ), .I1(\dvi_encoder_m0/encb/n273 [1]), 
            .I2(n768), .O(n770)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1705.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1706 (.I0(\dvi_encoder_m0/encb/cnt [1]), .I1(\dvi_encoder_m0/encb/cnt [2]), 
            .I2(\dvi_encoder_m0/encb/cnt [3]), .I3(\dvi_encoder_m0/encb/cnt [4]), 
            .O(n771)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1706.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1707 (.I0(n771), .I1(\dvi_encoder_m0/encb/cnt [0]), .I2(\dvi_encoder_m0/encb/LessThan_63/n7 ), 
            .O(n772)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hd0d0 */ ;
    defparam LUT__1707.LUTMASK = 16'hd0d0;
    EFX_LUT4 LUT__1708 (.I0(n770), .I1(n769), .I2(n772), .I3(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encb/n350 [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hac00 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1708.LUTMASK = 16'hac00;
    EFX_LUT4 LUT__1709 (.I0(\dvi_encoder_m0/encb/n238 [2]), .I1(\dvi_encoder_m0/encb/n225 [2]), 
            .I2(\dvi_encoder_m0/encb/n0q_m [3]), .O(n773)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1709.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1710 (.I0(\dvi_encoder_m0/encb/cnt [1]), .I1(\dvi_encoder_m0/encb/n0q_m [3]), 
            .I2(\dvi_encoder_m0/encb/cnt [2]), .O(\dvi_encoder_m0/encb/n618 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'he1e1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/dvi_encoder.v(23)
    defparam LUT__1710.LUTMASK = 16'he1e1;
    EFX_LUT4 LUT__1711 (.I0(\dvi_encoder_m0/encb/n618 ), .I1(\dvi_encoder_m0/encb/n273 [2]), 
            .I2(n768), .O(n774)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1711.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1712 (.I0(n774), .I1(n773), .I2(n772), .I3(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encb/n350 [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hac00 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1712.LUTMASK = 16'hac00;
    EFX_LUT4 LUT__1713 (.I0(\dvi_encoder_m0/encb/n238 [3]), .I1(\dvi_encoder_m0/encb/n225 [3]), 
            .I2(\dvi_encoder_m0/encb/n0q_m [3]), .O(n775)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1713.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1714 (.I0(\dvi_encoder_m0/encb/n292 [3]), .I1(\dvi_encoder_m0/encb/n273 [3]), 
            .I2(n768), .O(n776)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1714.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1715 (.I0(n776), .I1(n775), .I2(n772), .I3(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encb/n350 [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hac00 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1715.LUTMASK = 16'hac00;
    EFX_LUT4 LUT__1716 (.I0(\dvi_encoder_m0/encb/n238 [4]), .I1(\dvi_encoder_m0/encb/n225 [4]), 
            .I2(\dvi_encoder_m0/encb/n0q_m [3]), .O(n777)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1716.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1717 (.I0(\dvi_encoder_m0/encb/n292 [4]), .I1(\dvi_encoder_m0/encb/n273 [4]), 
            .I2(n768), .O(n778)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1717.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1718 (.I0(n778), .I1(n777), .I2(n772), .I3(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encb/n350 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hac00 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1718.LUTMASK = 16'hac00;
    EFX_LUT4 LUT__1719 (.I0(\dvi_encoder_m0/encr/n1q_m [3]), .I1(\dvi_encoder_m0/encr/n0q_m [3]), 
            .O(\dvi_encoder_m0/encr/LessThan_63/n7 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(125)
    defparam LUT__1719.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1720 (.I0(\dvi_encoder_m0/encr/LessThan_63/n7 ), .I1(\dvi_encoder_m0/encr/cnt [4]), 
            .I2(\dvi_encoder_m0/encb/de_reg ), .O(\dvi_encoder_m0/encr/n339 [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hd0d0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1720.LUTMASK = 16'hd0d0;
    EFX_LUT4 LUT__1721 (.I0(\dvi_encoder_m0/encr/cnt [4]), .I1(\dvi_encoder_m0/encb/de_reg ), 
            .I2(\dvi_encoder_m0/encr/LessThan_63/n7 ), .O(\dvi_encoder_m0/encr/n339 [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbfbf */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1721.LUTMASK = 16'hbfbf;
    EFX_LUT4 LUT__1722 (.I0(\dvi_encoder_m0/encr/n1q_m [3]), .I1(\dvi_encoder_m0/encr/n0q_m [3]), 
            .I2(\dvi_encoder_m0/encr/cnt [4]), .I3(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encr/n339 [9])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h53ff */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1722.LUTMASK = 16'h53ff;
    EFX_LUT4 LUT__1723 (.I0(\dvi_encoder_m0/encr/n0q_m [3]), .I1(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encr/n339 [8])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbbbb */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1723.LUTMASK = 16'hbbbb;
    EFX_LUT4 LUT__1724 (.I0(\dvi_encoder_m0/encr/cnt [4]), .I1(\dvi_encoder_m0/encr/n0q_m [3]), 
            .I2(\dvi_encoder_m0/encr/n1q_m [3]), .O(n779)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'he7e7 */ ;
    defparam LUT__1724.LUTMASK = 16'he7e7;
    EFX_LUT4 LUT__1725 (.I0(\dvi_encoder_m0/encr/cnt [0]), .I1(\dvi_encoder_m0/encr/n273 [0]), 
            .I2(n779), .I3(\dvi_encoder_m0/encb/de_reg ), .O(\dvi_encoder_m0/encr/n350 [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hac00 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1725.LUTMASK = 16'hac00;
    EFX_LUT4 LUT__1726 (.I0(\dvi_encoder_m0/encr/n238 [1]), .I1(\dvi_encoder_m0/encr/n225 [1]), 
            .I2(\dvi_encoder_m0/encr/n0q_m [3]), .O(n780)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1726.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1727 (.I0(\dvi_encoder_m0/encr/cnt [1]), .I1(\dvi_encoder_m0/encr/n0q_m [3]), 
            .O(\dvi_encoder_m0/encr/n694 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9999 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/dvi_encoder.v(32)
    defparam LUT__1727.LUTMASK = 16'h9999;
    EFX_LUT4 LUT__1728 (.I0(\dvi_encoder_m0/encr/n694 ), .I1(\dvi_encoder_m0/encr/n273 [1]), 
            .I2(n779), .O(n781)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1728.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1729 (.I0(\dvi_encoder_m0/encr/cnt [1]), .I1(\dvi_encoder_m0/encr/cnt [2]), 
            .I2(\dvi_encoder_m0/encr/cnt [3]), .I3(\dvi_encoder_m0/encr/cnt [4]), 
            .O(n782)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1729.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1730 (.I0(n782), .I1(\dvi_encoder_m0/encr/cnt [0]), .I2(\dvi_encoder_m0/encr/LessThan_63/n7 ), 
            .O(n783)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hd0d0 */ ;
    defparam LUT__1730.LUTMASK = 16'hd0d0;
    EFX_LUT4 LUT__1731 (.I0(n781), .I1(n780), .I2(n783), .I3(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encr/n350 [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hac00 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1731.LUTMASK = 16'hac00;
    EFX_LUT4 LUT__1732 (.I0(\dvi_encoder_m0/encr/n238 [2]), .I1(\dvi_encoder_m0/encr/n225 [2]), 
            .I2(\dvi_encoder_m0/encr/n0q_m [3]), .O(n784)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1732.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1733 (.I0(\dvi_encoder_m0/encr/cnt [1]), .I1(\dvi_encoder_m0/encr/n0q_m [3]), 
            .I2(\dvi_encoder_m0/encr/cnt [2]), .O(\dvi_encoder_m0/encr/n618 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'he1e1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/dvi_encoder.v(32)
    defparam LUT__1733.LUTMASK = 16'he1e1;
    EFX_LUT4 LUT__1734 (.I0(\dvi_encoder_m0/encr/n618 ), .I1(\dvi_encoder_m0/encr/n273 [2]), 
            .I2(n779), .O(n785)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1734.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1735 (.I0(n785), .I1(n784), .I2(n783), .I3(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encr/n350 [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hac00 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1735.LUTMASK = 16'hac00;
    EFX_LUT4 LUT__1736 (.I0(\dvi_encoder_m0/encr/n238 [3]), .I1(\dvi_encoder_m0/encr/n225 [3]), 
            .I2(\dvi_encoder_m0/encr/n0q_m [3]), .O(n786)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1736.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1737 (.I0(\dvi_encoder_m0/encr/n292 [3]), .I1(\dvi_encoder_m0/encr/n273 [3]), 
            .I2(n779), .O(n787)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1737.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1738 (.I0(n787), .I1(n786), .I2(n783), .I3(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encr/n350 [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hac00 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1738.LUTMASK = 16'hac00;
    EFX_LUT4 LUT__1739 (.I0(\dvi_encoder_m0/encr/n238 [4]), .I1(\dvi_encoder_m0/encr/n225 [4]), 
            .I2(\dvi_encoder_m0/encr/n0q_m [3]), .O(n788)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1739.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1740 (.I0(\dvi_encoder_m0/encr/n292 [4]), .I1(\dvi_encoder_m0/encr/n273 [4]), 
            .I2(n779), .O(n789)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1740.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1741 (.I0(n789), .I1(n788), .I2(n783), .I3(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encr/n350 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hac00 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1741.LUTMASK = 16'hac00;
    EFX_LUT4 LUT__1742 (.I0(\dvi_encoder_m0/encg/n1q_m [3]), .I1(\dvi_encoder_m0/encg/n0q_m [3]), 
            .O(\dvi_encoder_m0/encg/LessThan_63/n7 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(125)
    defparam LUT__1742.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1743 (.I0(\dvi_encoder_m0/encg/LessThan_63/n7 ), .I1(\dvi_encoder_m0/encg/cnt [4]), 
            .I2(\dvi_encoder_m0/encb/de_reg ), .O(\dvi_encoder_m0/encg/n339 [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hd0d0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1743.LUTMASK = 16'hd0d0;
    EFX_LUT4 LUT__1744 (.I0(\dvi_encoder_m0/encg/cnt [4]), .I1(\dvi_encoder_m0/encb/de_reg ), 
            .I2(\dvi_encoder_m0/encg/LessThan_63/n7 ), .O(\dvi_encoder_m0/encg/n339 [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbfbf */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1744.LUTMASK = 16'hbfbf;
    EFX_LUT4 LUT__1745 (.I0(\dvi_encoder_m0/encg/n1q_m [3]), .I1(\dvi_encoder_m0/encg/n0q_m [3]), 
            .I2(\dvi_encoder_m0/encg/cnt [4]), .I3(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encg/n339 [9])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h53ff */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1745.LUTMASK = 16'h53ff;
    EFX_LUT4 LUT__1746 (.I0(\dvi_encoder_m0/encg/n0q_m [3]), .I1(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encg/n339 [8])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbbbb */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1746.LUTMASK = 16'hbbbb;
    EFX_LUT4 LUT__1747 (.I0(\dvi_encoder_m0/encg/cnt [4]), .I1(\dvi_encoder_m0/encg/n0q_m [3]), 
            .I2(\dvi_encoder_m0/encg/n1q_m [3]), .O(n790)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'he7e7 */ ;
    defparam LUT__1747.LUTMASK = 16'he7e7;
    EFX_LUT4 LUT__1748 (.I0(\dvi_encoder_m0/encg/cnt [0]), .I1(\dvi_encoder_m0/encg/n273 [0]), 
            .I2(n790), .I3(\dvi_encoder_m0/encb/de_reg ), .O(\dvi_encoder_m0/encg/n350 [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hac00 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1748.LUTMASK = 16'hac00;
    EFX_LUT4 LUT__1749 (.I0(\dvi_encoder_m0/encg/n238 [1]), .I1(\dvi_encoder_m0/encg/n225 [1]), 
            .I2(\dvi_encoder_m0/encg/n0q_m [3]), .O(n791)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1749.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1750 (.I0(\dvi_encoder_m0/encg/cnt [1]), .I1(\dvi_encoder_m0/encg/n0q_m [3]), 
            .O(\dvi_encoder_m0/encg/n694 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9999 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/dvi_encoder.v(41)
    defparam LUT__1750.LUTMASK = 16'h9999;
    EFX_LUT4 LUT__1751 (.I0(\dvi_encoder_m0/encg/n694 ), .I1(\dvi_encoder_m0/encg/n273 [1]), 
            .I2(n790), .O(n792)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1751.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1752 (.I0(\dvi_encoder_m0/encg/cnt [1]), .I1(\dvi_encoder_m0/encg/cnt [2]), 
            .I2(\dvi_encoder_m0/encg/cnt [3]), .I3(\dvi_encoder_m0/encg/cnt [4]), 
            .O(n793)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1752.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1753 (.I0(n793), .I1(\dvi_encoder_m0/encg/cnt [0]), .I2(\dvi_encoder_m0/encg/LessThan_63/n7 ), 
            .O(n794)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hd0d0 */ ;
    defparam LUT__1753.LUTMASK = 16'hd0d0;
    EFX_LUT4 LUT__1754 (.I0(n792), .I1(n791), .I2(n794), .I3(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encg/n350 [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hac00 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1754.LUTMASK = 16'hac00;
    EFX_LUT4 LUT__1755 (.I0(\dvi_encoder_m0/encg/n238 [2]), .I1(\dvi_encoder_m0/encg/n225 [2]), 
            .I2(\dvi_encoder_m0/encg/n0q_m [3]), .O(n795)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1755.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1756 (.I0(\dvi_encoder_m0/encg/cnt [1]), .I1(\dvi_encoder_m0/encg/n0q_m [3]), 
            .I2(\dvi_encoder_m0/encg/cnt [2]), .O(\dvi_encoder_m0/encg/n618 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'he1e1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/dvi_encoder.v(41)
    defparam LUT__1756.LUTMASK = 16'he1e1;
    EFX_LUT4 LUT__1757 (.I0(\dvi_encoder_m0/encg/n618 ), .I1(\dvi_encoder_m0/encg/n273 [2]), 
            .I2(n790), .O(n796)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1757.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1758 (.I0(n796), .I1(n795), .I2(n794), .I3(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encg/n350 [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hac00 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1758.LUTMASK = 16'hac00;
    EFX_LUT4 LUT__1759 (.I0(\dvi_encoder_m0/encg/n238 [3]), .I1(\dvi_encoder_m0/encg/n225 [3]), 
            .I2(\dvi_encoder_m0/encg/n0q_m [3]), .O(n797)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1759.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1760 (.I0(\dvi_encoder_m0/encg/n292 [3]), .I1(\dvi_encoder_m0/encg/n273 [3]), 
            .I2(n790), .O(n798)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1760.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1761 (.I0(n798), .I1(n797), .I2(n794), .I3(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encg/n350 [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hac00 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1761.LUTMASK = 16'hac00;
    EFX_LUT4 LUT__1762 (.I0(\dvi_encoder_m0/encg/n238 [4]), .I1(\dvi_encoder_m0/encg/n225 [4]), 
            .I2(\dvi_encoder_m0/encg/n0q_m [3]), .O(n799)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1762.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1763 (.I0(\dvi_encoder_m0/encg/n292 [4]), .I1(\dvi_encoder_m0/encg/n273 [4]), 
            .I2(n790), .O(n800)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__1763.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__1764 (.I0(n800), .I1(n799), .I2(n794), .I3(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encg/n350 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hac00 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1764.LUTMASK = 16'hac00;
    EFX_LUT4 LUT__1765 (.I0(\u_color_bar_rgb/h_cnt [7]), .I1(\u_color_bar_rgb/h_cnt [5]), 
            .I2(\u_color_bar_rgb/h_cnt [6]), .I3(\u_color_bar_rgb/h_cnt [4]), 
            .O(n801)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4000 */ ;
    defparam LUT__1765.LUTMASK = 16'h4000;
    EFX_LUT4 LUT__1766 (.I0(\u_color_bar_rgb/h_state[0] ), .I1(n801), .I2(\u_color_bar_rgb/h_state [1]), 
            .O(n802)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__1766.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__1767 (.I0(\u_color_bar_rgb/h_cnt [0]), .I1(\u_color_bar_rgb/h_cnt [1]), 
            .I2(\u_color_bar_rgb/h_cnt [2]), .O(n803)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1767.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1768 (.I0(\u_color_bar_rgb/h_cnt [3]), .I1(\u_color_bar_rgb/h_cnt [8]), 
            .I2(\u_color_bar_rgb/h_cnt [9]), .I3(\u_color_bar_rgb/h_cnt [10]), 
            .O(n804)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1768.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1769 (.I0(\u_color_bar_rgb/h_cnt [11]), .I1(\u_color_bar_rgb/h_cnt [12]), 
            .I2(\u_color_bar_rgb/h_cnt [13]), .I3(\u_color_bar_rgb/h_cnt [14]), 
            .O(n805)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1769.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1770 (.I0(\u_color_bar_rgb/h_cnt [15]), .I1(n803), .I2(n804), 
            .I3(n805), .O(n806)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4000 */ ;
    defparam LUT__1770.LUTMASK = 16'h4000;
    EFX_LUT4 LUT__1771 (.I0(\u_color_bar_rgb/v_state[0] ), .I1(\u_color_bar_rgb/v_state [1]), 
            .O(n807)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1771.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1772 (.I0(n806), .I1(n802), .I2(n807), .O(n808)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7070 */ ;
    defparam LUT__1772.LUTMASK = 16'h7070;
    EFX_LUT4 LUT__1773 (.I0(n808), .I1(\u_color_bar_rgb/v_cnt [0]), .O(\u_color_bar_rgb/n454 [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9999 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(177)
    defparam LUT__1773.LUTMASK = 16'h9999;
    EFX_LUT4 LUT__1774 (.I0(n806), .I1(n802), .O(n809)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1774.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1775 (.I0(n809), .I1(n807), .O(ceg_net39)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__1775.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__1776 (.I0(\u_color_bar_rgb/h_cnt [0]), .I1(\u_color_bar_rgb/h_cnt [1]), 
            .I2(\u_color_bar_rgb/h_cnt [2]), .I3(\u_color_bar_rgb/h_cnt [3]), 
            .O(n810)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8000 */ ;
    defparam LUT__1776.LUTMASK = 16'h8000;
    EFX_LUT4 LUT__1777 (.I0(n810), .I1(\u_color_bar_rgb/h_cnt [4]), .I2(\u_color_bar_rgb/h_cnt [5]), 
            .O(n811)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1777.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1778 (.I0(\u_color_bar_rgb/h_cnt [15]), .I1(\u_color_bar_rgb/h_state[0] ), 
            .I2(n805), .I3(\u_color_bar_rgb/h_state [1]), .O(n812)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4000 */ ;
    defparam LUT__1778.LUTMASK = 16'h4000;
    EFX_LUT4 LUT__1779 (.I0(\u_color_bar_rgb/h_cnt [7]), .I1(\u_color_bar_rgb/h_cnt [6]), 
            .I2(\u_color_bar_rgb/h_cnt [9]), .I3(\u_color_bar_rgb/h_cnt [10]), 
            .O(n813)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4000 */ ;
    defparam LUT__1779.LUTMASK = 16'h4000;
    EFX_LUT4 LUT__1780 (.I0(n811), .I1(n812), .I2(n813), .I3(\u_color_bar_rgb/h_cnt [8]), 
            .O(n814)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8000 */ ;
    defparam LUT__1780.LUTMASK = 16'h8000;
    EFX_LUT4 LUT__1781 (.I0(\u_color_bar_rgb/h_state[0] ), .I1(\u_color_bar_rgb/h_state [1]), 
            .O(\u_color_bar_rgb/equal_105/n3 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'heeee */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(353)
    defparam LUT__1781.LUTMASK = 16'heeee;
    EFX_LUT4 LUT__1782 (.I0(\u_color_bar_rgb/h_cnt [4]), .I1(\u_color_bar_rgb/h_cnt [5]), 
            .I2(\u_color_bar_rgb/h_cnt [6]), .O(n815)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0101 */ ;
    defparam LUT__1782.LUTMASK = 16'h0101;
    EFX_LUT4 LUT__1783 (.I0(\u_color_bar_rgb/h_cnt [1]), .I1(\u_color_bar_rgb/h_cnt [2]), 
            .I2(\u_color_bar_rgb/h_cnt [7]), .I3(\u_color_bar_rgb/h_cnt [0]), 
            .O(n816)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__1783.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1784 (.I0(\u_color_bar_rgb/equal_105/n3 ), .I1(n815), 
            .I2(n816), .O(n817)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__1784.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__1785 (.I0(\u_color_bar_rgb/h_cnt [15]), .I1(n805), .I2(n804), 
            .I3(n817), .O(n818)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4000 */ ;
    defparam LUT__1785.LUTMASK = 16'h4000;
    EFX_LUT4 LUT__1786 (.I0(\u_color_bar_rgb/h_cnt [7]), .I1(\u_color_bar_rgb/h_cnt [6]), 
            .I2(\u_color_bar_rgb/h_cnt [4]), .O(n819)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__1786.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__1787 (.I0(\u_color_bar_rgb/h_state[0] ), .I1(\u_color_bar_rgb/h_cnt [5]), 
            .I2(\u_color_bar_rgb/h_state [1]), .I3(n819), .O(n820)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4200 */ ;
    defparam LUT__1787.LUTMASK = 16'h4200;
    EFX_LUT4 LUT__1788 (.I0(n806), .I1(n820), .O(n821)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1788.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1789 (.I0(n814), .I1(n818), .I2(n821), .O(ceg_net40)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0101 */ ;
    defparam LUT__1789.LUTMASK = 16'h0101;
    EFX_LUT4 LUT__1790 (.I0(\DC_FIFO_inst/U2_RdAddrCnt/n4 ), .I1(tx_req), 
            .O(n76)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(69)
    defparam LUT__1790.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1791 (.I0(\DC_FIFO_inst/FullFlag ), .I1(rx_valid), .O(\DC_FIFO_inst/FifoWrEn )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(192)
    defparam LUT__1791.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1792 (.I0(\u_color_bar_rgb/v_cnt [0]), .I1(\u_color_bar_rgb/v_cnt [1]), 
            .I2(\u_color_bar_rgb/v_cnt [2]), .I3(\u_color_bar_rgb/v_cnt [3]), 
            .O(n822)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8000 */ ;
    defparam LUT__1792.LUTMASK = 16'h8000;
    EFX_LUT4 LUT__1793 (.I0(\u_color_bar_rgb/v_cnt [4]), .I1(\u_color_bar_rgb/v_cnt [5]), 
            .O(n823)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1793.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1794 (.I0(n822), .I1(n823), .I2(\u_color_bar_rgb/v_cnt [6]), 
            .I3(\u_color_bar_rgb/v_cnt [7]), .O(n824)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8000 */ ;
    defparam LUT__1794.LUTMASK = 16'h8000;
    EFX_LUT4 LUT__1795 (.I0(n824), .I1(\u_color_bar_rgb/v_cnt [8]), .O(n825)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1795.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1796 (.I0(\u_color_bar_rgb/v_cnt [9]), .I1(\u_color_bar_rgb/v_cnt [11]), 
            .O(n826)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__1796.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__1797 (.I0(\u_color_bar_rgb/v_cnt [12]), .I1(\u_color_bar_rgb/v_cnt [13]), 
            .I2(\u_color_bar_rgb/v_cnt [14]), .I3(\u_color_bar_rgb/v_cnt [15]), 
            .O(n827)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1797.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1798 (.I0(\u_color_bar_rgb/v_state[0] ), .I1(\u_color_bar_rgb/v_cnt [10]), 
            .I2(\u_color_bar_rgb/v_state [1]), .O(n828)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1798.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1799 (.I0(n826), .I1(n827), .I2(n828), .O(n829)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1799.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1800 (.I0(\u_color_bar_rgb/v_state[0] ), .I1(\u_color_bar_rgb/v_state [1]), 
            .I2(\u_color_bar_rgb/v_cnt [4]), .I3(\u_color_bar_rgb/v_cnt [1]), 
            .O(n830)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9ffe */ ;
    defparam LUT__1800.LUTMASK = 16'h9ffe;
    EFX_LUT4 LUT__1801 (.I0(\u_color_bar_rgb/v_cnt [2]), .I1(\u_color_bar_rgb/v_cnt [7]), 
            .I2(\u_color_bar_rgb/v_cnt [8]), .I3(\u_color_bar_rgb/v_cnt [10]), 
            .O(n831)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1801.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1802 (.I0(\u_color_bar_rgb/v_cnt [3]), .I1(\u_color_bar_rgb/v_cnt [5]), 
            .I2(\u_color_bar_rgb/v_cnt [6]), .O(n832)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0101 */ ;
    defparam LUT__1802.LUTMASK = 16'h0101;
    EFX_LUT4 LUT__1803 (.I0(n826), .I1(n827), .I2(n831), .I3(n832), 
            .O(n833)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8000 */ ;
    defparam LUT__1803.LUTMASK = 16'h8000;
    EFX_LUT4 LUT__1804 (.I0(n830), .I1(n833), .I2(\u_color_bar_rgb/v_cnt [0]), 
            .O(n834)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__1804.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__1805 (.I0(n829), .I1(n825), .I2(n834), .I3(n809), 
            .O(ceg_net41)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h07ff */ ;
    defparam LUT__1805.LUTMASK = 16'h07ff;
    EFX_LUT4 LUT__1806 (.I0(\u_color_bar_rgb/h_state[0] ), .I1(\u_color_bar_rgb/v_state[0] ), 
            .I2(\u_color_bar_rgb/v_state [1]), .I3(\u_color_bar_rgb/h_state [1]), 
            .O(\u_color_bar_rgb/n719 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8000 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(334)
    defparam LUT__1806.LUTMASK = 16'h8000;
    EFX_LUT4 LUT__1807 (.I0(\u_color_bar_rgb/v_state[0] ), .I1(\u_color_bar_rgb/v_state [1]), 
            .O(\u_color_bar_rgb/equal_99/n3 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'heeee */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(343)
    defparam LUT__1807.LUTMASK = 16'heeee;
    EFX_LUT4 LUT__1808 (.I0(\u_color_bar_rgb/h_cnt [4]), .I1(\u_color_bar_rgb/h_cnt [5]), 
            .I2(\u_color_bar_rgb/h_cnt [9]), .I3(\u_color_bar_rgb/h_cnt [8]), 
            .O(n835)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hfc17 */ ;
    defparam LUT__1808.LUTMASK = 16'hfc17;
    EFX_LUT4 LUT__1809 (.I0(\u_color_bar_rgb/h_cnt [6]), .I1(\u_color_bar_rgb/h_cnt [7]), 
            .O(n836)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1809.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1810 (.I0(\u_color_bar_rgb/h_cnt [8]), .I1(n835), .I2(n836), 
            .O(n837)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3a3a */ ;
    defparam LUT__1810.LUTMASK = 16'h3a3a;
    EFX_LUT4 LUT__1811 (.I0(\u_color_bar_rgb/h_cnt [4]), .I1(\u_color_bar_rgb/h_cnt [5]), 
            .I2(\u_color_bar_rgb/h_cnt [6]), .I3(\u_color_bar_rgb/h_cnt [8]), 
            .O(n838)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0007 */ ;
    defparam LUT__1811.LUTMASK = 16'h0007;
    EFX_LUT4 LUT__1812 (.I0(\u_color_bar_rgb/h_cnt [5]), .I1(\u_color_bar_rgb/h_cnt [6]), 
            .I2(\u_color_bar_rgb/h_cnt [7]), .I3(\u_color_bar_rgb/h_cnt [8]), 
            .O(n839)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'he000 */ ;
    defparam LUT__1812.LUTMASK = 16'he000;
    EFX_LUT4 LUT__1813 (.I0(n839), .I1(n838), .I2(\u_color_bar_rgb/h_cnt [9]), 
            .O(n840)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0e0e */ ;
    defparam LUT__1813.LUTMASK = 16'h0e0e;
    EFX_LUT4 LUT__1814 (.I0(n815), .I1(\u_color_bar_rgb/h_cnt [7]), .I2(\u_color_bar_rgb/h_cnt [8]), 
            .I3(n840), .O(n841)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h00f4 */ ;
    defparam LUT__1814.LUTMASK = 16'h00f4;
    EFX_LUT4 LUT__1815 (.I0(n841), .I1(n837), .I2(\u_color_bar_rgb/h_cnt [10]), 
            .I3(n812), .O(\u_color_bar_rgb/n664 [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5300 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(312)
    defparam LUT__1815.LUTMASK = 16'h5300;
    EFX_LUT4 LUT__1816 (.I0(n836), .I1(\u_color_bar_rgb/h_cnt [8]), .I2(\u_color_bar_rgb/h_cnt [9]), 
            .O(n842)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1816.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1817 (.I0(n842), .I1(\u_color_bar_rgb/h_cnt [10]), .I2(n812), 
            .O(\u_color_bar_rgb/n664 [8])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(312)
    defparam LUT__1817.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__1818 (.I0(\u_color_bar_rgb/h_cnt [5]), .I1(\u_color_bar_rgb/h_cnt [6]), 
            .I2(\u_color_bar_rgb/h_cnt [7]), .I3(\u_color_bar_rgb/h_cnt [8]), 
            .O(n843)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8000 */ ;
    defparam LUT__1818.LUTMASK = 16'h8000;
    EFX_LUT4 LUT__1819 (.I0(n843), .I1(\u_color_bar_rgb/h_cnt [9]), .I2(n842), 
            .O(n844)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0e0e */ ;
    defparam LUT__1819.LUTMASK = 16'h0e0e;
    EFX_LUT4 LUT__1820 (.I0(n839), .I1(\u_color_bar_rgb/h_cnt [10]), .I2(n844), 
            .I3(n812), .O(\u_color_bar_rgb/n664 [16])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0700 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(312)
    defparam LUT__1820.LUTMASK = 16'h0700;
    EFX_LUT4 LUT__1821 (.I0(n818), .I1(\u_color_bar_rgb/h_cnt [0]), .I2(\u_color_bar_rgb/h_cnt [1]), 
            .O(\u_color_bar_rgb/n163 [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1414 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(125)
    defparam LUT__1821.LUTMASK = 16'h1414;
    EFX_LUT4 LUT__1822 (.I0(\u_color_bar_rgb/h_cnt [0]), .I1(\u_color_bar_rgb/h_cnt [1]), 
            .I2(\u_color_bar_rgb/h_cnt [2]), .O(\u_color_bar_rgb/n823 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(157)
    defparam LUT__1822.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__1823 (.I0(n821), .I1(n803), .I2(\u_color_bar_rgb/h_cnt [3]), 
            .O(\u_color_bar_rgb/n163 [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1414 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(125)
    defparam LUT__1823.LUTMASK = 16'h1414;
    EFX_LUT4 LUT__1824 (.I0(n821), .I1(n810), .I2(\u_color_bar_rgb/h_cnt [4]), 
            .O(\u_color_bar_rgb/n163 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1414 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(125)
    defparam LUT__1824.LUTMASK = 16'h1414;
    EFX_LUT4 LUT__1825 (.I0(n810), .I1(\u_color_bar_rgb/h_cnt [4]), .I2(n809), 
            .I3(\u_color_bar_rgb/h_cnt [5]), .O(\u_color_bar_rgb/n163 [5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0708 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(125)
    defparam LUT__1825.LUTMASK = 16'h0708;
    EFX_LUT4 LUT__1826 (.I0(n821), .I1(n811), .I2(\u_color_bar_rgb/h_cnt [6]), 
            .O(\u_color_bar_rgb/n163 [6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1414 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(125)
    defparam LUT__1826.LUTMASK = 16'h1414;
    EFX_LUT4 LUT__1827 (.I0(n811), .I1(\u_color_bar_rgb/h_cnt [6]), .I2(n814), 
            .I3(\u_color_bar_rgb/h_cnt [7]), .O(\u_color_bar_rgb/n163 [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0708 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(125)
    defparam LUT__1827.LUTMASK = 16'h0708;
    EFX_LUT4 LUT__1828 (.I0(n811), .I1(n836), .I2(n814), .I3(\u_color_bar_rgb/h_cnt [8]), 
            .O(\u_color_bar_rgb/n163 [8])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0708 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(125)
    defparam LUT__1828.LUTMASK = 16'h0708;
    EFX_LUT4 LUT__1829 (.I0(n810), .I1(n843), .I2(\u_color_bar_rgb/h_cnt [4]), 
            .O(n845)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1829.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1830 (.I0(n814), .I1(n845), .I2(\u_color_bar_rgb/h_cnt [9]), 
            .O(\u_color_bar_rgb/n163 [9])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1414 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(125)
    defparam LUT__1830.LUTMASK = 16'h1414;
    EFX_LUT4 LUT__1831 (.I0(n845), .I1(\u_color_bar_rgb/h_cnt [9]), .I2(n814), 
            .I3(\u_color_bar_rgb/h_cnt [10]), .O(\u_color_bar_rgb/n163 [10])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0708 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(125)
    defparam LUT__1831.LUTMASK = 16'h0708;
    EFX_LUT4 LUT__1832 (.I0(n845), .I1(\u_color_bar_rgb/h_cnt [9]), .I2(\u_color_bar_rgb/h_cnt [10]), 
            .I3(\u_color_bar_rgb/h_cnt [11]), .O(\u_color_bar_rgb/n868 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7f80 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(157)
    defparam LUT__1832.LUTMASK = 16'h7f80;
    EFX_LUT4 LUT__1833 (.I0(\u_color_bar_rgb/h_cnt [9]), .I1(\u_color_bar_rgb/h_cnt [10]), 
            .I2(\u_color_bar_rgb/h_cnt [11]), .O(n846)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1833.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1834 (.I0(n845), .I1(n846), .I2(\u_color_bar_rgb/h_cnt [12]), 
            .O(\u_color_bar_rgb/n873 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(157)
    defparam LUT__1834.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__1835 (.I0(n845), .I1(n846), .I2(\u_color_bar_rgb/h_cnt [12]), 
            .O(n847)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1835.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1836 (.I0(n847), .I1(\u_color_bar_rgb/h_cnt [13]), .O(\u_color_bar_rgb/n878 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(157)
    defparam LUT__1836.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1837 (.I0(n847), .I1(\u_color_bar_rgb/h_cnt [13]), .I2(\u_color_bar_rgb/h_cnt [14]), 
            .O(\u_color_bar_rgb/n883 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(157)
    defparam LUT__1837.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__1838 (.I0(n847), .I1(\u_color_bar_rgb/h_cnt [13]), .I2(\u_color_bar_rgb/h_cnt [14]), 
            .I3(\u_color_bar_rgb/h_cnt [15]), .O(\u_color_bar_rgb/n888 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7f80 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(157)
    defparam LUT__1838.LUTMASK = 16'h7f80;
    EFX_LUT4 LUT__1839 (.I0(\u_color_bar_rgb/equal_99/n3 ), .I1(\u_color_bar_rgb/v_cnt [4]), 
            .I2(n833), .O(n848)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;
    defparam LUT__1839.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__1840 (.I0(n848), .I1(n808), .I2(\u_color_bar_rgb/v_cnt [0]), 
            .I3(\u_color_bar_rgb/v_cnt [1]), .O(\u_color_bar_rgb/n454 [1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hcf10 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(177)
    defparam LUT__1840.LUTMASK = 16'hcf10;
    EFX_LUT4 LUT__1841 (.I0(n807), .I1(n833), .I2(\u_color_bar_rgb/v_cnt [4]), 
            .O(n849)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1841.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1842 (.I0(\u_color_bar_rgb/v_cnt [0]), .I1(\u_color_bar_rgb/v_cnt [1]), 
            .O(n850)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1842.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1843 (.I0(n849), .I1(n808), .I2(n850), .I3(\u_color_bar_rgb/v_cnt [2]), 
            .O(\u_color_bar_rgb/n454 [2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hcf10 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(177)
    defparam LUT__1843.LUTMASK = 16'hcf10;
    EFX_LUT4 LUT__1844 (.I0(n808), .I1(n850), .I2(\u_color_bar_rgb/v_cnt [2]), 
            .I3(\u_color_bar_rgb/v_cnt [3]), .O(\u_color_bar_rgb/n454 [3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbf40 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(177)
    defparam LUT__1844.LUTMASK = 16'hbf40;
    EFX_LUT4 LUT__1845 (.I0(n807), .I1(n833), .I2(n850), .O(n851)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1845.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1846 (.I0(n851), .I1(n808), .I2(n822), .I3(\u_color_bar_rgb/v_cnt [4]), 
            .O(\u_color_bar_rgb/n454 [4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hcd30 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(177)
    defparam LUT__1846.LUTMASK = 16'hcd30;
    EFX_LUT4 LUT__1847 (.I0(n808), .I1(n822), .I2(\u_color_bar_rgb/v_cnt [4]), 
            .I3(\u_color_bar_rgb/v_cnt [5]), .O(\u_color_bar_rgb/n454 [5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbf40 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(177)
    defparam LUT__1847.LUTMASK = 16'hbf40;
    EFX_LUT4 LUT__1848 (.I0(n808), .I1(n822), .I2(n823), .I3(\u_color_bar_rgb/v_cnt [6]), 
            .O(\u_color_bar_rgb/n454 [6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbf40 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(177)
    defparam LUT__1848.LUTMASK = 16'hbf40;
    EFX_LUT4 LUT__1849 (.I0(n822), .I1(n823), .I2(\u_color_bar_rgb/v_cnt [6]), 
            .O(n852)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1849.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1850 (.I0(n808), .I1(n852), .I2(\u_color_bar_rgb/v_cnt [7]), 
            .O(\u_color_bar_rgb/n454 [7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb4b4 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(177)
    defparam LUT__1850.LUTMASK = 16'hb4b4;
    EFX_LUT4 LUT__1851 (.I0(n806), .I1(n802), .I2(n807), .I3(n824), 
            .O(n853)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8f00 */ ;
    defparam LUT__1851.LUTMASK = 16'h8f00;
    EFX_LUT4 LUT__1852 (.I0(n853), .I1(\u_color_bar_rgb/v_cnt [8]), .O(\u_color_bar_rgb/n454 [8])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(177)
    defparam LUT__1852.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1853 (.I0(n829), .I1(n853), .I2(\u_color_bar_rgb/v_cnt [8]), 
            .I3(\u_color_bar_rgb/v_cnt [9]), .O(\u_color_bar_rgb/n454 [9])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3f40 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(177)
    defparam LUT__1853.LUTMASK = 16'h3f40;
    EFX_LUT4 LUT__1854 (.I0(n806), .I1(n802), .I2(n807), .I3(\u_color_bar_rgb/v_cnt [9]), 
            .O(n854)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8f00 */ ;
    defparam LUT__1854.LUTMASK = 16'h8f00;
    EFX_LUT4 LUT__1855 (.I0(n829), .I1(n825), .I2(n854), .I3(\u_color_bar_rgb/v_cnt [10]), 
            .O(\u_color_bar_rgb/n454 [10])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h37c0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(177)
    defparam LUT__1855.LUTMASK = 16'h37c0;
    EFX_LUT4 LUT__1856 (.I0(\u_color_bar_rgb/v_cnt [9]), .I1(\u_color_bar_rgb/v_cnt [10]), 
            .O(n855)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1856.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1857 (.I0(n853), .I1(n855), .I2(\u_color_bar_rgb/v_cnt [8]), 
            .I3(\u_color_bar_rgb/v_cnt [11]), .O(\u_color_bar_rgb/n454 [11])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7f80 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(177)
    defparam LUT__1857.LUTMASK = 16'h7f80;
    EFX_LUT4 LUT__1858 (.I0(n855), .I1(\u_color_bar_rgb/v_cnt [8]), .I2(\u_color_bar_rgb/v_cnt [11]), 
            .O(n856)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1858.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1859 (.I0(n853), .I1(n856), .I2(\u_color_bar_rgb/v_cnt [12]), 
            .O(\u_color_bar_rgb/n454 [12])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(177)
    defparam LUT__1859.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__1860 (.I0(n853), .I1(n856), .I2(\u_color_bar_rgb/v_cnt [12]), 
            .I3(\u_color_bar_rgb/v_cnt [13]), .O(\u_color_bar_rgb/n454 [13])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7f80 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(177)
    defparam LUT__1860.LUTMASK = 16'h7f80;
    EFX_LUT4 LUT__1861 (.I0(n856), .I1(\u_color_bar_rgb/v_cnt [12]), .I2(\u_color_bar_rgb/v_cnt [13]), 
            .O(n857)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1861.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1862 (.I0(n853), .I1(n857), .I2(\u_color_bar_rgb/v_cnt [14]), 
            .O(\u_color_bar_rgb/n454 [14])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(177)
    defparam LUT__1862.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__1863 (.I0(n853), .I1(n857), .I2(\u_color_bar_rgb/v_cnt [14]), 
            .I3(\u_color_bar_rgb/v_cnt [15]), .O(\u_color_bar_rgb/n454 [15])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7f80 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/color_bar_rgb.v(177)
    defparam LUT__1863.LUTMASK = 16'h7f80;
    EFX_LUT4 LUT__1864 (.I0(\DC_FIFO_inst/WrClkRstGen[1] ), .I1(\DC_FIFO_inst/WrClkRstGen[0] ), 
            .O(\DC_FIFO_inst/n523 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbbbb */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(61)
    defparam LUT__1864.LUTMASK = 16'hbbbb;
    EFX_LUT4 LUT__1865 (.I0(\DC_FIFO_inst/WrClkRstGen[0] ), .I1(\DC_FIFO_inst/WrClkRstGen[1] ), 
            .O(\DC_FIFO_inst/n21 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(165)
    defparam LUT__1865.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__1866 (.I0(\DC_FIFO_inst/WrClkRstGen[0] ), .I1(\DC_FIFO_inst/WrClkRstGen[1] ), 
            .O(\DC_FIFO_inst/n7 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7777 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(160)
    defparam LUT__1866.LUTMASK = 16'h7777;
    EFX_LUT4 LUT__1867 (.I0(\DC_FIFO_inst/WrRdAddr [0]), .I1(\DC_FIFO_inst/WrRdAddrReg [0]), 
            .O(n858)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9999 */ ;
    defparam LUT__1867.LUTMASK = 16'h9999;
    EFX_LUT4 LUT__1868 (.I0(\DC_FIFO_inst/WrRdAddr [2]), .I1(\DC_FIFO_inst/WrRdAddrReg [2]), 
            .I2(\DC_FIFO_inst/WrRdAddr [5]), .I3(\DC_FIFO_inst/WrRdAddrReg [5]), 
            .O(n859)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9009 */ ;
    defparam LUT__1868.LUTMASK = 16'h9009;
    EFX_LUT4 LUT__1869 (.I0(\DC_FIFO_inst/WrRdAddr [4]), .I1(\DC_FIFO_inst/WrRdAddrReg [4]), 
            .I2(\DC_FIFO_inst/WrRdAddr [6]), .I3(\DC_FIFO_inst/WrRdAddrReg [6]), 
            .O(n860)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9009 */ ;
    defparam LUT__1869.LUTMASK = 16'h9009;
    EFX_LUT4 LUT__1870 (.I0(\DC_FIFO_inst/WrRdAddr [1]), .I1(\DC_FIFO_inst/WrRdAddrReg [1]), 
            .I2(\DC_FIFO_inst/WrRdAddr [3]), .I3(\DC_FIFO_inst/WrRdAddrReg [3]), 
            .O(n861)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9009 */ ;
    defparam LUT__1870.LUTMASK = 16'h9009;
    EFX_LUT4 LUT__1871 (.I0(n858), .I1(n859), .I2(n860), .I3(n861), 
            .O(\DC_FIFO_inst/not_equal_52/n13 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7fff */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(338)
    defparam LUT__1871.LUTMASK = 16'h7fff;
    EFX_LUT4 LUT__1872 (.I0(\DC_FIFO_inst/WrRdAddrReg [6]), .I1(\DC_FIFO_inst/WrRdAddr [6]), 
            .O(\DC_FIFO_inst/RdAHighRise )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(345)
    defparam LUT__1872.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1873 (.I0(\DC_FIFO_inst/RdAHighNext ), .I1(\DC_FIFO_inst/WrRdAddrReg [7]), 
            .I2(\DC_FIFO_inst/WrNextAddr [7]), .I3(\DC_FIFO_inst/WrRdAddr [6]), 
            .O(n862)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3c5a */ ;
    defparam LUT__1873.LUTMASK = 16'h3c5a;
    EFX_LUT4 LUT__1874 (.I0(\DC_FIFO_inst/WrNextAddr [1]), .I1(\DC_FIFO_inst/WrRdAddr [1]), 
            .I2(\DC_FIFO_inst/WrNextAddr [5]), .I3(\DC_FIFO_inst/WrRdAddr [5]), 
            .O(n863)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9009 */ ;
    defparam LUT__1874.LUTMASK = 16'h9009;
    EFX_LUT4 LUT__1875 (.I0(\DC_FIFO_inst/WrRdAddr [0]), .I1(\DC_FIFO_inst/WrNextAddr [0]), 
            .I2(\DC_FIFO_inst/WrNextAddr [6]), .I3(\DC_FIFO_inst/WrRdAddr [6]), 
            .O(n864)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9009 */ ;
    defparam LUT__1875.LUTMASK = 16'h9009;
    EFX_LUT4 LUT__1876 (.I0(n862), .I1(n863), .I2(n864), .O(n865)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1876.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1877 (.I0(\DC_FIFO_inst/WrNextAddr [3]), .I1(\DC_FIFO_inst/WrRdAddr [3]), 
            .I2(\DC_FIFO_inst/WrRdAddr [2]), .I3(\DC_FIFO_inst/WrNextAddr [2]), 
            .O(n866)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9009 */ ;
    defparam LUT__1877.LUTMASK = 16'h9009;
    EFX_LUT4 LUT__1878 (.I0(\DC_FIFO_inst/FullFlag ), .I1(\DC_FIFO_inst/WrNextAddr [4]), 
            .I2(\DC_FIFO_inst/WrRdAddr [4]), .I3(n866), .O(n867)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4100 */ ;
    defparam LUT__1878.LUTMASK = 16'h4100;
    EFX_LUT4 LUT__1879 (.I0(n865), .I1(n867), .I2(\DC_FIFO_inst/WrFullClr ), 
            .I3(\DC_FIFO_inst/FullFlag ), .O(\DC_FIFO_inst/n253 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8f88 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(363)
    defparam LUT__1879.LUTMASK = 16'h8f88;
    EFX_LUT4 LUT__1880 (.I0(\DC_FIFO_inst/FullFlag ), .I1(rx_valid), .I2(\DC_FIFO_inst/WrClkRst ), 
            .O(ceg_net24)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hefef */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(192)
    defparam LUT__1880.LUTMASK = 16'hefef;
    EFX_LUT4 LUT__1881 (.I0(\DC_FIFO_inst/RdWrAddr [2]), .I1(\DC_FIFO_inst/RdWrAddrReg [2]), 
            .I2(\DC_FIFO_inst/RdWrAddr [5]), .I3(\DC_FIFO_inst/RdWrAddrReg [5]), 
            .O(n868)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9009 */ ;
    defparam LUT__1881.LUTMASK = 16'h9009;
    EFX_LUT4 LUT__1882 (.I0(\DC_FIFO_inst/RdWrAddr [4]), .I1(\DC_FIFO_inst/RdWrAddrReg [4]), 
            .I2(n868), .O(n869)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9090 */ ;
    defparam LUT__1882.LUTMASK = 16'h9090;
    EFX_LUT4 LUT__1883 (.I0(\DC_FIFO_inst/RdWrAddr [1]), .I1(\DC_FIFO_inst/RdWrAddrReg [1]), 
            .I2(\DC_FIFO_inst/RdWrAddr [3]), .I3(\DC_FIFO_inst/RdWrAddrReg [3]), 
            .O(n870)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9009 */ ;
    defparam LUT__1883.LUTMASK = 16'h9009;
    EFX_LUT4 LUT__1884 (.I0(\DC_FIFO_inst/RdWrAddr [0]), .I1(\DC_FIFO_inst/RdWrAddrReg [0]), 
            .I2(\DC_FIFO_inst/RdWrAddr [6]), .I3(\DC_FIFO_inst/RdWrAddrReg [6]), 
            .O(n871)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9009 */ ;
    defparam LUT__1884.LUTMASK = 16'h9009;
    EFX_LUT4 LUT__1885 (.I0(n869), .I1(n870), .I2(n871), .O(\DC_FIFO_inst/not_equal_92/n13 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7f7f */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(467)
    defparam LUT__1885.LUTMASK = 16'h7f7f;
    EFX_LUT4 LUT__1886 (.I0(\DC_FIFO_inst/RdWrAddrReg [6]), .I1(\DC_FIFO_inst/RdWrAddr [6]), 
            .O(\DC_FIFO_inst/WrAHighRise )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(478)
    defparam LUT__1886.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1887 (.I0(\DC_FIFO_inst/WrAHighNext ), .I1(\DC_FIFO_inst/RdWrAddrReg [7]), 
            .I2(\DC_FIFO_inst/RdNextAddr [7]), .I3(\DC_FIFO_inst/RdWrAddr [6]), 
            .O(n872)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hc3a5 */ ;
    defparam LUT__1887.LUTMASK = 16'hc3a5;
    EFX_LUT4 LUT__1888 (.I0(\DC_FIFO_inst/RdNextAddr [1]), .I1(\DC_FIFO_inst/RdWrAddr [1]), 
            .I2(\DC_FIFO_inst/RdNextAddr [5]), .I3(\DC_FIFO_inst/RdWrAddr [5]), 
            .O(n873)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9009 */ ;
    defparam LUT__1888.LUTMASK = 16'h9009;
    EFX_LUT4 LUT__1889 (.I0(\DC_FIFO_inst/RdWrAddr [0]), .I1(\DC_FIFO_inst/RdNextAddr [0]), 
            .I2(\DC_FIFO_inst/RdNextAddr [6]), .I3(\DC_FIFO_inst/RdWrAddr [6]), 
            .O(n874)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9009 */ ;
    defparam LUT__1889.LUTMASK = 16'h9009;
    EFX_LUT4 LUT__1890 (.I0(n872), .I1(n873), .I2(n874), .O(n875)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1890.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1891 (.I0(\DC_FIFO_inst/RdNextAddr [3]), .I1(\DC_FIFO_inst/RdWrAddr [3]), 
            .I2(\DC_FIFO_inst/RdWrAddr [2]), .I3(\DC_FIFO_inst/RdNextAddr [2]), 
            .O(n876)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9009 */ ;
    defparam LUT__1891.LUTMASK = 16'h9009;
    EFX_LUT4 LUT__1892 (.I0(\DC_FIFO_inst/RdNextAddr [4]), .I1(\DC_FIFO_inst/RdWrAddr [4]), 
            .I2(n876), .I3(\DC_FIFO_inst/U2_RdAddrCnt/n4 ), .O(n877)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9000 */ ;
    defparam LUT__1892.LUTMASK = 16'h9000;
    EFX_LUT4 LUT__1893 (.I0(n875), .I1(n877), .I2(\DC_FIFO_inst/EmptyClr ), 
            .I3(\DC_FIFO_inst/U2_RdAddrCnt/n4 ), .O(\DC_FIFO_inst/n407 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h888f */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(496)
    defparam LUT__1893.LUTMASK = 16'h888f;
    EFX_LUT4 LUT__1894 (.I0(tx_req), .I1(\DC_FIFO_inst/U2_RdAddrCnt/n4 ), 
            .I2(\DC_FIFO_inst/WrClkRst ), .O(ceg_net26)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbfbf */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(231)
    defparam LUT__1894.LUTMASK = 16'hbfbf;
    EFX_LUT4 LUT__1895 (.I0(\DC_FIFO_inst/FullFlag ), .I1(\DC_FIFO_inst/WrNextAddr [0]), 
            .I2(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/GrayCnt[0] ), .I3(\DC_FIFO_inst/WrNextAddr [1]), 
            .O(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n124 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbf40 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(602)
    defparam LUT__1895.LUTMASK = 16'hbf40;
    EFX_LUT4 LUT__1896 (.I0(\DC_FIFO_inst/FullFlag ), .I1(\DC_FIFO_inst/WrNextAddr [1]), 
            .I2(\DC_FIFO_inst/WrNextAddr [0]), .I3(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/GrayCnt[0] ), 
            .O(n878)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__1896.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1897 (.I0(\DC_FIFO_inst/WrNextAddr [4]), .I1(\DC_FIFO_inst/WrNextAddr [3]), 
            .I2(\DC_FIFO_inst/WrNextAddr [2]), .I3(n878), .O(n879)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__1897.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1898 (.I0(n879), .I1(\DC_FIFO_inst/WrNextAddr [6]), .I2(\DC_FIFO_inst/WrNextAddr [7]), 
            .O(\DC_FIFO_inst/U1_WrAddrCnt/n87 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(198)
    defparam LUT__1898.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__1899 (.I0(\DC_FIFO_inst/WrNextAddr [3]), .I1(\DC_FIFO_inst/WrNextAddr [2]), 
            .I2(n878), .I3(\DC_FIFO_inst/WrNextAddr [4]), .O(n880)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1000 */ ;
    defparam LUT__1899.LUTMASK = 16'h1000;
    EFX_LUT4 LUT__1900 (.I0(n880), .I1(\DC_FIFO_inst/WrNextAddr [5]), .O(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n144 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(602)
    defparam LUT__1900.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1901 (.I0(\DC_FIFO_inst/WrNextAddr [2]), .I1(n878), .I2(\DC_FIFO_inst/WrNextAddr [3]), 
            .I3(\DC_FIFO_inst/WrNextAddr [4]), .O(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n139 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbf40 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(602)
    defparam LUT__1901.LUTMASK = 16'hbf40;
    EFX_LUT4 LUT__1902 (.I0(n878), .I1(\DC_FIFO_inst/WrNextAddr [2]), .I2(\DC_FIFO_inst/WrNextAddr [3]), 
            .O(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n134 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(602)
    defparam LUT__1902.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__1903 (.I0(n879), .I1(\DC_FIFO_inst/WrNextAddr [6]), .O(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n149 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(602)
    defparam LUT__1903.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1904 (.I0(\DC_FIFO_inst/FullFlag ), .I1(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/GrayCnt[0] ), 
            .I2(\DC_FIFO_inst/WrNextAddr [0]), .O(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n119 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'he1e1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(602)
    defparam LUT__1904.LUTMASK = 16'he1e1;
    EFX_LUT4 LUT__1905 (.I0(\DC_FIFO_inst/FullFlag ), .I1(\DC_FIFO_inst/WrNextAddr [0]), 
            .I2(\DC_FIFO_inst/WrNextAddr [1]), .I3(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/GrayCnt[0] ), 
            .O(n881)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1000 */ ;
    defparam LUT__1905.LUTMASK = 16'h1000;
    EFX_LUT4 LUT__1906 (.I0(n881), .I1(\DC_FIFO_inst/WrNextAddr [2]), .O(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n129 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(602)
    defparam LUT__1906.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1907 (.I0(\DC_FIFO_inst/FullFlag ), .I1(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/GrayCnt[0] ), 
            .O(\DC_FIFO_inst/U1_WrAddrCnt/U1_AddrCnt/n114 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9999 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(602)
    defparam LUT__1907.LUTMASK = 16'h9999;
    EFX_LUT4 LUT__1908 (.I0(\DC_FIFO_inst/U2_RdAddrCnt/n4 ), .I1(\DC_FIFO_inst/RdNextAddr [0]), 
            .I2(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/GrayCnt[0] ), .I3(\DC_FIFO_inst/RdNextAddr [1]), 
            .O(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n124 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7f80 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(602)
    defparam LUT__1908.LUTMASK = 16'h7f80;
    EFX_LUT4 LUT__1909 (.I0(\DC_FIFO_inst/RdNextAddr [1]), .I1(\DC_FIFO_inst/RdNextAddr [0]), 
            .I2(\DC_FIFO_inst/U2_RdAddrCnt/n4 ), .I3(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/GrayCnt[0] ), 
            .O(n882)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1000 */ ;
    defparam LUT__1909.LUTMASK = 16'h1000;
    EFX_LUT4 LUT__1910 (.I0(\DC_FIFO_inst/RdNextAddr [4]), .I1(\DC_FIFO_inst/RdNextAddr [3]), 
            .I2(\DC_FIFO_inst/RdNextAddr [2]), .I3(n882), .O(n883)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__1910.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1911 (.I0(n883), .I1(\DC_FIFO_inst/RdNextAddr [6]), .I2(\DC_FIFO_inst/RdNextAddr [7]), 
            .O(\DC_FIFO_inst/U2_RdAddrCnt/n87 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(237)
    defparam LUT__1911.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__1912 (.I0(\DC_FIFO_inst/RdNextAddr [3]), .I1(\DC_FIFO_inst/RdNextAddr [2]), 
            .I2(n882), .I3(\DC_FIFO_inst/RdNextAddr [4]), .O(n884)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1000 */ ;
    defparam LUT__1912.LUTMASK = 16'h1000;
    EFX_LUT4 LUT__1913 (.I0(n884), .I1(\DC_FIFO_inst/RdNextAddr [5]), .O(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n144 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(602)
    defparam LUT__1913.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1914 (.I0(\DC_FIFO_inst/RdNextAddr [2]), .I1(n882), .I2(\DC_FIFO_inst/RdNextAddr [3]), 
            .I3(\DC_FIFO_inst/RdNextAddr [4]), .O(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n139 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbf40 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(602)
    defparam LUT__1914.LUTMASK = 16'hbf40;
    EFX_LUT4 LUT__1915 (.I0(n882), .I1(\DC_FIFO_inst/RdNextAddr [2]), .I2(\DC_FIFO_inst/RdNextAddr [3]), 
            .O(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n134 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(602)
    defparam LUT__1915.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__1916 (.I0(n883), .I1(\DC_FIFO_inst/RdNextAddr [6]), .O(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n149 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(602)
    defparam LUT__1916.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1917 (.I0(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/GrayCnt[0] ), 
            .I1(\DC_FIFO_inst/U2_RdAddrCnt/n4 ), .I2(\DC_FIFO_inst/RdNextAddr [0]), 
            .O(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n119 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb4b4 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(602)
    defparam LUT__1917.LUTMASK = 16'hb4b4;
    EFX_LUT4 LUT__1918 (.I0(\DC_FIFO_inst/RdNextAddr [0]), .I1(\DC_FIFO_inst/RdNextAddr [1]), 
            .I2(\DC_FIFO_inst/U2_RdAddrCnt/n4 ), .I3(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/GrayCnt[0] ), 
            .O(n885)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4000 */ ;
    defparam LUT__1918.LUTMASK = 16'h4000;
    EFX_LUT4 LUT__1919 (.I0(n885), .I1(\DC_FIFO_inst/RdNextAddr [2]), .O(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n129 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(602)
    defparam LUT__1919.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1920 (.I0(\DC_FIFO_inst/U2_RdAddrCnt/n4 ), .I1(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/GrayCnt[0] ), 
            .O(\DC_FIFO_inst/U2_RdAddrCnt/U1_AddrCnt/n114 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/DC_FIFO_v3p7.v(602)
    defparam LUT__1920.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1921 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [0]), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [3]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [1]), .I3(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [2]), 
            .O(n886)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8000 */ ;
    defparam LUT__1921.LUTMASK = 16'h8000;
    EFX_LUT4 LUT__1922 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [7]), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [6]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [5]), .I3(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [4]), 
            .O(n887)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8000 */ ;
    defparam LUT__1922.LUTMASK = 16'h8000;
    EFX_LUT4 LUT__1923 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [11]), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [10]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [9]), .I3(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [8]), 
            .O(n888)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8000 */ ;
    defparam LUT__1923.LUTMASK = 16'h8000;
    EFX_LUT4 LUT__1924 (.I0(n886), .I1(n887), .I2(n888), .I3(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [12]), 
            .O(n889)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8000 */ ;
    defparam LUT__1924.LUTMASK = 16'h8000;
    EFX_LUT4 LUT__1925 (.I0(n889), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [14]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [13]), .I3(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [15]), 
            .O(\uart_rx_tx_inst/uart01_rx/n440 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7f80 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1925.LUTMASK = 16'h7f80;
    EFX_LUT4 LUT__1926 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [15]), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [14]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [13]), .I3(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [12]), 
            .O(n890)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1926.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1927 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [11]), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [10]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [9]), .I3(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [8]), 
            .O(n891)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1927.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1928 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [4]), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [1]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [2]), .I3(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [3]), 
            .O(n892)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__1928.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1929 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [7]), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [6]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [5]), .O(n893)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1929.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1930 (.I0(n890), .I1(n891), .I2(n892), .I3(n893), 
            .O(n894)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8000 */ ;
    defparam LUT__1930.LUTMASK = 16'h8000;
    EFX_LUT4 LUT__1931 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [0]), .I1(n894), 
            .I2(\uart_rx_tx_inst/uart01_rx/cnt_en ), .O(\uart_rx_tx_inst/uart01_rx/n562 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8f8f */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(68)
    defparam LUT__1931.LUTMASK = 16'h8f8f;
    EFX_LUT4 LUT__1932 (.I0(\uart_rx_tx_inst/uart01_rx/rxd_r[1] ), .I1(\uart_rx_tx_inst/uart01_rx/rxd_r[0] ), 
            .O(\uart_rx_tx_inst/uart01_rx/equal_9/n3 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbbbb */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(46)
    defparam LUT__1932.LUTMASK = 16'hbbbb;
    EFX_LUT4 LUT__1933 (.I0(n889), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [13]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [14]), .O(\uart_rx_tx_inst/uart01_rx/n435 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1933.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__1934 (.I0(n889), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [13]), 
            .O(\uart_rx_tx_inst/uart01_rx/n430 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1934.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1935 (.I0(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [0]), .I1(\uart_rx_tx_inst/uart01_rx/capture_p1_en_dly [1]), 
            .O(n895)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1935.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1936 (.I0(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [1]), .I1(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [2]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [3]), .I3(n895), .O(\uart_rx_tx_inst/uart01_rx/n622 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(142)
    defparam LUT__1936.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1937 (.I0(n886), .I1(n887), .O(n896)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1937.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1938 (.I0(n896), .I1(n888), .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [12]), 
            .O(\uart_rx_tx_inst/uart01_rx/n425 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1938.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__1939 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [0]), .I1(n894), 
            .O(\uart_rx_tx_inst/uart01_rx/equal_16/n31 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbbbb */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(67)
    defparam LUT__1939.LUTMASK = 16'hbbbb;
    EFX_LUT4 LUT__1940 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [10]), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [9]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [8]), .O(n897)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1940.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1941 (.I0(n896), .I1(n897), .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [11]), 
            .O(\uart_rx_tx_inst/uart01_rx/n420 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1941.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__1942 (.I0(n896), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [9]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [8]), .I3(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [10]), 
            .O(\uart_rx_tx_inst/uart01_rx/n415 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7f80 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1942.LUTMASK = 16'h7f80;
    EFX_LUT4 LUT__1943 (.I0(n896), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [8]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [9]), .O(\uart_rx_tx_inst/uart01_rx/n410 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1943.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__1944 (.I0(n896), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [8]), 
            .O(\uart_rx_tx_inst/uart01_rx/n405 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1944.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1945 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [6]), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [5]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [4]), .O(n898)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1945.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1946 (.I0(n886), .I1(n898), .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [7]), 
            .O(\uart_rx_tx_inst/uart01_rx/n400 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1946.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__1947 (.I0(n890), .I1(n891), .O(n899)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1947.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1948 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [14]), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [13]), 
            .I2(n889), .I3(n899), .O(n900)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h007f */ ;
    defparam LUT__1948.LUTMASK = 16'h007f;
    EFX_LUT4 LUT__1949 (.I0(n886), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [4]), 
            .O(\uart_rx_tx_inst/uart01_rx/n385 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1949.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1950 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [3]), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [2]), 
            .O(n901)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1950.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1951 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [0]), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [6]), 
            .I2(\uart_rx_tx_inst/uart01_rx/cnt_en ), .I3(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [7]), 
            .O(n902)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1000 */ ;
    defparam LUT__1951.LUTMASK = 16'h1000;
    EFX_LUT4 LUT__1952 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [5]), .I1(\uart_rx_tx_inst/uart_tx01/BIT_NUM [3]), 
            .I2(n901), .I3(n902), .O(n903)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5ccc */ ;
    defparam LUT__1952.LUTMASK = 16'h5ccc;
    EFX_LUT4 LUT__1953 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [15]), .I1(\uart_rx_tx_inst/uart_tx01/BIT_NUM [3]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [1]), .O(n904)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'he0e0 */ ;
    defparam LUT__1953.LUTMASK = 16'he0e0;
    EFX_LUT4 LUT__1954 (.I0(\uart_rx_tx_inst/uart01_rx/n385 ), .I1(n903), 
            .I2(n904), .O(n905)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;
    defparam LUT__1954.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__1955 (.I0(n903), .I1(\uart_rx_tx_inst/uart01_rx/n562 ), 
            .I2(n900), .I3(n905), .O(\uart_rx_tx_inst/uart01_rx/equal_35/n31 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb0bb */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(101)
    defparam LUT__1955.LUTMASK = 16'hb0bb;
    EFX_LUT4 LUT__1956 (.I0(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [1]), .I1(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [2]), 
            .I2(\uart_rx_tx_inst/uart01_rx/capture_p1_en_dly [1]), .O(n906)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;
    defparam LUT__1956.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__1957 (.I0(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [0]), .I1(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [3]), 
            .I2(\uart_rx_tx_inst/uart_tx01/BIT_NUM [3]), .I3(n906), .O(\uart_rx_tx_inst/uart01_rx/n249 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8100 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(151)
    defparam LUT__1957.LUTMASK = 16'h8100;
    EFX_LUT4 LUT__1958 (.I0(n886), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [5]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [4]), .I3(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [6]), 
            .O(\uart_rx_tx_inst/uart01_rx/n395 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7f80 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1958.LUTMASK = 16'h7f80;
    EFX_LUT4 LUT__1959 (.I0(n886), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [4]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [5]), .O(\uart_rx_tx_inst/uart01_rx/n390 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1959.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__1960 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [0]), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [1]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [2]), .I3(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [3]), 
            .O(\uart_rx_tx_inst/uart01_rx/n380 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7f80 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1960.LUTMASK = 16'h7f80;
    EFX_LUT4 LUT__1961 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [0]), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [1]), 
            .O(\uart_rx_tx_inst/uart01_rx/n370 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1961.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1962 (.I0(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [0]), .I1(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [1]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bw_cnt_r [2]), .O(\uart_rx_tx_inst/uart01_rx/n375 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1962.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__1963 (.I0(\dvi_encoder_m0/encg/cnt [1]), .I1(\dvi_encoder_m0/encg/cnt [2]), 
            .I2(\dvi_encoder_m0/encg/cnt [3]), .I3(\dvi_encoder_m0/encg/n0q_m [3]), 
            .O(n907)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1963.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1964 (.I0(n907), .I1(\dvi_encoder_m0/encg/cnt [4]), .O(\dvi_encoder_m0/encg/n628 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/dvi_encoder.v(41)
    defparam LUT__1964.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1965 (.I0(\dvi_encoder_m0/encg/cnt [1]), .I1(\dvi_encoder_m0/encg/cnt [2]), 
            .I2(\dvi_encoder_m0/encg/n0q_m [3]), .I3(\dvi_encoder_m0/encg/cnt [3]), 
            .O(\dvi_encoder_m0/encg/n623 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hfe01 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/dvi_encoder.v(41)
    defparam LUT__1965.LUTMASK = 16'hfe01;
    EFX_LUT4 LUT__1966 (.I0(\dvi_encoder_m0/encr/cnt [1]), .I1(\dvi_encoder_m0/encr/cnt [2]), 
            .I2(\dvi_encoder_m0/encr/cnt [3]), .I3(\dvi_encoder_m0/encr/n0q_m [3]), 
            .O(n908)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1966.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1967 (.I0(n908), .I1(\dvi_encoder_m0/encr/cnt [4]), .O(\dvi_encoder_m0/encr/n628 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/dvi_encoder.v(32)
    defparam LUT__1967.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1968 (.I0(\dvi_encoder_m0/encr/cnt [1]), .I1(\dvi_encoder_m0/encr/cnt [2]), 
            .I2(\dvi_encoder_m0/encr/n0q_m [3]), .I3(\dvi_encoder_m0/encr/cnt [3]), 
            .O(\dvi_encoder_m0/encr/n623 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hfe01 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/dvi_encoder.v(32)
    defparam LUT__1968.LUTMASK = 16'hfe01;
    EFX_LUT4 LUT__1969 (.I0(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [0]), .I1(\uart_rx_tx_inst/uart01_rx/capture_p1_en_dly [1]), 
            .O(n909)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1969.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1970 (.I0(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [2]), .I1(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [3]), 
            .I2(n909), .I3(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [1]), .O(\uart_rx_tx_inst/uart01_rx/n620 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hefff */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1970.LUTMASK = 16'hefff;
    EFX_LUT4 LUT__1971 (.I0(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [2]), .I1(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [3]), 
            .I2(n895), .I3(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [1]), .O(\uart_rx_tx_inst/uart01_rx/n617 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1000 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(142)
    defparam LUT__1971.LUTMASK = 16'h1000;
    EFX_LUT4 LUT__1972 (.I0(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [1]), .I1(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [3]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [2]), .I3(n909), .O(\uart_rx_tx_inst/uart01_rx/n615 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hefff */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1972.LUTMASK = 16'hefff;
    EFX_LUT4 LUT__1973 (.I0(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [1]), .I1(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [3]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [2]), .I3(n895), .O(\uart_rx_tx_inst/uart01_rx/n612 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1000 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(142)
    defparam LUT__1973.LUTMASK = 16'h1000;
    EFX_LUT4 LUT__1974 (.I0(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [3]), .I1(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [1]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [2]), .I3(n909), .O(\uart_rx_tx_inst/uart01_rx/n607 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbfff */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1974.LUTMASK = 16'hbfff;
    EFX_LUT4 LUT__1975 (.I0(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [3]), .I1(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [1]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [2]), .I3(n895), .O(\uart_rx_tx_inst/uart01_rx/n604 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4000 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(142)
    defparam LUT__1975.LUTMASK = 16'h4000;
    EFX_LUT4 LUT__1976 (.I0(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [1]), .I1(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [2]), 
            .I2(n909), .I3(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [3]), .O(\uart_rx_tx_inst/uart01_rx/n602 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hefff */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(142)
    defparam LUT__1976.LUTMASK = 16'hefff;
    EFX_LUT4 LUT__1977 (.I0(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [0]), .I1(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [1]), 
            .O(\uart_rx_tx_inst/uart01_rx/n488 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1977.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1978 (.I0(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [0]), .I1(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [1]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [2]), .O(\uart_rx_tx_inst/uart01_rx/n495 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1978.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__1979 (.I0(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [0]), .I1(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [1]), 
            .I2(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [2]), .I3(\uart_rx_tx_inst/uart01_rx/bit_cnt_r [3]), 
            .O(\uart_rx_tx_inst/uart01_rx/n500 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7f80 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(45)
    defparam LUT__1979.LUTMASK = 16'h7f80;
    EFX_LUT4 LUT__1980 (.I0(n905), .I1(n899), .O(\uart_rx_tx_inst/uart01_rx/n592 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx.v(108)
    defparam LUT__1980.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1981 (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [4]), .I1(\uart_rx_tx_inst/uart_tx01/tx_cnt [3]), 
            .I2(\uart_rx_tx_inst/uart_tx01/tx_cnt [7]), .I3(\uart_rx_tx_inst/uart_tx01/tx_cnt [0]), 
            .O(n910)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4000 */ ;
    defparam LUT__1981.LUTMASK = 16'h4000;
    EFX_LUT4 LUT__1982 (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [15]), .I1(\uart_rx_tx_inst/uart_tx01/tx_cnt [14]), 
            .I2(\uart_rx_tx_inst/uart_tx01/tx_cnt [13]), .I3(\uart_rx_tx_inst/uart_tx01/tx_cnt [11]), 
            .O(n911)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1982.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1983 (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [12]), .I1(\uart_rx_tx_inst/uart_tx01/tx_cnt [10]), 
            .I2(\uart_rx_tx_inst/uart_tx01/tx_cnt [9]), .I3(\uart_rx_tx_inst/uart_tx01/tx_cnt [6]), 
            .O(n912)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__1983.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1984 (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [8]), .I1(\uart_rx_tx_inst/uart_tx01/tx_cnt [1]), 
            .I2(\uart_rx_tx_inst/uart_tx01/tx_cnt [5]), .O(n913)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;
    defparam LUT__1984.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__1985 (.I0(n911), .I1(n912), .I2(n913), .O(n914)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1985.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1986 (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [2]), .I1(n910), 
            .I2(n914), .O(\uart_rx_tx_inst/uart_tx01/equal_21/n31 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbfbf */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(79)
    defparam LUT__1986.LUTMASK = 16'hbfbf;
    EFX_LUT4 LUT__1987 (.I0(\uart_rx_tx_inst/uart_tx01/equal_21/n31 ), .I1(\uart_rx_tx_inst/tx_busy ), 
            .O(\uart_rx_tx_inst/uart_tx01/n227 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7777 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(30)
    defparam LUT__1987.LUTMASK = 16'h7777;
    EFX_LUT4 LUT__1988 (.I0(\uart_rx_tx_inst/uart_tx01/bite_cnt [0]), .I1(\uart_rx_tx_inst/uart_tx01/BIT_NUM [3]), 
            .I2(\uart_rx_tx_inst/uart_tx01/bite_cnt [1]), .I3(\uart_rx_tx_inst/uart_tx01/bite_cnt [3]), 
            .O(n915)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbffd */ ;
    defparam LUT__1988.LUTMASK = 16'hbffd;
    EFX_LUT4 LUT__1989 (.I0(\uart_rx_tx_inst/uart_tx01/tx_cnt [3]), .I1(\uart_rx_tx_inst/uart_tx01/tx_cnt [7]), 
            .I2(\uart_rx_tx_inst/uart_tx01/tx_cnt [0]), .I3(\uart_rx_tx_inst/uart_tx01/bite_cnt [2]), 
            .O(n916)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1989.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1990 (.I0(n915), .I1(n916), .I2(\uart_rx_tx_inst/uart_tx01/tx_cnt [2]), 
            .I3(\uart_rx_tx_inst/uart_tx01/tx_cnt [4]), .O(n917)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4000 */ ;
    defparam LUT__1990.LUTMASK = 16'h4000;
    EFX_LUT4 LUT__1991 (.I0(n914), .I1(n917), .O(\uart_rx_tx_inst/uart_tx01/n153 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(94)
    defparam LUT__1991.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1992 (.I0(\uart_rx_tx_inst/uart_tx01/bite_cnt [0]), .I1(\uart_rx_tx_inst/uart_tx01/tx_data_r [7]), 
            .I2(\uart_rx_tx_inst/uart_tx01/bite_cnt [1]), .I3(\uart_rx_tx_inst/uart_tx01/bite_cnt [2]), 
            .O(n918)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1992.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1993 (.I0(\uart_rx_tx_inst/uart_tx01/tx_data_r [3]), .I1(\uart_rx_tx_inst/uart_tx01/tx_data_r [5]), 
            .I2(\uart_rx_tx_inst/uart_tx01/bite_cnt [0]), .I3(\uart_rx_tx_inst/uart_tx01/bite_cnt [1]), 
            .O(n919)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0305 */ ;
    defparam LUT__1993.LUTMASK = 16'h0305;
    EFX_LUT4 LUT__1994 (.I0(\uart_rx_tx_inst/uart_tx01/tx_data_r [4]), .I1(\uart_rx_tx_inst/uart_tx01/tx_data_r [6]), 
            .I2(\uart_rx_tx_inst/uart_tx01/bite_cnt [1]), .I3(\uart_rx_tx_inst/uart_tx01/bite_cnt [0]), 
            .O(n920)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3500 */ ;
    defparam LUT__1994.LUTMASK = 16'h3500;
    EFX_LUT4 LUT__1995 (.I0(\uart_rx_tx_inst/uart_tx01/tx_data_r [0]), .I1(\uart_rx_tx_inst/uart_tx01/tx_data_r [2]), 
            .I2(\uart_rx_tx_inst/uart_tx01/bite_cnt [1]), .O(n921)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hcaca */ ;
    defparam LUT__1995.LUTMASK = 16'hcaca;
    EFX_LUT4 LUT__1996 (.I0(\uart_rx_tx_inst/uart_tx01/bite_cnt [1]), .I1(\uart_rx_tx_inst/uart_tx01/tx_data_r [1]), 
            .I2(n921), .I3(\uart_rx_tx_inst/uart_tx01/bite_cnt [0]), .O(n922)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0f77 */ ;
    defparam LUT__1996.LUTMASK = 16'h0f77;
    EFX_LUT4 LUT__1997 (.I0(n920), .I1(n919), .I2(n922), .I3(\uart_rx_tx_inst/uart_tx01/bite_cnt [2]), 
            .O(n923)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'heef0 */ ;
    defparam LUT__1997.LUTMASK = 16'heef0;
    EFX_LUT4 LUT__1998 (.I0(n918), .I1(\uart_rx_tx_inst/uart_tx01/bite_cnt [3]), 
            .I2(\uart_rx_tx_inst/tx_busy ), .I3(n923), .O(\uart_rx_tx_inst/uart_tx01/n171 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4fff */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(121)
    defparam LUT__1998.LUTMASK = 16'h4fff;
    EFX_LUT4 LUT__1999 (.I0(\uart_rx_tx_inst/uart_tx01/bite_cnt [0]), .I1(\uart_rx_tx_inst/uart_tx01/bite_cnt [1]), 
            .I2(\uart_rx_tx_inst/uart_tx01/bite_cnt [2]), .I3(\uart_rx_tx_inst/uart_tx01/bite_cnt [3]), 
            .O(n924)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1999.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__2000 (.I0(\uart_rx_tx_inst/tx_busy ), .I1(n924), .O(\uart_rx_tx_inst/uart_tx01/equal_4/n9 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbbbb */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(22)
    defparam LUT__2000.LUTMASK = 16'hbbbb;
    EFX_LUT4 LUT__2001 (.I0(\dvi_encoder_m0/encb/cnt [1]), .I1(\dvi_encoder_m0/encb/cnt [2]), 
            .I2(\dvi_encoder_m0/encb/cnt [3]), .I3(\dvi_encoder_m0/encb/n0q_m [3]), 
            .O(n925)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__2001.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__2002 (.I0(n925), .I1(\dvi_encoder_m0/encb/cnt [4]), .O(\dvi_encoder_m0/encb/n628 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/dvi_encoder.v(23)
    defparam LUT__2002.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__2003 (.I0(\dvi_encoder_m0/encb/cnt [1]), .I1(\dvi_encoder_m0/encb/cnt [2]), 
            .I2(\dvi_encoder_m0/encb/n0q_m [3]), .I3(\dvi_encoder_m0/encb/cnt [3]), 
            .O(\dvi_encoder_m0/encb/n623 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hfe01 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/dvi_encoder.v(23)
    defparam LUT__2003.LUTMASK = 16'hfe01;
    EFX_LUT4 LUT__2004 (.I0(\uart_rx_tx_inst/uart_tx01/bite_cnt [0]), .I1(\uart_rx_tx_inst/uart_tx01/bite_cnt [1]), 
            .O(\uart_rx_tx_inst/uart_tx01/n252 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(30)
    defparam LUT__2004.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__2005 (.I0(\uart_rx_tx_inst/uart_tx01/bite_cnt [0]), .I1(\uart_rx_tx_inst/uart_tx01/bite_cnt [1]), 
            .I2(\uart_rx_tx_inst/uart_tx01/bite_cnt [2]), .O(\uart_rx_tx_inst/uart_tx01/n259 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(30)
    defparam LUT__2005.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__2006 (.I0(\uart_rx_tx_inst/uart_tx01/bite_cnt [0]), .I1(\uart_rx_tx_inst/uart_tx01/bite_cnt [1]), 
            .I2(\uart_rx_tx_inst/uart_tx01/bite_cnt [2]), .I3(\uart_rx_tx_inst/uart_tx01/bite_cnt [3]), 
            .O(\uart_rx_tx_inst/uart_tx01/n264 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7f80 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_rx_tx.v(30)
    defparam LUT__2006.LUTMASK = 16'h7f80;
    EFX_LUT4 LUT__2027 (.I0(txd_2), .O(led[1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5555, EFX_ATTRIBUTE_INSTANCE__IS_LUT_SOP_INF_INV=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/uart/uart_tx.v(122)
    defparam LUT__2027.LUTMASK = 16'h5555;
    EFX_LUT4 LUT__2028 (.I0(tmds_data0[9]), .O(tmds_data0_o[9])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5555, EFX_ATTRIBUTE_INSTANCE__IS_LUT_SOP_INF_INV=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(183)
    defparam LUT__2028.LUTMASK = 16'h5555;
    EFX_LUT4 LUT__2029 (.I0(tmds_data0[8]), .O(tmds_data0_o[8])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5555, EFX_ATTRIBUTE_INSTANCE__IS_LUT_SOP_INF_INV=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(183)
    defparam LUT__2029.LUTMASK = 16'h5555;
    EFX_LUT4 LUT__2030 (.I0(tmds_data0[7]), .O(tmds_data0_o[7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5555, EFX_ATTRIBUTE_INSTANCE__IS_LUT_SOP_INF_INV=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(183)
    defparam LUT__2030.LUTMASK = 16'h5555;
    EFX_LUT4 LUT__2031 (.I0(tmds_data0[6]), .O(tmds_data0_o[6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5555, EFX_ATTRIBUTE_INSTANCE__IS_LUT_SOP_INF_INV=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(183)
    defparam LUT__2031.LUTMASK = 16'h5555;
    EFX_LUT4 LUT__2038 (.I0(tmds_data1[9]), .O(tmds_data1_o[9])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5555, EFX_ATTRIBUTE_INSTANCE__IS_LUT_SOP_INF_INV=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(184)
    defparam LUT__2038.LUTMASK = 16'h5555;
    EFX_LUT4 LUT__2039 (.I0(tmds_data1[8]), .O(tmds_data1_o[8])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5555, EFX_ATTRIBUTE_INSTANCE__IS_LUT_SOP_INF_INV=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(184)
    defparam LUT__2039.LUTMASK = 16'h5555;
    EFX_LUT4 LUT__2040 (.I0(tmds_data1[7]), .O(tmds_data1_o[7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5555, EFX_ATTRIBUTE_INSTANCE__IS_LUT_SOP_INF_INV=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(184)
    defparam LUT__2040.LUTMASK = 16'h5555;
    EFX_LUT4 LUT__2041 (.I0(tmds_data1[6]), .O(tmds_data1_o[6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5555, EFX_ATTRIBUTE_INSTANCE__IS_LUT_SOP_INF_INV=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(184)
    defparam LUT__2041.LUTMASK = 16'h5555;
    EFX_LUT4 LUT__2048 (.I0(tmds_data2[9]), .O(tmds_data2_o[9])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5555, EFX_ATTRIBUTE_INSTANCE__IS_LUT_SOP_INF_INV=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(185)
    defparam LUT__2048.LUTMASK = 16'h5555;
    EFX_LUT4 LUT__2049 (.I0(tmds_data2[8]), .O(tmds_data2_o[8])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5555, EFX_ATTRIBUTE_INSTANCE__IS_LUT_SOP_INF_INV=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(185)
    defparam LUT__2049.LUTMASK = 16'h5555;
    EFX_LUT4 LUT__2050 (.I0(tmds_data2[7]), .O(tmds_data2_o[7])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5555, EFX_ATTRIBUTE_INSTANCE__IS_LUT_SOP_INF_INV=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(185)
    defparam LUT__2050.LUTMASK = 16'h5555;
    EFX_LUT4 LUT__2051 (.I0(tmds_data2[6]), .O(tmds_data2_o[6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5555, EFX_ATTRIBUTE_INSTANCE__IS_LUT_SOP_INF_INV=TRUE */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/top.v(185)
    defparam LUT__2051.LUTMASK = 16'h5555;
    EFX_LUT4 LUT__1695 (.I0(\dvi_encoder_m0/encb/n1q_m [3]), .I1(\dvi_encoder_m0/encb/n0q_m [3]), 
            .O(\dvi_encoder_m0/encb/LessThan_63/n7 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(125)
    defparam LUT__1695.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1696 (.I0(\dvi_encoder_m0/encb/cnt [4]), .I1(\dvi_encoder_m0/encb/LessThan_63/n7 ), 
            .I2(\dvi_encoder_m0/encb/c0_reg ), .I3(\dvi_encoder_m0/encb/de_reg ), 
            .O(\dvi_encoder_m0/encb/n339 [0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbbf0 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(187)
    defparam LUT__1696.LUTMASK = 16'hbbf0;
    EFX_ADD \dvi_encoder_m0/encg/add_83/i1__AUX_ADD_CO  (.I0(1'b0), .I1(1'b0), 
            .CI(n942), .O(\dvi_encoder_m0/encg/add_83/n2 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encg/add_83/i1__AUX_ADD_CO .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encg/add_83/i1__AUX_ADD_CO .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/sub_82/add_2/i2__AUX_ADD_CI  (.I0(\dvi_encoder_m0/encr/sub_82/add_2/n2 ), 
            .I1(1'b1), .CI(1'b0), .CO(n941)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/sub_82/add_2/i2__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_82/add_2/i2__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/sub_84/add_2/i2__AUX_ADD_CI  (.I0(\dvi_encoder_m0/encr/sub_82/add_2/n2 ), 
            .I1(1'b1), .CI(1'b0), .CO(n940)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/sub_84/add_2/i2__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_84/add_2/i2__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/sub_82/add_2/i1__AUX_ADD_CO  (.I0(1'b0), 
            .I1(1'b0), .CI(n939), .O(\dvi_encoder_m0/encr/sub_82/add_2/n2 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/sub_82/add_2/i1__AUX_ADD_CO .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_82/add_2/i1__AUX_ADD_CO .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/sub_82/add_2/i1__AUX_ADD_CI  (.I0(1'b1), 
            .I1(1'b1), .CI(1'b0), .CO(n938)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/sub_82/add_2/i1__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/sub_82/add_2/i1__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_89/i1__AUX_ADD_CI  (.I0(\dvi_encoder_m0/encr/n0q_m [3]), 
            .I1(1'b1), .CI(1'b0), .CO(n937)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encr/add_89/i1__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_89/i1__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_83/i2__AUX_ADD_CI  (.I0(\dvi_encoder_m0/encr/add_83/n2 ), 
            .I1(1'b1), .CI(1'b0), .CO(n936)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/add_83/i2__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_83/i2__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_81/i2__AUX_ADD_CI  (.I0(\dvi_encoder_m0/encr/add_83/n2 ), 
            .I1(1'b1), .CI(1'b0), .CO(n935)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/add_81/i2__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_81/i2__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encr/add_83/i1__AUX_ADD_CO  (.I0(1'b0), .I1(1'b0), 
            .CI(n934), .O(\dvi_encoder_m0/encr/add_83/n2 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encr/add_83/i1__AUX_ADD_CO .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encr/add_83/i1__AUX_ADD_CO .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/sub_82/add_2/i2__AUX_ADD_CI  (.I0(\dvi_encoder_m0/encb/sub_82/add_2/n2 ), 
            .I1(1'b1), .CI(1'b0), .CO(n933)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/sub_82/add_2/i2__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_82/add_2/i2__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/sub_84/add_2/i2__AUX_ADD_CI  (.I0(\dvi_encoder_m0/encb/sub_82/add_2/n2 ), 
            .I1(1'b1), .CI(1'b0), .CO(n932)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/sub_84/add_2/i2__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_84/add_2/i2__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/sub_82/add_2/i1__AUX_ADD_CO  (.I0(1'b0), 
            .I1(1'b0), .CI(n931), .O(\dvi_encoder_m0/encb/sub_82/add_2/n2 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/sub_82/add_2/i1__AUX_ADD_CO .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_82/add_2/i1__AUX_ADD_CO .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/sub_82/add_2/i1__AUX_ADD_CI  (.I0(1'b1), 
            .I1(1'b1), .CI(1'b0), .CO(n930)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/sub_82/add_2/i1__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_82/add_2/i1__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_89/i1__AUX_ADD_CI  (.I0(\dvi_encoder_m0/encb/n0q_m [3]), 
            .I1(1'b1), .CI(1'b0), .CO(n929)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encb/add_89/i1__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_89/i1__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_81/i2__AUX_ADD_CI  (.I0(\dvi_encoder_m0/encb/add_83/n2 ), 
            .I1(1'b1), .CI(1'b0), .CO(n928)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/add_81/i2__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_81/i2__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_83/i2__AUX_ADD_CI  (.I0(\dvi_encoder_m0/encb/add_83/n2 ), 
            .I1(1'b1), .CI(1'b0), .CO(n927)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/add_83/i2__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_83/i2__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/add_83/i1__AUX_ADD_CO  (.I0(1'b0), .I1(1'b0), 
            .CI(n926), .O(\dvi_encoder_m0/encb/add_83/n2 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(162)
    defparam \dvi_encoder_m0/encb/add_83/i1__AUX_ADD_CO .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/add_83/i1__AUX_ADD_CO .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/sub_92/add_2/i4__AUX_ADD_CI  (.I0(1'b1), 
            .I1(1'b1), .CI(1'b0), .CO(n958)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encb/sub_92/add_2/i4__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_92/add_2/i4__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/sub_92/add_2/i4__AUX_ADD_CO  (.I0(1'b0), 
            .I1(1'b0), .CI(n959), .O(\dvi_encoder_m0/encb/sub_92/add_2/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(175)
    defparam \dvi_encoder_m0/encb/sub_92/add_2/i4__AUX_ADD_CO .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_92/add_2/i4__AUX_ADD_CO .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/sub_88/add_2/i4__AUX_ADD_CI  (.I0(1'b1), 
            .I1(1'b1), .CI(1'b0), .CO(n960)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encb/sub_88/add_2/i4__AUX_ADD_CI .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_88/add_2/i4__AUX_ADD_CI .I1_POLARITY = 1'b1;
    EFX_ADD \dvi_encoder_m0/encb/sub_88/add_2/i4__AUX_ADD_CO  (.I0(1'b0), 
            .I1(1'b0), .CI(n961), .O(\dvi_encoder_m0/encb/sub_88/add_2/n8 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/fr/Program/FPGA/Iris/iris_ws/src/hdmi/encode.v(169)
    defparam \dvi_encoder_m0/encb/sub_88/add_2/i4__AUX_ADD_CO .I0_POLARITY = 1'b1;
    defparam \dvi_encoder_m0/encb/sub_88/add_2/i4__AUX_ADD_CO .I1_POLARITY = 1'b1;
    
endmodule

//
// Verific Verilog Description of module EFX_FF_c5547176_0
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c5547176_1
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c5547176_2
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c5547176_3
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c5547176_4
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c5547176_5
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c5547176_6
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c5547176_7
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c5547176_8
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c5547176_9
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c5547176_10
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c5547176_11
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c5547176_12
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c5547176_13
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c5547176_14
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_ADD_c5547176_0
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_ADD_c5547176_1
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM10_c5547176__8_8_0
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_0
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_1
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_2
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_3
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_4
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_5
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_6
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_7
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_8
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_9
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_10
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_11
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_12
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_13
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_14
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_15
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_16
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_17
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_18
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_19
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_20
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_21
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_22
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_23
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_24
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_25
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_26
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_27
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_28
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_29
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_30
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_31
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_32
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_33
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_34
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_35
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_36
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_37
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_38
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_39
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_40
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_41
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_42
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_43
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_44
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_45
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_46
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_47
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_48
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_49
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_50
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_51
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_52
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_53
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_54
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_55
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_56
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_57
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_58
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_59
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_60
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_61
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_62
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_63
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_64
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_65
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_66
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_67
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_68
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_69
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_70
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_71
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_72
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_73
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_74
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_75
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_76
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_77
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c5547176_78
// module not written out since it is a black box. 
//

