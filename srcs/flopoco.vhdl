--------------------------------------------------------------------------------
--                RightShifterSticky26_by_max_25_Freq100_uid4
-- VHDL generated for Zynq7000 @ 100MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca (2008-2011), Florent de Dinechin (2008-2019)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 10
-- Target frequency (MHz): 100
-- Input signals: X S
-- Output signals: R Sticky
--  approx. input signal timings: X: (c0, 4.092000ns)S: (c0, 5.970000ns)
--  approx. output signal timings: R: (c0, 7.218000ns)Sticky: (c1, 0.460000ns)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity RightShifterSticky26_by_max_25_Freq100_uid4 is
    port (clk : in std_logic;
          X : in  std_logic_vector(25 downto 0);
          S : in  std_logic_vector(4 downto 0);
          R : out  std_logic_vector(25 downto 0);
          Sticky : out  std_logic   );
end entity;

architecture arch of RightShifterSticky26_by_max_25_Freq100_uid4 is
signal ps :  std_logic_vector(4 downto 0);
   -- timing of ps: (c0, 5.970000ns)
signal Xpadded :  std_logic_vector(25 downto 0);
   -- timing of Xpadded: (c0, 4.092000ns)
signal level5 :  std_logic_vector(25 downto 0);
   -- timing of level5: (c0, 4.092000ns)
signal stk4 :  std_logic;
   -- timing of stk4: (c0, 6.679500ns)
signal level4 :  std_logic_vector(25 downto 0);
   -- timing of level4: (c0, 5.970000ns)
signal stk3 :  std_logic;
   -- timing of stk3: (c0, 7.360500ns)
signal level3 :  std_logic_vector(25 downto 0);
   -- timing of level3: (c0, 6.594000ns)
signal stk2 :  std_logic;
   -- timing of stk2: (c0, 8.013000ns)
signal level2 :  std_logic_vector(25 downto 0);
   -- timing of level2: (c0, 6.594000ns)
signal stk1 :  std_logic;
   -- timing of stk1: (c0, 8.665500ns)
signal level1 :  std_logic_vector(25 downto 0);
   -- timing of level1: (c0, 7.218000ns)
signal stk0, stk0_d1 :  std_logic;
   -- timing of stk0: (c0, 9.318000ns)
signal level0 :  std_logic_vector(25 downto 0);
   -- timing of level0: (c0, 7.218000ns)
