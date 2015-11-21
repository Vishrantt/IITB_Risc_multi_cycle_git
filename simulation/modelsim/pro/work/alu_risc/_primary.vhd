library verilog;
use verilog.vl_types.all;
entity alu_risc is
    port(
        input_A         : in     vl_logic_vector(15 downto 0);
        input_B         : in     vl_logic_vector(15 downto 0);
        result          : out    vl_logic_vector(15 downto 0);
        op_sel          : in     vl_logic_vector(1 downto 0);
        flags           : out    vl_logic_vector(15 downto 0);
        aorb            : in     vl_logic
    );
end alu_risc;
