section .text
	global sort
	extern printf

struc node
	.val: resd 1
	.next: resd 1

endstruc
; struct node {
;     	int val;
;    	struct node* next;
; };

;; struct node* sort(int n, struct node* node);
; 	The function will link the nodes in the array
;	in ascending order and will return the address
;	of the new found head of the list
; @params:
;	n -> the number of nodes in the array
;	node -> a pointer to the beginning in the array
; @returns:
;	the address of the head of the sorted list
sort:
	enter 0, 0
	xor ecx,ecx
	mov ecx,0 ;; ecx is a counter

creste_pozitia_in_vector:
	mov eax,dword[ebp+12] ;; first element of the vector
	inc ecx 
caut_elementul_ecx:
	cmp [eax],ecx ;; look for ecx in the vector 
	je gasit 
	add eax,node_size ;; keep going if not found
	jmp caut_elementul_ecx
gasit:
	push eax  ;; if i found the element i push on stack
	cmp ecx,dword[ebp+8] ;; compare ecx with n
	je am_adaugat_tot_in_stiva
	jmp creste_pozitia_in_vector ;; else keep going

am_adaugat_tot_in_stiva: ;; if all numbers are on stack
	xor eax,eax
	xor ecx,ecx
	
mov ecx,1
pop ebx ;; pop last element
mov dword[ebx+4],0 ;;last_element->next are valoarea 0 

adauga_adrese:
	pop eax 

	mov dword[eax+4],ebx ;; connecting the nodes
	mov ebx,eax ;; mov in ebx the eax node which will be the next of the next eax node

	cmp [eax],ecx ;; make sure we are in bounds
	je returneaza

	jmp adauga_adrese
returneaza:
	leave
	ret

