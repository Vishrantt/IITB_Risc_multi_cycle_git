library verilog;
use verilog.vl_types.all;
entity Priority_enc is
    port(
        \in\            : in     vl_logic_vector(7 downto 0);
        out3            : out    vl_logic_vector(3 downto 0)
    );
end Priority_enc;
