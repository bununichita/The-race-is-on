%include "../include/io.mac"

section .data
matrix db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

section .text
	global checkers
    extern printf

checkers:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; table


    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE
    xor edx, edx
    inc eax
    inc ebx
    imul edx, eax, 10
    add edx, ebx
    ; in momentul acesta edx stocheaza pozitia curenta a damei
    ; push edx
    sub edx, 10
    dec edx
    mov byte [matrix + edx], 1
    add edx, 2
    mov byte [matrix + edx], 1
    add edx, 20
    mov byte [matrix + edx], 1
    sub edx, 2
    mov byte [matrix + edx], 1
    xor eax, eax
for_i:
    xor ebx, ebx
for_j:
    mov esi, eax
    inc esi
    mov edi, ebx
    inc edi
    push eax
    imul eax, eax, 8
    add eax, ebx
    imul esi, esi, 10
    add esi, edi
    movzx edx, byte [matrix + esi]
    mov [ecx + eax], dx
    pop eax

    inc ebx
    cmp ebx, 10
    jl for_j
; endfor_j

    inc eax
    cmp eax, 10
    jl for_i

; endfor_i

    xor eax, eax
for_1:
    xor ebx, ebx
for_2:
    mov edx, eax
    imul edx, edx, 10
    add edx, ebx
    mov [matrix + edx], byte 0
    inc ebx
    cmp ebx, 10
    jl for_2

    inc eax
    cmp eax, 10
    jl for_1


    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY