# GameOfPas
Conway's Game of Life implementation in Pascal 
in the code you can select the ROWS and the COLS
the procedure fillArrayCentRand(array,squareArea) will initialize every cell to 0 except for a square in the center that will initialize the cells inside him as random
the unused procedure fillArrayRand(array) will initialize all the cells as random

use fpc life.pas on the terminal to compile, then use ./life to initialize
if you dont have free pascal you can download the compiler from here:
FreePascalCompiler: https://www.freepascal.org/
be aware that the code uses an infinite loop, so you should know how to interrupt the process on the terminal.


Also take in consideration that this is not actually the game of life, for every cell counts one neighbour up, i am aware of this, but the 
pattern that makes on this configuration is more smooth other ways with the actual rules, initializing as random, is very static, i will need to implement the posibility of the user to change the grid for the actual game of life to be enjoyable. In the future maybe :P
