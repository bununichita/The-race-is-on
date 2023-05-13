%include "../include/io.mac"

section .data


section .text
    global bonus
    extern printf

bonus:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; board

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE
    
    xor esi, esi ; esi si edi sunt registrii care trebuiesc returnati
    xor edi, edi

    push eax
    push ebx
    inc eax
    dec ebx
    cmp eax, 7
    jg dreapta_sus
    cmp ebx, 0
    jl dreapta_sus
    imul edx, eax, 8
    add edx, ebx    
    pop ebx
    pop eax

    cmp edx, 31
    jg add_esi1
    jmp add_edi1

add_esi1:
    sub edx, 32
    push eax
    mov eax, 1
    cmp edx, 0
    je power_zero_esi1

pow_esi1:
    shl eax, 1
    dec edx
    cmp edx, 0
    jg pow_esi1

power_zero_esi1:
    add esi, eax
    pop eax
    jmp ommit_pop1
add_edi1:
    push eax
    mov eax, 1
    cmp edx, 0
    je power_zero_edi1

pow_edi1:
    shl eax, 1
    dec edx
    cmp edx, 0
    jg pow_edi1

power_zero_edi1:
    add edi, eax
    pop eax
    jmp ommit_pop1

dreapta_sus:
    pop ebx
    pop eax
ommit_pop1:
    push eax
    push ebx
    inc eax
    inc ebx
    cmp eax, 7
    jg stanga_jos
    cmp ebx, 7
    jg stanga_jos
    imul edx, eax, 8
    add edx, ebx
    
    
    pop ebx
    pop eax

    cmp edx, 31
    jg add_esi2
    jmp add_edi2

add_esi2:
    sub edx, 32
    push eax
    mov eax, 1
    cmp edx, 0
    je power_zero_esi2

pow_esi2:
    shl eax, 1
    dec edx
    cmp edx, 0
    jg pow_esi2

power_zero_esi2:
    add esi, eax
    pop eax
    jmp ommit_pop2
add_edi2:
    push eax
    mov eax, 1
    cmp edx, 0
    je power_zero_edi2

pow_edi2:
    shl eax, 1
    dec edx
    cmp edx, 0
    jg pow_edi2

power_zero_edi2:
    add edi, eax
    pop eax
    jmp ommit_pop2

stanga_jos:
    pop ebx
    pop eax
ommit_pop2:
    push eax
    push ebx
    dec eax
    dec ebx
    cmp eax, 0
    jl dreapta_jos
    cmp ebx, 0
    jl dreapta_jos
    imul edx, eax, 8
    add edx, ebx
    
    
    pop ebx
    pop eax

    cmp edx, 31
    jg add_esi3
    jmp add_edi3

add_esi3:
    sub edx, 32
    push eax
    mov eax, 1
    cmp edx, 0
    je power_zero_esi3

pow_esi3:
    shl eax, 1
    dec edx
    cmp edx, 0
    jg pow_esi3

power_zero_esi3:
    add esi, eax
    pop eax
    jmp ommit_pop3

add_edi3:
    push eax
    mov eax, 1
    cmp edx, 0
    je power_zero_edi3

pow_edi3:
    shl eax, 1
    dec edx
    cmp edx, 0
    jg pow_edi3

power_zero_edi3:
    add edi, eax
    pop eax
    jmp ommit_pop3

dreapta_jos:
    pop ebx
    pop eax
ommit_pop3:
    push eax
    push ebx
    dec eax
    inc ebx
    cmp eax, 0
    jl fin
    cmp ebx, 7
    jg fin
    imul edx, eax, 8
    add edx, ebx
    
    
    pop ebx
    pop eax

    cmp edx, 31
    jg add_esi4
    jmp add_edi4

add_esi4:
    sub edx, 32
    push eax
    mov eax, 1
    cmp edx, 0
    je power_zero_esi4

pow_esi4:
    shl eax, 1
    dec edx
    cmp edx, 0
    jg pow_esi4

power_zero_esi4:
    add esi, eax
    pop eax
    jmp ommit_pop4

add_edi4:
    push eax
    mov eax, 1
    cmp edx, 0
    je power_zero_edi4

pow_edi4:
    shl eax, 1
    dec edx
    cmp edx, 0
    jg pow_edi4

power_zero_edi4:
    add edi, eax
    pop eax
    jmp ommit_pop4

fin:
    pop ebx
    pop eax
ommit_pop4:
    
    mov [ecx], esi
    mov [ecx + 4], edi
    
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY