library verilog;
use verilog.vl_types.all;
entity processor is
    port(
        clk             : in     vl_logic;
        reset_pin       : in     vl_logic
    );
end processor;
