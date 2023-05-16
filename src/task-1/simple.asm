%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here
    movzx ebx, byte [esi]
    mov eax, 0
label:
    movzx ebx, byte [esi + eax]
    add ebx, edx
    cmp ebx, 91
    jl lower
    sub ebx, 26
lower:
    mov [edi + eax], bl
    inc eax
    cmp eax, ecx
    jl label

    ;; Your code ends here



    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
