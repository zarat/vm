; Using arithmetic modes
; arithmetic mode affects add sub mul div instructions

call chartest
call inttest
call floattest

jmp end

chartest:    
    int 9 ; ARITH_CHAR
    ; mov is not affected by arith mode
    mov r7 31415
    mov r8 10000
    mov r9 0
    ; add is affected, 3.1415 which dows not fit into a single byte
    add r9 r7
    div r9 r8
    ; print
    ldr r9 push 'c' print push 10 printc
    ret

inttest:
    int 10 ; ARITH_INT
    mov r7 31415
    mov r8 10000
    mov r9 0
    ; div is affected, 3.14 dows fit into 4 bytes but is stored in a different way then integers
    ; so we end up with just the integer value before the decimal point
    add r9 r7
    div r9 r8 
    ; print
    ldr r9 push 'd' print push 10 printc
    ret

floattest:
    int 11 ; ARITH_FLOAT 
    mov r7 31415
    mov r8 10000
    mov r9 0
    add r9 r7
    div r9 r8
    ; print
    ldr r9 push 'f' print
    ret
 
end: