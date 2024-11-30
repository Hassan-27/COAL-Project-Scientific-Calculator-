INCLUDE Irvine32.inc

.DATA
; Menu and Messages
promptLineZero DB "------------ SCIENTIFIC CALCULATOR --------------",0
promptLineOne DB "1.  X + Y                    10.  NOT X",0
promptLineTwo DB "2.  X - Y                    11.  X XOR Y",0
promptLineThree DB "3.  X * Y                    12.  Absolute Value",0
promptLineFour DB "4.  X / Y                    13.  Prime or Not!",0
promptLineFive DB "5.  X mod Y                  14.  GCD",0
promptLineSix DB "6.  X^2                      15.  Factorial",0
promptLineSeven DB "7.  X^3                      16.  Negation",0
promptLineEight DB "8.  X OR Y                   17.  Exponentiation",0
promptLineNine DB "9.  X AND Y                  18.  EXIT PROGRAM",0
promptLineTen DB "-------------------------------------------------",0

choiceMsg DB "Enter your choice: ",0
resultMsg DB "The result is: ",0
invalidChoice DB "Invalid choice. Try again.",0
isPrime DB " Is Prime !", 0
isNotPrime DB " Is Not Prime !", 0


adding DB "Adding X and Y.",0
subbing DB "Subtracting X and Y.",0
multiplying DB "Multiplying X and Y.",0
dividing DB "Dividing X by Y.",0
modding DB "Calculating X mod Y.",0
squaring DB "Calculating Square of X.", 0
cubing DB "Calculating Cube of X.", 0
anding DB "Calculating X AND Y.",0
oring DB "Calculating X OR Y.",0
notting DB "Calculating NOT X.",0
xoring DB "Calculating X XOR Y.",0
absolute DB "Calculating absolute of X.", 0
primeOrNot DB "Finding if X is Prime.", 0
gcd DB "Calculating GCD of X and Y.", 0
factorial DB "Calculating Factorial of X.", 0
negating DB "Calculating Negation of X.", 0
exponentiating DB "Calculating Exponentiation of X and Y.", 0


inputX DB "Enter X: ",0
inputY DB "Enter Y: ",0


; Variables
choice DD 0
op1 DD 0
op2 DD 0
result DD 0


.CODE

; Procedure to display the menu
prompt PROC
    MOV EAX, cyan
    CALL SETTEXTCOLOR
    MOV EDX, OFFSET promptLineZero
    CALL WriteString
    CALL CRLF
    CALL CRLF
    MOV EDX, OFFSET promptLineOne
    CALL WriteString
    CALL CRLF
    MOV EDX, OFFSET promptLineTwo
    CALL WriteString
    CALL CRLF
    MOV EDX, OFFSET promptLineThree
    CALL WriteString
    CALL CRLF
    MOV EDX, OFFSET promptLineFour
    CALL WriteString
    CALL CRLF
    MOV EDX, OFFSET promptLineFive
    CALL WriteString
    CALL CRLF
    MOV EDX, OFFSET promptLineSix
    CALL WriteString
    CALL CRLF
    MOV EDX, OFFSET promptLineSeven
    CALL WriteString
    CALL CRLF
    MOV EDX, OFFSET promptLineEight
    CALL WriteString
    CALL CRLF
    MOV EDX, OFFSET promptLineNine
    CALL WriteString
    CALL CRLF
    MOV EDX, OFFSET promptLineTen
    CALL WriteString
    CALL CRLF
    RET
prompt ENDP

;---------------------------------------------------------------------------------

; Procedure to handle Addition
addFunc PROC
    MOV EDX, OFFSET adding
    CALL WriteString
    CALL CRLF
    CALL ReadOperands   ; to take 2 inputs
    MOV EAX, op1
    ADD EAX, op2
    MOV result, EAX
    RET
addFunc ENDP

; Procedure to handle Subtraction
subFunc PROC
    MOV EDX, OFFSET subbing
    CALL WriteString
    CALL CRLF
    CALL ReadOperands
    MOV EAX, op1
    SUB EAX, op2
    MOV result, EAX
    RET
subFunc ENDP

; Procedure to handle Multiplication
mulFunc PROC
    MOV EDX, OFFSET multiplying
    CALL WriteString
    CALL CRLF
    CALL ReadOperands
    MOV EAX, op1
    IMUL EAX, op2
    MOV result, EAX
    RET
mulFunc ENDP

; Procedure to handle Division
divFunc PROC
    MOV EDX, OFFSET dividing
    CALL WriteString
    CALL CRLF
    CALL ReadOperands
    MOV EAX, op1
    CDQ
    IDIV op2
    MOV result, EAX
    RET
