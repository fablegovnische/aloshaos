.global bm
bm:
push {r4-r11,lr}
sub sp,sp,#24
adr r4,bi
ldrb r0,[r4,#0]
cmp r0,#0x42
bne dn
ldrb r0,[r4,#1]
cmp r0,#0x4d
bne dn
mov r1,#10
bl rd
add r5,r4,r0
mov r1,#18
bl rd
mov r6,r0
mov r1,#22
bl rd
mov r7,r0
mov r8,#0
cmp r7,#0
rsblt r7,r7,#0
movlt r8,#1
ldrb r9,[r4,#28]
lsr r9,r9,#3
cmp r9,#3
blt dn
mul r10,r6,r9
add r10,r10,#3
bic r10,r10,#3
bl gp
ldr r1,[r0,#4]
str r1,[sp,#0]
ldr r1,[r0,#8]
str r1,[sp,#4]
ldr r2,[r0,#12]
mov r11,#2
lsl r3,r6,#1
cmp r3,r1
bgt s1
lsl r3,r7,#1
add r3,r3,#40
cmp r3,r2
ble sc
s1:
mov r11,#1
sc:
str r8,[sp,#16]
str r11,[sp,#20]
mul r3,r6,r11
sub r3,r1,r3
asr r3,r3,#1
str r3,[sp,#8]
mul r3,r7,r11
sub r1,r2,r3
sub r1,r1,#26
asr r1,r1,#1
cmp r1,#2
movlt r1,#2
str r1,[sp,#12]
add r1,r1,r3
add r1,r1,#12
str r1,[r0,#28]
mov r4,#0
by:
ldr r0,[sp,#16]
cmp r0,#0
subeq r0,r7,#1
subeq r0,r0,r4
movne r0,r4
mul r0,r10,r0
add r8,r5,r0
mov r11,#0
bx:
ldrb r0,[r8,#0]
ldrb r1,[r8,#1]
ldrb r2,[r8,#2]
add r8,r8,r9
lsr r0,r0,#3
lsr r1,r1,#2
lsr r2,r2,#3
orr r0,r0,r1,lsl #5
orr r0,r0,r2,lsl #11
ldr r1,[sp,#20]
ldr r2,[sp,#12]
mul r3,r4,r1
add r2,r2,r3
ldr r3,[sp,#8]
mul ip,r11,r1
add r3,r3,ip
cmp r3,#0
blt nx
ldr ip,[sp,#4]
cmp r3,ip
bge nx
mul r2,ip,r2
add r2,r2,r3
ldr r3,[sp,#0]
add r2,r3,r2,lsl #1
strh r0,[r2,#0]
cmp r1,#2
blt nx
strh r0,[r2,#2]
add r2,r2,ip,lsl #1
strh r0,[r2,#0]
strh r0,[r2,#2]
nx:
add r11,r11,#1
cmp r11,r6
blt bx
add r4,r4,#1
cmp r4,r7
blt by
bl fl
dn:
add sp,sp,#24
pop {r4-r11,pc}
rd:
add r2,r4,r1
ldrb r0,[r2,#0]
ldrb r3,[r2,#1]
orr r0,r0,r3,lsl #8
ldrb r3,[r2,#2]
orr r0,r0,r3,lsl #16
ldrb r3,[r2,#3]
orr r0,r0,r3,lsl #24
bx lr
.ltorg
.align 2
bi:
.incbin "bmps/alosha.bmp"
.align 2
