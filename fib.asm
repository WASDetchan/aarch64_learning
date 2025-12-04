.global _start
.section .text

fib_one:
  ret
fib:
  cmp x0, #1
  b.le fib_one
  
  sub sp, sp, #16
  str lr, [sp]
  sub x0, x0, #1
  str x0, [sp, #8]
  bl fib

  ldr x1, [sp, #8]
  str x0, [sp, #8]
  mov x0, x1
  sub x0, x0, #1
  bl fib
  

  ldr x1, [sp, #8]
  add x0, x0, x1

  ldr lr, [sp]
  add sp, sp, #16
  ret


_start:
  mov x0, #10
  
  bl fib

  mov x8, #93
  svc #0