divFunc ENDP

; Procedure to handle Modulus
modFunc PROC
    MOV EDX, OFFSET modding
    CALL WriteString
    CALL CRLF
    CALL ReadOperands
    MOV EAX, op1
    CDQ
    IDIV op2
    MOV result, EDX
    RET
modFunc ENDP

; Procedure to handle AND operation
andFunc PROC
    MOV EDX, OFFSET anding
    CALL WriteString
    CALL CRLF
    CALL ReadOperands
    MOV EAX, op1
    AND EAX, op2
    MOV result, EAX
    RET
andFunc ENDP

; Procedure to handle OR operation
orFunc PROC
    MOV EDX, OFFSET oring
    CALL WriteString
    CALL CRLF
    CALL ReadOperands
    MOV EAX, op1
    OR EAX, op2
    MOV result, EAX
    RET
orFunc ENDP

; Procedure to handle NOT operation
notFunc PROC
    MOV EDX, OFFSET notting
    CALL WriteString
    CALL CRLF
                            ; Only one operand required for NOT
    CALL ReadSingleOperand
    MOV EAX, op1
    NOT EAX
    MOV result, EAX
    RET
notFunc ENDP

; Procedure to handle XOR operation
xorFunc PROC
    MOV EDX, OFFSET xoring
    CALL WriteString
    CALL CRLF
    CALL ReadOperands
    MOV EAX, op1
    XOR EAX, op2
    MOV result, EAX
    RET
xorFunc ENDP

 ; Procedure to handle Square operation
squareFunc PROC
    MOV EDX, OFFSET squaring
    CALL WriteString
    CALL CRLF
    CALL ReadSingleOperand
    MOV EAX, op1
    MOV EBX, EAX
    MUL EBX
    MOV result, EAX
    RET
squareFunc ENDP

 ; Procedure to handle Cube operation
cubeFunc PROC
    MOV EDX, OFFSET cubing
    CALL WriteString
    CALL CRLF
    CALL ReadSingleOperand
    MOV EAX, op1
    MOV EBX, EAX
    MUL EBX
    MUL EBX
    MOV result, EAX
    RET
cubeFunc ENDP


 ;Procedure to handle Exponentiation operation
exponentiationFunc PROC
    MOV EDX, OFFSET exponentiating
    CALL WriteString
    CALL CRLF
    CALL ReadOperands

    MOV ECX, op2
    MOV EAX, op1
    MOV EBX, op1

exponentiation:
    CMP ECX, 1
    JE endExponentiation

    MUL EBX
    DEC ECX
    JMP exponentiation

endExponentiation:
    MOV result, EAX
    RET

exponentiationFunc ENDP

 ; Procedure to check Prime
primeFunc PROC
    MOV EDX, OFFSET primeOrNot
    CALL WriteString
    CALL CRLF
    CALL ReadSingleOperand

    MOV EAX, op1
    CMP EAX, 2
    JE Prime

    MOV EBX, 2
    MOV ECX, op1
    DEC ECX

PrimeLoop:
    XOR EDX, EDX

    MOV EAX, op1
    DIV EBX

    CMP EDX, 0
    JE notPrime

    INC EBX
    CMP EBX, ECX
    JE Prime

JMP PrimeLoop

notPrime:
    MOV EAX, op1
    CALL WriteDec
    MOV EDX, OFFSET isNotPrime
    CALL WriteString
    JMP endPrimeFunc

Prime:
    MOV EAX, op1
    CALL WriteDec
    MOV EDX, OFFSET isPrime
    CALL WriteString

endPrimeFunc:
    RET
primeFunc ENDP


factorialFunc PROC
    MOV EDX, OFFSET factorial
    CALL WriteString
    CALL CRLF
    CALL ReadSingleOperand
    MOV EAX, op1
    
    CMP EAX, 0
    JNZ StartFact
    MOV EAX, 1
    JMP EndFact

StartFact:
    MOV ECX, EAX
    MOV EAX, 1

FactLoop:
    MUL ECX
    DEC ECX
    JNZ FactLoop

EndFact:
    MOV result, EAX
    RET
factorialFunc ENDP


AbsoluteFunc PROC
    MOV EDX, OFFSET absolute
    CALL writeString
    CALL CRLF
    CALL ReadSingleOperand
    MOV EAX, op1
    CMP EAX, 0
    JGE SkipNegate
    NEG EAX
SkipNegate:
    MOV result, EAX
    RET
AbsoluteFunc ENDP

