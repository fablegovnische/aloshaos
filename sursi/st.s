.global st
st:
b go
nop
nop
nop
nop
nop
nop
nop
b go
.word 0x016f2818
.word 0x00000000
.word 0x00080000
go:
adr r0,st
mov r1,#0x100000
add sp,r0,r1
bl hw
bl ds
bl bm
bl tx
adr r0,ms
bl us
en:
wfi
b en
ms:
.asciz "AloshaOS\n"
.align 2
