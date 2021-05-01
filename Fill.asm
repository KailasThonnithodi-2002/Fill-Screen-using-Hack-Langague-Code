(loop) // a while loop, which runs the following program indefinitly (unless manually stopped)


// initalisation
@SCREEN 
D=A
@0
M=D // saving the screen's address location, in resgister 


// if statements declaration
(keyboard_effect)
@KBD // scanning the value of any keyboard input
D=M
@Key_clicked
D;JGT	// if D > 0, then we know that a key was pressed (this would mean we need to target the key_clicked reference below)
@Key_not_clicked
D;JEQ	// if D = 0, then we know that a key was not pressed (this would mean we need to target the key_not_clicked refernce below)

@keyboard_effect
0;JMP


// For the following, we will be making a switch command, more like the building blocks for the parameters, of the function (which will be created below)
(Key_clicked)
@1
M=-1	// -1, refers to filling a single pixel on the screen (this will depend on the which registers are -1)
@Result
0;JMP

(Key_not_clicked)
@1
M=0	// 0, refers to leaving the screen blank (we need this, as we can't just leave the screen black, even after we clicked a key, and lifted the finger of the key)
@Result
0;JMP



// I will create a function called result, which will depend on the parameters which fill it in (Key_clicked or Key_not_clicked)
(Result)
@1	
D=M // i need to check, which values was past (-1 or 0), depending the if statement

@0 // I know that the screen register address was saved on at register 0
A=M // accessing the updated value's register (depending on the value of R0)
M=D // pasting the value of D (either 0 or -1) into the register (selected above)

@0 
D=M+1	// need to collate the value of D (when perform the subtraction for the loop exit)

@0
M=M+1	// incrementing the pixel, by row (this will basically fill the screen)

@KBD
D=A-D	// I know that the keyboard register occurs after the screen register last pixel is filled (by performing the subtration, we can verify that all pixel are filled)


@Result
D;JGT	// this test whether the D == 0, else exit out of the pixel creation loop
@loop // This will react to any keyboard input. (goes to the start of the program)
0;JMP


