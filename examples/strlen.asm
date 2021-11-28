; read input into address 1
; push it on the stack, including 0 (terminator) at the end
; compare each element on the stack to 0
; if 0 is found, its the NULL terminator we've put at the end of the string, so get out
; increment ax and loop again

main:
    push 1
    read
     
    push 0 ; terminator
    push 1 ; address
    gets 
    
    mov r1 0 ; counter for strlen    
    call strlen
    
    ldr r1 ; print the length stored at ax
    print
    jmp end
    
strlen_loop: 
    inc r1 ; cout up
strlen:       
    push 0 ; 0 to compare with the next char            
    eq 
    jnz strlen_loop
    ret           
    
end:
    push 1
    read ; to pause at the end
