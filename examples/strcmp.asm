; function strcmp
; compare 2 strings in memory
; addresses of the strings on the stack
; no of current index is in ax
; afterwards you have to check if the result is the length of the known one

; store 2 strings in memory
push 62 push 117 push 111 push 121 push 32 push 101 push 114 push 97 push 32 push 119 push 111 push 72 push 12 push 20 puts
push 63 push 117 push 111 push 121 push 32 push 101 push 114 push 97 push 32 push 119 push 111 push 72 push 12 push 21 puts

main:
    mov r1 0 ; counter for strcmp
    mov r2 20 ; 1st string
    mov r3 21 ; 2nd string
    call strcmp
    ldr r1 ; get the result (count of equal chars)
    print
    jmp end
    
strcmp_add:
    add r1 0x1
strcmp:
    ldr r2
    ldr r1
    ldm 
    ldr r3
    ldr r1
    ldm
    eq
    jz strcmp_add
    ret
    
end:
    push 1
    read ; to pause at the end
