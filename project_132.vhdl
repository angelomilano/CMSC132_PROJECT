library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use STD.textio.all;

entity project_132 is
      port (
      CLK : in std_logic;
      F : in std_logic;
      D : in std_logic;
      E : in std_logic;
      M : in std_logic;
      W : in std_logic;
      SFlag : in std_logic;
      UFlag : in std_logic;
      OFlag : in std_logic;
      PC0 : in std_logic;
      PC1 : in std_logic;
      PC2 : in std_logic;
      PC3 : in std_logic);
end project_132;

architecture behaviour of project_132 is
subtype ins_32 is std_logic_vector(31 downto 0);
type ins_array is array(0 to 15) of ins_32;
signal instructions : ins_array;

subtype reg is std_logic_vector(1 downto 0);
type reg_array is array(0 to 31) of reg;
signal registers : reg_array;


begin
      process
            constant NUM_COL : integer := 31;
            file test_vector : text open read_mode is "input.txt";
            variable row : line;
            variable row_counter : integer := 0;      --track the current index in instructions to be inserted
            variable c: character;

            begin
                  while (not endfile(test_vector)) loop
                        readline(test_vector,row);
                        for i in 0 to NUM_COL loop
                              read(row, c);
                              --insert the line into the array of std_logic_vector named instruction
                              case c is
                                    when '0' => instructions(row_counter)(i) <= '0'; report "0";
                                    when '1' => instructions(row_counter)(i) <= '1'; report "1";
                                    when others => instructions(row_counter)(i) <= 'X'; report "X";
                              end case;
                        end loop;
                        --update line counter
                        row_counter := row_counter + 1;
                  end loop;
                  file_close(test_vector);
                  wait;
      end process;
end behaviour;
