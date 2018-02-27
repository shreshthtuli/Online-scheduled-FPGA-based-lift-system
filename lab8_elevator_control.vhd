--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab4_seven_segment_display.vhf
-- /___/   /\     Timestamp : 10/12/2017 14:36:32
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt64\unwrapped\sch2hdl.exe -intstyle ise -family artix7 -flat -suppress -vhdl lab4_seven_segment_display.vhf -w C:/Users/user/Desktop/COL215LAB/lab8_elevator_control/lab4_seven_segment_display_for_lab_8/lab4_seven_segment_display/lab4_seven_segment_display.sch
--Design Name: lab4_seven_segment_display
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL FTC_HXILINX_lab4_seven_segment_display -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FTC_HXILINX_lab4_seven_segment_display is
generic(
    INIT : bit := '0'
    );

  port (
    Q   : out STD_LOGIC := '0';
    C   : in STD_LOGIC;
    CLR : in STD_LOGIC;
    T   : in STD_LOGIC
    );
end FTC_HXILINX_lab4_seven_segment_display;

architecture Behavioral of FTC_HXILINX_lab4_seven_segment_display is
signal q_tmp : std_logic := TO_X01(INIT);
begin

process(C, CLR)
begin
  if (CLR='1') then
    q_tmp <= '0';
  elsif (C'event and C = '1') then
    if(T='1') then
      q_tmp <= not q_tmp;
    end if;
  end if;  
end process;

Q <= q_tmp;

end Behavioral;

----- CELL D2_4E_HXILINX_lab4_seven_segment_display -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D2_4E_HXILINX_lab4_seven_segment_display is
  
port(
    D0  : out std_logic;
    D1  : out std_logic;
    D2  : out std_logic;
    D3  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    E   : in std_logic
  );
end D2_4E_HXILINX_lab4_seven_segment_display;

architecture D2_4E_HXILINX_lab4_seven_segment_display_V of D2_4E_HXILINX_lab4_seven_segment_display is
  signal d_tmp : std_logic_vector(3 downto 0);
begin
  process (A0, A1, E)
  variable sel   : std_logic_vector(1 downto 0);
  begin
    sel := A1&A0;
    if( E = '0') then
    d_tmp <= "0000";
    else
      case sel is
      when "00" => d_tmp <= "0001";
      when "01" => d_tmp <= "0010";
      when "10" => d_tmp <= "0100";
      when "11" => d_tmp <= "1000";
      when others => NULL;
      end case;
    end if;
  end process; 

    D3 <= d_tmp(3);
    D2 <= d_tmp(2);
    D1 <= d_tmp(1);
    D0 <= d_tmp(0);

end D2_4E_HXILINX_lab4_seven_segment_display_V;
----- CELL CB2CE_HXILINX_lab4_seven_segment_display -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB2CE_HXILINX_lab4_seven_segment_display is
  
port (
    CEO  : out STD_LOGIC;
    Q0   : out STD_LOGIC;
    Q1   : out STD_LOGIC;
    TC   : out STD_LOGIC;
    C    : in STD_LOGIC;
    CE   : in STD_LOGIC;
    CLR  : in STD_LOGIC
    );
end CB2CE_HXILINX_lab4_seven_segment_display;

architecture Behavioral of CB2CE_HXILINX_lab4_seven_segment_display is

  signal COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '1');
  
begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC   <= '1' when (COUNT = TERMINAL_COUNT) else '0';
CEO  <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';

Q1 <= COUNT(1);
Q0 <= COUNT(0);

end Behavioral;


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Clocking_MUSER_lab4_seven_segment_display is
   port ( clk        : in    std_logic; 
          pushbutton : in    std_logic; 
          anode      : out   std_logic_vector (3 downto 0));
end Clocking_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of Clocking_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_26                 : std_logic;
   signal XLXN_27                 : std_logic;
   signal XLXN_47                 : std_logic;
   signal XLXN_49                 : std_logic;
   signal XLXN_52                 : std_logic;
   signal XLXN_53                 : std_logic;
   signal XLXN_55                 : std_logic;
   signal XLXN_56                 : std_logic;
   signal XLXN_58                 : std_logic;
   signal XLXN_59                 : std_logic;
   signal XLXN_61                 : std_logic;
   signal XLXN_62                 : std_logic;
   signal XLXN_64                 : std_logic;
   signal XLXN_65                 : std_logic;
   signal XLXN_67                 : std_logic;
   signal XLXN_74                 : std_logic;
   signal XLXN_76                 : std_logic;
   signal XLXN_77                 : std_logic;
   signal XLXN_79                 : std_logic;
   signal XLXN_80                 : std_logic;
   signal XLXN_82                 : std_logic;
   signal XLXN_83                 : std_logic;
   signal XLXN_85                 : std_logic;
   signal XLXN_86                 : std_logic;
   signal XLXN_88                 : std_logic;
   signal XLXN_89                 : std_logic;
   signal XLXN_91                 : std_logic;
   signal XLXN_92                 : std_logic;
   signal XLXN_94                 : std_logic;
   signal XLXN_95                 : std_logic;
   signal XLXN_114                : std_logic;
   signal XLXN_116                : std_logic;
   signal XLXN_117                : std_logic;
   signal XLXN_118                : std_logic;
   signal XLXN_157                : std_logic;
   signal XLXN_159                : std_logic;
   signal XLXN_160                : std_logic;
   signal XLXN_161                : std_logic;
   signal XLXN_172                : std_logic;
   signal XLXN_179                : std_logic;
   signal XLXN_180                : std_logic;
   signal XLXN_181                : std_logic;
   signal XLXN_182                : std_logic;
   signal XLXI_13_CLR_openSignal  : std_logic;
   signal XLXI_44_CLR_openSignal  : std_logic;
   signal XLXI_46_CLR_openSignal  : std_logic;
   signal XLXI_48_CLR_openSignal  : std_logic;
   signal XLXI_50_CLR_openSignal  : std_logic;
   signal XLXI_52_CLR_openSignal  : std_logic;
   signal XLXI_54_CLR_openSignal  : std_logic;
   signal XLXI_56_CLR_openSignal  : std_logic;
   signal XLXI_62_CLR_openSignal  : std_logic;
   signal XLXI_64_CLR_openSignal  : std_logic;
   signal XLXI_66_CLR_openSignal  : std_logic;
   signal XLXI_68_CLR_openSignal  : std_logic;
   signal XLXI_70_CLR_openSignal  : std_logic;
   signal XLXI_72_CLR_openSignal  : std_logic;
   signal XLXI_74_CLR_openSignal  : std_logic;
   signal XLXI_76_CLR_openSignal  : std_logic;
   signal XLXI_125_CLR_openSignal : std_logic;
   component FTC_HXILINX_lab4_seven_segment_display
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component CB2CE_HXILINX_lab4_seven_segment_display
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component D2_4E_HXILINX_lab4_seven_segment_display
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_13 : label is "XLXI_13_0";
   attribute HU_SET of XLXI_44 : label is "XLXI_44_1";
   attribute HU_SET of XLXI_46 : label is "XLXI_46_2";
   attribute HU_SET of XLXI_48 : label is "XLXI_48_3";
   attribute HU_SET of XLXI_50 : label is "XLXI_50_4";
   attribute HU_SET of XLXI_52 : label is "XLXI_52_5";
   attribute HU_SET of XLXI_54 : label is "XLXI_54_6";
   attribute HU_SET of XLXI_56 : label is "XLXI_56_7";
   attribute HU_SET of XLXI_62 : label is "XLXI_62_8";
   attribute HU_SET of XLXI_64 : label is "XLXI_64_9";
   attribute HU_SET of XLXI_66 : label is "XLXI_66_10";
   attribute HU_SET of XLXI_68 : label is "XLXI_68_11";
   attribute HU_SET of XLXI_70 : label is "XLXI_70_12";
   attribute HU_SET of XLXI_72 : label is "XLXI_72_13";
   attribute HU_SET of XLXI_74 : label is "XLXI_74_14";
   attribute HU_SET of XLXI_76 : label is "XLXI_76_15";
   attribute HU_SET of XLXI_125 : label is "XLXI_125_16";
   attribute HU_SET of XLXI_127 : label is "XLXI_127_17";
