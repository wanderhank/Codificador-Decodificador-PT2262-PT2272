
// Generated by Cadence Genus(TM) Synthesis Solution 22.14-s059_1
// Generated on: Jan 15 2025 15:00:53 -03 (Jan 15 2025 18:00:53 UTC)

// Verification Directory fv/codificador_pt2262 

module codificador_pt2262(clk, reset, A, D, sync, cod_o);
  input clk, reset;
  input [7:0] A;
  input [3:0] D;
  output sync, cod_o;
  wire clk, reset;
  wire [7:0] A;
  wire [3:0] D;
  wire sync, cod_o;
  wire [7:0] A_01;
  wire [7:0] A_F;
  wire [4:0] bit_counter_ff;
  wire [1:0] counterD_ff;
  wire [2:0] counterA_ff;
  wire [2:0] current_state;
  wire [6:0] sync_counter_ff;
  wire [6:0] inst_freq_div_counter;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  wire n_32, n_33, n_34, n_35, n_36, n_37, n_38, n_39;
  wire n_40, n_41, n_42, n_43, n_44, n_45, n_46, n_47;
  wire n_48, n_49, n_50, n_51, n_52, n_53, n_54, n_55;
  wire n_56, n_57, n_58, n_59, n_60, n_61, n_62, n_63;
  wire n_64, n_65, n_66, n_67, n_68, n_69, n_70, n_71;
  wire n_72, n_73, n_74, n_75, n_76, n_77, n_78, n_79;
  wire n_81, n_82, n_83, n_84, n_85, n_86, n_87, n_88;
  wire n_89, n_90, n_91, n_92, n_93, n_94, n_95, n_96;
  wire n_97, n_98, n_99, n_100, n_101, n_102, n_103, n_104;
  wire n_105, n_108, n_109, osc_12;
  comp_endereco inst_comp_endereco(.A (A), .A_01 (A_01), .A_F (A_F));
  OAI32X1 g2002__2398(.A0 (reset), .A1 (n_85), .A2 (n_103), .B0
       (reset), .B1 (n_102), .Y (cod_o));
  AOI21XL g2003__5107(.A0 (n_105), .A1 (n_101), .B0 (n_93), .Y (n_102));
  OAI22XL g2004__6260(.A0 (n_109), .A1 (n_100), .B0 (n_104), .B1
       (n_96), .Y (n_101));
  MXI2XL g2005__4319(.A (bit_counter_ff[4]), .B (n_98), .S0 (n_99), .Y
       (n_100));
  AOI221X1 g2006__8428(.A0 (n_82), .A1 (n_86), .B0 (n_87), .B1 (n_81),
       .C0 (n_97), .Y (n_99));
  OAI211X1 g2007__5526(.A0 (n_83), .A1 (n_88), .B0 (n_94), .C0 (n_95),
       .Y (n_98));
  OAI22XL g2008__6783(.A0 (n_92), .A1 (n_79), .B0 (n_83), .B1 (n_91),
       .Y (n_97));
  MXI4X1 g2009__3680(.A (D[3]), .B (D[1]), .C (D[2]), .D (D[0]), .S0
       (counterD_ff[1]), .S1 (counterD_ff[0]), .Y (n_96));
  AOI22XL g2010__1617(.A0 (n_82), .A1 (n_89), .B0 (n_90), .B1 (n_81),
       .Y (n_95));
  OAI221X1 g2011__2802(.A0 (A_01[1]), .A1 (counterA_ff[2]), .B0
       (A_01[5]), .B1 (n_1), .C0 (n_84), .Y (n_94));
  NOR3XL g2012__1705(.A (bit_counter_ff[3]), .B (bit_counter_ff[2]), .C
       (current_state[1]), .Y (n_93));
  NOR2XL g2013__5122(.A (reset), .B (n_108), .Y (sync));
  AOI22XL g2014__8246(.A0 (A_F[1]), .A1 (n_1), .B0 (A_F[5]), .B1
       (counterA_ff[2]), .Y (n_92));
  AOI22XL g2015__7098(.A0 (A_F[3]), .A1 (n_1), .B0 (A_F[7]), .B1
       (counterA_ff[2]), .Y (n_91));
  OR2X1 g2016__6131(.A (sync_counter_ff[6]), .B (n_108), .Y (n_103));
  MX2X1 g2017__1881(.A (A_01[4]), .B (A_01[6]), .S0 (counterA_ff[1]),
       .Y (n_90));
  MX2X1 g2018__5115(.A (A_01[0]), .B (A_01[2]), .S0 (counterA_ff[1]),
       .Y (n_89));
  OAI22XL g2019__7482(.A0 (A_01[3]), .A1 (counterA_ff[2]), .B0
       (A_01[7]), .B1 (n_1), .Y (n_88));
  MX2X1 g2020__4733(.A (A_F[4]), .B (A_F[6]), .S0 (counterA_ff[1]), .Y
       (n_87));
  MX2X1 g2021__6161(.A (A_F[0]), .B (A_F[2]), .S0 (counterA_ff[1]), .Y
       (n_86));
  OR4X1 g2022__9315(.A (sync_counter_ff[5]), .B (sync_counter_ff[4]),
       .C (sync_counter_ff[3]), .D (sync_counter_ff[2]), .Y (n_85));
  INVXL g2023(.A (n_79), .Y (n_84));
  NAND2XL g2025__9945(.A (counterA_ff[0]), .B (counterA_ff[1]), .Y
       (n_83));
  NAND2XL g2026__2883(.A (bit_counter_ff[3]), .B (bit_counter_ff[2]),
       .Y (n_105));
  OR2X1 g2027__2346(.A (current_state[0]), .B (current_state[1]), .Y
       (n_109));
  NAND2BXL g2028__1666(.AN (current_state[1]), .B (current_state[0]),
       .Y (n_104));
  NOR2XL g2029__7410(.A (counterA_ff[0]), .B (counterA_ff[2]), .Y
       (n_82));
  NOR2XL g2030__6417(.A (counterA_ff[0]), .B (n_1), .Y (n_81));
  NAND2BXL g2031__5477(.AN (current_state[0]), .B (current_state[1]),
       .Y (n_108));
  NAND2BX1 g2__2398(.AN (counterA_ff[1]), .B (counterA_ff[0]), .Y
       (n_79));
  DFFRHQX1 \sync_counter_ff_reg[6] (.RN (n_0), .CK (osc_12), .D (n_75),
       .Q (sync_counter_ff[6]));
  DFFRHQX1 \current_state_reg[0] (.RN (n_0), .CK (osc_12), .D (n_76),
       .Q (current_state[0]));
  DFFHQX1 \inst_freq_div_counter_reg[6] (.CK (clk), .D (n_78), .Q
       (inst_freq_div_counter[6]));
  DFFRHQX1 \current_state_reg[1] (.RN (n_0), .CK (osc_12), .D (n_77),
       .Q (current_state[1]));
  NOR2XL g2305__5107(.A (n_28), .B (n_72), .Y (n_78));
  NAND3BXL g2307__6260(.AN (n_70), .B (n_103), .C (n_57), .Y (n_77));
  OAI31X1 g2308__4319(.A0 (n_1), .A1 (n_109), .A2 (n_59), .B0 (n_56),
       .Y (n_76));
  OAI21XL g2309__8428(.A0 (n_103), .A1 (n_64), .B0 (n_73), .Y (n_75));
  DFFRHQX1 \sync_counter_ff_reg[5] (.RN (n_0), .CK (osc_12), .D (n_69),
       .Q (sync_counter_ff[5]));
  DFFHQX1 \inst_freq_div_counter_reg[5] (.CK (clk), .D (n_71), .Q
       (inst_freq_div_counter[5]));
  NOR2XL g2312__5526(.A (n_109), .B (n_68), .Y (n_74));
  NAND2XL g2313__6783(.A (sync_counter_ff[6]), .B (n_70), .Y (n_73));
  XNOR2X1 g2314__3680(.A (inst_freq_div_counter[6]), .B (n_63), .Y
       (n_72));
  NOR2XL g2315__1617(.A (n_28), .B (n_66), .Y (n_71));
  NOR2XL g2316__2802(.A (n_108), .B (n_65), .Y (n_69));
  NOR2BX1 g2317__1705(.AN (n_64), .B (n_108), .Y (n_70));
  DFFRHQX1 \counterA_ff_reg[1] (.RN (n_0), .CK (osc_12), .D (n_67), .Q
       (counterA_ff[1]));
  XNOR2X1 g2319__5122(.A (n_1), .B (n_59), .Y (n_68));
  DFFRHQX1 \sync_counter_ff_reg[4] (.RN (n_0), .CK (osc_12), .D (n_62),
       .Q (sync_counter_ff[4]));
  DFFHQX1 \inst_freq_div_counter_reg[4] (.CK (clk), .D (n_61), .Q
       (inst_freq_div_counter[4]));
  NOR2XL g2322__8246(.A (n_109), .B (n_60), .Y (n_67));
  XNOR2X1 g2323__7098(.A (inst_freq_div_counter[5]), .B (n_51), .Y
       (n_66));
  XNOR2X1 g2324__6131(.A (sync_counter_ff[5]), .B (n_50), .Y (n_65));
  AND2X1 g2325__1881(.A (n_51), .B (inst_freq_div_counter[5]), .Y
       (n_63));
  NAND2XL g2326__5115(.A (sync_counter_ff[5]), .B (n_50), .Y (n_64));
  NOR2XL g2327__7482(.A (n_108), .B (n_53), .Y (n_62));
  NOR2XL g2328__4733(.A (n_54), .B (n_28), .Y (n_61));
  XNOR2X1 g2330__6161(.A (counterA_ff[1]), .B (n_42), .Y (n_60));
  DFFRHQX1 \counterA_ff_reg[0] (.RN (n_0), .CK (osc_12), .D (n_58), .Q
       (counterA_ff[0]));
  NOR2XL g2332__9315(.A (n_109), .B (n_43), .Y (n_58));
  NAND2XL g2333__9945(.A (counterA_ff[1]), .B (n_42), .Y (n_59));
  DFFRHQX1 \counterD_ff_reg[0] (.RN (n_0), .CK (osc_12), .D (n_48), .Q
       (counterD_ff[0]));
  DFFRHQX1 \sync_counter_ff_reg[3] (.RN (n_0), .CK (osc_12), .D (n_49),
       .Q (sync_counter_ff[3]));
  DFFHQX1 \inst_freq_div_counter_reg[3] (.CK (clk), .D (n_52), .Q
       (inst_freq_div_counter[3]));
  OAI21XL g2337__2883(.A0 (current_state[1]), .A1 (n_47), .B0
       (current_state[0]), .Y (n_57));
  OAI21XL g2338__2346(.A0 (current_state[1]), .A1 (n_46), .B0
       (current_state[0]), .Y (n_56));
  OAI211X1 g2339__1666(.A0 (n_2), .A1 (n_41), .B0 (n_4), .C0 (n_46), .Y
       (n_55));
  XNOR2X1 g2340__7410(.A (inst_freq_div_counter[4]), .B (n_30), .Y
       (n_54));
  XNOR2X1 g2341__6417(.A (sync_counter_ff[4]), .B (n_31), .Y (n_53));
  NOR2XL g2342__5477(.A (n_33), .B (n_28), .Y (n_52));
  DFFRHQX1 \bit_counter_ff_reg[3] (.RN (n_0), .CK (osc_12), .D (n_44),
       .Q (bit_counter_ff[3]));
  DFFHQX1 inst_freq_div_osc_12_reg(.CK (clk), .D (n_45), .Q (osc_12));
  NOR2XL g2345__2398(.A (n_108), .B (n_35), .Y (n_49));
  NAND3BXL g2346__5107(.AN (n_41), .B (n_4), .C (n_39), .Y (n_48));
  AND2X1 g2347__6260(.A (n_30), .B (inst_freq_div_counter[4]), .Y
       (n_51));
  AND2X1 g2348__4319(.A (n_31), .B (sync_counter_ff[4]), .Y (n_50));
  DFFHQX1 \inst_freq_div_counter_reg[2] (.CK (clk), .D (n_36), .Q
       (inst_freq_div_counter[2]));
  DFFHQX1 \inst_freq_div_counter_reg[1] (.CK (clk), .D (n_37), .Q
       (inst_freq_div_counter[1]));
  DFFRHQX1 \bit_counter_ff_reg[4] (.RN (n_0), .CK (osc_12), .D (n_38),
       .Q (bit_counter_ff[4]));
  DFFHQX1 \inst_freq_div_counter_reg[0] (.CK (clk), .D (n_40), .Q
       (inst_freq_div_counter[0]));
  INVXL g2353(.A (n_46), .Y (n_47));
  OAI211X1 g2354__8428(.A0 (osc_12), .A1 (n_25), .B0 (n_0), .C0 (n_26),
       .Y (n_45));
  NOR2XL g2355__5526(.A (current_state[1]), .B (n_34), .Y (n_44));
  XNOR2X1 g2356__6783(.A (counterA_ff[0]), .B (n_23), .Y (n_43));
  NAND2XL g2357__3680(.A (n_2), .B (n_41), .Y (n_46));
  NOR2XL g2358__1617(.A (inst_freq_div_counter[0]), .B (n_28), .Y
       (n_40));
  NAND2XL g2359__2802(.A (counterD_ff[0]), .B (n_32), .Y (n_39));
  AND2X1 g2360__1705(.A (n_23), .B (counterA_ff[0]), .Y (n_42));
  NOR2XL g2361__5122(.A (counterD_ff[0]), .B (n_32), .Y (n_41));
  DFFRHQX1 \sync_counter_ff_reg[2] (.RN (n_0), .CK (osc_12), .D (n_29),
       .Q (sync_counter_ff[2]));
  DFFRHQX1 \bit_counter_ff_reg[2] (.RN (n_0), .CK (osc_12), .D (n_27),
       .Q (bit_counter_ff[2]));
  NOR2XL g2364__8246(.A (current_state[1]), .B (n_24), .Y (n_38));
  NOR2XL g2365__7098(.A (n_11), .B (n_28), .Y (n_37));
  NOR2XL g2366__6131(.A (n_20), .B (n_28), .Y (n_36));
  XNOR2X1 g2367__1881(.A (sync_counter_ff[3]), .B (n_16), .Y (n_35));
  XNOR2X1 g2368__5115(.A (bit_counter_ff[3]), .B (n_17), .Y (n_34));
  XNOR2X1 g2369__7482(.A (inst_freq_div_counter[3]), .B (n_19), .Y
       (n_33));
  INVXL g2370(.A (n_23), .Y (n_32));
  NOR2XL g2371__4733(.A (n_108), .B (n_21), .Y (n_29));
  AND2X1 g2372__6161(.A (n_16), .B (sync_counter_ff[3]), .Y (n_31));
  AND2X1 g2373__9315(.A (n_19), .B (inst_freq_div_counter[3]), .Y
       (n_30));
  NOR2XL g2374__9945(.A (current_state[1]), .B (n_22), .Y (n_27));
  NAND2XL g2375__2883(.A (osc_12), .B (n_25), .Y (n_26));
  NAND2XL g2376__2346(.A (n_0), .B (n_25), .Y (n_28));
  NAND4BXL g2377__1666(.AN (n_13), .B (inst_freq_div_counter[5]), .C
       (inst_freq_div_counter[4]), .D (n_3), .Y (n_25));
  XNOR2X1 g2378__7410(.A (bit_counter_ff[4]), .B (n_18), .Y (n_24));
  DFFRHQX1 \bit_counter_ff_reg[1] (.RN (n_0), .CK (osc_12), .D (n_14),
       .Q (bit_counter_ff[1]));
  DFFRHQX1 \sync_counter_ff_reg[1] (.RN (n_0), .CK (osc_12), .D (n_15),
       .Q (sync_counter_ff[1]));
  AND2X1 g2381__6417(.A (n_18), .B (bit_counter_ff[4]), .Y (n_23));
  XNOR2X1 g2382__5477(.A (bit_counter_ff[2]), .B (n_5), .Y (n_22));
  XNOR2X1 g2383__2398(.A (sync_counter_ff[2]), .B (n_6), .Y (n_21));
  XNOR2X1 g2384__5107(.A (inst_freq_div_counter[2]), .B (n_7), .Y
       (n_20));
  AND2X1 g2385__6260(.A (n_5), .B (bit_counter_ff[2]), .Y (n_17));
  AND2X1 g2386__4319(.A (n_7), .B (inst_freq_div_counter[2]), .Y
       (n_19));
  NOR2BX1 g2387__8428(.AN (n_5), .B (n_105), .Y (n_18));
  NOR2XL g2388__5526(.A (n_108), .B (n_10), .Y (n_15));
  NOR2XL g2389__6783(.A (current_state[1]), .B (n_12), .Y (n_14));
  AND2X1 g2390__3680(.A (n_6), .B (sync_counter_ff[2]), .Y (n_16));
  NAND4BXL g2391__1617(.AN (inst_freq_div_counter[1]), .B
       (inst_freq_div_counter[3]), .C (inst_freq_div_counter[2]), .D
       (inst_freq_div_counter[6]), .Y (n_13));
  DFFRHQX1 \sync_counter_ff_reg[0] (.RN (n_0), .CK (osc_12), .D (n_9),
       .Q (sync_counter_ff[0]));
  DFFRHQX1 \bit_counter_ff_reg[0] (.RN (n_0), .CK (osc_12), .D (n_8),
       .Q (bit_counter_ff[0]));
  XNOR2X1 g2394__2802(.A (bit_counter_ff[0]), .B (bit_counter_ff[1]),
       .Y (n_12));
  XNOR2X1 g2395__1705(.A (inst_freq_div_counter[0]), .B
       (inst_freq_div_counter[1]), .Y (n_11));
  XNOR2X1 g2396__5122(.A (sync_counter_ff[0]), .B (sync_counter_ff[1]),
       .Y (n_10));
  NOR2XL g2397__8246(.A (sync_counter_ff[0]), .B (n_108), .Y (n_9));
  NOR2XL g2398__7098(.A (bit_counter_ff[0]), .B (current_state[1]), .Y
       (n_8));
  AND2X1 g2399__6131(.A (inst_freq_div_counter[0]), .B
       (inst_freq_div_counter[1]), .Y (n_7));
  AND2X1 g2400__1881(.A (sync_counter_ff[1]), .B (sync_counter_ff[0]),
       .Y (n_6));
  AND2X1 g2401__5115(.A (bit_counter_ff[1]), .B (bit_counter_ff[0]), .Y
       (n_5));
  INVX1 g2402(.A (n_104), .Y (n_4));
  INVXL g2403(.A (inst_freq_div_counter[0]), .Y (n_3));
  INVX1 g2406(.A (reset), .Y (n_0));
  DFFRX1 \counterA_ff_reg[2] (.RN (n_0), .CK (osc_12), .D (n_74), .Q
       (counterA_ff[2]), .QN (n_1));
  DFFRX1 \counterD_ff_reg[1] (.RN (n_0), .CK (osc_12), .D (n_55), .Q
       (counterD_ff[1]), .QN (n_2));
endmodule

