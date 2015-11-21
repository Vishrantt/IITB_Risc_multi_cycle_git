library verilog;
use verilog.vl_types.all;
entity \register\ is
    port(
        data_in         : in     vl_logic_vector(15 downto 0);
        data_out        : out    vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        w               : in     vl_logic
    );
end \register\;
