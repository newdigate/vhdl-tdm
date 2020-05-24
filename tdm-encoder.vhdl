library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity tdm_encoder is
port (
  clk:    in  std_logic;
  wclk:   in  std_logic;
  n_rst:  in  std_logic;

  cin1:   in std_logic_vector( 15 downto 0); 
  cin2:   in std_logic_vector( 15 downto 0); 
  cin3:   in std_logic_vector( 15 downto 0);
  cin4:   in std_logic_vector( 15 downto 0); 
  cin5:   in std_logic_vector( 15 downto 0); 
  cin6:   in std_logic_vector( 15 downto 0); 
  cin7:   in std_logic_vector( 15 downto 0); 
  cin8:   in std_logic_vector( 15 downto 0); 
  cin9:   in std_logic_vector( 15 downto 0); 
  cin10:   in std_logic_vector( 15 downto 0); 
  cin11:   in std_logic_vector( 15 downto 0); 
  cin12:   in std_logic_vector( 15 downto 0); 
  cin13:   in std_logic_vector( 15 downto 0); 
  cin14:   in std_logic_vector( 15 downto 0); 
  cin15:   in std_logic_vector( 15 downto 0); 
  cin16:   in std_logic_vector( 15 downto 0);
  valid:   in std_logic_vector( 15 downto 0);

  dout:    out  std_logic
);
end entity;

architecture behaviour of tdm_encoder is
  signal out1:  std_logic := '0';
  signal out2:  std_logic := '0';
  signal cnt: unsigned (7 downto 0) := (others => '0'); 
  signal in1:  signed ( 15 downto 0) := (others => '0');  
  signal in2:  signed( 15 downto 0) := (others => '0'); 
  signal in3:  signed( 15 downto 0) := (others => '0'); 
  signal in4:  signed( 15 downto 0) := (others => '0'); 
  signal in5:  signed( 15 downto 0) := (others => '0'); 
  signal in6:  signed( 15 downto 0) := (others => '0'); 
  signal in7:  signed( 15 downto 0) := (others => '0'); 
  signal in8:  signed( 15 downto 0) := (others => '0'); 
  signal in9:  signed( 15 downto 0) := (others => '0'); 
  signal in10:  signed( 15 downto 0) := (others => '0'); 
  signal in11:  signed( 15 downto 0) := (others => '0'); 
  signal in12:  signed( 15 downto 0) := (others => '0'); 
  signal in13:  signed( 15 downto 0) := (others => '0'); 
  signal in14:  signed( 15 downto 0) := (others => '0'); 
  signal in15:  signed( 15 downto 0) := (others => '0'); 
  signal in16:  signed( 15 downto 0) := (others => '0'); 
  signal valid_x:  std_logic_vector( 15 downto 0) := (others => '0');
begin
  process (clk, n_rst, valid_x, wclk)
  begin
    if n_rst = '0' then
      cnt <= (others => '0');
    else     
      if falling_edge(wclk) then
        cnt <= (others => '0');
      elsif falling_edge(clk) then
        cnt <= cnt + 1;
        if cnt < 16 then
          out1 <= in1( to_integer(15 -  cnt mod 16) );
        elsif cnt < 32 then
          out1 <= in2( to_integer(15 - cnt mod 16) );     
        elsif cnt < 48 then
          out1 <= in3( to_integer(15 - cnt mod 16) );   
        elsif cnt < 64 then
          out1 <= in4( to_integer(15 - cnt mod 16) );   
        elsif cnt < 80 then
          out1 <= in5( to_integer(15 - cnt mod 16) );   
        elsif cnt < 96 then
          out1 <= in6( to_integer(15 - cnt mod 16) );   
        elsif cnt < 112 then
          out1 <= in7( to_integer(15 - cnt mod 16) );   
        elsif cnt < 128 then
          out1 <= in8( to_integer(15 - cnt mod 16) );   
        elsif cnt < 144 then
          out1 <= in9( to_integer(15 - cnt mod 16) );   
        elsif cnt < 160 then
          out1 <= in10( to_integer(15 - cnt mod 16) );   
        elsif cnt < 176 then
          out1 <= in11( to_integer(15 - cnt mod 16) );   
        elsif cnt < 192 then
          out1 <= in12( to_integer(15 - cnt mod 16) );   
        elsif cnt < 208 then
          out1 <= in13( to_integer(15 - cnt mod 16) );   
        elsif cnt < 224 then
          out1 <= in14( to_integer(15 - cnt mod 16) );   
        elsif cnt < 240 then
          out1 <= in15( to_integer(15 - cnt mod 16) );   
        else
          out1 <= in16( to_integer(15 - cnt mod 16) );   
        end if;
      end if;   

      out2 <= out1;
    end if;
  end process;

  process (clk)
  begin
    if falling_edge(clk) then 
      if (valid_x(0) ='1') then
        in1 <= signed(cin1);
      elsif (valid_x(1) ='1') then
        in2 <= signed(cin2);
      elsif (valid_x(2) ='1') then
        in3 <= signed(cin3);        
      elsif (valid_x(3) ='1') then
        in4 <= signed(cin4);        
      elsif (valid_x(4) ='1') then
        in5 <= signed(cin5);        
      elsif (valid_x(5) ='1') then
        in6 <= signed(cin6);       
      elsif (valid_x(6) ='1') then
        in7 <= signed(cin7);    
      elsif (valid_x(7) ='1') then
        in8 <= signed(cin8);    
      elsif (valid_x(8) ='1') then
        in9 <= signed(cin9);    
      elsif (valid_x(9) ='1') then
        in10 <= signed(cin10);    
      elsif (valid_x(10) ='1') then
        in11 <= signed(cin11);    
      elsif (valid_x(11) ='1') then
        in12 <= signed(cin12);    
      elsif (valid_x(12) ='1') then
        in13 <= signed(cin13);    
      elsif (valid_x(13) ='1') then
        in14 <= signed(cin14);    
      elsif (valid_x(14) ='1') then
        in15 <= signed(cin15);    
      elsif (valid_x(15) ='1') then
        in16 <= signed(cin16);        
      end if;
    end if;
  end process;

  dout <= out2;
  valid_x <= valid;
end architecture;
