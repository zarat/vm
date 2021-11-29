push 100
push 108
push 114
push 111
push 119
push 32
push 111
push 108
push 108
push 101
push 104
push 11 ; lenght
push 1 ; location
puts

; first we print it character by character directly from memory
push 1 ; memory location
call print_string_from_memory

; print a line feed
push 10
printc

; now we bring the memory onto the stack and print it character by character
push 0 ; null terminator to mark the end
push 1 ; memory location
gets
call print_string_from_stack

jmp end


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
    pop r3 ; store the next character
    push 0
    ldr r3
    eq
    jz print_string_from_memory_end
    ldr r3 ; add the last character back onto the stack, eq has removed it
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
    
   
end:    