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

    ; PRINTF32 `eax = %d  edx = %d` eax, 

    imul ebx, ebx, 2
    imul ebx, ebx, 26
    ; PRINTF32 `ebx = %d\n\x0`, ebx
    ; mov edi, [ecx + ebx]
    ; add ebx, 26
    ; mov esi, [ecx + ebx]
    ; xor ebx, ebx
    mov edi, ebx
    ; PRINTF32 `edi = %d\n\x0`, edi
    mov esi, ecx
    ; PRINTF32 `%c\n\x0`, byte [esi + 26]
    ; PRINTF32 `////////////////\n\x0`
    cmp edx, 0
    je shift
    mov edx, 26
    sub edx, eax
    mov eax, edx
    ; PRINTF32 `%d\n\x0`, eax
shift:
    mov ecx, eax
    ; PRINTF32 `%d\n\x0`, eax
    
for_i:
    push ecx
    push edi
    xor eax, eax
    xor ebx, ebx
    mov al, byte [esi + edi]
    mov bl, byte [esi + edi + 26]
    ; PRINTF32 `ecx = %d\n\x0`, ecx
    ; PRINTF32 `al = %c     bl = %c\n\x0`, eax, ebx
    xor edx, edx
for_j:
    xor ecx, ecx
    ; push ebx
    ; add ebx, edx
    inc edi
    ; inc edi
    ; inc ebx
    mov cl, byte [esi + edi]
    dec edi
    mov [esi + edi], byte cl
    xor ecx, ecx
    inc edi
    ; add ebx, 27
    mov cl, byte [esi + edi + 26]
    ; dec ebx
    dec edi
    mov [esi + edi + 26], byte cl
    ; pop ebx    
    inc edx
    cmp edx, 26
    jl for_j
; endfor_j


    ; push ebx
    pop edi
    push edi
    ; add ebx, edx

    mov [esi + edi + 25], byte al
    add edi, 26
    mov [esi + edi + 25], byte bl
    ; pop ebx
    pop edi
    pop ecx
    dec ecx
    PRINTF32 `ecx2 = %d\n\x0`, ecx
    cmp ecx, 0
    jg for_i
; endfor_i

    ; mov esi, ecx


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