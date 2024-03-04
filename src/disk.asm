disk_load:
	push dx
	mov ah, 0x02
	mov al, dh
	mov ch, 0x00
	mov dh, 0x00
	mov cl, 0x02
	int 0x13
	cmp ah, 0x00
	jne disk_error

	pop dx
	cmp dh, al
	jne disk_error
	ret
	
disk_error:
	push bx
	mov bx, DISK_ERROR
	call print
	pop bx
	ret
DISK_ERROR: db "error while reading disk", 0	