negateFunc PROC
    MOV EDX, OFFSET negating
    CALL writeString
    CALL CRLF
    CALL ReadSingleOperand
    MOV EAX, op1

    NEG EAX
    MOV result, EAX

    RET
negateFunc ENDP

gcdFunc PROC
    MOV EDX, OFFSET gcd
    CALL writeString
    CALL CRLF
    CALL ReadOperands

    whileLoop:
        MOV EDX, 0
        MOV EAX, op1
        MOV EBX, op2

        DIV EBX

        MOV op1, EBX
        MOV op2, EDX

        CMP op2, 0
        jg whileLoop
    
    MOV EAX, op1
    MOV result, EAX
    RET
gcdFunc ENDP

; --------------------------------------

; Procedure to read two operands
ReadOperands PROC
    MOV EDX, OFFSET inputX
    CALL writeString
    CALL ReadInt
    MOV op1, EAX
    MOV EDX, OFFSET inputY
    CALL writeString
    CALL ReadInt
    MOV op2, EAX
    RET
ReadOperands ENDP

; Procedure to read a single operand
ReadSingleOperand PROC
    MOV EDX, OFFSET inputX
    CALL writeString
    CALL ReadInt
    MOV op1, EAX
    RET
ReadSingleOperand ENDP

                     ; Procedure to display result
displayResult PROC
    MOV EDX, OFFSET resultMsg
    CALL WriteString
    MOV EAX, result
    CALL WriteInt
    CALL Crlf
    RET
displayResult ENDP

;-----------------------------------------------------------------------------

; Main Calculation Procedure
calculate PROC
    CALL CRLF
    CMP choice, 1
    JE callAdd
    CMP choice, 2
    JE callSub
    CMP choice, 3
    JE callMul
    CMP choice, 4
    JE callDiv
    CMP choice, 5
    JE callMod
    CMP choice, 6
    JE callSquare
    CMP choice, 7
    JE callCube 
    CMP choice, 8
    JE callOr
    CMP choice, 9
    JE callAnd
    CMP choice, 10
    JE callNot
    CMP choice, 11
    JE callXor
    CMP choice, 12
    JE callAbsolute
    CMP choice, 13
    JE callPrime
    CMP choice, 14
    JE callGCD
    CMP choice, 15
    JE callFactorial
    CMP choice, 16
    JE callNegation
    CMP choice, 17
    JE callExponentiation
    JMP invalidInput

callAdd:
    CALL addFunc
    JMP displayResult

callSub:
    CALL subFunc
    JMP displayResult

callMul:
    CALL mulFunc
    JMP displayResult

callDiv:
    CALL divFunc
    JMP displayResult

callMod:
    CALL modFunc
    JMP displayResult

callSquare:
    CALL squareFunc
    JMP displayResult

callCube:
    CALL cubeFunc
    JMP displayResult

callAnd:
    CALL andFunc
    JMP displayResult

callOr:
    CALL orFunc
    JMP displayResult

callNot:
    CALL notFunc
    JMP displayResult

callXor:
    CALL xorFunc
    JMP displayResult

callAbsolute:
    CALL AbsoluteFunc
    JMP displayResult

callPrime:
    CALL primeFunc
    JMP displayResult

callGCD:
    CALL gcdFunc
    JMP displayResult

callFactorial:
    CALL factorialFunc
    JMP displayResult

callNegation:
    CALL negateFunc
    JMP displayResult

callExponentiation:
    CALL exponentiationFunc
    JMP displayResult

invalidInput:
    MOV EDX, OFFSET invalidChoice
    CALL WriteString
    CALL Crlf
    RET
calculate ENDP

;---------------------------------------------------------------------------

; Main Program
main PROC
                        ; Display the menu
    CALL prompt

                        ; Loop until user chooses to exit
mainLoop:
    CALL CRLF
    MOV EAX, yellow
    CALL SETTEXTCOLOR
    MOV EDX, OFFSET choiceMsg
    CALL WriteString
    CALL ReadDec
    MOV choice, EAX

    CMP choice, 18
    JE exitProgram              ; Exit if user chooses 18

    CMP choice, 1
    JL invalidChoiceHandler
    CMP choice, 18
    JG invalidChoiceHandler

    ; Perform the calculation
    CALL calculate
    JMP mainLoop

invalidChoiceHandler:
    CALL invalidInput
    JMP mainLoop

exitProgram:
exit
main ENDP

; Procedure to display invalid choice message
invalidInput PROC
    MOV EDX, OFFSET invalidChoice
    CALL WriteString
    CALL Crlf
    RET
invalidInput ENDP

END main