begin
   XLXI_13 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                CLR=>XLXI_13_CLR_openSignal,
                T=>XLXN_27,
                Q=>XLXN_26);
   
   XLXI_33 : AND2
      port map (I0=>XLXN_26,
                I1=>XLXN_27,
                O=>XLXN_47);
   
   XLXI_44 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                CLR=>XLXI_44_CLR_openSignal,
                T=>XLXN_47,
                Q=>XLXN_49);
   
   XLXI_45 : AND2
      port map (I0=>XLXN_49,
                I1=>XLXN_47,
                O=>XLXN_172);
   
   XLXI_46 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                CLR=>XLXI_46_CLR_openSignal,
                T=>XLXN_172,
                Q=>XLXN_52);
   
   XLXI_47 : AND2
      port map (I0=>XLXN_52,
                I1=>XLXN_172,
                O=>XLXN_53);
   
   XLXI_48 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                CLR=>XLXI_48_CLR_openSignal,
                T=>XLXN_53,
                Q=>XLXN_55);
   
   XLXI_49 : AND2
      port map (I0=>XLXN_55,
                I1=>XLXN_53,
                O=>XLXN_56);
   
   XLXI_50 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                CLR=>XLXI_50_CLR_openSignal,
                T=>XLXN_56,
                Q=>XLXN_58);
   
   XLXI_51 : AND2
      port map (I0=>XLXN_58,
                I1=>XLXN_56,
                O=>XLXN_59);
   
   XLXI_52 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                CLR=>XLXI_52_CLR_openSignal,
                T=>XLXN_59,
                Q=>XLXN_61);
   
   XLXI_53 : AND2
      port map (I0=>XLXN_61,
                I1=>XLXN_59,
                O=>XLXN_62);
   
   XLXI_54 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                CLR=>XLXI_54_CLR_openSignal,
                T=>XLXN_62,
                Q=>XLXN_64);
   
   XLXI_55 : AND2
      port map (I0=>XLXN_64,
                I1=>XLXN_62,
                O=>XLXN_65);
   
   XLXI_56 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                CLR=>XLXI_56_CLR_openSignal,
                T=>XLXN_65,
                Q=>XLXN_67);
   
   XLXI_57 : AND2
      port map (I0=>XLXN_67,
                I1=>XLXN_65,
                O=>XLXN_74);
   
   XLXI_62 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                CLR=>XLXI_62_CLR_openSignal,
                T=>XLXN_74,
                Q=>XLXN_76);
   
   XLXI_63 : AND2
      port map (I0=>XLXN_76,
                I1=>XLXN_74,
                O=>XLXN_77);
   
   XLXI_64 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                CLR=>XLXI_64_CLR_openSignal,
                T=>XLXN_77,
                Q=>XLXN_79);
   
   XLXI_65 : AND2
      port map (I0=>XLXN_79,
                I1=>XLXN_77,
                O=>XLXN_80);
   
   XLXI_66 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                CLR=>XLXI_66_CLR_openSignal,
                T=>XLXN_80,
                Q=>XLXN_82);
   
   XLXI_67 : AND2
      port map (I0=>XLXN_82,
                I1=>XLXN_80,
                O=>XLXN_83);
   
   XLXI_68 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                CLR=>XLXI_68_CLR_openSignal,
                T=>XLXN_83,
                Q=>XLXN_85);
   
   XLXI_69 : AND2
      port map (I0=>XLXN_85,
                I1=>XLXN_83,
                O=>XLXN_86);
   
   XLXI_70 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                CLR=>XLXI_70_CLR_openSignal,
                T=>XLXN_86,
                Q=>XLXN_88);
   
   XLXI_71 : AND2
      port map (I0=>XLXN_88,
                I1=>XLXN_86,
                O=>XLXN_89);
   
   XLXI_72 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                CLR=>XLXI_72_CLR_openSignal,
                T=>XLXN_89,
                Q=>XLXN_91);
   
   XLXI_73 : AND2
      port map (I0=>XLXN_91,
                I1=>XLXN_89,
                O=>XLXN_92);
   
   XLXI_74 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                CLR=>XLXI_74_CLR_openSignal,
                T=>XLXN_92,
                Q=>XLXN_94);
   
   XLXI_75 : AND2
      port map (I0=>XLXN_94,
                I1=>XLXN_92,
                O=>XLXN_95);
   
   XLXI_76 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                CLR=>XLXI_76_CLR_openSignal,
                T=>XLXN_95,
                Q=>XLXN_116);
   
   XLXI_82 : AND2
      port map (I0=>clk,
                I1=>pushbutton,
                O=>XLXN_117);
   
   XLXI_83 : AND2
      port map (I0=>XLXN_116,
                I1=>XLXN_114,
                O=>XLXN_118);
   
   XLXI_84 : INV
      port map (I=>pushbutton,
                O=>XLXN_114);
   
   XLXI_85 : OR2
      port map (I0=>XLXN_118,
                I1=>XLXN_117,
                O=>XLXN_157);
   
   XLXI_86 : VCC
      port map (P=>XLXN_27);
   
   XLXI_125 : CB2CE_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_157,
                CE=>XLXN_159,
                CLR=>XLXI_125_CLR_openSignal,
                CEO=>open,
                Q0=>XLXN_160,
                Q1=>XLXN_161,
                TC=>open);
   
   XLXI_126 : VCC
      port map (P=>XLXN_159);
   
   XLXI_127 : D2_4E_HXILINX_lab4_seven_segment_display
      port map (A0=>XLXN_160,
                A1=>XLXN_161,
                E=>XLXN_159,
                D0=>XLXN_179,
                D1=>XLXN_180,
                D2=>XLXN_181,
                D3=>XLXN_182);
   
   XLXI_132 : INV
      port map (I=>XLXN_179,
                O=>anode(0));
   
   XLXI_133 : INV
      port map (I=>XLXN_180,
                O=>anode(1));
   
   XLXI_135 : INV
      port map (I=>XLXN_181,
                O=>anode(2));
   
   XLXI_136 : INV
      port map (I=>XLXN_182,
                O=>anode(3));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Binary_to_Seven_MUSER_lab4_seven_segment_display is
   port ( A  : in    std_logic; 
          B  : in    std_logic; 
          C  : in    std_logic; 
          D  : in    std_logic; 
          CA : out   std_logic; 
          CB : out   std_logic; 
          CC : out   std_logic; 
          CD : out   std_logic; 
          CE : out   std_logic; 
          CF : out   std_logic; 
          CG : out   std_logic);
end Binary_to_Seven_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of Binary_to_Seven_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_15  : std_logic;
   signal XLXN_16  : std_logic;
   signal XLXN_17  : std_logic;
   signal XLXN_28  : std_logic;
   signal XLXN_30  : std_logic;
   signal XLXN_31  : std_logic;
   signal XLXN_32  : std_logic;
   signal XLXN_34  : std_logic;
   signal XLXN_35  : std_logic;
   signal XLXN_37  : std_logic;
   signal XLXN_38  : std_logic;
   signal XLXN_39  : std_logic;
   signal XLXN_40  : std_logic;
   signal XLXN_62  : std_logic;
   signal XLXN_63  : std_logic;
   signal XLXN_64  : std_logic;
   signal XLXN_65  : std_logic;
   signal XLXN_66  : std_logic;
   signal XLXN_85  : std_logic;
   signal XLXN_86  : std_logic;
   signal XLXN_87  : std_logic;
   signal XLXN_88  : std_logic;
   signal XLXN_89  : std_logic;
   signal XLXN_107 : std_logic;
   signal XLXN_108 : std_logic;
   signal XLXN_110 : std_logic;
   signal XLXN_111 : std_logic;
   signal XLXN_126 : std_logic;
   signal XLXN_127 : std_logic;
   signal XLXN_128 : std_logic;
   signal XLXN_129 : std_logic;
   signal XLXN_130 : std_logic;
   signal XLXN_144 : std_logic;
   signal XLXN_145 : std_logic;
   signal XLXN_146 : std_logic;
   signal XLXN_147 : std_logic;
   signal XLXN_148 : std_logic;
   signal XLXN_178 : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component NOR5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NOR5 : component is "BLACK_BOX";
   
   component NOR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NOR4 : component is "BLACK_BOX";
   
