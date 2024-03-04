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
printhex:
	push ax
	mov ah, 0x0e
	mov al, 'x'
	int 0x10

	mov al, [bx]
	shr al, 4
	call printhex_cmp
	mov [HEX_BUFFER], al
	mov al, [bx]
	and al, 0x0f
	call printhex_cmp
	mov [HEX_BUFFER + 1], al

	push bx
	mov bx, HEX_BUFFER
	call print
	pop bx
	pop ax
	ret

printhex_cmp:
	cmp al, 9
	jg printhexgt9
	printhexle9: 
		add al, '0'
		jmp printhexend
	printhexgt9:
		sub al, 10
		add al, 'a'
	printhexend:
	ret

HEX_BUFFER: db "00", 0
