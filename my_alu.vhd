----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 03:18:47 PM
-- Design Name: 
-- Module Name: my_alu - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_alu is
    Port (  A, B, Opcode    :   in std_logic_vector(3 downto 0);
            output          :   out std_logic_vector(3 downto 0)
    );
end my_alu;

architecture Behavioral of my_alu is
begin
    process (Opcode) is
    begin
        case (Opcode) is
            when "0000" => output <= std_logic_vector(unsigned(A)+unsigned(B));
            when "0001" => output <= std_logic_vector(unsigned(A)-unsigned(B));
            when "0010" => output <= std_logic_vector(unsigned(A)+1);
            when "0011" => output <= std_logic_vector(unsigned(A)-1);
            when "0100" => output <= std_logic_vector(0-unsigned(A));
            when "0101" => 
                if (A>B) then
                    output <= "0001";
                else 
                    output <= "0000";
                end if;
            when "0110" => output <= A(2 downto 0) & "0";
            when "0111" => output <= "0" & A(3 downto 1);
            when "1000" => output <= A(3) & A(3 downto 1);
            when "1001" => output <= not(A);
            when "1010" => output <= A AND B;
            when "1011" => output <= A OR B;
            when "1100" => output <= A XOR B;
            when "1101" => output <= A XNOR B;
            when "1110" => output <= A NAND B;
            when "1111" => output <= A NOR B;
            when others => output <= "0000";
        end case;
    end process;
end Behavioral;