signal stk :  std_logic;
   -- timing of stk: (c1, 0.460000ns)
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            stk0_d1 <=  stk0;
         end if;
      end process;
   ps<= S;
   Xpadded <= X;
   level5<= Xpadded;
   stk4 <= '1' when (level5(15 downto 0)/="0000000000000000" and ps(4)='1')   else '0';
   level4 <=  level5 when  ps(4)='0'    else (15 downto 0 => '0') & level5(25 downto 16);
   stk3 <= '1' when (level4(7 downto 0)/="00000000" and ps(3)='1') or stk4 ='1'   else '0';
   level3 <=  level4 when  ps(3)='0'    else (7 downto 0 => '0') & level4(25 downto 8);
   stk2 <= '1' when (level3(3 downto 0)/="0000" and ps(2)='1') or stk3 ='1'   else '0';
   level2 <=  level3 when  ps(2)='0'    else (3 downto 0 => '0') & level3(25 downto 4);
   stk1 <= '1' when (level2(1 downto 0)/="00" and ps(1)='1') or stk2 ='1'   else '0';
   level1 <=  level2 when  ps(1)='0'    else (1 downto 0 => '0') & level2(25 downto 2);
   stk0 <= '1' when (level1(0 downto 0)/="0" and ps(0)='1') or stk1 ='1'   else '0';
   level0 <=  level1 when  ps(0)='0'    else (0 downto 0 => '0') & level1(25 downto 1);
   stk <= stk0_d1;
   R <= level0;
   Sticky <= stk;
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_27_Freq100_uid6
-- VHDL generated for Zynq7000 @ 100MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 10
-- Target frequency (MHz): 100
-- Input signals: X Y Cin
-- Output signals: R
--  approx. input signal timings: X: (c0, 4.092000ns)Y: (c0, 7.842000ns)Cin: (c1, 0.460000ns)
--  approx. output signal timings: R: (c1, 2.284000ns)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_27_Freq100_uid6 is
    port (clk : in std_logic;
          X : in  std_logic_vector(26 downto 0);
          Y : in  std_logic_vector(26 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(26 downto 0)   );
end entity;

architecture arch of IntAdder_27_Freq100_uid6 is
signal Rtmp :  std_logic_vector(26 downto 0);
   -- timing of Rtmp: (c1, 2.284000ns)
signal X_d1 :  std_logic_vector(26 downto 0);
   -- timing of X: (c0, 4.092000ns)
signal Y_d1 :  std_logic_vector(26 downto 0);
   -- timing of Y: (c0, 7.842000ns)
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            X_d1 <=  X;
            Y_d1 <=  Y;
         end if;
      end process;
   Rtmp <= X_d1 + Y_d1 + Cin;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                            LZC_26_Freq100_uid8
-- VHDL generated for Zynq7000 @ 100MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 10
-- Target frequency (MHz): 100
-- Input signals: I
-- Output signals: O
--  approx. input signal timings: I: (c1, 2.284000ns)
--  approx. output signal timings: O: (c1, 6.823000ns)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity LZC_26_Freq100_uid8 is
    port (clk : in std_logic;
          I : in  std_logic_vector(25 downto 0);
          O : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of LZC_26_Freq100_uid8 is
signal level5 :  std_logic_vector(30 downto 0);
   -- timing of level5: (c1, 2.284000ns)
signal digit4 :  std_logic;
   -- timing of digit4: (c1, 2.993500ns)
signal level4 :  std_logic_vector(14 downto 0);
   -- timing of level4: (c1, 3.617500ns)
signal digit3 :  std_logic;
   -- timing of digit3: (c1, 4.298500ns)
signal level3 :  std_logic_vector(6 downto 0);
   -- timing of level3: (c1, 4.922500ns)
signal digit2 :  std_logic;
   -- timing of digit2: (c1, 5.575000ns)
signal level2 :  std_logic_vector(2 downto 0);
   -- timing of level2: (c1, 6.199000ns)
signal lowBits :  std_logic_vector(1 downto 0);
   -- timing of lowBits: (c1, 6.823000ns)
signal outHighBits :  std_logic_vector(2 downto 0);
   -- timing of outHighBits: (c1, 5.575000ns)
begin
   -- pad input to the next power of two minus 1
   level5 <= I & "11111";
   -- Main iteration for large inputs
   digit4<= '1' when level5(30 downto 15) = "0000000000000000" else '0';
   level4<= level5(14 downto 0) when digit4='1' else level5(30 downto 16);
   digit3<= '1' when level4(14 downto 7) = "00000000" else '0';
   level3<= level4(6 downto 0) when digit3='1' else level4(14 downto 8);
   digit2<= '1' when level3(6 downto 3) = "0000" else '0';
   level2<= level3(2 downto 0) when digit2='1' else level3(6 downto 4);
   -- Finish counting with one LUT
   with level2  select  lowBits <= 
      "11" when "000",
      "10" when "001",
      "01" when "010",
      "01" when "011",
      "00" when others;
   outHighBits <= digit4 & digit3 & digit2 & "";
   O <= outHighBits & lowBits ;
end architecture;

--------------------------------------------------------------------------------
--                   LeftShifter27_by_max_26_Freq100_uid10
-- VHDL generated for Zynq7000 @ 100MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca (2008-2011), Florent de Dinechin (2008-2019)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles
-- Clock period (ns): 10
-- Target frequency (MHz): 100
-- Input signals: X S
-- Output signals: R
--  approx. input signal timings: X: (c1, 2.284000ns)S: (c1, 8.701000ns)
--  approx. output signal timings: R: (c2, 1.187000ns)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity LeftShifter27_by_max_26_Freq100_uid10 is
    port (clk : in std_logic;
          X : in  std_logic_vector(26 downto 0);
          S : in  std_logic_vector(4 downto 0);
          R : out  std_logic_vector(52 downto 0)   );
end entity;

architecture arch of LeftShifter27_by_max_26_Freq100_uid10 is
signal ps, ps_d1 :  std_logic_vector(4 downto 0);
   -- timing of ps: (c1, 8.701000ns)
signal level0 :  std_logic_vector(26 downto 0);
   -- timing of level0: (c1, 2.284000ns)
signal level1, level1_d1 :  std_logic_vector(27 downto 0);
   -- timing of level1: (c1, 8.701000ns)
signal level2 :  std_logic_vector(29 downto 0);
   -- timing of level2: (c2, 0.143000ns)
signal level3 :  std_logic_vector(33 downto 0);
   -- timing of level3: (c2, 0.143000ns)
signal level4 :  std_logic_vector(41 downto 0);
   -- timing of level4: (c2, 1.187000ns)
signal level5 :  std_logic_vector(57 downto 0);
   -- timing of level5: (c2, 1.187000ns)
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            ps_d1 <=  ps;
            level1_d1 <=  level1;
         end if;
      end process;
   ps<= S;
   level0<= X;
   level1<= level0 & (0 downto 0 => '0') when ps(0)= '1' else     (0 downto 0 => '0') & level0;
   level2<= level1_d1 & (1 downto 0 => '0') when ps_d1(1)= '1' else     (1 downto 0 => '0') & level1_d1;
   level3<= level2 & (3 downto 0 => '0') when ps_d1(2)= '1' else     (3 downto 0 => '0') & level2;
   level4<= level3 & (7 downto 0 => '0') when ps_d1(3)= '1' else     (7 downto 0 => '0') & level3;
   level5<= level4 & (15 downto 0 => '0') when ps_d1(4)= '1' else     (15 downto 0 => '0') & level4;
   R <= level5(52 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                         IntAdder_31_Freq100_uid13
-- VHDL generated for Zynq7000 @ 100MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles
-- Clock period (ns): 10
-- Target frequency (MHz): 100
-- Input signals: X Y Cin
-- Output signals: R
--  approx. input signal timings: X: (c2, 1.187000ns)Y: (c0, 0.000000ns)Cin: (c2, 3.065000ns)
--  approx. output signal timings: R: (c2, 5.003000ns)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_31_Freq100_uid13 is
    port (clk : in std_logic;
          X : in  std_logic_vector(30 downto 0);
          Y : in  std_logic_vector(30 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(30 downto 0)   );
end entity;

architecture arch of IntAdder_31_Freq100_uid13 is
signal Rtmp :  std_logic_vector(30 downto 0);
   -- timing of Rtmp: (c2, 5.003000ns)
signal Y_d1, Y_d2 :  std_logic_vector(30 downto 0);
   -- timing of Y: (c0, 0.000000ns)
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            Y_d1 <=  Y;
            Y_d2 <=  Y_d1;
         end if;
      end process;
   Rtmp <= X + Y_d2 + Cin;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                        IEEEFPAdd_8_23_Freq100_uid2
-- VHDL generated for Zynq7000 @ 100MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Valentin Huguet (2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles
-- Clock period (ns): 10
-- Target frequency (MHz): 100
-- Input signals: X Y
-- Output signals: R
--  approx. input signal timings: X: (c0, 0.000000ns)Y: (c0, 0.000000ns)
--  approx. output signal timings: R: (c2, 6.995000ns)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IEEEFPAdd_8_23_Freq100_uid2 is
    port (clk : in std_logic;
          X : in  std_logic_vector(31 downto 0);
          Y : in  std_logic_vector(31 downto 0);
          R : out  std_logic_vector(31 downto 0)   );
end entity;

architecture arch of IEEEFPAdd_8_23_Freq100_uid2 is
   component RightShifterSticky26_by_max_25_Freq100_uid4 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(25 downto 0);
             S : in  std_logic_vector(4 downto 0);
             R : out  std_logic_vector(25 downto 0);
             Sticky : out  std_logic   );
   end component;

   component IntAdder_27_Freq100_uid6 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(26 downto 0);
             Y : in  std_logic_vector(26 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(26 downto 0)   );
   end component;

   component LZC_26_Freq100_uid8 is
      port ( clk : in std_logic;
             I : in  std_logic_vector(25 downto 0);
             O : out  std_logic_vector(4 downto 0)   );
   end component;

   component LeftShifter27_by_max_26_Freq100_uid10 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(26 downto 0);
             S : in  std_logic_vector(4 downto 0);
             R : out  std_logic_vector(52 downto 0)   );
   end component;

   component IntAdder_31_Freq100_uid13 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(30 downto 0);
             Y : in  std_logic_vector(30 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(30 downto 0)   );
   end component;

signal expFracX :  std_logic_vector(30 downto 0);
   -- timing of expFracX: (c0, 0.000000ns)
signal expFracY :  std_logic_vector(30 downto 0);
   -- timing of expFracY: (c0, 0.000000ns)
signal expXmExpY :  std_logic_vector(8 downto 0);
   -- timing of expXmExpY: (c0, 1.368000ns)
signal expYmExpX :  std_logic_vector(8 downto 0);
   -- timing of expYmExpX: (c0, 1.368000ns)
signal swap :  std_logic;
   -- timing of swap: (c0, 1.596000ns)
signal newX, newX_d1 :  std_logic_vector(31 downto 0);
   -- timing of newX: (c0, 2.220000ns)
signal newY, newY_d1 :  std_logic_vector(31 downto 0);
   -- timing of newY: (c0, 2.220000ns)
signal expDiff :  std_logic_vector(8 downto 0);
   -- timing of expDiff: (c0, 2.220000ns)
signal expNewX, expNewX_d1 :  std_logic_vector(7 downto 0);
   -- timing of expNewX: (c0, 2.220000ns)
signal expNewY :  std_logic_vector(7 downto 0);
   -- timing of expNewY: (c0, 2.220000ns)
signal signNewX, signNewX_d1, signNewX_d2 :  std_logic;
   -- timing of signNewX: (c0, 2.220000ns)
signal signNewY, signNewY_d1, signNewY_d2 :  std_logic;
   -- timing of signNewY: (c0, 2.220000ns)
signal EffSub, EffSub_d1, EffSub_d2 :  std_logic;
   -- timing of EffSub: (c0, 2.844000ns)
signal xExpFieldZero, xExpFieldZero_d1 :  std_logic;
   -- timing of xExpFieldZero: (c0, 4.092000ns)
signal yExpFieldZero, yExpFieldZero_d1 :  std_logic;
   -- timing of yExpFieldZero: (c0, 4.092000ns)
signal xExpFieldAllOnes, xExpFieldAllOnes_d1 :  std_logic;
   -- timing of xExpFieldAllOnes: (c0, 4.092000ns)
signal yExpFieldAllOnes, yExpFieldAllOnes_d1 :  std_logic;
   -- timing of yExpFieldAllOnes: (c0, 4.092000ns)
signal xSigFieldZero :  std_logic;
   -- timing of xSigFieldZero: (c1, 3.970000ns)
signal ySigFieldZero :  std_logic;
   -- timing of ySigFieldZero: (c1, 3.970000ns)
signal xIsNaN :  std_logic;
   -- timing of xIsNaN: (c1, 4.594000ns)
signal yIsNaN :  std_logic;
   -- timing of yIsNaN: (c1, 4.594000ns)
signal xIsInfinity, xIsInfinity_d1 :  std_logic;
   -- timing of xIsInfinity: (c1, 4.594000ns)
signal yIsInfinity, yIsInfinity_d1 :  std_logic;
   -- timing of yIsInfinity: (c1, 4.594000ns)
signal xIsZero, xIsZero_d1 :  std_logic;
   -- timing of xIsZero: (c1, 4.594000ns)
signal yIsZero, yIsZero_d1 :  std_logic;
   -- timing of yIsZero: (c1, 4.594000ns)
signal bothSubNormals :  std_logic;
   -- timing of bothSubNormals: (c0, 4.716000ns)
signal resultIsNaN, resultIsNaN_d1 :  std_logic;
   -- timing of resultIsNaN: (c1, 5.218000ns)
signal significandNewX :  std_logic_vector(23 downto 0);
   -- timing of significandNewX: (c0, 4.092000ns)
signal significandNewY :  std_logic_vector(23 downto 0);
   -- timing of significandNewY: (c0, 4.092000ns)
signal allShiftedOut :  std_logic;
   -- timing of allShiftedOut: (c0, 3.588000ns)
signal rightShiftValue :  std_logic_vector(4 downto 0);
   -- timing of rightShiftValue: (c0, 4.212000ns)
signal shiftCorrection :  std_logic;
   -- timing of shiftCorrection: (c0, 4.716000ns)
signal finalRightShiftValue :  std_logic_vector(4 downto 0);
   -- timing of finalRightShiftValue: (c0, 5.970000ns)
signal significandY00 :  std_logic_vector(25 downto 0);
   -- timing of significandY00: (c0, 4.092000ns)
signal shiftedSignificandY :  std_logic_vector(25 downto 0);
   -- timing of shiftedSignificandY: (c0, 7.218000ns)
signal stickyLow, stickyLow_d1 :  std_logic;
   -- timing of stickyLow: (c1, 0.460000ns)
signal summandY :  std_logic_vector(26 downto 0);
   -- timing of summandY: (c0, 7.842000ns)
signal summandX :  std_logic_vector(26 downto 0);
   -- timing of summandX: (c0, 4.092000ns)
signal carryIn :  std_logic;
   -- timing of carryIn: (c1, 0.460000ns)
signal significandZ :  std_logic_vector(26 downto 0);
   -- timing of significandZ: (c1, 2.284000ns)
signal z1 :  std_logic;
   -- timing of z1: (c1, 2.284000ns)
signal z0 :  std_logic;
   -- timing of z0: (c1, 2.284000ns)
signal lzcZInput :  std_logic_vector(25 downto 0);
   -- timing of lzcZInput: (c1, 2.284000ns)
signal lzc :  std_logic_vector(4 downto 0);
   -- timing of lzc: (c1, 6.823000ns)
signal leftShiftVal :  std_logic_vector(4 downto 0);
   -- timing of leftShiftVal: (c1, 8.701000ns)
signal normalizedSignificand :  std_logic_vector(52 downto 0);
   -- timing of normalizedSignificand: (c2, 1.187000ns)
signal significandPreRound :  std_logic_vector(22 downto 0);
   -- timing of significandPreRound: (c2, 1.187000ns)
signal lsb :  std_logic;
   -- timing of lsb: (c2, 1.187000ns)
signal roundBit :  std_logic;
   -- timing of roundBit: (c2, 1.187000ns)
signal stickyBit :  std_logic;
   -- timing of stickyBit: (c2, 2.441000ns)
signal deltaExp :  std_logic_vector(7 downto 0);
   -- timing of deltaExp: (c1, 6.823000ns)
signal fullCancellation, fullCancellation_d1 :  std_logic;
   -- timing of fullCancellation: (c1, 7.963000ns)
signal expPreRound, expPreRound_d1 :  std_logic_vector(7 downto 0);
   -- timing of expPreRound: (c1, 8.191000ns)
signal expSigPreRound :  std_logic_vector(30 downto 0);
   -- timing of expSigPreRound: (c2, 1.187000ns)
signal roundUpBit :  std_logic;
   -- timing of roundUpBit: (c2, 3.065000ns)
signal expSigR :  std_logic_vector(30 downto 0);
   -- timing of expSigR: (c2, 5.003000ns)
signal resultIsZero :  std_logic;
   -- timing of resultIsZero: (c2, 6.371000ns)
signal resultIsInf :  std_logic;
   -- timing of resultIsInf: (c2, 6.371000ns)
signal constInf, constInf_d1, constInf_d2 :  std_logic_vector(30 downto 0);
   -- timing of constInf: (c0, 0.000000ns)
signal constNaN, constNaN_d1, constNaN_d2 :  std_logic_vector(30 downto 0);
   -- timing of constNaN: (c0, 0.000000ns)
signal expSigR2 :  std_logic_vector(30 downto 0);
   -- timing of expSigR2: (c2, 6.995000ns)
signal signR :  std_logic;
   -- timing of signR: (c2, 6.995000ns)
signal computedR :  std_logic_vector(31 downto 0);
   -- timing of computedR: (c2, 6.995000ns)
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            newX_d1 <=  newX;
            newY_d1 <=  newY;
            expNewX_d1 <=  expNewX;
            signNewX_d1 <=  signNewX;
            signNewX_d2 <=  signNewX_d1;
            signNewY_d1 <=  signNewY;
            signNewY_d2 <=  signNewY_d1;
            EffSub_d1 <=  EffSub;
            EffSub_d2 <=  EffSub_d1;
            xExpFieldZero_d1 <=  xExpFieldZero;
            yExpFieldZero_d1 <=  yExpFieldZero;
            xExpFieldAllOnes_d1 <=  xExpFieldAllOnes;
            yExpFieldAllOnes_d1 <=  yExpFieldAllOnes;
            xIsInfinity_d1 <=  xIsInfinity;
            yIsInfinity_d1 <=  yIsInfinity;
            xIsZero_d1 <=  xIsZero;
            yIsZero_d1 <=  yIsZero;
            resultIsNaN_d1 <=  resultIsNaN;
            stickyLow_d1 <=  stickyLow;
            fullCancellation_d1 <=  fullCancellation;
            expPreRound_d1 <=  expPreRound;
            constInf_d1 <=  constInf;
            constInf_d2 <=  constInf_d1;
            constNaN_d1 <=  constNaN;
            constNaN_d2 <=  constNaN_d1;
         end if;
      end process;

   -- Exponent difference and swap
   expFracX <= X(30 downto 0);
   expFracY <= Y(30 downto 0);
   expXmExpY <= ('0' & X(30 downto 23)) - ('0'  & Y(30 downto 23)) ;
   expYmExpX <= ('0' & Y(30 downto 23)) - ('0'  & X(30 downto 23)) ;
   swap <= '0' when expFracX >= expFracY else '1';
   newX <= X when swap = '0' else Y;
   newY <= Y when swap = '0' else X;
   expDiff <= expXmExpY when swap = '0' else expYmExpX;
   expNewX <= newX(30 downto 23);
   expNewY <= newY(30 downto 23);
   signNewX <= newX(31);
   signNewY <= newY(31);
   EffSub <= signNewX xor signNewY;
   -- Special case dectection
   xExpFieldZero <= '1' when expNewX="00000000" else '0';
   yExpFieldZero <= '1' when expNewY="00000000" else '0';
   xExpFieldAllOnes <= '1' when expNewX="11111111" else '0';
   yExpFieldAllOnes <= '1' when expNewY="11111111" else '0';
   xSigFieldZero <= '1' when newX_d1(22 downto 0)="00000000000000000000000" else '0';
   ySigFieldZero <= '1' when newY_d1(22 downto 0)="00000000000000000000000" else '0';
   xIsNaN <= xExpFieldAllOnes_d1 and not xSigFieldZero;
   yIsNaN <= yExpFieldAllOnes_d1 and not ySigFieldZero;
   xIsInfinity <= xExpFieldAllOnes_d1 and xSigFieldZero;
   yIsInfinity <= yExpFieldAllOnes_d1 and ySigFieldZero;
   xIsZero <= xExpFieldZero_d1 and xSigFieldZero;
   yIsZero <= yExpFieldZero_d1 and ySigFieldZero;
   bothSubNormals <=  xExpFieldZero and yExpFieldZero;
   resultIsNaN <=  xIsNaN or yIsNaN  or  (xIsInfinity and yIsInfinity and EffSub_d1);
   significandNewX <= not(xExpFieldZero) & newX(22 downto 0);
   significandNewY <= not(yExpFieldZero) & newY(22 downto 0);

   -- Significand alignment
   allShiftedOut <= '1' when (expDiff >= 26) else '0';
   rightShiftValue <= expDiff(4 downto 0) when allShiftedOut='0' else CONV_STD_LOGIC_VECTOR(26,5) ;
   shiftCorrection <= '1' when (yExpFieldZero='1' and xExpFieldZero='0') else '0'; -- only other cases are: both normal or both subnormal
   finalRightShiftValue <= rightShiftValue - ("0000" & shiftCorrection);
   significandY00 <= significandNewY & "00";
   RightShifterComponent: RightShifterSticky26_by_max_25_Freq100_uid4
      port map ( clk  => clk,
                 S => finalRightShiftValue,
                 X => significandY00,
                 R => shiftedSignificandY,
                 Sticky => stickyLow);
   summandY <= ('0' & shiftedSignificandY) xor (26 downto 0 => EffSub);


   -- Significand addition
   summandX <= '0' & significandNewX & '0' & '0';
   carryIn <= EffSub_d1 and not stickyLow;
   fracAdder: IntAdder_27_Freq100_uid6
      port map ( clk  => clk,
                 Cin => carryIn,
                 X => summandX,
                 Y => summandY,
                 R => significandZ);

   -- Cancellation detection, renormalization (see explanations in IEEEFPAdd.cpp) 
   z1 <=  significandZ(26); -- bit of weight 1
   z0 <=  significandZ(25); -- bit of weight 0
   lzcZInput <= significandZ(26 downto 1);
   IEEEFPAdd_8_23_Freq100_uid2LeadingZeroCounter: LZC_26_Freq100_uid8
      port map ( clk  => clk,
                 I => lzcZInput,
                 O => lzc);
   leftShiftVal <= 
      lzc when ((z1='1') or (z1='0' and z0='1' and xExpFieldZero_d1='1') or (z1='0' and z0='0' and xExpFieldZero_d1='0' and lzc<=expNewX_d1)  or (xExpFieldZero_d1='0' and lzc>=26) ) 
      else (expNewX_d1(4 downto 0)) when (xExpFieldZero_d1='0' and (lzc < 26) and (("000"&lzc)>=expNewX_d1)) 
       else "0000"&'1';
   LeftShifterComponent: LeftShifter27_by_max_26_Freq100_uid10
      port map ( clk  => clk,
                 S => leftShiftVal,
                 X => significandZ,
                 R => normalizedSignificand);
   significandPreRound <= normalizedSignificand(25 downto 3); -- remove the implicit zero/one
   lsb <= normalizedSignificand(3);
   roundBit <= normalizedSignificand(2);
   stickyBit <= stickyLow_d1 or  normalizedSignificand(1)or  normalizedSignificand(0);
   deltaExp <=    -- value to subtract to exponent for normalization
      "00000000" when ( (z1='0' and z0='1' and xExpFieldZero_d1='0')
          or  (z1='0' and z0='0' and xExpFieldZero_d1='1') )
      else "11111111" when ( (z1='1')  or  (z1='0' and z0='1' and xExpFieldZero_d1='1'))
      else ("000" & lzc)-'1' when (z1='0' and z0='0' and xExpFieldZero_d1='0' and lzc<=expNewX_d1 and lzc<26)      else expNewX_d1;
   fullCancellation <= '1' when (lzc>=26) else '0';
   expPreRound <= expNewX_d1 - deltaExp; -- we may have a first overflow here
   expSigPreRound <= expPreRound_d1 & significandPreRound; 
   -- Final rounding, with the mantissa overflowing in the exponent  
   roundUpBit <= '1' when roundBit='1' and (stickyBit='1' or (stickyBit='0' and lsb='1')) else '0';
   roundingAdder: IntAdder_31_Freq100_uid13
      port map ( clk  => clk,
                 Cin => roundUpBit,
                 X => expSigPreRound,
                 Y => "0000000000000000000000000000000",
                 R => expSigR);
   -- Final packing
   resultIsZero <= '1' when (fullCancellation_d1='1' and expSigR(30 downto 23)="00000000") else '0';
   resultIsInf <= '1' when resultIsNaN_d1='0' and (((xIsInfinity_d1='1' and yIsInfinity_d1='1'  and EffSub_d2='0')  or (xIsInfinity_d1='0' and yIsInfinity_d1='1')  or (xIsInfinity_d1='1' and yIsInfinity_d1='0')  or  (expSigR(30 downto 23)="11111111"))) else '0';
   constInf <= "11111111" & "00000000000000000000000";
   constNaN <= "1111111111111111111111111111111";
   expSigR2 <= constInf_d2 when resultIsInf='1' else constNaN_d2 when resultIsNaN_d1='1' else expSigR;
   signR <= '0' when ((resultIsNaN_d1='1'  or (resultIsZero='1' and xIsInfinity_d1='0' and yIsInfinity_d1='0')) and (xIsZero_d1='0' or yIsZero_d1='0' or (signNewX_d2 /= signNewY_d2)) )  else signNewX_d2;
   computedR <= signR & expSigR2;
   R <= computedR;
end architecture;