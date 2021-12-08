; Using arithmetic modes
; arithmetic mode affects add sub mul div instructions

call chartest
call inttest
call floattest

jmp end

chartest:    
    int 9 ; ARITH_CHAR
    mov r1 65
    add r1 1
    ldr r1 push 'c' print push 10 printc
    ret

inttest:
    int 10 ; ARITH_INT
    mov r1 31415
    mov r2 10000
    div r1 r2 
    ldr r1 push 'd' print push 10 printc
    ret

floattest:
    int 11 ; ARITH_FLOAT 
    mov r1 31415
    mov r2 10000
    div r1 r2
    ldr r1 push 'f' print
    ret
 
end:
