; convert a memory address to a number
; address on the stack
; no of digits on the stack
; base on the stack
push 1 
read

push 1
gets

si ax
dec ax

push 10 ; base
ldr ax ; no of digits
push 1  ; addr of string
call string_to_number

; print result at ax 
mul ax 2
ldr ax
print

jmp end

string_to_number:
    pop r1 ; address of string
    pop r2 ; no of digits
    dec r2
    pop r3 ;mov r3 10 ; base
    mov r4 0 ; final result 
    mov r5 1 ; current index
    call string_to_number_loop 
    mov ax r4   
    ret        
string_to_number_loop_step:
    push 1 
    ldr r2 
    ldm    
    pop r6        
    sub r6 48 ; from ascii
    mul r6 r5 ; multiply currenet index by multiplier
    add r4 r6        
    mul r5 r3 ; mul the multiplier by the base every loop
    dec r2 ; decrease digit counter        
string_to_number_loop:
    push 0
    ldr r2 ; digit counter == 0 -> done
    geq
    jz string_to_number_loop_step
    ret

end: 
    