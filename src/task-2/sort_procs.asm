%include "../include/io.mac"

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

section .text
    global sort_procs
    extern printf

sort_procs:
    ;; DO NOT MODIFY
    enter 0,0
    pusha

    mov edx, [ebp + 8]      ; processes
    mov eax, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ; Your code starts here

    ; movzx ax, [edx + proc.pid]
    ; PRINTF32 `%d\n\x0`, eax
    ; movzx eax, byte [edx + proc.prio]
    ; PRINTF32 `%d\n\x0`, eax
    ; movzx ax, [edx + proc.time]
    ; PRINTF32 `%d\n\x0`, eax


    mov ecx, eax
    mov ebx, 0
for_i:
    PRINTF32 `%d \x0`, ebx
    push ebx
    imul ebx, ebx, 5
    movzx ax, [edx + ebx + proc.pid]
    PRINTF32 `%d    \x0`, eax
    movzx eax, byte [edx + ebx + proc.prio]
    PRINTF32 `%d    \x0`, eax
    movzx ax, [edx + ebx + proc.time]
    PRINTF32 `%d\n\x0`, eax
    pop ebx

    inc ebx
    cmp ebx, ecx
    jl for_i

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY