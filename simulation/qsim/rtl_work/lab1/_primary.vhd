library verilog;
use verilog.vl_types.all;
entity lab1 is
    port(
        output0         : out    vl_logic;
        reset           : in     vl_logic;
        controller      : in     vl_logic;
        in0             : in     vl_logic;
        in1             : in     vl_logic;
        in2             : in     vl_logic;
        in3             : in     vl_logic;
        in4             : in     vl_logic;
        in5             : in     vl_logic;
        in6             : in     vl_logic;
        in7             : in     vl_logic;
        shiftIn         : in     vl_logic;
        enable          : in     vl_logic;
        clk             : in     vl_logic;
        NOToutput0      : out    vl_logic;
        output1         : out    vl_logic;
        NOToutput1      : out    vl_logic;
        output2         : out    vl_logic;
        NOToutput2      : out    vl_logic;
        output3         : out    vl_logic;
        NOToutput3      : out    vl_logic;
        output4         : out    vl_logic;
        NOToutput4      : out    vl_logic;
        output5         : out    vl_logic;
        NOToutput5      : out    vl_logic;
        output6         : out    vl_logic;
        NOToutput6      : out    vl_logic;
        output7         : out    vl_logic;
        NOToutput7      : out    vl_logic
    );
end lab1;
