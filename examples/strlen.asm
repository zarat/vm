; count the length of a string using memory and using the stack.

push 1
read

push 1 ; address
call strlen_memory

ldr r2
print
push 10
printc
 
push 0 ; terminator
push 1 ; address
gets 

mov r1 0 ; counter for strlen    
call strlen_stack

ldr r1 ; print the length stored at ax
print

jmp end

; get length of null terminated data in memory
; r1 - address
; r2 - counter
strlen_memory:
    pop r1
    mov r2 0
    call strlen_memory_loop
    ret
strlen_memory_loop:
    ldr r1 ; address
    ldr r2 ; index (counter)
    ldm
    push 0
    eq
    jz strlen_memory_end
    inc r2
    jmp strlen_memory_loop
strlen_memory_end:
    ret

; get length of null terminated data on the stack   
strlen_stack_loop: 
    inc r1 ; cout up
strlen_stack:       
    push 0 ; 0 to compare with the next char            
    eq 
    jnz strlen_stack_loop
    ret           
    
end:
