library verilog;
use verilog.vl_types.all;
entity MCPUtb2 is
    generic(
        R0              : vl_logic_vector;
        R1              : vl_logic_vector;
        R2              : vl_logic_vector;
        R3              : vl_logic_vector;
        R4              : vl_logic_vector;
        R5              : vl_logic_vector;
        R6              : vl_logic_vector;
        R7              : vl_logic_vector;
        R8              : vl_logic_vector;
        R9              : vl_logic_vector;
        RA              : vl_logic_vector;
        RB              : vl_logic_vector;
        RC              : vl_logic_vector;
        RD              : vl_logic_vector;
        RE              : vl_logic_vector;
        RF              : vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of R0 : constant is 4;
    attribute mti_svvh_generic_type of R1 : constant is 4;
    attribute mti_svvh_generic_type of R2 : constant is 4;
    attribute mti_svvh_generic_type of R3 : constant is 4;
    attribute mti_svvh_generic_type of R4 : constant is 4;
    attribute mti_svvh_generic_type of R5 : constant is 4;
    attribute mti_svvh_generic_type of R6 : constant is 4;
    attribute mti_svvh_generic_type of R7 : constant is 4;
    attribute mti_svvh_generic_type of R8 : constant is 4;
    attribute mti_svvh_generic_type of R9 : constant is 4;
    attribute mti_svvh_generic_type of RA : constant is 4;
    attribute mti_svvh_generic_type of RB : constant is 4;
    attribute mti_svvh_generic_type of RC : constant is 4;
    attribute mti_svvh_generic_type of RD : constant is 4;
    attribute mti_svvh_generic_type of RE : constant is 4;
    attribute mti_svvh_generic_type of RF : constant is 4;
end MCPUtb2;
