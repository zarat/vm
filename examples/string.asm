push 0
push "Hello world"
si ax
ldr ax ; lenght
push 1 ; location
puts

; first we print it character by character directly from memory
push 1 ; memory location
call print_string_from_memory

; print a line feed
push 10
printc

; now we bring the memory onto the stack and print it character by character
;push 0 ; null terminator to mark the end
push 1 ; memory location
gets
call print_string_from_stack

push 10
printc

; strlen
push 1
call strlen_memory

ldr ax
push 'd'
print

push 10
printc

push 0
push 1
gets
mov r1 0 ; set the counter for strlen to 0   
call strlen_stack

ldr ax
push 'd'
print

push 10
printc

; strpos
push 'w' ; pattern
push 1 ; addr
call strpos
mov bx ax

int 1 ; RW_CHAR
push "First appearance of"
si ax
ldr ax
push 2
puts

push 2
write

push '''
push 'w'
push '''
printc
printc
printc

push 0
push " found at position"
si ax
ldr ax
push 2
puts

push 2
write

ldr bx
push 'd'
print

push 10
printc

jmp end

; strpos
; get the position in a string where a specified character appears first.
; if it does not appear at all this function returns -1
; result is stored in ax
strpos:
    pop r1 ; addr
    pop r2 ; pattern
    ;ldr r1 push 1 ldm str ax ret
    mov r3 0 ; counter
strpos_loop:
    ldr r1 ; addr
    ldr r3 ; counter
    ldm
    ldr r2 ; pattern
    eq
    jz strpos_end
    ldr r1 ; addr
    ldr r3 ; counter
    ldm
    push 0
    eq
    jz strpos_end_not_found
    inc r3
    jmp strpos_loop
strpos_end:
    mov ax r3
    ret
strpos_end_not_found:
    mov ax -1
    ret

; memory location is on the stack
; we print out the next position of the memory as long as it is not equal to 0
print_string_from_memory:
    pop r1 ; memory location from stack
    mov r2 0 ; index counter
    call print_string_from_memory_loop
    ret
print_string_from_memory_loop:
    ldr r1
    ldr r2
    ldm
    pop r3 ; store the current character
    push 0
    ldr r3
    eq
    jz print_string_from_memory_end
    push r3 ; add the current character back onto the stack, eq has removed it
    printc
    inc r2 ; increment index counter
    jmp print_string_from_memory_loop
print_string_from_memory_end:
    ret


; null terminator is on the stack
; data is on the stack
; we print out the top of the stack as long as it is not equal to 0
print_string_from_stack:
    call print_string_from_stack_loop
    ret
print_string_from_stack_loop:
    printc
    str r1 ; store the next character
    push 0
    eq
    jz print_string_from_stack_end
    ldr r1 ; add the last character back onto the stack, eq has removed it
    jmp print_string_from_stack_loop
print_string_from_stack_end:
    ret

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
