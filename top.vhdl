library ieee;
use ieee.std_logic_1164.all;

entity top IS
    port (
        CLK   : in std_logic; -- 50MHz
        LED   : out std_logic
    );
end entity;

architecture Behavioral of top IS
--    component FreqDivider
--        generic (DIVIDER : integer);
--
--        port (
--            clk    : in std_logic;
--            reset  : in std_logic;
--            clkOut : out std_logic
--        );
--    end component;

    signal s_clk2 : std_logic := '0'; -- Hz
    signal s_clk1 : std_logic := '0'; -- Hz

begin
    LED <= '1';
end Behavioral;