; Using arithmetic modes
; arithmetic mode affects add sub mul div instructions

call chartest
call inttest
call floattest

jmp end

chartest:    
    int 9 ; ARITH_CHAR
    mov r7 65
    add r7 1
    ldr r7 push 'c' print push 10 printc
    ret

inttest:
    int 10 ; ARITH_INT
    mov r7 31415
    mov r8 10000
    div r7 r8 
    ldr r7 push 'd' print push 10 printc
    ret

floattest:
    int 11 ; ARITH_FLOAT 
    mov r7 31415
    mov r8 10000
    div r7 r8
    ldr r7 push 'f' print
    ret
 
end:
