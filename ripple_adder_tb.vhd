----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 03:09:44 PM
-- Design Name: 
-- Module Name: ripple_adder_tb - Behavioral
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

entity ripple_adder_tb is
end ripple_adder_tb;

architecture Behavioral of ripple_adder_tb is
    component ripple_adder
        Port (A, B  :   in std_logic_vector(3 downto 0);
            C0    :   in std_logic;
            S     :   out std_logic_vector(3 downto 0);
            C4    :   out std_logic 
    );
    end component;
    
    signal A_tb     : std_logic_vector(3 downto 0) := (others => '0');
    signal B_tb     : std_logic_vector(3 downto 0) := (others => '0');
    signal C0_tb    : std_logic := '0';
    signal S_tb     : std_logic_vector(3 downto 0) := (others => '0');
    signal C4_tb    : std_logic := '0';
    
begin
    tb: ripple_adder port map (A=>A_tb, B=>B_tb, S=>S_tb, C0=>C0_tb, C4=>C4_tb);
    process begin
        A_tb <= "0001";
        B_tb <= "1101";
        C0_tb <= '1';
        wait for 10 ns;
        A_tb <= "0011";
        B_tb <= "0001";
        wait for 10 ns;
        A_tb <= "1000";
        B_tb <= "0111";
        C0_tb <= '0';
        wait for 10 ns;
        A_tb <= "1111";
        B_tb <= "1111";
        C0_tb <= '1';
        wait for 10 ns;
    end process;

end Behavioral;
