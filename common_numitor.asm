section .text
	global cmmmc

;; int cmmmc(int a, int b)
;
;; calculate least common multiple fow 2 numbers, a and b ;; NOT ALLOWED TO USE MOV INSTRUCTION OR RELATED
cmmmc:
	push ebx ;; save ebx
	push dword[esp+8] ;; push a to stack
	pop eax ;; mov in eax a
	push dword[esp+12] ;; push b to stack
	pop ebx ;; mov in ebx b
	push esi ;; coppy of esi to stack
	push edi ;; coppy of edi to stack
	push eax ;; mov to stack eax
	pop edi ;; pop in edi eax
	push ebx ;; push to stack ebx
	pop esi ;; pop in esi ebx
	
	;;method of successive additions until edi and esi are equal
cat_timp_esi_diferit_edi:
	cmp edi,esi
	je final
	jl adun_edi
	jg adun_esi
adun_edi:
	add edi,eax
	jmp cat_timp_esi_diferit_edi
adun_esi:
	add esi,ebx
	jmp cat_timp_esi_diferit_edi
final:
	push edi ;; save the result
	pop eax ;; pop result
	pop edi ;; restore  edi
	pop esi ;; restore  esi
	pop ebx ;; restore ebx
	ret

