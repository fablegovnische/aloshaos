.global ds
ds:
push {r4-r8,lr}
bl gp
ldr r4,[r0,#0]
ldr r5,[r0,#4]
ldr r6,[r0,#8]
ldr r7,[r0,#12]
ldr r8,[r0,#16]
mul r2,r6,r7
mov r1,r5
px:
strh r8,[r1],#2
subs r2,r2,#1
bne px
cmp r4,#0
bne ok
ldr r0,=0x10020000
lsr r2,r6,#4
sub r2,r2,#1
lsl r2,r2,#2
str r2,[r0,#0]
sub r2,r7,#1
str r2,[r0,#4]
mov r2,#0
str r2,[r0,#8]
str r2,[r0,#12]
str r5,[r0,#16]
str r5,[r0,#20]
ldr r2,=0x92d
str r2,[r0,#24]
ok:
bl fl
pop {r4-r8,pc}
