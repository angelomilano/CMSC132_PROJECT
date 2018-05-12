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


begin
      process
            constant NUM_COL : integer := 31;
            file test_vector : text open read_mode is "input.txt";
            variable row : line;
            variable row_counter : integer := 0;
            variable c: character;

            begin
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
                  file_close(test_vector);
                  wait;
      end process;
end behaviour;
