; ARITH
; 9     char
; 10    int
; 11    float

; switch to ARITH_INT
int 10

; divide 2 integers
mov r1 267400
mov r2 200
div r1 r2 

; store at memory location 1
int 2
ldr r1
push 1
push 1
puts

; retrieve from memory and print as integer '1337'
push 1
gets
push 'd'
print
