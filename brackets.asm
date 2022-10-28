section .text
	global par

;; int par(int str_length, char* str)
;
; check for balanced brackets in an expression 
;; return 1 if brackets closed '()()() ' else  0 for '(()'

par:
	push ecx ;; saving ecx to stack
	push edx ;; saving edx to stack
	push esi ;; saving esi to stack

	push dword[esp+20] ;; pointer to start of string
	pop eax ;; first char in string
	
	xor ecx,ecx
	xor esi,esi

parcurg_sirul:

	cmp ecx,dword[esp + 16] ;; check if in bounds
	je final 

	push dword[eax+ecx] ;; push next character
	pop edx ;; pop in edx character

	cmp dl,40 ;; comparing to ascii code of '('
	je adun ;; if bracket is open i count
	jg scad ;; if bracket is closed i decrese (if i need to do 0-1 i skip bcs is invalid)

adun:
	inc esi ;; counting
	inc ecx ;; ecx from 0 to strlen(s)
	jmp parcurg_sirul ;; loop

scad:
	cmp esi,0 ;; check if esi is 0 to stop 
	je retur0 ;; if 0 i return(cant have a value like '))((' to return 1)
	dec esi 
	inc ecx ;; ecx from 0 to strlen s
	jmp parcurg_sirul ;; loop

final:

	cmp esi,0 
	jg retur0 ;; if the brackets were not all closed esi >0
	
	push 1  ;; else
	pop eax ;; mov retur value to eax
	jmp final2 ;; go to final

retur0:
	push 0 ;; push 0 to stack
	pop eax ;; mov in eax returning value
final2:
	pop esi ;; reinitializating the values of function for other functions that may be appeled
	pop edx 
	pop ecx 
	ret

