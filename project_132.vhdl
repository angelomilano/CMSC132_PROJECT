library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use STD.textio.all;

entity project_132 is
      --port (q: out std_logic_vector(1 downto 0); -- data output
      --clk: in std_logic); -- clock signal


end project_132;

architecture behaviour of project_132 is

subtype ins_32 is std_logic_vector(31 downto 0);
type ins_array is array(0 to 15) of ins_32;
signal instructions : ins_array;

subtype single_register is bit;
type reg_array is array(0 to 31) of single_register;
signal registers: reg_array;

signal fetch: bit;
signal decode: bit;
signal execute: bit;
signal memory: bit;
signal writeback: bit;
signal sflag: bit; --result of operation is positive, 1
signal uflow: bit; --underflow happens
signal oflow: bit; --overflow happens
signal zflag: bit; --result of operation is zero, then 1

-- components
component add is
     port(
            add1,add2: in std_logic_vector(1 downto 0);
            carry_in: in std_logic_vector(1 downto 0);
            sum: out std_logic_vector(1 downto 0);
            carry_out: out std_logic_vector(1 downto 0);
            overflow: out bit -- overflow flag
      );
end component;

component subtract is
      port(
            sub1,sub2: in std_logic_vector(1 downto 0);
            difference: out std_logic_vector(1 downto 0);
            negative: out bit --sign flag
      );
end component;

component multiply is
      port(
            mul1,mul2: in std_logic_vector(1 downto 0);
            product: out std_logic_vector(1 downto 0);
            overflow: out bit -- overflow flag
      );
end component;

component divide is
      port(
            div1,div2: in std_logic_vector(1 downto 0);
            quotient: out std_logic_vector(1 downto 0)
      );
end component;

component modulo is
      port(
            mod1,mod2: in std_logic_vector(1 downto 0);
            mod_output: out std_logic_vector(1 downto 0)
      );
end component;

-- add prtmap to map values with existing signals (flags and values of respective registers)
-- need portmap (
--);

begin
      process
            constant NUM_COL : integer := 31;
            file test_vector : text open read_mode is "input.txt";
            variable row : line;
            variable row_counter : integer := 0;
            variable c: character;

            begin
                  --store into intructions (MAX of 15 instructo=ions ar the same time)
                  while (not endfile(test_vector)) loop
                        readline(test_vector,row);
                        for i in 0 to NUM_COL loop
                              read(row, c);
                              case c is
                                    when '0' => instructions(row_counter)(i) <= '0'; report "0";
                                    when '1' => instructions(row_counter)(i) <= '1'; report "1";
                                    when others => instructions(row_counter)(i) <= 'X'; report "X";
                              end case;
                        end loop;
                        row_counter := row_counter + 1;
                  end loop;


                  --need to include here assignment of values to respective registers post operations

                  file_close(test_vector);
                  wait;
      end process;
end behaviour;
