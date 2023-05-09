%include "../include/io.mac"

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

section .text
    global sort_procs

sort_procs:
    ;; DO NOT MODIFY
    enter 0,0
    pusha

    mov edx, [ebp + 8]      ; processes
    mov eax, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ; Your code starts here

    mov ecx, eax
    ; di este o variabila care retine daca s-a facut
    ; vreo schimbare in timpul ultimei parcurgeri
for_i:
    mov esi, 1
    mov edi, 0
for_j:
    push esi
    imul esi, esi, 5
    jmp compare_start
compare_stop:
    pop esi
    inc esi
    jmp label
swap_stop:
    pop esi

label:
    cmp esi, ecx
    jl for_j
    ; end for_j
    cmp edi, 0
    je prog_end
    jmp for_i
    ; end for_i

compare_start:
    movzx eax, byte [edx + esi + proc.prio]
    movzx ebx, byte [edx + esi - 5 + proc.prio]
    cmp eax, ebx
    jg compare_stop
    jl swap_proc

    mov ax, [edx + esi + proc.time]
    mov bx, [edx + esi - 5 + proc.time]
    cmp eax, ebx
    jg compare_stop
    jl swap_proc

    mov ax, [edx + esi + proc.pid]
    mov bx, [edx + esi - 5 + proc.pid]
    cmp eax, ebx
    jl swap_proc
    jmp compare_stop
swap_proc:
    inc edi
    mov eax, 0
    mov ebx, 0
    mov al, byte [edx + esi + proc.prio]
    mov bl, byte [edx + esi - 5 + proc.prio]
    mov byte [edx + esi + proc.prio], bl
    mov byte [edx + esi - 5 + proc.prio], al
    push word [edx + esi + proc.time]
    push word [edx + esi - 5 + proc.time]
    pop word [edx + esi + proc.time]
    pop word [edx + esi - 5 + proc.time]
    push word [edx + esi + proc.pid]
    push word [edx + esi - 5 + proc.pid]
    pop word [edx + esi + proc.pid]
    pop word [edx + esi - 5 + proc.pid]
    jmp swap_stop
prog_end:

    ;; Your code ends here

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY