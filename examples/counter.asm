mov r1 1
mov r2 10000

main:
    call up
    call show
    call check
    jmp main
    
up:
    add r1 0x1
    ret
    
show:
    ldr r1 
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
    
