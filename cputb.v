module MCPUtb();


reg reset, clk;


MCPU cpuinst (clk, reset);


initial begin
  reset=1;
  #10  reset=0;
end

always begin
  #5 clk=0; 
  #5 clk=1; 
end


/********OUR ASSEMBLER*****/

integer file, i;
reg[cpuinst.WORD_SIZE-1:0] memi;
parameter  [cpuinst.OPERAND_SIZE-1:0]  R0  = 0;  //4'b0000
parameter  [cpuinst.OPERAND_SIZE-1:0]  R1  = 1;  //4'b0001
parameter  [cpuinst.OPERAND_SIZE-1:0]  R2  = 2;  //4'b0010
parameter  [cpuinst.OPERAND_SIZE-1:0]  R3  = 3;  //4'b0011
parameter  [cpuinst.OPERAND_SIZE-1:0]  R4  = 4;  //4'b0100
parameter  [cpuinst.OPERAND_SIZE-1:0]  R5  = 5;  //4'b0101
parameter  [cpuinst.OPERAND_SIZE-1:0]  R6  = 6;  //4'b0110
parameter  [cpuinst.OPERAND_SIZE-1:0]  R7  = 7;  //4'b0111
parameter  [cpuinst.OPERAND_SIZE-1:0]  R8  = 8;  //4'b1000
parameter  [cpuinst.OPERAND_SIZE-1:0]  R9  = 9;  //4'b1001
parameter  [cpuinst.OPERAND_SIZE-1:0]  RA  = 10; //4'b1010
parameter  [cpuinst.OPERAND_SIZE-1:0]  RB  = 11; //4'b1011
parameter  [cpuinst.OPERAND_SIZE-1:0]  RC  = 12; //4'b1100
parameter  [cpuinst.OPERAND_SIZE-1:0]  RD  = 13; //4'b1101
parameter  [cpuinst.OPERAND_SIZE-1:0]  RE  = 14; //4'b1110
parameter  [cpuinst.OPERAND_SIZE-1:0]  RF  = 15; //4'b1111

initial
begin

    for(i=0;i<256;i=i+1)
    begin
      cpuinst.raminst.mem[i]=0;
    end

    for(i=0; i<16; i=i+1)
    begin
      cpuinst.regfileinst.R[i]=0;
    end

                                                                                //memory address: instruction
    i=0;    cpuinst.raminst.mem[0]={cpuinst.OP_SHORT_TO_REG, R0, 8'b0100_0100}; //00: R0=0x44;
    i=i+1;  cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R2, 8'b0000_1000}; //01: R2=8;
    i=i+1;  cpuinst.raminst.mem[i]={cpuinst.OP_LSL, R0, R0, R2};                //02: R0=R0<<R2 (0x4400)
    // constant RE=1
    i=i+1;  cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, RE, 8'b0000_0001}; //03: RE=1;
    // LOOP:
    // calculate condition while (
    i=i+1;  cpuinst.raminst.mem[i]={cpuinst.OP_XOR, R2, R0, RE};                //04: R2=R0^RE;
    i=i+1;  cpuinst.raminst.mem[i]={cpuinst.OP_BNZ, R2, 8'b0000_0111};          //05: R2 ~=0? get inside loop else nextLine
    i=i+1;  cpuinst.raminst.mem[i]={cpuinst.OP_BNZ, RE, 8'b0000_1111};          //06: goto HALT (1~=0) always true 
    // ) {
    // claculate condition if (
    i=i+1;  cpuinst.raminst.mem[i]={cpuinst.OP_AND, R2, R0, RE};                //07: R2=R0&RE (mask last bit of R0)
    i=i+1;  cpuinst.raminst.mem[i]={cpuinst.OP_BNZ, R2, 8'b0000_1011};          //08: R2~=0? odd : nextLine
    // ) {
    // number is even
    i=i+1;  cpuinst.raminst.mem[i]={cpuinst.OP_RSL, R0, R0, RE};                //09: R0=R0>>RE (R0=R0/2)
    i=i+1;  cpuinst.raminst.mem[i]={cpuinst.OP_BNZ, RE, 8'b0000_0100};          //0A: goto LOOP (1~=0) always true
    // }
    // odd
    // else {
    i=i+1;  cpuinst.raminst.mem[i]={cpuinst.OP_LSL, R2, R0, RE};                //0B: R2=R0<<1 (R2=R0x2) R2 = 2R0
    i=i+1;  cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R0, R2, R0};                //0C: R0=R2+R0 (R0=R2+R0) 2R0 + R0
    i=i+1;  cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R0, R0, RE};                //0D: R0=R0+RE (R0=R0+1) 3R0 + 1
    i=i+1;  cpuinst.raminst.mem[i]={cpuinst.OP_BNZ, RE, 8'b0000_0100};          //0E: goto LOOP (1~=0) always true
    // }
    // }
    // Halt
    i=i+1;  cpuinst.raminst.mem[i]={cpuinst.OP_MOV, RF, R0};                    //0F:



    file = $fopen("program.list","w");
    for(i=0;i<cpuinst.raminst.RAM_SIZE;i=i+1)
    begin
      memi=cpuinst.raminst.mem[i];
      
      $fwrite(file, "%b_%b_%b_%b\n", 
        memi[cpuinst.INSTRUCTION_SIZE-1:cpuinst.INSTRUCTION_SIZE-cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE*3-1:2*cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE*2-1:cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE-1:0]);
    end
    $fclose(file);
end

endmodule