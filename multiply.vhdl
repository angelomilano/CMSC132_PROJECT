library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use STD.textio.all;

entity multiply  is
      --multiply
      port(
            mul1,mul2: in std_logic_vector(1 downto 0);
            product: out std_logic_vector(1 downto 0);
            overflow: out bit
      );
end multiply;

architecture behaviour of multiply is
  begin
    process (mul1, mul2)
    variable a: integer;
    variable b: integer;
    variable answer: integer;
    begin
      
      a := to_integer(unsigned(mul1));
      b := to_integer(unsigned(mul2));

      if ((a = 0) or (b = 0)) then
        product <= "00";
      elsif (a = 1) then
        product <= mul2;
      elsif (b = 1) then
        product <= mul1;  
      elsif (a = 2) and (b = 2) then 
        product <= "00";
        overflow <= '1';
      elsif (a = 3) and (b = 2) then 
        product <= "10"; 
        overflow <= '1';
      elsif (a = 3) and (b = 3) then 
        product <= "01";   
        overflow <= '1';
      else overflow <= '0';
         
      end if;
    end process;  
end behaviour;