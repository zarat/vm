; get the status of a digit at position x in a number
; x is on top of the stack

push 1
read

push 1
gets

si ax
push ax

call status    
jmp end

; r1 -> no of digits, decreased by 1
; r2 -> final result
; r3 -> counter
; @return ax -> result
status:
    pop r1 
    dec r1 
    mov r2 1
    mov r3 0 ; set counter to 1    
    call status_loop
    ret    
status_loop:
    mul r2 10
    inc r3      
    ldr r3
    ldr r1
    eq
    jnz status_loop    
    mov ax r2
    ret

end: 
    ldr ax 
    print
    push 1
    read ; to pause at the end
