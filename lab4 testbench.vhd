library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity lab4_testbench is
end lab4_testbench;

architecture behavior of lab4_testbench is

  -- define the maximum delay for the DUT
  constant MAX_DELAY : time := 20 ns;

  -- define signals that connect to DUT
  signal A_sig : std_logic_vector(0 to 15);
  signal B_sig : std_logic_vector(0 to 15);
  signal C_sig : std_logic_vector(0 to 15);
  signal Mode_sig : std_logic_vector(0 to 2);
  signal OE_sig : std_logic;
  signal Zero_sig : std_logic;
  signal Cout_sig : std_logic;
  
  begin
  
    -- this is the process that will generate the inputs
	-- this is the process that will generate the inputs
    stimulus : process
      begin
        A_sig <=   "1000000000000001" after 0 ns,
                   "0000000000000011" after 10 ns,
                   "0000000000001000" after 20 ns,
                   "0000000000000001" after 30 ns,
                   "1110000000000100" after 40 ns,
                   "1010101010101010" after 50 ns,
                   "1111111111111111" after 60 ns,
                   "0000000000001111" after 70 ns,
                   "0000000000000001" after 80 ns,
                   "0000000000000010" after 90 ns,
                   "1111000000000000" after 100 ns;
				   
		B_sig <=   "1000000000000001" after 0 ns,
                   "0000000000000011" after 10 ns,
                   "0000000000000000" after 20 ns,
                   "0000000000000000" after 30 ns,
                   "1111000000000010" after 40 ns,
                   "0101010101010101" after 50 ns,
                   "1111111111111111" after 60 ns,
                   "0000000000000000" after 70 ns,
                   "0000000000000001" after 80 ns,
                   "0000000000000010" after 90 ns,
                   "1111000000000000" after 100 ns;
        
        Mode_sig <= "000" after 0 ns,
        		    "001" after 10 ns,
        		    "010" after 20 ns,
        		    "011" after 30 ns,
        		    "100" after 40 ns,
        		    "101" after 50 ns,
        		    "110" after 60 ns,
        		    "111" after 70 ns,
        		    "000" after 80 ns,
        		    "000" after 90 ns,
        		    "001" after 100 ns;
       
        OE_sig <= '1' after 0 ns,
                  '0' after 80 ns,
                  '1' after 90 ns;
                  
        wait; -- stop the process to avoid an infinite loop
    end process stimulus;

    -- this is the component instantiation for the
    -- DUT - the device we are testing
    DUT : entity work.lab4(simple)
      port map(A => A_sig, B => B_sig, C => C_sig, Mode => Mode_sig, OE => OE_sig, Zero => Zero_sig, Cout => Cout_sig);
    
end behavior;