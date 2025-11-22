# aarch64-linux-gnu-as caesar.asm -o caesaar.o
# aarch64-linux-gnu-gcc caesar.o -o caesar.elf -static -nostdlib
# qemu-aarch64 caesar.elf

.global _start
.section .text

_start:
  b rio

exit:
  sub sp, sp, #16
  mov x1, sp

  mov w3, #10
  strb w3, [x1]

  mov x0, #1
  mov x8, #0x40
  mov x2, #1
  svc #0

  mov x8, #0x5d
  mov x0, #0
  svc #0

rio:
  sub sp, sp, #16
  mov x1, sp
  mov x2, #1
  mov x0, #0
  mov x8, #0x3f
  svc #0


  ldrb w3, [x1]
  cmp w3, #10
  b.eq exit
  cmp w3, #'a'
  b.lt noinc
  cmp w3, #'z'
  b.gt noinc
  b.ne nodec
  sub w3, w3, #26
nodec:
  add w3, w3, #1
  strb w3, [x1]

noinc:
  mov x0, #1
  mov x8, #0x40
  svc #0
  
  add sp, sp, #16

  b rio


.section .data
