;• Implementar en lenguaje ensamblador para la arquitectura Intel de 64 bits un programa que
;determine si un n´umero entero en memoria es fuerte o no. Ejemplo de n´umero fuerte:
;145 = 1! + 4! + 5!
;Guardar en memoria la letra T en caso el n´umero en memoria sea fuerte, o la letra F en caso
;no cumpla la condici´on.
;• Codificar un script para gdb que le permita ver los valores asignados a los registros de prop´osito
;general que est´a utilizando en su solucion.
;nasm -f elf64 -g numeroFuerte.asm -o numeroFuerte.o
;ld numeroFuerte.o -o numeroFuerte
;./numeroFuerte
section .data 
    numero dq 145
    suma dq 0

section .bss
    resultado2 resb 1

section .text
   global _start

_start:
    xor rcx,rcx
    xor rdx,rdx
    mov rax,qword [rel numero]
    mov rcx,rax
    mov r9,10

digito:
    idiv r9
    xor rax,0
    jz Fin ; si el cociente es 0 ya no tengo mas digitos para sumar
    mov rcx,rdx
    mov r8,rax
    mov rbx,1
    mov rax,1
iterar: ;aqui alla el factorial del digito y se acumula
    mul rbx
    add rbx,1
    cmp rbx,rcx
    jle iterar

    add qword[suma],rax
    mov rax,r8; regreso a rax lo que queda del numero
    jmp digito
Fin:
    add qword[suma],rdx ;le sumo el ultimo residuo
    mov r8,qword[suma]
    mov r9,qword [rel numero]
    xor r8,r9; si son iguales imprime T
    jz igual

    mov byte[resultado2],70
    jmp imprime

    igual:

    mov byte[resultado2],84

imprime:
; ----- Codigo para impresión en pantalla ----- ;
	mov rax, 1		    ; función a utilizar (printf)
	mov rdi, 1		    ; imprimir en pantalla: 1gi
	mov rsi, resultado2	; rsi debe contener el puntero hacia el arreglo a imprimir
	mov rdx, 8	; numero de elementos a imprimir
	syscall			    ; system call --> llamadas a funciones del sistema (SO)
exit:
    ; ---- return 0 ---- ;
	mov rax, 60		; función para terminar la ejecución del programa. Similar a int 21h
	mov rdi, 0
	syscall
    ; ------------------ ;

