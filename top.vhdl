library ieee;
use ieee.std_logic_1164.all;

entity top IS
    port (
        PIN_1 : in std_logic; -- BCLK
        PIN_2 : in std_logic; -- DIN
        PIN_3 : in std_logic; -- WCLK
        PIN_4 : in std_logic -- n_rst
    );
end entity;

architecture Behavioral of top IS
    signal  cout1:   std_logic_vector (15 downto 0) := (others => '0');
    signal  cout2:   std_logic_vector (15 downto 0) := (others => '0');
    signal  cout3:   std_logic_vector (15 downto 0) := (others => '0');
    signal  cout4:   std_logic_vector (15 downto 0) := (others => '0');
    signal  cout5:   std_logic_vector (15 downto 0) := (others => '0');
    signal  cout6:   std_logic_vector (15 downto 0) := (others => '0');
    signal  cout7:   std_logic_vector (15 downto 0) := (others => '0');
    signal  cout8:   std_logic_vector (15 downto 0) := (others => '0');
    signal  cout9:   std_logic_vector (15 downto 0) := (others => '0');
    signal  cout10:   std_logic_vector (15 downto 0) := (others => '0');
    signal  cout11:   std_logic_vector (15 downto 0) := (others => '0');
    signal  cout12:   std_logic_vector (15 downto 0) := (others => '0');
    signal  cout13:   std_logic_vector (15 downto 0) := (others => '0');
    signal  cout14:   std_logic_vector (15 downto 0) := (others => '0');
    signal  cout15:   std_logic_vector (15 downto 0) := (others => '0');
    signal  cout16:   std_logic_vector (15 downto 0) := (others => '0');
    signal  valid:    std_logic_vector( 15 downto 0) := (others => '0');
begin
    --enc: entity work.tdm_encoder port map (clk, wclk, n_rst, cin1, cin2, cin3, cin4, cin5, cin6, cin7, cin8, cin9, cin10, cin11, cin12, cin13, cin14, cin15, cin16, input_valid, din);
    dec: entity work.tdm_decoder port map (
        clk => PIN_1, 
        din => PIN_2, 
        wclk => PIN_3, 
        n_rst => PIN_4, 
        cout1 => cout1, 
        cout2 => cout2, 
        cout3 => cout3, 
        cout4 => cout4,
        cout5 => cout5,
        cout6 => cout6,
        cout7 => cout7,
        cout8 => cout8,
        cout9 => cout9,
        cout10 => cout10,
        cout11 => cout11,
        cout12 => cout12,
        cout13 => cout13,
        cout14 => cout14,
        cout15 => cout15,
        cout16 => cout16, 
        valid => valid);

end Behavioral;