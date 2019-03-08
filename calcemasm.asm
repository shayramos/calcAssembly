;Author @Aline Shayonara@
;       @Manollo@

%include "io.inc"
%include "io64.inc"

;global CMAIN
;segment .text
;global _start
;CMAIN:
;_start:
 
    mov ebp, esp; for correct debugging

global calcABS
    calcABS:
    	fld dword[esp+4]
        fabs              ;valor absoluto de st0  
        ret 

global calcEXP

	    calcEXP:
	    xor eax, eax
	    xor ebx, ebx
	    mov ebx, -1

		calce:
		fld dword[esp+8]
	    fld dword [esp+4]
	    fldln2
	    fdiv
	    
	    compara:
	    fcomi st0, st1      
	    jb final
	    jae loop2
	        
	    final:
	    f2xm1
	    fadd st0, st1
	    fld dword[esp+12]
	    jmp multiplica
	    
	    loop2:
	    fsub dword[esp+8]
	    inc ebx
	    jmp compara
	    
	    multiplica:
	    fmul dword[esp+12]
	    dec ebx
	    cmp ebx, 0
	    je fim
	    jg multiplica
	    
	    fim:
	    fmul st0, st1

        ret
        
global calcLN
    section .data
    R dq 1.00
    
    calcLN:
        fld dword [esp+8]
        fld dword [esp+12]
        fyl2x
        fstp dword [R]
        fld dword [esp+8]
        fld dword [esp+4]
        fyl2x
        fdiv dword [R]
        ret
        
        
global calcSQRT
    section .data
    z dq 1.00
    calcSQRT:
        fld dword[esp+4]
        fsqrt             ;square root of st0
        ret

global calcSin
    section .data
    h dq 1.00
    calcSin:
        fld dword[esp+4]
        fsin              ;st0 = sin(ang) em radianos
        ret
         
        
global calcCos
    calcCos: 
        fld dword[esp+4]      
        fcos              ;st0 = cos(ang) em radianos
        ret
            
         
global calcTan
    section .data
    val dq 1.00

    calcTan: 
        fld dword[esp+4]         
        fptan
    	fstp dword[val]
        ret
        
global calcATan
    section .data
    n dq 1.00
    calcATan:
        fld dword[esp+4] 
        fld dword[esp+8] 
        fpatan
        ret

global calcArcCos   
    section .data
    valX dq 1.00

    calcArcCos:
	    fld dword[esp+4]
	    fmul dword[esp+4]
	    fstp dword[valX]
	    fld dword[esp+8]
	    fsub dword[valX]
	    fsqrt
	    
	    fld dword[esp+4]
	    fadd dword[esp+8]

	    fdiv

	    fld dword[esp+8] 
	    fpatan
	    fmul dword[esp+12]
	    ret
    
global calcArcSin 
    section .data
    valY dq 1.00

    calcArcSin:

	    fld dword[esp+4]

	    fld dword[esp+4]
	    fmul dword[esp+4]
	    fstp dword[valY]
	    fld dword[esp+8]
	    fsub dword[valY]
	    fsqrt
	    fadd dword[esp+8]
	    
	    fdiv
	    fld dword[esp+8] 
	    fpatan
	    fmul dword[esp+12]

	    ret
                 
