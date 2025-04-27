**CS220 Assignment 8 Report**

 **Rohan Potukuchi	 230864**

**Bikramjeet Singh            	230298**

# **PDS1**

## **Question: \- Decide the registers and their usage protocol.**

**Answer: \-** We have used **32 general purpose registers** (GPRs) and **32 Floating point registers** (FPRs). Each register is **32 bits** wide. Aside from this we have kept aside 2 registers Hi and Low to store the value of multiplication. All the registers are used for storage, but we have reserved GPR $31 as the destination of mfc1 and GPR $30 as the destination of mflo. FPR $31 is reserved for cc.

# **PDS2**

## **Question: \- Decide upon the size of instruction and data memory.**

**Answer: \-** We have used the in-built Vivado memory module to implement the Instruction and Data Memory (separately). Both have a **depth \= 512** and are **32 bits wide**. We have implemented a Program Counter (PC) that is 32 bits wide to keep it consistent with the standard used in MIPS, although only 9 LSB of PC will be used to access the instruction memory.

| Size (in bits) | Registers | Usage protocol |
| :---- | :---- | :---- |
| 32 | ins\_out | Stores the current instruction to be executed |
| 6 | opcode | Stores opcode of current instruction |
| 5 | Read1 | Stores address of first source register of current instruction |
| 5 | Read2 | Stores address of second source register of current instruction |
| 5 | WriteReg | Stores address of destination register of current instruction |
| 5 | shamt | Stores the shift amount of current instruction |
| 6 | func | Stores function code of current instruction |
| 26 | jump\_addr | Stores address of current J type instruction |
| 16 | immidiate | Stores address of current I type instruction |
| 1 | branch | Stores whether current instruction is a banching instruction (1) or not (0) |
| 1 | jump | Stores whether the current instruction is J type (1) or not (0) |
| 1 | MemtoReg | Stores whether the current instruction requires a write back (1) or not (0) |
| 1 | MemWrite | Stores whether the current instruction requires a write to data memory (1) or not (0) |
| 1 | RegWrite | Stores whether the current instruction writes to a GPR (1) or not (0) |
| 1 | FRegWrite | Stores whether the current instruction writes to a FPR (1) or not (0) |
| 6 | ALU\_Con | Decides the operation to be performed by the ALU |

# **PDS3**

## **Question: \- Designing the instruction layout of R, I and J-type instructions and their respective encoding methods.**

**Answer: \-**  
We decided to use the same format as MIPS for encoding the different instruction types.

**General structure of instruction encoding: \-**

1. **I-Type (immediate)**

| 31 |  | 26 | 25 |  | 21 | 20 |  | 16 | 15 |  | 0 |
| :---- | :---- | :---- | ----- | :---- | :---- | ----- | :---- | :---- | ----- | :---- | :---- |
| opcode |  |  | rs |  |  | rt |  |  | imm |  |  |

2. **J-Type (jump)**

| 31 |  | 26 | 25 |  | 0 |
| :---- | :---- | :---- | ----- | :---- | :---- |
| opcode |  |  | address |  |  |

3. **R-Type (register)**

| 31 |  | 26 | 25 |  | 21 | 20 |  | 16 | 15 |  | 11 | 10 |  | 6 | 5 |  | 0 |
| :---- | :---- | :---- | ----- | :---- | :---- | ----- | :---- | :---- | ----- | :---- | :---- | :---- | :---- | :---- | ----- | :---- | :---- |
| opcode |  |  | rs |  |  | rt |  |  | rd |  |  | shamt |  |  | func |  |  |

**Instruction encoding: \-**

1. **R-Type**

   For a given instruction, we first check the **opcode**. If that comes out to be **0**, then that instruction is **R type**. Then we check the specific instruction by **func code**.

| Instruction type | Instruction | Instruction encoding |
| ----- | :---- | :---- |
|  R type (opcode \= 0\) | add  | func \= 0 |
|  | addu  | func \= 1 |
|  | sub  | func \= 2 |
|  | subu  | func \= 3 |
|  | madd | func \= 4 |
|  | maddu | func \= 5 |
|  | mul | func \= 6 |
|  | and | func \= 7 |
|  | or  | func \= 8 |
|  | not | func \= 9 |
|  | xor | func \= 10 |
|  | sll | func \= 11 |
|  | srl | func \= 12 |
|  | sla | func \= 13 |
|  | sra | func \= 14 |
|  | slt | func \= 15 |
|  | jr | func \= 16 |

2. **I-Type**

   For immediate instructions, we have assigned opcodes 1 to 18\.

   

| Instruction type | Instruction | Instruction encoding |
| ----- | :---- | :---- |
|  I type  | addi | opcode \= 1 |
|  | addiu  | opcode \= 2 |
|  | andi | opcode \= 3 |
|  | ori | opcode \= 4 |
|  | xori | opcode \= 5 |
|  | lw | opcode \= 6 |
|  | sw | opcode \= 7 |
|  | lui | opcode \= 8 |
|  | beq | opcode \= 9 |
|  | bne | opcode \= 10 |
|  | bgt | opcode \= 11 |
|  | bgte | opcode \= 12 |
|  | ble | opcode \= 13 |
|  | bleq | opcode \= 14 |
|  | bleu | opcode \= 15 |
|  | bgtu | opcode \= 16 |
|  | slti | opcode \= 17 |
|  | seq | opcode \= 18 |

   

3. **Floating Point Instructions**

   For implementing instructions that require the FPRs, we have reserved the opcodes 21 to 30\.

| Instruction type | Instruction | Instruction encoding |
| :---- | :---- | :---- |
| Floating Point | add.s | opcode \= 21 |
|  | sub.s  | opcode \= 22 |
|  | mfc1 | opcode \= 23 |
|  | mtc1 | opcode \= 24 |
|  | c.eq.s | opcode \= 25 |
|  | c.le.s | opcode \= 26 |
|  | c.lt.s | opcode \= 27 |
|  | c.ge.s | opcode \= 28 |
|  | c.gt.s | opcode \= 29 |
|  | mov.s | opcode \= 30 |

   

4. **Other**

   In addition to the ones mentioned above, we have included 2 other instructions.

| Instruction type | Instruction encoding |
| ----- | :---- |
| mflo | opcode \= 41 |
| terminate | opcode \= 63 |

