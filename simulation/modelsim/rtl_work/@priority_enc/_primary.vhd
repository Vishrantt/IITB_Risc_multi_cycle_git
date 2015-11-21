library verilog;
use verilog.vl_types.all;
entity Priority_enc is
    port(
        in8             : in     vl_logic_vector(7 downto 0);
        out3            : out    vl_logic_vector(3 downto 0);
        load            : in     vl_logic_vector(1 downto 0);
        addr            : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic
    );
end Priority_enc;