begin
   XLXI_2 : AND2
      port map (I0=>C,
                I1=>XLXN_17,
                O=>XLXN_30);
   
   XLXI_3 : AND2
      port map (I0=>C,
                I1=>B,
                O=>XLXN_31);
   
   XLXI_6 : AND3
      port map (I0=>XLXN_28,
                I1=>XLXN_15,
                I2=>A,
                O=>XLXN_35);
   
   XLXI_19 : INV
      port map (I=>A,
                O=>XLXN_17);
   
   XLXI_21 : INV
      port map (I=>B,
                O=>XLXN_15);
   
   XLXI_22 : INV
      port map (I=>C,
                O=>XLXN_28);
   
   XLXI_23 : INV
      port map (I=>D,
                O=>XLXN_16);
   
   XLXI_38 : AND2
      port map (I0=>XLXN_15,
                I1=>XLXN_17,
                O=>XLXN_37);
   
   XLXI_40 : AND3
      port map (I0=>D,
                I1=>C,
                I2=>XLXN_17,
                O=>XLXN_39);
   
   XLXI_43 : AND2
      port map (I0=>XLXN_28,
                I1=>XLXN_17,
                O=>XLXN_62);
   
   XLXI_44 : AND2
      port map (I0=>D,
                I1=>XLXN_17,
                O=>XLXN_63);
   
   XLXI_45 : AND2
      port map (I0=>D,
                I1=>XLXN_28,
                O=>XLXN_64);
   
   XLXI_46 : AND2
      port map (I0=>B,
                I1=>XLXN_17,
                O=>XLXN_65);
   
   XLXI_47 : AND2
      port map (I0=>XLXN_15,
                I1=>A,
                O=>XLXN_66);
   
   XLXI_48 : NOR5
      port map (I0=>XLXN_66,
                I1=>XLXN_65,
                I2=>XLXN_64,
                I3=>XLXN_63,
                I4=>XLXN_62,
                O=>CC);
   
   XLXI_53 : AND3
      port map (I0=>D,
                I1=>XLXN_28,
                I2=>B,
                O=>XLXN_87);
   
   XLXI_56 : NOR5
      port map (I0=>XLXN_89,
                I1=>XLXN_88,
                I2=>XLXN_87,
                I3=>XLXN_86,
                I4=>XLXN_85,
                O=>CD);
   
   XLXI_57 : AND2
      port map (I0=>B,
                I1=>A,
                O=>XLXN_107);
   
   XLXI_67 : AND3
      port map (I0=>XLXN_28,
                I1=>B,
                I2=>XLXN_17,
                O=>XLXN_130);
   
   XLXI_68 : NOR5
      port map (I0=>XLXN_130,
                I1=>XLXN_129,
                I2=>XLXN_128,
                I3=>XLXN_127,
                I4=>XLXN_126,
                O=>CF);
   
   XLXI_72 : AND2
      port map (I0=>D,
                I1=>A,
                O=>XLXN_147);
   
   XLXI_74 : NOR5
      port map (I0=>XLXN_148,
                I1=>XLXN_147,
                I2=>XLXN_146,
                I3=>XLXN_145,
                I4=>XLXN_144,
                O=>CG);
   
   XLXI_75 : AND3
      port map (I0=>XLXN_16,
                I1=>XLXN_28,
                I2=>XLXN_17,
                O=>XLXN_40);
   
   XLXI_89 : NOR5
      port map (I0=>XLXN_40,
                I1=>XLXN_178,
                I2=>XLXN_39,
                I3=>XLXN_38,
                I4=>XLXN_37,
                O=>CB);
   
   XLXI_90 : AND2
      port map (I0=>XLXN_28,
                I1=>A,
                O=>XLXN_89);
   
   XLXI_91 : AND2
      port map (I0=>C,
                I1=>A,
                O=>XLXN_108);
   
   XLXI_92 : AND2
      port map (I0=>XLXN_16,
                I1=>C,
                O=>XLXN_110);
   
   XLXI_93 : AND2
      port map (I0=>XLXN_16,
                I1=>XLXN_15,
                O=>XLXN_111);
   
   XLXI_95 : NOR4
      port map (I0=>XLXN_111,
                I1=>XLXN_110,
                I2=>XLXN_108,
                I3=>XLXN_107,
                O=>CE);
   
   XLXI_98 : AND3
      port map (I0=>XLXN_16,
                I1=>XLXN_15,
                I2=>XLXN_17,
                O=>XLXN_34);
   
   XLXI_99 : NOR5
      port map (I0=>XLXN_35,
                I1=>XLXN_34,
                I2=>XLXN_32,
                I3=>XLXN_31,
                I4=>XLXN_30,
                O=>CA);
   
   XLXI_100 : AND2
      port map (I0=>XLXN_28,
                I1=>XLXN_15,
                O=>XLXN_38);
   
   XLXI_101 : AND2
      port map (I0=>D,
                I1=>XLXN_15,
                O=>XLXN_178);
   
   XLXI_102 : AND2
      port map (I0=>XLXN_16,
                I1=>XLXN_15,
                O=>XLXN_85);
   
   XLXI_103 : AND2
      port map (I0=>C,
                I1=>XLXN_15,
                O=>XLXN_86);
   
   XLXI_105 : AND2
      port map (I0=>XLXN_16,
                I1=>C,
                O=>XLXN_88);
   
   XLXI_106 : AND3
      port map (I0=>XLXN_16,
                I1=>XLXN_28,
                I2=>XLXN_17,
                O=>XLXN_126);
   
   XLXI_107 : AND3
      port map (I0=>XLXN_16,
                I1=>B,
                I2=>XLXN_17,
                O=>XLXN_127);
   
   XLXI_108 : AND3
      port map (I0=>XLXN_28,
                I1=>XLXN_15,
                I2=>A,
                O=>XLXN_128);
   
   XLXI_109 : AND3
      port map (I0=>C,
                I1=>B,
                I2=>A,
                O=>XLXN_129);
   
   XLXI_110 : AND3
      port map (I0=>C,
                I1=>XLXN_15,
                I2=>XLXN_17,
                O=>XLXN_148);
   
   XLXI_111 : AND2
      port map (I0=>XLXN_28,
                I1=>B,
                O=>XLXN_144);
   
   XLXI_112 : AND2
      port map (I0=>XLXN_16,
                I1=>B,
                O=>XLXN_145);
   
   XLXI_113 : AND2
      port map (I0=>XLXN_28,
                I1=>A,
                O=>XLXN_146);
   
   XLXI_114 : AND3
      port map (I0=>D,
                I1=>B,
                I2=>XLXN_17,
                O=>XLXN_32);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Mux_MUSER_lab4_seven_segment_display is
   port ( anode : in    std_logic_vector (3 downto 0); 
          b0    : in    std_logic; 
          b1    : in    std_logic; 
          b2    : in    std_logic; 
          b3    : in    std_logic; 
          b4    : in    std_logic; 
          b5    : in    std_logic; 
          b6    : in    std_logic; 
          b7    : in    std_logic; 
          b8    : in    std_logic; 
          b9    : in    std_logic; 
          b10   : in    std_logic; 
          b11   : in    std_logic; 
          b12   : in    std_logic; 
          b13   : in    std_logic; 
          b14   : in    std_logic; 
          b15   : in    std_logic; 
          bit0  : out   std_logic; 
          bit1  : out   std_logic; 
          bit2  : out   std_logic; 
          bit3  : out   std_logic);
end Mux_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of Mux_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_1   : std_logic;
   signal XLXN_2   : std_logic;
   signal XLXN_3   : std_logic;
   signal XLXN_4   : std_logic;
   signal XLXN_11  : std_logic;
   signal XLXN_12  : std_logic;
   signal XLXN_13  : std_logic;
   signal XLXN_14  : std_logic;
   signal XLXN_19  : std_logic;
   signal XLXN_20  : std_logic;
   signal XLXN_21  : std_logic;
   signal XLXN_22  : std_logic;
   signal XLXN_27  : std_logic;
   signal XLXN_28  : std_logic;
   signal XLXN_29  : std_logic;
   signal XLXN_30  : std_logic;
   signal XLXN_113 : std_logic;
   signal XLXN_125 : std_logic;
   signal XLXN_130 : std_logic;
   signal XLXN_133 : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND2
      port map (I0=>b0,
                I1=>XLXN_113,
                O=>XLXN_1);
   
   XLXI_2 : AND2
      port map (I0=>b4,
                I1=>XLXN_125,
                O=>XLXN_2);
   
   XLXI_3 : AND2
      port map (I0=>b8,
                I1=>XLXN_130,
                O=>XLXN_3);
   
   XLXI_4 : AND2
      port map (I0=>b12,
                I1=>XLXN_133,
                O=>XLXN_4);
   
   XLXI_5 : OR4
      port map (I0=>XLXN_4,
                I1=>XLXN_3,
                I2=>XLXN_2,
                I3=>XLXN_1,
                O=>bit0);
   
   XLXI_6 : AND2
      port map (I0=>b1,
                I1=>XLXN_113,
                O=>XLXN_11);
   
   XLXI_7 : AND2
      port map (I0=>b5,
                I1=>XLXN_125,
                O=>XLXN_12);
   
   XLXI_8 : AND2
      port map (I0=>b9,
                I1=>XLXN_130,
                O=>XLXN_13);
   
   XLXI_9 : AND2
      port map (I0=>b13,
                I1=>XLXN_133,
                O=>XLXN_14);
   
   XLXI_10 : OR4
      port map (I0=>XLXN_14,
                I1=>XLXN_13,
                I2=>XLXN_12,
                I3=>XLXN_11,
                O=>bit1);
   
   XLXI_11 : AND2
      port map (I0=>b2,
                I1=>XLXN_113,
                O=>XLXN_19);
   
   XLXI_12 : AND2
      port map (I0=>b6,
                I1=>XLXN_125,
                O=>XLXN_20);
   
   XLXI_13 : AND2
      port map (I0=>b10,
                I1=>XLXN_130,
                O=>XLXN_21);
   
   XLXI_14 : AND2
      port map (I0=>b14,
                I1=>XLXN_133,
                O=>XLXN_22);
   
   XLXI_15 : OR4
      port map (I0=>XLXN_22,
                I1=>XLXN_21,
                I2=>XLXN_20,
                I3=>XLXN_19,
                O=>bit2);
   
   XLXI_16 : AND2
      port map (I0=>b3,
                I1=>XLXN_113,
                O=>XLXN_27);
   
   XLXI_17 : AND2
      port map (I0=>b7,
                I1=>XLXN_125,
                O=>XLXN_28);
   
   XLXI_18 : AND2
      port map (I0=>b11,
                I1=>XLXN_130,
                O=>XLXN_29);
   
   XLXI_19 : AND2
      port map (I0=>b15,
                I1=>XLXN_133,
                O=>XLXN_30);
   
   XLXI_20 : OR4
      port map (I0=>XLXN_30,
                I1=>XLXN_29,
                I2=>XLXN_28,
                I3=>XLXN_27,
                O=>bit3);
   
   XLXI_61 : INV
      port map (I=>anode(0),
                O=>XLXN_113);
   
   XLXI_63 : INV
      port map (I=>anode(1),
                O=>XLXN_125);
   
   XLXI_64 : INV
      port map (I=>anode(2),
                O=>XLXN_130);
   
   XLXI_65 : INV
      port map (I=>anode(3),
                O=>XLXN_133);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab4_seven_segment_display is
   port ( b          : in    std_logic_vector (15 downto 0):="0000000000000000"; 
          clk        : in    std_logic; 
          pushbutton : in    std_logic:='0'; 
          anode      : out   std_logic_vector (3 downto 0); 
          cathode    : out   std_logic_vector (6 downto 0));
