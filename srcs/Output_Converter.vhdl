--------------------------------------------------------------------------------
--                    OutputIEEE_8_23_to_8_23_Freq100_uid2
-- VHDL generated for Zynq7000 @ 100MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: F. Ferrandi  (2009-2012)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 10
-- Target frequency (MHz): 100
-- Input signals: X
-- Output signals: R
--  approx. input signal timings: X: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 0.248000ns)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity OutputIEEE_8_23_to_8_23_Freq100_uid2 is
    port (clk : in std_logic;
          X : in  std_logic_vector(8+23+2 downto 0);
          R : out  std_logic_vector(31 downto 0)   );
end entity;

architecture arch of OutputIEEE_8_23_to_8_23_Freq100_uid2 is
signal fracX :  std_logic_vector(22 downto 0);
   -- timing of fracX: (c0, 0.000000ns)
signal exnX :  std_logic_vector(1 downto 0);
   -- timing of exnX: (c0, 0.000000ns)
signal expX :  std_logic_vector(7 downto 0);
   -- timing of expX: (c0, 0.000000ns)
signal sX :  std_logic;
   -- timing of sX: (c0, 0.124000ns)
signal expZero :  std_logic;
   -- timing of expZero: (c0, 0.124000ns)
signal fracR :  std_logic_vector(22 downto 0);
   -- timing of fracR: (c0, 0.248000ns)
signal expR :  std_logic_vector(7 downto 0);
   -- timing of expR: (c0, 0.124000ns)
begin
   fracX  <= X(22 downto 0);
   exnX  <= X(33 downto 32);
   expX  <= X(30 downto 23);
   sX  <= X(31) when (exnX = "01" or exnX = "10" or exnX = "00") else '0';
   expZero  <= '1' when expX = (7 downto 0 => '0') else '0';
   -- since we have one more exponent value than IEEE (field 0...0, value emin-1),
   -- we can represent subnormal numbers whose mantissa field begins with a 1
   fracR <= 
      "00000000000000000000000" when (exnX = "00") else
      '1' & fracX(22 downto 1) & "" when (expZero = '1' and exnX = "01") else
      fracX  & "" when (exnX = "01") else
      "0000000000000000000000" & exnX(0);
   expR <=  
      (7 downto 0 => '0') when (exnX = "00") else
      expX when (exnX = "01") else 
      (7 downto 0 => '1');
   R <= sX & expR & fracR; 
end architecture;

