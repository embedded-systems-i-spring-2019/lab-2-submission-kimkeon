----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 04:30:32 PM
-- Design Name: 
-- Module Name: alu_tester - Behavioral
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

entity alu_tester is
    Port (clk         : in std_logic;
        btn, sw     : in std_logic_vector(3 downto 0);
        led         : out std_logic_vector(3 downto 0)
    );
end alu_tester;

architecture Behavioral of alu_tester is
    component my_alu is
        Port (  A, B, Opcode    :   in std_logic_vector(3 downto 0);
                output          :   out std_logic_vector(3 downto 0)
        );
    end component;
    
    component debounce is
        Port (  clk: in std_logic;
                btn: in std_logic;
                deb_out: out std_logic   
        );
    end component;
    
    signal A_in, B_in, Op_in, Outp      : std_logic_vector(3 downto 0) := (others => '0');
    signal deb_out0, deb_out1, deb_out2, deb_out3  : std_logic := '0';
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            if (deb_out3 = '1') then
                A_in <= "0000";
                B_in <= "0000";
                Op_in <= "0000";
            else
                if (deb_out2 ='1') then
                    Op_in <= sw;
                end if;
                if (deb_out1 = '1') then
                    A_in <= sw;
                end if;
                if (deb_out0 = '1') then
                    B_in <= sw;
                end if;
            end if;
            led <= Outp;
        end if;
    end process;
    
    alu: my_alu
    port map ( A => A_in,
               B => B_in,
               Opcode => Op_in,
               output => Outp);
    u1: debounce
        port map ( clk => clk,
                   btn => btn(0),
                   deb_out => deb_out0);
    u2: debounce
        port map ( clk => clk,
                   btn => btn(1),
                   deb_out => deb_out1);
    u3: debounce
        port map ( clk => clk,
                   btn => btn(2),
                   deb_out => deb_out2);
    u4: debounce
        port map ( clk => clk,
                   btn => btn(3),
                   deb_out => deb_out3);

end Behavioral;
