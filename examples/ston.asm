; convert a string to a number
; address of the string on the stack
; no of digits on the stack
; base on the stack
push 1 
read 

push 1
gets

si ax

push 10 ; base
push ax ; no of digits
push 1  ; addr of string

call ston

jmp end

; r1 -> addr of string
; r2 -> no of digits
; r3 -> base
; r4 -> the final result as integer
; r5 -> current index
; r6 -> tmp 
; @return ax -> result 
ston:
    pop r1
    pop r2
    dec r2
    mov r3 10 ; base
    mov r4 0 ; final number 
    mov r5 1 ; current index
    call ston_loop 
    mov ax r4   
    ret        
ston_loop_step:
    push 1 
    ldr r2 
    ldm    
    pop r6        
    sub r6 48 ; from ascii
    mul r6 r5 ; multiply currenet index by multiplier
    add r4 r6        
    mul r5 r3 ; mul the multiplier by 10 every loop
    dec r2 ; digit counter        
ston_loop:
    push 0
    ldr r2 ; digit counter == 0 -> done
    geq
    jz ston_loop_step
    ret


end:
    ;add ax 2 
    push 10 printc 
    ldr ax print
    push 1
    read ; to pause at the end
