library verilog;
use verilog.vl_types.all;
entity generatePropogate is
    port(
        ALUOp2          : in     vl_logic;
        bi              : in     vl_logic;
        ai              : in     vl_logic;
        gi              : out    vl_logic;
        pi              : out    vl_logic
    );
end generatePropogate;
