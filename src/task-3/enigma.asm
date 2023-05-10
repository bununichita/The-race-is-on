%include "../include/io.mac"

;; defining constants, you can use these as immediate values in your code
LETTERS_COUNT EQU 26

section .data
    extern len_plain
    extern printf


section .text
    global rotate_x_positions
    global enigma
    extern printf

; void rotate_x_positions(int x, int rotor, char config[10][26], int forward);
rotate_x_positions:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; x
    mov ebx, [ebp + 12] ; rotor
    mov ecx, [ebp + 16] ; config (address of first element in matrix)
    mov edx, [ebp + 20] ; forward
    ;; DO NOT MODIFY
    ;; TODO: Implement rotate_x_positions
    ;; FREESTYLE STARTS HERE

    imul ebx, ebx, 2
    imul ebx, ebx, 26
    mov edi, ebx
    mov esi, ecx
    cmp edx, 0
    je shift
    mov edx, 26
    sub edx, eax
    mov eax, edx
shift:
    mov ecx, eax
    ; inc ecx
    ; PRINTF32 `ecx = %d\n\x0`, ecx
    ; mov eax, 0 ; //////////////////////////
for_1:
    ; PRINTF32 `ecx2 = %d\n\x0`, ecx
    push ecx
    ; inc eax ;//////////////////////////////////////
    push edi
    xor eax, eax
    xor ebx, ebx
    mov al, byte [esi + edi]
    mov bl, byte [esi + edi + 26]
    xor edx, edx
for_j:
    ; xor ecx, ecx
    inc edi
    mov cl, byte [esi + edi]
    dec edi
    mov [esi + edi], byte cl
    ; xor ecx, ecx
    inc edi
    mov cl, byte [esi + edi + 26]
    dec edi
    mov [esi + edi + 26], byte cl
    inc edi
    inc edx
    cmp edx, 26
    jl for_j
; endfor_j

    pop edi
    push edi
    mov [esi + edi + 25], byte al
    add edi, 26
    mov [esi + edi + 25], byte bl
    pop edi
    pop ecx
    dec ecx
    ; PRINTF32 `ecx3 = %d\n\x0`, ecx
    cmp ecx, 0
    ; PRINTF32 `ecx4 = %d\n\x0`, ecx
    jg for_1
; endfor_i
    ; PRINTF32 `eax = %d\n\x0`, eax
    ; mov ecx, esi


    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY

; void enigma(char *plain, char key[3], char notches[3], char config[10][26], char *enc);
enigma:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; plain (address of first element in string)
    mov ebx, [ebp + 12] ; key
    mov ecx, [ebp + 16] ; notches
    mov edx, [ebp + 20] ; config (address of first element in matrix)
    mov edi, [ebp + 24] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement enigma
    ;; FREESTYLE STARTS HERE


    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY