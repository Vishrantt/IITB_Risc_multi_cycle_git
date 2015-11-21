library verilog;
use verilog.vl_types.all;
entity memory is
    port(
        data_in         : in     vl_logic_vector(15 downto 0);
        data_outs       : out    vl_logic_vector(15 downto 0);
        addr            : in     vl_logic_vector(5 downto 0);
        clk             : in     vl_logic;
        rw              : in     vl_logic_vector(1 downto 0)
    );
end memory;
