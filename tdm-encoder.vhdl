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
  
  signal enabled:  std_logic := '0';
  signal cnt: unsigned (7 downto 0) := (others => '0'); 
  signal first_word_clock_received: std_logic := '0';
  signal second_word_clock_received: std_logic := '0';

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
  signal out1:  std_logic := '0';
  
begin

  process (clk) -- reset event
  begin
    if rising_edge(clk) then
      if cnt = 255 then
        out1 <= in1( 15 );
      elsif cnt+1 < 16 then
        out1 <= in1( to_integer(15 - ((cnt+1) mod 16)) );
      elsif cnt+1 < 32 then
        out1 <= in2( to_integer(15 - ((cnt+1) mod 16)) );     
      elsif cnt+1 < 48 then
        out1 <= in3( to_integer(15 - ((cnt+1) mod 16)) );   
      elsif cnt+1 < 64 then
        out1 <= in4( to_integer(15 - ((cnt+1) mod 16)) );
      elsif cnt+1 < 80 then
        out1 <= in5( to_integer(15 - ((cnt+1) mod 16)) ); 
      elsif cnt+1 < 96 then
        out1 <= in6( to_integer(15 - ((cnt+1) mod 16)) );
      elsif cnt+1 < 112 then
        out1 <= in7( to_integer(15 - ((cnt+1) mod 16)) );
      elsif cnt+1 < 128 then
        out1 <= in8( to_integer(15 - ((cnt+1) mod 16)) );
      elsif cnt+1 < 144 then
        out1 <= in9( to_integer(15 - ((cnt+1) mod 16)) );
      elsif cnt+1 < 160 then
        out1 <= in10( to_integer(15 - ((cnt+1) mod 16)) );
      elsif cnt+1 < 176 then
        out1 <= in11( to_integer(15 - ((cnt+1) mod 16)) );
      elsif cnt+1 < 192 then
        out1 <= in12( to_integer(15 - ((cnt+1) mod 16)) );
      elsif cnt+1 < 208 then
        out1 <= in13( to_integer(15 - ((cnt+1) mod 16)) );  
      elsif cnt+1 < 224 then
        out1 <= in14( to_integer(15 - ((cnt+1) mod 16)) );
      elsif cnt+1 < 240 then
        out1 <= in15( to_integer(15 - ((cnt+1) mod 16)) );  
      else
        out1 <= in16( to_integer(15 - ((cnt+1) mod 16)) );
      end if;
      
      if (valid_x(0) ='1') then
        in1 <= signed(cin1);
      end if; 
      if (valid_x(1) ='1') then
        in2 <= signed(cin2);
      end if;
      if (valid_x(2) ='1') then
        in3 <= signed(cin3);        
      end if;
      if (valid_x(3) ='1') then
        in4 <= signed(cin4);        
      end if;
      if (valid_x(4) ='1') then
        in5 <= signed(cin5);        
      end if;
      if (valid_x(5) ='1') then
        in6 <= signed(cin6);       
      end if;
      if (valid_x(6) ='1') then
        in7 <= signed(cin7);    
      end if;
      if (valid_x(7) ='1') then
        in8 <= signed(cin8);    
      end if;
      if (valid_x(8) ='1') then
        in9 <= signed(cin9);    
      end if;
      if (valid_x(9) ='1') then
        in10 <= signed(cin10);    
      end if;
      if (valid_x(10) ='1') then
        in11 <= signed(cin11);    
      end if;
      if (valid_x(11) ='1') then
        in12 <= signed(cin12);    
      end if;
      if (valid_x(12) ='1') then
        in13 <= signed(cin13);    
      end if;
      if (valid_x(13) ='1') then
        in14 <= signed(cin14);    
      end if;
      if (valid_x(14) ='1') then
        in15 <= signed(cin15);    
      end if;
      if (valid_x(15) ='1') then
        in16 <= signed(cin16);        
      end if;
    end if;
  end process;

  process (clk)
  begin
    if rising_edge(clk) then
      if wclk = '0' then
        cnt <= (others => '0');
      else
        cnt <= cnt + 1; 
      end if;    
    end if;
  end process;

  dout <= out1;
  valid_x <= valid;

end architecture;
