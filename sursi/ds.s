.global ds
ds:
ldr r5,=0x70020000
ldr r6,=0x9de1
mov r3,#0
ly:
mov r4,#0
lx:
strh r6,[r5],#2
add r4,r4,#1
cmp r4,#240
blt lx
add r3,r3,#1
cmp r3,#320
blt ly
ldr r0,=0x10020000
ldr r1,=0x70020000
mov r2,#0x38
str r2,[r0,#0]
ldr r2,=0x13f
str r2,[r0,#4]
mov r2,#0
str r2,[r0,#8]
str r2,[r0,#12]
str r1,[r0,#16]
str r1,[r0,#20]
ldr r2,=0x92d
str r2,[r0,#24]
bx lr
