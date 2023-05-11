%include "../include/io.mac"

section .data
matrix db 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0

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
    push ecx

    xor edx, edx
    inc eax
    inc ebx
    imul edx, eax, 9
    add edx, ebx
    ; in momentul acesta edx stocheaza pozitia curenta a damei
    ; push edx
    sub edx, 9
    dec edx
    mov byte [matrix + edx], 1
    add edx, 2
    mov byte [matrix + edx], 1
    add edx, 18
    mov byte [matrix + edx], 1
    sub edx, 2
    mov byte [matrix + edx], 1
    xor eax, eax
for_i:
    ; PRINTF32 `test1\n\x0`
    xor ebx, ebx
for_j:
    ; PRINTF32 `test2\n\x0`
    mov esi, eax
    inc esi
    mov edi, ebx
    inc edi
    push eax
    imul eax, eax, 8
    add eax, ebx
    imul esi, esi, 9
    add esi, edi
    movzx edx, byte [matrix + esi]
    mov [ecx + eax],  dx
    pop eax
    ; PRINTF32 `%d \x0`, edx
    inc ebx
    cmp ebx, 9
    jle for_j
; endfor_j

    inc eax
    cmp eax, 9
    jle for_i
; endfor_i

    xor eax, eax
for_1:
    xor ebx, ebx
for_2:
    mov edx, eax
    imul edx, edx, 9
    add edx, ebx
    mov [matrix + edx], byte 0
    inc ebx
    cmp ebx, 9
    jle for_2

    inc eax
    cmp eax, 9   
    jle for_1



    ; ecx stocheaza matricea aferenta


    xor esi, esi
    xor edi, edi
    xor eax, eax
first_loop:
    xor ebx, ebx
second_loop:
    imul edx, eax, 8
    add edx, ebx
    ; PRINTF32 `%d\n\x0`, edx
    push eax
    movzx eax, byte [ecx + edx]
    cmp al, 0
    je zero
    jmp one
zero:
    shl esi, 1
    ; imul esi, esi, 2
    ; PRINTF32 `esi = %d\n\x0`, esi
    jmp next
one:
    PRINTF32 `esi   %d\n\x0`, edx
    ; PRINTF32 `%d\n\x0`, eax
    shl esi, 1
    ; imul esi, esi, 2
    inc esi
    ; PRINTF32 `esi = %d\n\x0`, esi
next:
    pop eax
    inc ebx
    cmp ebx, 8
    jl second_loop

    inc eax
    cmp eax, 4
    jl first_loop
    




    xor eax, eax
    add eax, 4
first_loop2:
    xor ebx, ebx
second_loop2:
    imul edx, eax, 8
    add edx, ebx
    ; PRINTF32 `%d\n\x0`, edx
    push eax
    movzx eax, byte [ecx + edx]
    cmp al, 0
    je zero2
    jmp one2
zero2:
    shl edi, 1
    ; imul edi, edi, 2
    ; PRINTF32 `edi = %d\n\x0`, edi
    jmp next2
one2:
    PRINTF32 `edi   %d\n\x0`, edx
    ; PRINTF32 `%d\n\x0`, eax
    shl edi, 1
    ; imul edi, edi, 2
    inc edi
    ; PRINTF32 `edi = %d\n\x0`, edi
next2:
    pop eax
    inc ebx
    cmp ebx, 8
    jl second_loop2

    inc eax
    cmp eax, 8
    jl first_loop2

    ; PRINTF32 `%d    %d\n\x0`, esi, edi

    xor eax, eax
last_for:

    shl esi, 1
    shl edi, 1

    inc eax
    cmp eax, 9
    jl last_for


    PRINTF32 `esi = %d\n\x0`, esi
    PRINTF32 `edi = %d\n\x0`, edi

    ; mov [ebp + 16], esi
    ; mov [ebp + 20], edi
    mov ecx, esi
    mov [ecx + 4], edi


    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY