library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use STD.textio.all;

entity subtract  is
      -- subtract 
      port(
            sub1,sub2: in std_logic_vector(1 downto 0);
            difference: out std_logic_vector(1 downto 0);
            negative: out bit
      );
end subtract;

architecture behaviour of subtract is

  begin
    process (sub1, sub2)
    variable a: integer;
    variable b: integer;
    variable answer: integer;
    begin
      
      a := to_integer(unsigned(sub1));
      b := to_integer(unsigned(sub2));
      answer := a - b;
      difference <= std_logic_vector(to_unsigned(answer,2));

      if (sub1="00") and ( (sub2="01") or (sub2="10") or (sub2="11")) then
        negative <= '1';
      elsif ( (sub1="01") and ((sub2="10") or (sub2="11") )) then 
        negative <= '1';
      elsif ( (sub1="10") and (sub2="11")) then 
        negative <= '1';
      else negative <= '0'; 
      end if;
    end process;   
end behaviour;