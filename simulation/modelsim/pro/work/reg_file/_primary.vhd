library verilog;
use verilog.vl_types.all;
entity reg_file is
    port(
        addrA           : in     vl_logic_vector(2 downto 0);
        addrB           : in     vl_logic_vector(2 downto 0);
        addrC           : in     vl_logic_vector(2 downto 0);
        reset           : in     vl_logic;
        data_write      : in     vl_logic_vector(15 downto 0);
        output_A        : out    vl_logic_vector(15 downto 0);
        output_B        : out    vl_logic_vector(15 downto 0);
        regw            : in     vl_logic;
        clk             : in     vl_logic
    );
end reg_file;
