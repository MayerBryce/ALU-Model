library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity lab4 is
    port(Mode : in std_logic_vector(2 downto 0);
		 OE   : in std_logic;
		 A    : in std_logic_vector(15 downto 0);
		 B    : in std_logic_vector(15 downto 0);
		 C    : out std_logic_vector(15 downto 0);
		 Zero : out std_logic;
		 Cout : out std_logic);
end lab4;

architecture simple of lab4 is
begin
process(Mode, OE, A, B)
variable A_Sig, B_Sig, C_Sig: signed(16 downto 0);
begin
if (OE = '1') then
    Zero <= '0';
    if (Mode = "000") then
        A_Sig := '0' & signed(A);
        B_Sig := '0' & signed(B);
        C_Sig := A_Sig + B_Sig;
        C <= std_logic_vector(C_Sig(15 downto 0));
        Cout <= C_Sig(16);
    if (C_Sig(15 downto 0) = "0000000000000000") then
        Zero <= '1';
    end if;
    end if;
    
    if (Mode = "001") then
        A_Sig := '0' & signed(A);
        B_Sig := '0' & signed(B);
        C_Sig := A_Sig - B_Sig;
        C <= std_logic_vector(C_sig(15 downto 0));
        Cout <= C_Sig(16);
    if (C_Sig(15 downto 0) = "0000000000000000") then
        Zero <= '1';
    end if;
    end if;
   
    if (Mode = "010") then
        A_Sig := '0' & signed(A);
        C_Sig := A_Sig - A_Sig - A_Sig;
        C <= std_logic_vector(C_Sig(15 downto 0));
        Cout <= '0';
    if (C_Sig(15 downto 0) = "0000000000000000") then
        Zero <= '1';
    end if;
    end if;
    
    if (Mode = "011") then
        A_Sig := '0' & signed(A);
        C_Sig := shift_left(signed(A_Sig), 1);
        C <= std_logic_vector(C_Sig(15 downto 0));
        Cout <= C_Sig(16);
    if (C_Sig(15 downto 0) = "0000000000000000") then
        Zero <= '1';
    end if;    
    end if;
    
    if (Mode = "100") then
        A_Sig := '0' & signed(A);
        B_Sig := '0' & signed(B);
        C_Sig := A_Sig AND B_Sig;
        Cout <= C_Sig(0);
        C <= std_logic_vector(C_Sig(15 downto 0));
    if (C_Sig(15 downto 0) = "0000000000000000") then
        Zero <= '1';
    end if;
    end if;

    if (Mode = "101") then
        A_Sig := '0' & signed(A);
        B_Sig := '0' & signed(B);
        C_Sig := A_Sig OR B_Sig;
        Cout <= C_Sig(0);
        C <= std_logic_vector(C_Sig(15 downto 0));
    if (C_Sig(15 downto 0) = "0000000000000000") then
        Zero <= '1';
    end if;
    end if;
    
    if (Mode = "110") then
        A_Sig := '0' & signed(A);
        B_Sig := '0' & signed(B);
        C_Sig := A_Sig XOR B_Sig;
        Cout <= C_Sig(0);
        C <= std_logic_vector(C_Sig(15 downto 0));
    if (C_Sig(15 downto 0) = "0000000000000000") then
        Zero <= '1';
    end if;
    end if;

    if (Mode = "111") then
        A_Sig := '0' & signed(A);
        C_Sig := NOT A_Sig;
        Cout <= C_Sig(0);
        C <= std_logic_vector(C_Sig(15 downto 0));
    if (C_Sig(15 downto 0) = "0000000000000000") then
        Zero <= '1';
    end if;    
    end if;
else
    C <= "ZZZZZZZZZZZZZZZZ";
end if;
end process;

end simple;