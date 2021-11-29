; count the length of a string using memory and using the stack.

; read a string from stdin and store it at memory location 1
push 1
read

; strlen_memory will compute the length and store it in ax
push 1 ; memory location of the string
call strlen_memory

; print the length stored in ax
ldr ax
print

; print a line feed
push 10
printc

; strlen_stack which will count the elements on the stack until it finds a 0 and store it in ax
push 0 ; null terminator to mark the end
push 1 ; memory location
gets 
mov r1 0 ; set the counter for strlen to 0   
call strlen_stack

ldr ax ; print the length stored in ax
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
    ldr r1 ; location
    ldr r2 ; index (counter)
    ldm
    push 0
    eq
    jz strlen_memory_end
    inc r2
    jmp strlen_memory_loop
strlen_memory_end:
    mov ax r2 ; store result in ax
    ret

; get length of null terminated data on the stack   
strlen_stack_loop: 
    inc r1 ; cout up
strlen_stack:       
    push 0 ; 0 to compare with the next char            
    eq 
    jnz strlen_stack_loop
    mov ax r1
    ret           
    
end:
