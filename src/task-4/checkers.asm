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
    imul esi, esi, 10
    add esi, edi
    movzx edx, byte [matrix + esi]
    mov [ecx + eax], dx
    pop eax
    ; PRINTF32 `%d \x0`, edx
    inc ebx
    cmp ebx, 10
    jl for_j
; endfor_j

    inc eax
    cmp eax, 10
    jl for_i


; endfor_i

    ; ptintre matrix2

;     pusha
;     xor eax, eax
; for_a:
;     xor ebx, ebx
; for_b:
;     mov edx, eax
;     imul edx, edx, 10
;     add edx, ebx
;     movzx esi, byte [matrix + edx]
;     PRINTF32 `%d \x0`, esi
;     inc ebx
;     cmp ebx, 10
;     jl for_b
;     PRINTF32 `\n\x0`
;     inc eax
;     cmp eax, 10
;     jl for_a

;     popa

    ; mov ecx, matrix2

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