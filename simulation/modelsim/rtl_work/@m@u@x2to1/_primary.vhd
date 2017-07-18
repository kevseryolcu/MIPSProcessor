library verilog;
use verilog.vl_types.all;
entity MUX2to1 is
    port(
        R               : out    vl_logic;
        S               : in     vl_logic;
        I0              : in     vl_logic;
        I1              : in     vl_logic
    );
end MUX2to1;
