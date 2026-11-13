.global tx
tx:
push {r4-r11,lr}
bl gp
ldr r8,[r0,#4]
ldr r9,[r0,#8]
ldr r5,[r0,#28]
ldr r11,[r0,#20]
adr r0,ts
mov r2,#0
ln:
ldrb r1,[r0],#1
cmp r1,#0
beq ce
add r2,r2,#1
b ln
ce:
lsl r2,r2,#4
add r4,r9,#2
sub r4,r4,r2
asr r4,r4,#1
adr r6,ts
adr r7,fn
ch:
ldrb r0,[r6],#1
cmp r0,#0
beq dn
cmp r0,#'a'
blo up
cmp r0,#'z'
bhi up
sub r0,r0,#32
up:
cmp r0,#'A'
blo nx
cmp r0,#'Z'
bhi nx
sub r0,r0,#'A'
add r1,r7,r0,lsl #3
mov r2,#0
ry:
ldrb r3,[r1,r2]
mov r10,#0
rx:
tst r3,#0x80
beq sk
add r0,r5,r2,lsl #1
mul r0,r9,r0
add ip,r4,r10,lsl #1
add r0,r0,ip
add r0,r8,r0,lsl #1
strh r11,[r0,#0]
strh r11,[r0,#2]
add r0,r0,r9,lsl #1
strh r11,[r0,#0]
strh r11,[r0,#2]
sk:
lsl r3,r3,#1
add r10,r10,#1
cmp r10,#8
blt rx
add r2,r2,#1
cmp r2,#8
blt ry
nx:
add r4,r4,#16
b ch
dn:
bl fl
pop {r4-r11,pc}
ts:
.asciz "ALOSHAAAA"
.align 2
fn:
.word 0xc6c66c38,0x00c6c6fe
.word 0xfcc6c6fc,0x00fcc6c6
.word 0xc0c0c67c,0x007cc6c0
.word 0xc6c6ccf8,0x00f8ccc6
.word 0xfcc0c0fe,0x00fec0c0
.word 0xfcc0c0fe,0x00c0c0c0
.word 0xcec0c67c,0x007cc6c6
.word 0xfec6c6c6,0x00c6c6c6
.word 0x3030307c,0x007c3030
.word 0x0c0c0c3e,0x0078cccc
.word 0xf0d8ccc6,0x00c6ccd8
.word 0xc0c0c0c0,0x00fec0c0
.word 0xd6feeec6,0x00c6c6c6
.word 0xdef6e6c6,0x00c6c6ce
.word 0xc6c6c67c,0x007cc6c6
.word 0xfcc6c6fc,0x00c0c0c0
.word 0xc6c6c67c,0x0076ccde
.word 0xfcc6c6fc,0x00c6ccd8
.word 0x7cc0c67c,0x007cc606
.word 0x303030fc,0x00303030
.word 0xc6c6c6c6,0x007cc6c6
.word 0xc6c6c6c6,0x00386cc6
.word 0xd6c6c6c6,0x00c6eefe
.word 0x386cc6c6,0x00c6c66c
.word 0x306cc6c6,0x00303030
.word 0x180c06fe,0x00fe6030
