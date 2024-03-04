[org 0x7c00]

mov [BOOT_DRIVE], dl

mov bp, 0x8000
mov sp, bp

mov bx, 0x9000
mov dh, 0x01
mov dl, [BOOT_DRIVE]
call disk_load

mov bx, 0x9000
call println

mov bx, HELLO
call println

mov bx, HEX_TEST
call printhex

jmp $

HEX_TEST: db 0xfa, 0xce 
HELLO: db "Hello", 0
BOOT_DRIVE: db 0

%include "src/io.asm"
%include "src/disk.asm"

times 510-($-$$) db 0
dw 0xaa55

db "Hello from sector 1", 0
times 1024000-($-$$) db 0
