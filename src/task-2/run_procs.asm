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
    ; mov , [ecx + proc.time]
    ; PRINTF32 `%d\n\x0`, edx
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
    push ebx ; pozitia structurii ex: 0, 1, 2, 3, 4
    imul ebx, ebx, 5 ; inceputul structurilor ex: 0, 5, 10, 15, 20
    push eax ; eliberez memoria pentru a putea muta timpul in eax
    mov eax, 0
    mov al, byte [edi + ebx + proc.prio]
    ; PRINTF32 `edx = %d  \x0`, edx
    ; PRINTF32 `eax = %d\n\x0`, eax
    cmp edx, eax
    pop eax
    je equal
    jmp not_equal
equal:
    add ax, [edi + ebx + proc.time]
    ; PRINTF32 `%d\n\x0`, eax
not_equal:
    pop ebx
    inc ebx
    
    cmp ebx, ecx
    jl for_j
    push edx
    dec edx
    imul edx, edx, 4
    ; PRINTF32 `eax = %d\n\x0`, eax
    mov [time_result + edx], eax
    ; PRINTF32 `prio_result = %d\n\x0`, [prio_result + edx]
    pop edx


    cmp edx, 5
    jne for_i



    mov edx, 0
for_i2:
    inc edx
    mov ebx, 0 ; pozitia structurii
    mov eax, 0 ; numarul elementelor cu prioritatea edx
for_j2:
    push ebx ; pozitia structurii ex: 0, 1, 2, 3, 4
    imul ebx, ebx, 5 ; inceputul structurilor ex: 0, 5, 10, 15, 20
    push eax ; eliberez memoria pentru a putea muta timpul in eax
    mov eax, 0
    mov al, byte [edi + ebx + proc.prio]
    ; PRINTF32 `edx = %d  \x0`, edx
    ; PRINTF32 `eax = %d\n\x0`, eax
    cmp edx, eax
    pop eax
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
    mov [prio_result + edx], eax
    pop edx


    cmp edx, 5
    jne for_i2

    PRINTF32 `///////////////////////////////\n\x0`

    mov ecx, 5


; loop_start:
;     push ecx
;     dec ecx
;     imul ecx, ecx, 4
;     mov eax, [prio_result + ecx]
;     mov ebx, [time_result + ecx]
    
;     PRINTF32 `%d    \x0`, eax
;     PRINTF32 `%d\n\x0`, ebx
;     pop ecx
;     loop loop_start

loop_start:
    xor eax, eax
    xor ebx, ebx

    push ecx
    dec ecx
    imul ecx, ecx, 4
    mov eax, [time_result + ecx]
    mov ebx, [prio_result + ecx]
    ; PRINTF32 `eax = %d  \x0`, eax
    ; PRINTF32 `ebx = %d\n\x0`, ebx
    cmp ebx, 0
    je no_elem
    xor edx, edx
    div ebx
no_elem:
    ; PRINTF32 `rez = %d\n\x0`, eax
    mov [esi + ecx + avg.quo], ax
    mov [esi + ecx + avg.remain], dx
    pop ecx
    loop loop_start


    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY