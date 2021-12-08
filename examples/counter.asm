int 11

mov r1 1
mov r2 10000

main:
    call up
    call show
    call check
    jmp main
    
up:
    mov ax 10
    div ax 10000
    add r1 ax
    ret
    
show:
    ldr r1
    push 'f' 
    print
    push 10
    printc
    ret
    
check:
    ldr r1 
    ldr r2 
    eq
    jz reset
    ret
    
reset:
    mov r1 0
    ret

end:
    
