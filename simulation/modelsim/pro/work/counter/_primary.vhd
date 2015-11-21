library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        clk             : in     vl_logic;
        enable          : in     vl_logic;
        count           : out    vl_logic_vector(3 downto 0);
        load            : in     vl_logic
    );
end counter;
