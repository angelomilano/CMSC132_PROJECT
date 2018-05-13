library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use STD.textio.all;

entity divide_tb is 
end divide_tb;

architecture behav of divide_tb is
	component divide
      --divide (integer division)
      port(
            div1,div2: in std_logic_vector(1 downto 0);
            quotient: out std_logic_vector(1 downto 0)
      );	
  end component;
  
	signal div1,div2: in std_logic_vector(1 downto 0);
	signal quotient: out std_logic_vector(1 downto 0);

  begin
    process (div1, div2)
    variable a: integer;
    variable b: integer;
    variable answer: integer;
    begin
      
      a := to_integer(unsigned(div1));
      b := to_integer(unsigned(div2));

      if (b = 0) then
        report "REPORT UNDEFINED";
      elsif (a = 0) then
        quotient <= "00";
      elsif (a >= b) then 
        quotient <= "01";
      elsif (a < b) then 
        quotient <= "00";       
      else quotient <= "XX"; 
      end if;
    end process;  
end behav;