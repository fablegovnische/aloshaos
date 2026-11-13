.global st
st:
ldr sp,=0x70010000
bl ds
bl tx
ldr r0,=0x10009000
ldr r1,=ms
lp:
ldrb r2,[r1],#1
cmp r2,#0
beq en
strb r2,[r0]
b lp
en:
b en
ms:
.asciz "AloshaOS\n"
.align 2
