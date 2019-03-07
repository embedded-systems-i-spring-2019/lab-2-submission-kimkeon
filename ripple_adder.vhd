----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 02:54:44 PM
-- Design Name: 
-- Module Name: ripple_adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_adder is
    Port (A, B  :   in std_logic_vector(3 downto 0);
          C0    :   in std_logic;
          S     :   out std_logic_vector(3 downto 0);
          C4    :   out std_logic 
    );
end ripple_adder;

architecture Behavioral of ripple_adder is
    component adder
        port(
            A, B, Cin   :   in std_logic;
            S, Cout     :   out std_logic
        );
    end component;
    
    signal C1, C2, C3   :   std_logic;
begin
    adder0: adder
        port map(
            A => A(0),
            B => B(0),
            Cin => C0,
            S => S(0),
            Cout => C1
        );
        
    adder1: adder
        port map(
            A => A(1),
            B => B(1),
            Cin => C1,
            S => S(1),
            Cout => C2
        );
        
    adder2: adder
        port map(
            A => A(2),
            B => B(2),
            Cin => C2,
            S => S(2),
            Cout => C3
        );
        
    adder3: adder
        port map(
            A => A(3),
            B => B(3),
            Cin => C3,
            S => S(3),
            Cout => C4
        );

end Behavioral;
