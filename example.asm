; Calculates expression -(x+y - 2z + 1)
; Author:  Rogelio Perez
; Date:    11/11/2024

.586
.MODEL FLAT

INCLUDE io.h                                ; header file for input/output

.STACK 4096

.DATA
x DWORD   ?                                 ; variable to store x   
y DWORD   ?                                 ; variable to store y
z DWORD   ?                                 ; variable to store z

prompt1 BYTE    "Enter a number for x", 0   ; prompt for x
prompt2 BYTE    "Enter a number for y", 0   ; prompt for y
prompt3 BYTE    "Enter a number for z", 0   ; prompt for z
string  BYTE    40 DUP (?)                  ; buffer to store ASCII values
resultLbl BYTE  "The result is", 0          ; prompt for the result display
sum     BYTE    11 DUP (?), 0               ; result in ASCII

.CODE
_MainProc PROC
        input   prompt1, string, 40         ; read ASCII characters
        atod    string                      ; convert to integer
        mov     x, eax                      ; store in memory

        input   prompt2, string, 40         ; repeat for second number
        atod    string
        mov     y, eax

        input   prompt3, string, 40         ; repeat for third number
        atod    string
        mov     z, eax
        

        mov     eax, x                      ; first number to EAX (=x)
        add     eax, y                      ; result := x+y
        mov     ebx, z                      ; temp := z
        add     ebx, ebx                    ; temp := 2*z
        sub     eax, ebx                    ; result := x + y - 2z
        inc     eax                         ; result := x + y - 2z + 1 
        neg     eax                         ; result := -(x + y - 2z + 1)

        dtoa    sum, eax                    ; convert to ASCII characters
        output  resultLbl, sum              ; output label and sum

        mov     eax, 0                      ; exit with return code 0
        ret

_MainProc ENDP
END                                         ; end of source code

