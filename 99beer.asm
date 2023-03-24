; 99 Bottles of Beer on the Wall by Mac Young in NASM for LINUX
; March 22, 2023
;
; DISCLAIMER: I don't drink. I never have, and I never will. This is
; just a song, nothing more.

SECTION .data
msg1 db " bottles of beer on the wall, ", 0h
msg2 db " bottles of beer!", 0h
msg3 db "Take one down, pass it around;", 0h
msg4 db " bottles of beer on the wall!", 0h
msg5 db " bottle of beer on the wall!", 0h
msg6 db " bottle of beer on the wall, ", 0h
msg7 db " bottle of beer!", 0h
msg8 db "Take it down, pass it around;", 0h
msg9 db "No more bottles of beer on the wall!", 0h
msgA db "No more bottles of beer on the wall, No more bottles of beer!", 0h
msgB db "We've taken them down and passed them around;", 0h
msgC db "Now we are drunk and passed out!", 0h

SECTION .text
global _start

_start:
	mov ecx, 99

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; beer_nromal is the main function. The majority of the song is played 
; through here.
beer_normal:
	mov eax, ecx
	call iprint
	mov eax, msg1
	call sprint
	mov eax, ecx
	call iprint
	mov eax, msg2
	call sprintLF

	dec ecx
	mov eax, msg3
	call sprintLF
	cmp ecx, 1
	je beer_one
	mov eax, ecx
	call iprint
	mov eax, msg4
	call sprintLF
	jmp beer_normal

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; beer_one plays the second to last verse of the song then moves to 
; the final verse.
beer_one:
	mov eax, ecx
	call iprint
	mov eax, msg5
	call sprintLF
	mov eax, ecx
	call iprint
	mov eax, msg6
	call sprint
	mov eax, ecx
	call iprint
	mov eax, msg7
	call sprintLF

	dec ecx
	mov eax, msg8
	call sprintLF
	mov eax, msg9
	call sprintLF
	call beer_zero

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; beer_zero plays the last lyric of the song then ends the program.
beer_zero:
	mov eax, msgA
	call sprintLF
	mov eax, msgB
	call sprintLF
	mov eax, msgC
	call sprintLF
	
	mov ebx, 0
	mov eax, 1
	int 80h

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; slen calculates the length of a string.
slen:
	push ebx
	mov ebx, eax

nextchar:
	cmp byte [eax], 0
	jz finished
	inc eax
	jmp nextchar

finished:
	sub eax, ebx
	pop ebx
	ret

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; iprint prints an integer to the screen.
iprint:
	push eax
	push ecx
	push edx
	push esi
	mov ecx, 0

divide_loop:
	inc ecx
	mov edx, 0
	mov esi, 10
	idiv esi
	add edx, 48
	push edx
	cmp eax, 0
	jnz divide_loop

print_loop:
	dec ecx
	mov eax, esp
	call sprint
	pop eax
	cmp ecx, 0
	jnz print_loop

	pop esi
	pop edx
	pop ecx
	pop eax
	ret

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; sprint prints a string onto the screen.
sprint:
	push edx
	push ecx
	push ebx
	push eax
	call slen

	mov edx, eax
	pop eax

	mov ecx, eax
	mov ebx, 1
	mov eax, 4
	int 80h

	pop ebx
	pop ecx
	pop edx
	ret

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; sprintLF prints a string to the screen with a line feed.
sprintLF:
	call sprint
	
	push eax
	mov eax, 0Ah
	push eax
	mov eax, esp
	call sprint
	pop eax
	pop eax
	ret