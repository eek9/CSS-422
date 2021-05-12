*-----------------------------------------------------------
* Title      : Introduction to 68K
* Written by : Eunhee Kim
* Date       : 04/10/2021
* Description: 
*-----------------------------------------------------------
* Watch out for comments, if the text spills over to the next line and you  forget to use an asterisk, you'll get an error.

**********************************************************************

*

*  Beginning of EQUates section, just like #define in C

*

**********************************************************************

addr1     EQU     $4000        

addr2     EQU     $4001 

data2     EQU     $A7FF 

data3     EQU     $5555 

data4     EQU     $0000 

data5     EQU     4678 

data6     EQU     %01001111 

data7     EQU     %00010111 

 

**********************************************************************

*

* Beginning of code segment. This is the actual assembly language instructions.

*

*****************************************************************************************************

 

         ORG       $400          * This pseudo op code tells the assembler  here                                                                                                                         

                                           * the program will run in memory

start    MOVE.W    #data2,D0     * Load D0 

         MOVE.B    #data6,D1     * Load D1 

         MOVE.B    #data7,D2     * load D2 

         MOVE.W    #data3,D3     * load D3 

         MOVEA.W   #addr1,A0     * load address register 

         MOVE.B    D1,(A0)+      * transfer byte to memory 

         MOVE.B    D2,(A0)+      * transfer second byte

         MOVEA.W   #addr1,A1     * load address 

         AND.W     D3,(A1)       * Logical AND

 

*Stop here. The next instruction shows how a label is used

 

        JMP        start         * This instruction keeps the program

                                 * looping forever

        END   $400            * This pseudo op-code tells the assembler 

                                 * where the program source code ends and

                                 * where to load the program in memory. 

* End of the program

*******************************************************************************
*QUESTION:
*(1) What is the Byte value, Word value, and Longword value of the data in 
*memory location $4000 when the program is just about to loop back to the 
*beginning and start over again? Please describe how you got the answer as 
*well. (For example, you can describe how you analyzed the code segments, or 
*how you traced the code segments with debug tools)

*ANSWER:
*Byte value: 45
*Word value: 4515
*Longword value: 4515FF
*How I analyzed the code segments: After executing the code, I made sure to
*add in a breakpoint to the line containing the 'JMP start' and re-executed
*the code because then the it will stop right before the loop back to the 
*beginning. I then checked into the memory location $4000 and saw that it 
*contained '45' in address one of that line and '15' in the second (the rest
*of the address had FF).
*******************************************************************************

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