end lab4_seven_segment_display;

architecture BEHAVIORAL of lab4_seven_segment_display is
   signal XLXN_2      : std_logic;
   signal XLXN_3      : std_logic;
   signal XLXN_4      : std_logic;
   signal XLXN_6      : std_logic;
   signal anode_DUMMY : std_logic_vector (3 downto 0);
   component Mux_MUSER_lab4_seven_segment_display
      port ( anode : in    std_logic_vector (3 downto 0); 
             b0    : in    std_logic; 
             b1    : in    std_logic; 
             b10   : in    std_logic; 
             b11   : in    std_logic; 
             b12   : in    std_logic; 
             b13   : in    std_logic; 
             b14   : in    std_logic; 
             b15   : in    std_logic; 
             b2    : in    std_logic; 
             b3    : in    std_logic; 
             b4    : in    std_logic; 
             b5    : in    std_logic; 
             b6    : in    std_logic; 
             b7    : in    std_logic; 
             b8    : in    std_logic; 
             b9    : in    std_logic; 
             bit0  : out   std_logic; 
             bit1  : out   std_logic; 
             bit2  : out   std_logic; 
             bit3  : out   std_logic);
   end component;
   
   component Binary_to_Seven_MUSER_lab4_seven_segment_display
      port ( A  : in    std_logic; 
             B  : in    std_logic; 
             C  : in    std_logic; 
             CA : out   std_logic; 
             CB : out   std_logic; 
             CC : out   std_logic; 
             CD : out   std_logic; 
             CE : out   std_logic; 
             CF : out   std_logic; 
             CG : out   std_logic; 
             D  : in    std_logic);
   end component;
   
   component Clocking_MUSER_lab4_seven_segment_display
      port ( anode      : out   std_logic_vector (3 downto 0); 
             clk        : in    std_logic; 
             pushbutton : in    std_logic);
   end component;
   
begin
   anode(3 downto 0) <= anode_DUMMY(3 downto 0);
   XLXI_3 : Mux_MUSER_lab4_seven_segment_display
      port map (anode(3 downto 0)=>anode_DUMMY(3 downto 0),
                b0=>b(0),
                b1=>b(1),
                b2=>b(2),
                b3=>b(3),
                b4=>b(4),
                b5=>b(5),
                b6=>b(6),
                b7=>b(7),
                b8=>b(8),
                b9=>b(9),
                b10=>b(10),
                b11=>b(11),
                b12=>b(12),
                b13=>b(13),
                b14=>b(14),
                b15=>b(15),
                bit0=>XLXN_2,
                bit1=>XLXN_3,
                bit2=>XLXN_4,
                bit3=>XLXN_6);
   
   XLXI_4 : Binary_to_Seven_MUSER_lab4_seven_segment_display
      port map (A=>XLXN_6,
                B=>XLXN_4,
                C=>XLXN_3,
                D=>XLXN_2,
                CA=>cathode(0),
                CB=>cathode(1),
                CC=>cathode(2),
                CD=>cathode(3),
                CE=>cathode(4),
                CF=>cathode(5),
                CG=>cathode(6));
   
   XLXI_10 : Clocking_MUSER_lab4_seven_segment_display
      port map (clk=>clk,
                pushbutton=>pushbutton,
                anode(3 downto 0)=>anode_DUMMY(3 downto 0));
   
end BEHAVIORAL;




--------------------------------------------------------------------------
--------------------------------------------------------------------------




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity lab8_elevator_control is
	PORT(
	up_request : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	down_request : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	up_request_indicator : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	down_request_indicator : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	reset : IN STD_LOGIC;
	cathode : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	anode : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	door_open : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	door_closed : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	clk : INOUT STD_LOGIC;
	lift1_floor : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	lift2_floor : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	lift1_floor_indicator : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	lift2_floor_indicator : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	sim_mode : IN STD_LOGIC
	);
end lab8_elevator_control;

architecture Behavioral of lab8_elevator_control is
	SIGNAL lift1_status : STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
    SIGNAL lift2_status : STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
	SIGNAL floor_req, upfloor_req, downfloor_req, lift1floor_req, lift2floor_req, floor2_req, upfloor2_req, downfloor2_req: STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL counter, counter2 : INTEGER RANGE 0 to 200000000:=0;
    SIGNAL c : STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
    SIGNAL b : STD_LOGIC_VECTOR(15 DOWNTO 0):="0000000000000000";
    SIGNAL lift1_idle, lift2_idle, bothliftsfree : STD_LOGIC:='0';
    SIGNAL lift1_up, lift2_up : STD_LOGIC_VECTOR(1 DOWNTO 0):="00";
begin
	
SSD: ENTITY work.lab4_seven_segment_display
port map(
    clk=>clk,
    cathode=>cathode,
    anode=>anode,
    b=>b
    );

