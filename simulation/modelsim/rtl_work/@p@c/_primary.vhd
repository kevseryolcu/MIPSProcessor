library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        clk             : in     vl_logic;
        address         : in     vl_logic_vector(31 downto 0);
        outPC           : out    vl_logic_vector(31 downto 0)
    );
end PC;
