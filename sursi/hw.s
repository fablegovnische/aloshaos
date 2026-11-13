.global hw
.global gp
.global fl
hw:
adr r3,gd
ldr r2,=0x9de1
str r2,[r3,#16]
ldr r2,=0x09c1
str r2,[r3,#20]
lsr r1,r0,#28
cmp r1,#8
bhs nk
mov r2,#0
str r2,[r3,#0]
add r2,r0,#0x200000
str r2,[r3,#4]
mov r2,#240
str r2,[r3,#8]
mov r2,#320
str r2,[r3,#12]
mov r2,#153
str r2,[r3,#28]
ldr r2,=0x10009000
str r2,[r3,#24]
bx lr
nk:
ldr r1,=0x48314000
ldr r2,=0xaaaa
str r2,[r1,#72]
w1:
ldr r2,[r1,#52]
tst r2,#16
bne w1
ldr r2,=0x5555
str r2,[r1,#72]
w2:
ldr r2,[r1,#52]
tst r2,#16
bne w2
mov r2,#1
str r2,[r3,#0]
ldr r2,=0x8f9c0000
str r2,[r3,#4]
mov r2,#800
str r2,[r3,#8]
mov r2,#480
str r2,[r3,#12]
mov r2,#233
str r2,[r3,#28]
ldr r2,=0x49020000
str r2,[r3,#24]
bx lr
gp:
adr r0,gd
bx lr
fl:
adr r0,gd
ldr r1,[r0,#0]
cmp r1,#0
bxeq lr
ldr r1,[r0,#4]
ldr r2,[r0,#8]
ldr r3,[r0,#12]
mul r2,r3,r2
add r2,r1,r2,lsl #1
cl:
mcr p15,0,r1,c7,c10,1
add r1,r1,#64
cmp r1,r2
blo cl
dsb
bx lr
.align 2
gd:
.word 0,0,0,0,0,0,0,0
