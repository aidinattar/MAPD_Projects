----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2021 01:37:23 PM
-- Design Name: 
-- Module Name: tb_uart - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_uart is
--  Port ( );
end tb_uart;

architecture Behavioral of tb_uart is

component uart_top is
    Port ( clk  : in STD_LOGIC;
           --data : in std_logic;
           btn  : in STD_LOGIC;
           tx   : out STD_LOGIC );
           --busy : out STD_LOGIC);
end component uart_top;

component Baudrate is
    Port ( clk   : in STD_LOGIC;
           b_out : out STD_LOGIC);
end component Baudrate;           

signal s_clk, s_btn, s_tx, s_b_out : std_logic;
--signal size : integer := 0;
--signal fake_data : unsigned(11 downto 0) := ( '1', '1', '0', '1','1','0','0','0','0','1', '1', '1');

begin
    
    uut1 : uart_top port map ( clk => s_clk, btn => s_btn, tx => s_tx );
    uut2 : Baudrate port map ( clk => s_clk, b_out => s_b_out );
    
    p_clk : process is
    begin
        s_clk <= '1'; wait for 5 ns;
        s_clk <= '0'; wait for 5 ns;
    end process p_clk;         
    
    p_btn: process is
    begin
        s_btn <= '0'; wait for 100 ns;
        s_btn <= '1'; wait for 300000 ns;
    end process p_btn;

end Behavioral;
