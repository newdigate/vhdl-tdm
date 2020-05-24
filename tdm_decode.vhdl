library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity tdm_decoder is
port (
  clk:    in  std_logic;
  din:    in  std_logic;
  wclk:   in  std_logic;
  n_rst:  in  std_logic;

  cout1:   out std_logic_vector( 15 downto 0); 
  cout2:   out std_logic_vector( 15 downto 0); 
  cout3:   out std_logic_vector( 15 downto 0);
  cout4:   out std_logic_vector( 15 downto 0); 
  cout5:   out std_logic_vector( 15 downto 0); 
  cout6:   out std_logic_vector( 15 downto 0); 
  cout7:   out std_logic_vector( 15 downto 0); 
  cout8:   out std_logic_vector( 15 downto 0); 
  cout9:   out std_logic_vector( 15 downto 0); 
  cout10:   out std_logic_vector( 15 downto 0); 
  cout11:   out std_logic_vector( 15 downto 0); 
  cout12:   out std_logic_vector( 15 downto 0); 
  cout13:   out std_logic_vector( 15 downto 0); 
  cout14:   out std_logic_vector( 15 downto 0); 
  cout15:   out std_logic_vector( 15 downto 0); 
  cout16:   out std_logic_vector( 15 downto 0)
);
end entity;

architecture behaviour of tdm_decoder is
  signal cnt: unsigned (7 downto 0) := (others => '0'); 
  signal out1:  signed ( 15 downto 0) := (others => '0');  
  signal out2:  signed( 15 downto 0) := (others => '0'); 
  signal out3:  signed( 15 downto 0) := (others => '0'); 
  signal out4:  signed( 15 downto 0) := (others => '0'); 
  signal out5:  signed( 15 downto 0) := (others => '0'); 
  signal out6:  signed( 15 downto 0) := (others => '0'); 
  signal out7:  signed( 15 downto 0) := (others => '0'); 
  signal out8:  signed( 15 downto 0) := (others => '0'); 
  signal out9:  signed( 15 downto 0) := (others => '0'); 
  signal out10:  signed( 15 downto 0) := (others => '0'); 
  signal out11:  signed( 15 downto 0) := (others => '0'); 
  signal out12:  signed( 15 downto 0) := (others => '0'); 
  signal out13:  signed( 15 downto 0) := (others => '0'); 
  signal out14:  signed( 15 downto 0) := (others => '0'); 
  signal out15:  signed( 15 downto 0) := (others => '0'); 
  signal out16:  signed( 15 downto 0) := (others => '0'); 
begin
  process (clk, n_rst, wclk)
  begin
    if n_rst = '0' then
      cnt <= (others => '0');
    else
      
      if falling_edge(wclk) then
        cnt <= (others => '0');
      elsif falling_edge(clk) then
        cnt <= cnt + 1;
      end if;   
    
      if cnt < 16 then
        out1( to_integer(15 - cnt) ) <= din;
      elsif cnt < 32 then
        out2( to_integer(15 - (cnt mod 16)) ) <= din;
      elsif cnt < 48 then
        out3( to_integer(15 - (cnt mod 16)) ) <= din;
      elsif cnt < 64 then
        out4( to_integer(15 - (cnt mod 16)) ) <= din;
      elsif cnt < 80 then
        out5( to_integer(15 - (cnt mod 16)) ) <= din;
      elsif cnt < 96 then
        out6( to_integer(15 - (cnt mod 16)) ) <= din;
      elsif cnt < 112 then
        out7( to_integer(15 - (cnt mod 16)) ) <= din;
      elsif cnt < 128 then
        out8( to_integer(15 - (cnt mod 16)) ) <= din;
      elsif cnt < 144 then
        out9( to_integer(15 - (cnt mod 16)) ) <= din;
      elsif cnt < 160 then
        out10( to_integer(15 - (cnt mod 16)) ) <= din;
      elsif cnt < 176 then
        out11( to_integer(15 - (cnt mod 16)) ) <= din;
      elsif cnt < 192 then
        out12( to_integer(15 - (cnt mod 16)) ) <= din;
      elsif cnt < 208 then
        out13( to_integer(15 - (cnt mod 16)) ) <= din;
      elsif cnt < 224 then
        out14( to_integer(15 - (cnt mod 16)) ) <= din;
      elsif cnt < 240 then
        out15( to_integer(15 - (cnt mod 16)) ) <= din;
      else
        out16( to_integer(15 - (cnt mod 16)) ) <= din;

      end if;
    end if;
  end process;

  cout1 <= std_logic_vector(out1);
  cout2 <= std_logic_vector(out2);
  cout3 <= std_logic_vector(out3);
  cout4 <= std_logic_vector(out4);
  cout5 <= std_logic_vector(out5);
  cout6 <= std_logic_vector(out6);
  cout7 <= std_logic_vector(out7);
  cout8 <= std_logic_vector(out8);
  cout9 <= std_logic_vector(out9);
  cout10 <= std_logic_vector(out10);
  cout11 <= std_logic_vector(out11);
  cout12 <= std_logic_vector(out12);
  cout13 <= std_logic_vector(out13);
  cout14 <= std_logic_vector(out14);
  cout15 <= std_logic_vector(out15);
  cout16 <= std_logic_vector(out16);
end architecture;
