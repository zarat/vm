; ARITH
; 9     char
; 10    int
; 11    float

; switch to ARITH_FLOAT
int 11

; divide 2 integers to create the float '2.14159'
mov r1 214159
mov r2 100000
div r1 r2 

; create another float '0.00159' 
mov ax 159
mov bx 100000
div ax bx

; subtract '0.00159' to rount r1 to '2.14'
sub r1 ax ; 2.14

; add 1 so it is '3.14'
add r1 1

; add '0.00159' again to get '3.14159'
add r1 ax

; store at memory location 1
int 2
ldr r1
push 1
push 1
puts

; retrieve from memory and print as float
push 1
gets
push 'f'
print