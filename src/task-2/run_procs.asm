%include "../include/io.mac"

    ;;
    ;;   TODO: Declare 'avg' struct to match its C counterpart
    ;;
struc avg
    .quo: resw 1
    .remain: resw 1
endstruc

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

    ;; Hint: you can use these global arrays
section .data
    prio_result dd 0, 0, 0, 0, 0
    time_result dd 0, 0, 0, 0, 0

section .text
    global run_procs
    extern printf

run_procs:
    ;; DO NOT MODIFY

    push ebp
    mov ebp, esp
    pusha

    xor ecx, ecx

clean_results:
    mov dword [time_result + 4 * ecx], dword 0
    mov dword [prio_result + 4 * ecx],  0

    inc ecx
    cmp ecx, 5
    jne clean_results

    mov ecx, [ebp + 8]      ; processes
    mov ebx, [ebp + 12]     ; length
    mov eax, [ebp + 16]     ; proc_avg
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    ; mov edx, 0
    mov dx, [ecx + proc.time]
    PRINTF32 `%d\n\x0`, edx
    ; esi este adresa proc_avg
    mov esi, eax
    ; edi este adresa proceselor sortate
    mov edi, ecx
    ; ecx este numarul proceselor
    mov ecx, ebx
    mov edx, 0
for_i:
    inc edx
    mov ebx, 0 ; pozitia structurii
    mov eax, 0 ; suma elementelor cu prioritatea edx
for_j:
    push ebx
    imul ebx, ebx, 5
    ; push eax
    ; mov ax, [edi + ebx + proc.time]
    ; cmp edx, eax
    ; je equal
    ; jmp not_equal
equal:
    add eax, [edi + ebx + proc.time]
not_equal:
    pop ebx
    inc ebx
    
    cmp ebx, ecx
    jl for_j
    push edx
    dec edx
    imul edx, edx, 4
    PRINTF32 `eax = %d\n\x0`, eax
    mov [prio_result + edx], eax
    pop edx


    cmp edx, 5
    jne for_i



    mov edx, 0
for_i2:
    inc edx
    mov ebx, 0 ; pozitia structurii
    mov eax, 0 ; numarul elementelor cu prioritatea edx
for_j2:
    push ebx
    imul ebx, ebx, 5
    cmp edx, [edi + ebx + proc.time]
    je equal2
    jmp not_equal2
equal2:
    inc eax
not_equal2:
    pop ebx
    inc ebx
    
    cmp ebx, ecx
    jl for_j2
    push edx
    dec edx
    imul edx, edx, 4
    mov [time_result + edx], eax
    pop edx


    cmp edx, 5
    jne for_i2

    PRINTF32 `///////////////////////////////\n\x0`

    mov ecx, 5


loop_start:
    push ecx
    dec ecx
    imul ecx, ecx, 4
    mov eax, [prio_result + ecx]
    mov ebx, [time_result + ecx]
    
    PRINTF32 `%d    \x0`, eax
    PRINTF32 `%d\n\x0`, ebx
    pop ecx
    loop loop_start

; loop_start:
;     push ecx
;     dec ecx
;     imul ecx, ecx, 4
;     mov eax, [prio_result + ecx]
;     mov ebx, [time_result + ecx]
;     xor edx, edx
;     div ebx
;     mov [esi + ecx + avg.quo], ax
;     mov [esi + ecx + avg.remain], dx
;     pop ecx
;     loop loop_start


    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY