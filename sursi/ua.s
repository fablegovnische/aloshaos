.global uc
.global us
uc:
push {r4,lr}
mov r4,r0
bl gp
ldr r1,[r0,#0]
ldr r2,[r0,#24]
cmp r1,#0
bne wn
wq:
ldr r3,[r2,#24]
tst r3,#32
bne wq
strb r4,[r2,#0]
pop {r4,pc}
wn:
ldrb r3,[r2,#20]
tst r3,#32
beq wn
strb r4,[r2,#0]
pop {r4,pc}
us:
push {r4,lr}
mov r4,r0
sl:
ldrb r0,[r4],#1
cmp r0,#0
beq se
bl uc
b sl
se:
pop {r4,pc}
