library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        count           : out    vl_logic_vector(3 downto 0);
        reset           : in     vl_logic;
        load            : in     vl_logic_vector(1 downto 0);
        addr1           : in     vl_logic_vector(2 downto 0);
        op_sel          : in     vl_logic_vector(1 downto 0);
        regw            : in     vl_logic;
        rw              : in     vl_logic_vector(1 downto 0);
        mux_ccr_sel     : in     vl_logic;
        mux_memw_sel    : in     vl_logic;
        mux_a_sel       : in     vl_logic_vector(1 downto 0);
        mux_a1_sel      : in     vl_logic;
        mux_B_sel       : in     vl_logic_vector(1 downto 0);
        mux_adi_sel     : in     vl_logic;
        mux_alu_sel     : in     vl_logic_vector(1 downto 0);
        mux_mem_sel     : in     vl_logic;
        mux_reg_sel     : in     vl_logic_vector(1 downto 0);
        mux_pc_sel      : in     vl_logic_vector(1 downto 0);
        mux_pcw_sel     : in     vl_logic_vector(1 downto 0);
        opcode          : out    vl_logic_vector(15 downto 0);
        cz              : out    vl_logic_vector(1 downto 0);
        wa              : in     vl_logic;
        wb              : in     vl_logic;
        wmdr            : in     vl_logic;
        wccr            : in     vl_logic;
        walu            : in     vl_logic;
        wir             : in     vl_logic;
        equal           : out    vl_logic;
        aorb            : in     vl_logic
    );
end datapath;
