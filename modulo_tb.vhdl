library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use STD.textio.all;

entity modulo_tb is 
end modulo_tb;

architecture behav of modulo_tb is
	component modulo
      port(
            mod1,mod2: in std_logic_vector(1 downto 0);
            mod_output: out std_logic_vector(1 downto 0)
      );
	end component;
	signal mod1,mod2: in std_logic_vector(1 downto 0);
	signal mod_output: out std_logic_vector(1 downto 0);

	begin
    process(mod1,mod2)
    variable a: integer;
    variable b: integer;
    variable answer: integer;
    begin
      a := to_integer(unsigned(mod1));
      b := to_integer(unsigned(mod2));
      if (mod2 = "00") then
        report "UNDEFINED";
      elsif (mod1 = "01") then
        mod_output <= "00";
      elsif (a = b) then
        mod_output <= "00";
      elsif (a > b) then
        answer := a - b;
        mod_output <= std_logic_vector(to_unsigned(answer,2));
      elsif (a < b) then
        mod_output <= mod1;
      end if;
    end process; 
end behav;