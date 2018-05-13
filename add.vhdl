library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use STD.textio.all;

entity add is 
      --add 
      port(
            add1,add2: in std_logic_vector(1 downto 0);
            carry_in: in std_logic_vector(1 downto 0);
            sum: out std_logic_vector(1 downto 0);
            carry_out: out std_logic_vector(1 downto 0);
            overflow: out bit -- overflow flag
      );
end add;

architecture behav of add is
	begin
        --addition
        sum <= add1 xor add2 xor carry_in;
        carry_out <= (add1 and add2) or (add1 and carry_in) or (add2 and carry_in);
        if( to_integer(unsigned(carry_out)) > 0) then
            overflow <= '1';
        else then overflow <= '0';
        end if;
end behav;