PROCESS(clk, lift1_status, lift2_status)
BEGIN
    if(clk'EVENT and clk='1') then
    
    if reset='1' then lift1_status<="0001"; down_request_indicator<="0000"; lift1_idle<='1';
        floor_req<="00"; up_request_indicator<="0000"; lift1_floor_indicator<="0000"; 
        upfloor_req<="00"; lift1floor_req<="00"; downfloor_req<="00"; lift1_up<="00";
        floor2_req<="00"; lift2_status<="0001"; lift2_idle<='1'; lift2_up<="00"; lift2_floor_indicator<="0000";
        upfloor2_req<="00"; lift2floor_req<="00"; downfloor2_req<="00"; bothliftsfree<='1';
        counter<=0; counter2<=0;
     end if;
    
	if(down_request(3)='1') THEN down_request_indicator(3) <= '1';  end if;
	if(down_request(2)='1') THEN down_request_indicator(2) <= '1'; end if;
	if(down_request(1)='1') THEN down_request_indicator(1) <= '1'; end if;
	if(up_request(2)='1') THEN up_request_indicator(2) <= '1'; end if;
	if(up_request(1)='1') THEN up_request_indicator(1) <= '1'; end if;
	if(up_request(0)='1') THEN up_request_indicator(0) <= '1'; end if;
	if lift1_floor(0)='1' then lift1_floor_indicator(0)<='1';end if;
    if lift1_floor(1)='1' then lift1_floor_indicator(1)<='1';end if;
    if lift1_floor(2)='1' then lift1_floor_indicator(2)<='1';end if;
    if lift1_floor(3)='1' then lift1_floor_indicator(3)<='1';end if;
    if lift2_floor(0)='1' then lift2_floor_indicator(0)<='1';end if;
    if lift2_floor(1)='1' then lift2_floor_indicator(1)<='1';end if;
    if lift2_floor(2)='1' then lift2_floor_indicator(2)<='1';end if;
    if lift2_floor(3)='1' then lift2_floor_indicator(3)<='1';end if;

	-------------------
	if lift1_up="01" or lift1_up="00" then
	   if lift1_status(3 DOWNTO 2)="00" then
	       if up_request_indicator(1)='1' then upfloor_req<="01";
	       elsif up_request_indicator(2)='1' then upfloor_req<="10";
	       elsif up_request_indicator(0)='1' then upfloor_req<="00"; end if;
	       if lift1_floor_indicator(0)='1' then lift1floor_req<="00";
	       elsif lift1_floor_indicator(1)='1' then lift1floor_req<="01";
	       elsif lift1_floor_indicator(2)='1' then lift1floor_req<="10";
	       elsif lift1_floor_indicator(3)='1' then lift1floor_req<="11"; end if;
	       if down_request_indicator(1)='1' then downfloor_req<="01";
           elsif down_request_indicator(2)='1' then downfloor_req<="10";
           elsif down_request_indicator(3)='1' then downfloor_req<="11"; end if;
       elsif lift1_status(3 DOWNTO 2)="01" then
           if up_request_indicator(1)='1' then upfloor_req<="01";
           elsif up_request_indicator(2)='1' then upfloor_req<="10";
           elsif up_request_indicator(0)='1' then upfloor_req<="00"; end if;
           if lift1_floor_indicator(1)='1' then lift1floor_req<="01";
           elsif lift1_floor_indicator(2)='1' then lift1floor_req<="10";
           elsif lift1_floor_indicator(3)='1' then lift1floor_req<="11";
           elsif lift1_floor_indicator(0)='1' then lift1floor_req<="00"; end if;
           if down_request_indicator(2)='1' then downfloor_req<="10";
           elsif down_request_indicator(3)='1' then downfloor_req<="11";
           elsif down_request_indicator(1)='1' then downfloor_req<="01"; end if;
       elsif lift1_status(3 DOWNTO 2)="10" then
           if up_request_indicator(2)='1' then upfloor_req<="10";
           elsif up_request_indicator(1)='1' then upfloor_req<="01";
           elsif up_request_indicator(0)='1' then upfloor_req<="00"; end if;
           if lift1_floor_indicator(2)='1' then lift1floor_req<="10";
           elsif lift1_floor_indicator(3)='1' then lift1floor_req<="11";
           elsif lift1_floor_indicator(1)='1' then lift1floor_req<="01";
           elsif lift1_floor_indicator(0)='1' then lift1floor_req<="00"; end if;
           if down_request_indicator(3)='1' then downfloor_req<="11";
           elsif down_request_indicator(2)='1' then downfloor_req<="10";
           elsif down_request_indicator(1)='1' then downfloor_req<="01"; end if;
       elsif lift1_status(3 DOWNTO 2)="11" then
           if up_request_indicator(2)='1' then upfloor_req<="10";
           elsif up_request_indicator(1)='1' then upfloor_req<="01";
           elsif up_request_indicator(0)='1' then upfloor_req<="00"; end if;
           if lift1_floor_indicator(3)='1' then lift1floor_req<="11";
           elsif lift1_floor_indicator(2)='1' then lift1floor_req<="10";
           elsif lift1_floor_indicator(1)='1' then lift1floor_req<="01";
           elsif lift1_floor_indicator(0)='1' then lift1floor_req<="00"; end if;
           if down_request_indicator(3)='1' then downfloor_req<="11";
           elsif down_request_indicator(2)='1' then downfloor_req<="10";
           elsif down_request_indicator(1)='1' then downfloor_req<="01"; end if;
       end if;
	elsif lift1_up="10" then
       if lift1_status(3 DOWNTO 2)="00" then
          if up_request_indicator(0)='1' then upfloor_req<="00";
          elsif up_request_indicator(1)='1' then upfloor_req<="01";
          elsif up_request_indicator(2)='1' then upfloor_req<="10"; end if;
          if lift1_floor_indicator(0)='1' then lift1floor_req<="00";
          elsif lift1_floor_indicator(3)='1' then lift1floor_req<="11";
          elsif lift1_floor_indicator(2)='1' then lift1floor_req<="10";
          elsif lift1_floor_indicator(1)='1' then lift1floor_req<="01"; end if;
          if down_request_indicator(2)='1' then downfloor_req<="10";
          elsif down_request_indicator(1)='1' then downfloor_req<="01";
          elsif down_request_indicator(0)='1' then downfloor_req<="00"; end if;
      elsif lift1_status(3 DOWNTO 2)="01" then
          if up_request_indicator(0)='1' then upfloor_req<="00";
          elsif up_request_indicator(1)='1' then upfloor_req<="01";
          elsif up_request_indicator(2)='1' then upfloor_req<="10"; end if;
          if lift1_floor_indicator(1)='1' then lift1floor_req<="01";
          elsif lift1_floor_indicator(0)='1' then lift1floor_req<="00";
          elsif lift1_floor_indicator(2)='1' then lift1floor_req<="10";
          elsif lift1_floor_indicator(3)='1' then lift1floor_req<="11"; end if;
          if down_request_indicator(1)='1' then downfloor_req<="01";
          elsif down_request_indicator(2)='1' then downfloor_req<="10";
          elsif down_request_indicator(3)='1' then downfloor_req<="11"; end if;
      elsif lift1_status(3 DOWNTO 2)="10" then
          if up_request_indicator(1)='1' then upfloor_req<="01";
          elsif up_request_indicator(0)='1' then upfloor_req<="00";
          elsif up_request_indicator(2)='1' then upfloor_req<="10"; end if;
          if lift1_floor_indicator(2)='1' then lift1floor_req<="10";
          elsif lift1_floor_indicator(1)='1' then lift1floor_req<="01";
          elsif lift1_floor_indicator(0)='1' then lift1floor_req<="00";
          elsif lift1_floor_indicator(3)='1' then lift1floor_req<="11"; end if;
          if down_request_indicator(1)='1' then downfloor_req<="01";
          elsif down_request_indicator(2)='1' then downfloor_req<="10";
          elsif down_request_indicator(3)='1' then downfloor_req<="11"; end if;
      elsif lift1_status(3 DOWNTO 2)="11" then
          if up_request_indicator(2)='1' then upfloor_req<="10";
          elsif up_request_indicator(1)='1' then upfloor_req<="01";
          elsif up_request_indicator(0)='1' then upfloor_req<="00"; end if;
          if lift1_floor_indicator(3)='1' then lift1floor_req<="11";
          elsif lift1_floor_indicator(2)='1' then lift1floor_req<="10";
          elsif lift1_floor_indicator(1)='1' then lift1floor_req<="01";
          elsif lift1_floor_indicator(0)='1' then lift1floor_req<="00"; end if;
          if down_request_indicator(3)='1' then downfloor_req<="11";
          elsif down_request_indicator(2)='1' then downfloor_req<="10";
          elsif down_request_indicator(1)='1' then downfloor_req<="01"; end if;
      end if;
    end if;
	
	if up_request_indicator="0000" and down_request_indicator="0000" then
       if lift1_status(3 DOWNTO 2) > lift1floor_req then floor_req<=lift1floor_req;
       else floor_req<=lift1floor_req; 
       end if;
    elsif lift1_floor_indicator="0000" and down_request_indicator="0000" then
       if lift1_status(3 DOWNTO 2) > upfloor_req then floor_req<=upfloor_req; 
       else floor_req<=upfloor_req;
       end if;
    elsif lift1_floor_indicator="0000" and up_request_indicator="0000" then
       if lift1_status(3 DOWNTO 2) > downfloor_req then floor_req<=downfloor_req; 
       else floor_req<=downfloor_req; 
       end if;
    elsif lift1_floor_indicator="0000" then
       if lift1_status(3 DOWNTO 2)<=upfloor_req and lift1_status(3 DOWNTO 2)<downfloor_req then floor_req<=upfloor_req;
       elsif lift1_status(3 DOWNTO 2)<=upfloor_req and lift1_status(3 DOWNTO 2)>=downfloor_req then floor_req<=upfloor_req;
       elsif lift1_status(3 DOWNTO 2)>=upfloor_req and lift1_status(3 DOWNTO 2)<downfloor_req then floor_req<=downfloor_req;
       elsif lift1_status(3 DOWNTO 2)>=upfloor_req and lift1_status(3 DOWNTO 2)>=downfloor_req then floor_req<=downfloor_req;end if;
	elsif down_request_indicator="0000" then
	   if lift1_status(3 DOWNTO 2)<=upfloor_req and upfloor_req<=lift1floor_req then floor_req<=upfloor_req;
       elsif lift1_status(3 DOWNTO 2)<upfloor_req and upfloor_req>lift1floor_req then floor_req<=lift1floor_req;
       elsif lift1_status(3 DOWNTO 2)>=upfloor_req and upfloor_req<lift1floor_req then floor_req<=lift1floor_req;
       elsif lift1_status(3 DOWNTO 2)>=upfloor_req and upfloor_req>=lift1floor_req then floor_req<=lift1floor_req;
	   elsif lift1floor_req<lift1_status(3 DOWNTO 2) and lift1_status(3 DOWNTO 2) < upfloor_req then floor_req<=lift1floor_req;
	   elsif lift1floor_req>lift1_status(3 DOWNTO 2) and lift1_status(3 DOWNTO 2) >= upfloor_req then floor_req<=upfloor_req;
	   end if;
	elsif up_request_indicator="0000" then
       if lift1_status(3 DOWNTO 2)<downfloor_req and downfloor_req<=lift1floor_req then floor_req<=lift1floor_req;
       elsif lift1_status(3 DOWNTO 2)<downfloor_req and downfloor_req>lift1floor_req then floor_req<=lift1floor_req;
       elsif lift1_status(3 DOWNTO 2)>=downfloor_req and downfloor_req<lift1floor_req then floor_req<=lift1floor_req;
       elsif lift1_status(3 DOWNTO 2)>=downfloor_req and downfloor_req>=lift1floor_req then floor_req<=downfloor_req;
       elsif lift1floor_req<lift1_status(3 DOWNTO 2) and lift1_status(3 DOWNTO 2) < downfloor_req then floor_req<=lift1floor_req;
       elsif lift1floor_req>lift1_status(3 DOWNTO 2) and lift1_status(3 DOWNTO 2) >= downfloor_req then floor_req<=lift1floor_req;
       end if;	   
    else
       
	end if;
	
    
	if ( floor_req > lift1_status(3 DOWNTO 2) ) THEN
	    if counter < 50000000 and (lift1_status(1 DOWNTO 0)="01" or lift1_status(1 DOWNTO 0)="00") then counter <= counter +1; end if;
	    if counter = 50000000 and (lift1_status(1 DOWNTO 0)="01" or lift1_status(1 DOWNTO 0)="00") then
	      lift1_status(1 DOWNTO 0)<="10";
	      lift1_idle<='0';
	      lift1_up<="01";
	      counter<=0; end if;
		if counter < 200000000 and lift1_status(1 DOWNTO 0)="10" then counter <= counter +1; end if;
        if counter = 200000000 and lift1_status(1 DOWNTO 0)="10" then
          lift1_status(3 DOWNTO 2) <= lift1_status(3 DOWNTO 2) + 1;
          counter<=0; 
        end if;
	elsif ( floor_req < lift1_status(3 DOWNTO 2) ) THEN
	    if counter < 50000000 and (lift1_status(1 DOWNTO 0)="01" or lift1_status(1 DOWNTO 0)="00") then counter <= counter +1; end if;
        if counter = 50000000 and (lift1_status(1 DOWNTO 0)="01" or lift1_status(1 DOWNTO 0)="00") then
        lift1_status(1 DOWNTO 0)<="11";
        lift1_idle<='0';
        lift1_up<="10";
        counter<=0; end if;
        if counter < 200000000 and lift1_status(1 DOWNTO 0)="11" then counter <= counter +1; end if;
        if counter = 200000000 and lift1_status(1 DOWNTO 0)="11" then
           lift1_status(3 DOWNTO 2) <= lift1_status(3 DOWNTO 2) - 1;
           counter<=0; 
        end if;
    elsif (lift1_idle='1') then
        if up_request_indicator(to_integer(unsigned(lift1_status(3 DOWNTO 2))))='1' or down_request_indicator(to_integer(unsigned(lift1_status(3 DOWNTO 2))))='1' then lift1_status(1 DOWNTO 0)<="00";elsif(lift1_status(1 DOWNTO 0)/="00") then lift1_status(1 DOWNTO 0)<="01"; end if;
	    if lift1_up="01" 
	    or (lift1floor_req>lift1_status(3 DOWNTO 2) and downfloor_req>lift1_status(3 DOWNTO 2) and upfloor_req>lift1_status(3 DOWNTO 2)) 
	    or (lift1_floor_indicator="0000" and down_request_indicator="0000" and lift1_up="01") 
	    or (lift1_floor_indicator="0000" and downfloor_req>lift1_status(3 DOWNTO 2))
	    or (down_request_indicator="0000" and lift1floor_req>lift1_status(3 DOWNTO 2))
	    then up_request_indicator(to_integer(unsigned(lift1_status(3 DOWNTO 2))))<='0'; end if;
	    if lift1_up="10" 
	    or (lift1floor_req<lift1_status(3 DOWNTO 2) and downfloor_req<lift1_status(3 DOWNTO 2) and upfloor_req<lift1_status(3 DOWNTO 2)) 
	    or (lift1_floor_indicator="0000" and up_request_indicator="0000" and lift1_up="10") 
	    or (lift1_floor_indicator="0000" and upfloor_req<lift1_status(3 DOWNTO 2))
        or (up_request_indicator="0000" and lift1floor_req<lift1_status(3 DOWNTO 2))
	    then down_request_indicator(to_integer(unsigned(lift1_status(3 DOWNTO 2))))<='0'; end if;
        lift1_floor_indicator(to_integer(unsigned(lift1_status(3 DOWNTO 2))))<='0'; 
	elsif (floor_req = lift1_status(3 DOWNTO 2)) THEN
		if counter < 150000000 then counter <= counter +1; end if;
        if counter = 150000000 then
          counter<=0; 
          lift1_status(1 DOWNTO 0)<="01";
          lift1_idle <= '1';lift1floor_req<=floor_req;bothliftsfree<='0';
          if lift1_up="01" 
          or (lift1floor_req>lift1_status(3 DOWNTO 2) and downfloor_req>lift1_status(3 DOWNTO 2) and upfloor_req>lift1_status(3 DOWNTO 2)) 
          or (lift1_floor_indicator="0000" and down_request_indicator="0000" and lift1_up="01") 
          or (lift1_floor_indicator="0000" and downfloor_req>lift1_status(3 DOWNTO 2))
          or (down_request_indicator="0000" and lift1floor_req>lift1_status(3 DOWNTO 2))
          then up_request_indicator(to_integer(unsigned(lift1_status(3 DOWNTO 2))))<='0'; end if;
          if lift1_up="10" 
          or (lift1floor_req<lift1_status(3 DOWNTO 2) and downfloor_req<lift1_status(3 DOWNTO 2) and upfloor_req<lift1_status(3 DOWNTO 2)) 
          or (lift1_floor_indicator="0000" and up_request_indicator="0000" and lift1_up="10") 
          or (lift1_floor_indicator="0000" and upfloor_req<lift1_status(3 DOWNTO 2))
          or (up_request_indicator="0000" and lift1floor_req<lift1_status(3 DOWNTO 2))
          then down_request_indicator(to_integer(unsigned(lift1_status(3 DOWNTO 2))))<='0'; end if;
          lift1_floor_indicator(to_integer(unsigned(lift1_status(3 DOWNTO 2))))<='0';
        end if;	
        if counter <50000000 then
            lift1_status(1 DOWNTO 0)<="00";
        elsif counter <150000000 then
            lift1_status(1 DOWNTO 0)<="01";            
        end if;
	end if;
	----------------------
	if lift2_up="01" or lift2_up="00" then
       if lift2_status(3 DOWNTO 2)="00" then
           if up_request_indicator(1)='1' then upfloor2_req<="01";
           elsif up_request_indicator(2)='1' then upfloor2_req<="10";
           elsif up_request_indicator(0)='1' then upfloor2_req<="00"; end if;
           if lift2_floor_indicator(0)='1' then lift2floor_req<="00";
           elsif lift2_floor_indicator(1)='1' then lift2floor_req<="01";
           elsif lift2_floor_indicator(2)='1' then lift2floor_req<="10";
           elsif lift2_floor_indicator(3)='1' then lift2floor_req<="11"; end if;
           if down_request_indicator(1)='1' then downfloor2_req<="01";
           elsif down_request_indicator(2)='1' then downfloor2_req<="10";
           elsif down_request_indicator(3)='1' then downfloor2_req<="11"; end if;
       elsif lift2_status(3 DOWNTO 2)="01" then
           if up_request_indicator(1)='1' then upfloor2_req<="01";
           elsif up_request_indicator(2)='1' then upfloor2_req<="10";
           elsif up_request_indicator(0)='1' then upfloor2_req<="00"; end if;
           if lift2_floor_indicator(1)='1' then lift2floor_req<="01";
           elsif lift2_floor_indicator(2)='1' then lift2floor_req<="10";
           elsif lift2_floor_indicator(3)='1' then lift2floor_req<="11";
           elsif lift2_floor_indicator(0)='1' then lift2floor_req<="00"; end if;
           if down_request_indicator(2)='1' then downfloor2_req<="10";
           elsif down_request_indicator(3)='1' then downfloor2_req<="11";
           elsif down_request_indicator(1)='1' then downfloor2_req<="01"; end if;
       elsif lift2_status(3 DOWNTO 2)="10" then
           if up_request_indicator(2)='1' then upfloor2_req<="10";
           elsif up_request_indicator(1)='1' then upfloor2_req<="01";
           elsif up_request_indicator(0)='1' then upfloor2_req<="00"; end if;
           if lift2_floor_indicator(2)='1' then lift2floor_req<="10";
           elsif lift2_floor_indicator(3)='1' then lift2floor_req<="11";
           elsif lift2_floor_indicator(1)='1' then lift2floor_req<="01";
           elsif lift2_floor_indicator(0)='1' then lift2floor_req<="00"; end if;
           if down_request_indicator(3)='1' then downfloor2_req<="11";
           elsif down_request_indicator(2)='1' then downfloor2_req<="10";
           elsif down_request_indicator(1)='1' then downfloor2_req<="01"; end if;
       elsif lift2_status(3 DOWNTO 2)="11" then
           if up_request_indicator(2)='1' then upfloor2_req<="10";
           elsif up_request_indicator(1)='1' then upfloor2_req<="01";
           elsif up_request_indicator(0)='1' then upfloor2_req<="00"; end if;
           if lift2_floor_indicator(3)='1' then lift2floor_req<="11";
           elsif lift2_floor_indicator(2)='1' then lift2floor_req<="10";
           elsif lift2_floor_indicator(1)='1' then lift2floor_req<="01";
           elsif lift2_floor_indicator(0)='1' then lift2floor_req<="00"; end if;
           if down_request_indicator(3)='1' then downfloor2_req<="11";
           elsif down_request_indicator(2)='1' then downfloor2_req<="10";
           elsif down_request_indicator(1)='1' then downfloor2_req<="01"; end if;
       end if;
    elsif lift2_up="10" then
       if lift2_status(3 DOWNTO 2)="00" then
          if up_request_indicator(0)='1' then upfloor2_req<="00";
          elsif up_request_indicator(1)='1' then upfloor2_req<="01";
          elsif up_request_indicator(2)='1' then upfloor2_req<="10"; end if;
          if lift2_floor_indicator(0)='1' then lift2floor_req<="00";
          elsif lift2_floor_indicator(3)='1' then lift2floor_req<="11";
          elsif lift2_floor_indicator(2)='1' then lift2floor_req<="10";
          elsif lift2_floor_indicator(1)='1' then lift2floor_req<="01"; end if;
          if down_request_indicator(2)='1' then downfloor2_req<="10";
          elsif down_request_indicator(1)='1' then downfloor2_req<="01";
          elsif down_request_indicator(0)='1' then downfloor2_req<="00"; end if;
      elsif lift2_status(3 DOWNTO 2)="01" then
          if up_request_indicator(0)='1' then upfloor2_req<="00";
          elsif up_request_indicator(1)='1' then upfloor2_req<="01";
          elsif up_request_indicator(2)='1' then upfloor2_req<="10"; end if;
          if lift2_floor_indicator(1)='1' then lift2floor_req<="01";
          elsif lift2_floor_indicator(0)='1' then lift2floor_req<="00";
          elsif lift2_floor_indicator(2)='1' then lift2floor_req<="10";
          elsif lift2_floor_indicator(3)='1' then lift2floor_req<="11"; end if;
          if down_request_indicator(1)='1' then downfloor2_req<="01";
          elsif down_request_indicator(2)='1' then downfloor2_req<="10";
          elsif down_request_indicator(3)='1' then downfloor2_req<="11"; end if;
      elsif lift2_status(3 DOWNTO 2)="10" then
          if up_request_indicator(1)='1' then upfloor2_req<="01";
          elsif up_request_indicator(0)='1' then upfloor2_req<="00";
          elsif up_request_indicator(2)='1' then upfloor2_req<="10"; end if;
          if lift2_floor_indicator(2)='1' then lift2floor_req<="10";
          elsif lift2_floor_indicator(1)='1' then lift2floor_req<="01";
          elsif lift2_floor_indicator(0)='1' then lift2floor_req<="00";
          elsif lift2_floor_indicator(3)='1' then lift2floor_req<="11"; end if;
          if down_request_indicator(1)='1' then downfloor2_req<="01";
          elsif down_request_indicator(2)='1' then downfloor2_req<="10";
          elsif down_request_indicator(3)='1' then downfloor2_req<="11"; end if;
      elsif lift2_status(3 DOWNTO 2)="11" then
          if up_request_indicator(2)='1' then upfloor2_req<="10";
          elsif up_request_indicator(1)='1' then upfloor2_req<="01";
          elsif up_request_indicator(0)='1' then upfloor2_req<="00"; end if;
          if lift2_floor_indicator(3)='1' then lift2floor_req<="11";
          elsif lift2_floor_indicator(2)='1' then lift2floor_req<="10";
          elsif lift2_floor_indicator(1)='1' then lift2floor_req<="01";
          elsif lift2_floor_indicator(0)='1' then lift2floor_req<="00"; end if;
          if down_request_indicator(3)='1' then downfloor2_req<="11";
          elsif down_request_indicator(2)='1' then downfloor2_req<="10";
          elsif down_request_indicator(1)='1' then downfloor2_req<="01"; end if;
      end if;
    end if;
    
    if up_request_indicator="0000" and down_request_indicator="0000" then
       if lift2_status(3 DOWNTO 2) > lift2floor_req then floor2_req<=lift2floor_req;
       else floor2_req<=lift2floor_req; 
       end if;
    elsif lift2_floor_indicator="0000" and down_request_indicator="0000" then
       if lift2_status(3 DOWNTO 2) > upfloor2_req then floor2_req<=upfloor2_req; 
       else floor2_req<=upfloor2_req;
       end if;
    elsif lift2_floor_indicator="0000" and up_request_indicator="0000" then
       if lift2_status(3 DOWNTO 2) > downfloor2_req then floor2_req<=downfloor2_req; 
       else floor2_req<=downfloor2_req; 
       end if;
    elsif lift2_floor_indicator="0000" then
       if lift2_status(3 DOWNTO 2)<upfloor2_req and lift2_status(3 DOWNTO 2)<downfloor2_req then floor2_req<=upfloor2_req;
       elsif lift2_status(3 DOWNTO 2)<upfloor2_req and lift2_status(3 DOWNTO 2)>=downfloor2_req then floor2_req<=upfloor2_req;
       elsif lift2_status(3 DOWNTO 2)>=upfloor2_req and lift2_status(3 DOWNTO 2)<downfloor2_req then floor2_req<=downfloor2_req;
       elsif lift2_status(3 DOWNTO 2)>=upfloor2_req and lift2_status(3 DOWNTO 2)>=downfloor2_req then floor2_req<=downfloor2_req;end if;
    elsif down_request_indicator="0000" then
       if lift2_status(3 DOWNTO 2)<=upfloor2_req and upfloor2_req<=lift2floor_req then floor2_req<=upfloor2_req;
       elsif lift2_status(3 DOWNTO 2)<upfloor2_req and upfloor2_req>lift2floor_req then floor2_req<=lift2floor_req;
       elsif lift2_status(3 DOWNTO 2)>=upfloor2_req and upfloor2_req<lift2floor_req then floor2_req<=lift2floor_req;
       elsif lift2_status(3 DOWNTO 2)>=upfloor2_req and upfloor2_req>=lift2floor_req then floor2_req<=lift2floor_req;
       elsif lift2floor_req<lift2_status(3 DOWNTO 2) and lift2_status(3 DOWNTO 2) < upfloor2_req then floor2_req<=lift2floor_req;
       elsif lift2floor_req>lift2_status(3 DOWNTO 2) and lift2_status(3 DOWNTO 2) >= upfloor2_req then floor2_req<=upfloor2_req;
       end if;
    elsif up_request_indicator="0000" then
       if lift2_status(3 DOWNTO 2)<downfloor2_req and downfloor2_req<=lift2floor_req then floor2_req<=lift2floor_req;
       elsif lift2_status(3 DOWNTO 2)<downfloor2_req and downfloor2_req>lift2floor_req then floor2_req<=lift2floor_req;
       elsif lift2_status(3 DOWNTO 2)>=downfloor2_req and downfloor2_req<lift2floor_req then floor2_req<=lift2floor_req;
       elsif lift2_status(3 DOWNTO 2)>=downfloor2_req and downfloor2_req>=lift2floor_req then floor2_req<=downfloor2_req;
       elsif lift2floor_req<lift2_status(3 DOWNTO 2) and lift2_status(3 DOWNTO 2) < downfloor2_req then floor2_req<=lift2floor_req;
       elsif lift2floor_req>lift2_status(3 DOWNTO 2) and lift2_status(3 DOWNTO 2) >= downfloor2_req then floor2_req<=lift2floor_req;
       end if;       
    else
       
    end if;
    
    
    if ( floor2_req > lift2_status(3 DOWNTO 2) ) THEN
        if counter2 < 50000000 and (lift2_status(1 DOWNTO 0)="01" or lift2_status(1 DOWNTO 0)="00") then counter2 <= counter2 +1; end if;
        if counter2 = 50000000 and (lift2_status(1 DOWNTO 0)="01" or lift2_status(1 DOWNTO 0)="00") then
          lift2_status(1 DOWNTO 0)<="10";
          lift2_idle<='0';
          lift2_up<="01";
          counter2<=0; end if;
        if counter2 < 200000000 and lift2_status(1 DOWNTO 0)="10" then counter2 <= counter2 +1; end if;
        if counter2 = 200000000 and lift2_status(1 DOWNTO 0)="10" then
          lift2_status(3 DOWNTO 2) <= lift2_status(3 DOWNTO 2) + 1;
          counter2<=0; 
        end if;
    elsif ( floor2_req < lift2_status(3 DOWNTO 2) ) THEN
        if counter2 < 50000000 and (lift2_status(1 DOWNTO 0)="01" or lift2_status(1 DOWNTO 0)="00") then counter2 <= counter2 +1; end if;
        if counter2 = 50000000 and (lift2_status(1 DOWNTO 0)="01" or lift2_status(1 DOWNTO 0)="00") then
        lift2_status(1 DOWNTO 0)<="11";
        lift2_idle<='0';
        lift2_up<="10";
        counter2<=0; end if;
        if counter2 < 200000000 and lift2_status(1 DOWNTO 0)="11" then counter2 <= counter2 +1; end if;
        if counter2 = 200000000 and lift2_status(1 DOWNTO 0)="11" then
           lift2_status(3 DOWNTO 2) <= lift2_status(3 DOWNTO 2) - 1;
           counter2<=0; 
        end if;
    elsif (lift2_idle='1') then
        if up_request_indicator(to_integer(unsigned(lift2_status(3 DOWNTO 2))))='1' or down_request_indicator(to_integer(unsigned(lift2_status(3 DOWNTO 2))))='1' then lift2_status(1 DOWNTO 0)<="00";elsif(lift2_status(1 DOWNTO 0)/="00") then lift2_status(1 DOWNTO 0)<="01"; end if;
        if lift2_up="01" 
        or (lift2floor_req>lift2_status(3 DOWNTO 2) and downfloor2_req>lift2_status(3 DOWNTO 2) and upfloor2_req>lift2_status(3 DOWNTO 2)) 
        or (lift2_floor_indicator="0000" and down_request_indicator="0000" and lift2_up="01") 
        or (lift2_floor_indicator="0000" and downfloor2_req>lift2_status(3 DOWNTO 2))
        or (down_request_indicator="0000" and lift2floor_req>lift2_status(3 DOWNTO 2))
        then up_request_indicator(to_integer(unsigned(lift2_status(3 DOWNTO 2))))<='0'; end if;
        if lift2_up="10" 
        or (lift2floor_req<lift2_status(3 DOWNTO 2) and downfloor2_req<lift2_status(3 DOWNTO 2) and upfloor2_req<lift2_status(3 DOWNTO 2)) 
        or (lift2_floor_indicator="0000" and up_request_indicator="0000" and lift2_up="10") 
        or (lift2_floor_indicator="0000" and upfloor2_req<lift2_status(3 DOWNTO 2))
        or (up_request_indicator="0000" and lift2floor_req<lift2_status(3 DOWNTO 2))
        then down_request_indicator(to_integer(unsigned(lift2_status(3 DOWNTO 2))))<='0'; end if;
        lift2_floor_indicator(to_integer(unsigned(lift2_status(3 DOWNTO 2))))<='0';
    elsif (floor2_req = lift2_status(3 DOWNTO 2)) THEN
        if counter2 < 150000000 then counter2 <= counter2 +1; end if;
        if counter2 = 150000000 then
          counter2<=0; 
          lift2_status(1 DOWNTO 0)<="01";
          lift2_idle <= '1';lift2floor_req<=floor2_req; 
          if lift2_up="01" 
          or (lift2floor_req>lift2_status(3 DOWNTO 2) and downfloor2_req>lift2_status(3 DOWNTO 2) and upfloor2_req>lift2_status(3 DOWNTO 2)) 
          or (lift2_floor_indicator="0000" and down_request_indicator="0000" and lift2_up="01") 
          or (lift2_floor_indicator="0000" and downfloor2_req>lift2_status(3 DOWNTO 2))
          or (down_request_indicator="0000" and lift2floor_req>lift2_status(3 DOWNTO 2))
          then up_request_indicator(to_integer(unsigned(lift2_status(3 DOWNTO 2))))<='0'; end if;
          if lift2_up="10" 
          or (lift2floor_req<lift2_status(3 DOWNTO 2) and downfloor2_req<lift2_status(3 DOWNTO 2) and upfloor2_req<lift2_status(3 DOWNTO 2)) 
          or (lift2_floor_indicator="0000" and up_request_indicator="0000" and lift2_up="10") 
          or (lift2_floor_indicator="0000" and upfloor2_req<lift2_status(3 DOWNTO 2))
          or (up_request_indicator="0000" and lift2floor_req<lift2_status(3 DOWNTO 2))
          then down_request_indicator(to_integer(unsigned(lift2_status(3 DOWNTO 2))))<='0'; end if;
          lift2_floor_indicator(to_integer(unsigned(lift2_status(3 DOWNTO 2))))<='0';
        end if;    
        if counter2 <50000000 then
            lift2_status(1 DOWNTO 0)<="00";
        elsif counter2 <150000000 then
            lift2_status(1 DOWNTO 0)<="01";            
        end if;
    end if;
    --------------------------
    if lift1_idle='1' and lift2_idle='1' and lift1_status(1 DOWNTO 0)="01" and lift2_status(1 DOWNTO 0)="01" and door_open(0)='0'  then bothliftsfree<='1'; end if;
    if (lift1_up="01" and floor_req>lift1_status(3 DOWNTO 2) and door_open(0)='0') or (lift1_up="10" and floor_req<lift1_status(3 DOWNTO 2) and door_open(0)='0')then bothliftsfree<='1'; end if;
    if (lift1_up="01" and floor_req<=lift1_status(3 DOWNTO 2)) or (lift1_up="10" and floor_req>=lift1_status(3 DOWNTO 2))then bothliftsfree<='0'; end if;
	if (lift1_up="01" and floor_req>lift1_status(3 DOWNTO 2) and lift2_floor_indicator="0000" and down_request_indicator/="0000") then bothliftsfree<='0'; floor2_req<=downfloor2_req;end if;
	if (lift1_up="10" and floor_req<lift1_status(3 DOWNTO 2) and lift2_floor_indicator="0000" and up_request_indicator/="0000") then bothliftsfree<='0'; floor2_req<=downfloor2_req;end if;
	if bothliftsfree='1' and lift2_floor_indicator="0000" then floor2_req<=lift2_status(3 DOWNTO 2); end if;
	if bothliftsfree='1' and lift2_floor_indicator="0000" and lift2_status(1 DOWNTO 0)/="00" then lift2_status(1 DOWNTO 0)<="01"; end if;
	if lift2_floor_indicator="0000" and up_request_indicator="0000" and down_request_indicator="0000" and lift2_status(1 DOWNTO 0)/="00" then lift2_status(1 DOWNTO 0)<="01"; end if;
	if lift1_floor_indicator="0000" and up_request_indicator="0000" and down_request_indicator="0000" and lift1_status(1 DOWNTO 0)/="00" then lift1_status(1 DOWNTO 0)<="01"; end if;
	
	if lift1_status(1 DOWNTO 0)="01" and door_closed(0)='1' then lift1_status(1 DOWNTO 0)<="00"; end if;
	if lift2_status(1 DOWNTO 0)="01" and door_closed(1)='1' then lift2_status(1 DOWNTO 0)<="00"; end if;
	if (lift1_status(1 DOWNTO 0)="01" or lift1_status(1 DOWNTO 0)="00") and floor_req=lift1_status(3 DOWNTO 2) and door_open(0)='1' then floor_req<=lift1_status(3 DOWNTO 2); lift1_status(1 DOWNTO 0)<="01"; end if;
    if (lift2_status(1 DOWNTO 0)="01" or lift2_status(1 DOWNTO 0)="00") and floor2_req=lift2_status(3 DOWNTO 2) and door_open(1)='1' then floor_req<=lift2_status(3 DOWNTO 2);lift2_status(1 DOWNTO 0)<="01"; end if;
	
	if (lift1_status="0001" or lift2_status="0001") then up_request_indicator(0)<='0'; end if;
	end if;
END PROCESS;

c <= "00"&lift2_status(3 DOWNTO 2)&"10"&lift2_status(1 DOWNTO 0)
    WHEN (lift2_status(1 DOWNTO 0)="10" or lift2_status(1 DOWNTO 0)="11")  
    ELSE "00"&lift2_status(3 DOWNTO 2)&"11"&lift2_status(1 DOWNTO 0);

b <= "00"&lift1_status(3 DOWNTO 2)&"10"&lift1_status(1 DOWNTO 0)&c
    WHEN (lift1_status(1 DOWNTO 0)="10" or lift1_status(1 DOWNTO 0)="11")  
    ELSE "00"&lift1_status(3 DOWNTO 2)&"11"&lift1_status(1 DOWNTO 0)&c          ;                    


end Behavioral;

