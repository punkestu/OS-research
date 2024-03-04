print:
	push ax
	mov ah, 0x0e
	print_loop:
		mov al, [bx]
		cmp al, 0x00
		je end
		int 0x10
		inc bx
		jmp print_loop
	end:
	pop ax
	ret	
println:
	call print
	push ax
	mov ah, 0x0e
	mov al, 0x0d
	int 0x10
	mov al, 0x0a
	int 0x10
	pop ax
	ret
