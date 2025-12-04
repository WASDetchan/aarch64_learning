.global _start
.section .text

is_prime:
  cmp x0, #1
  b.eq finish_not_prime
  mov x1, #1
prime_loop:
  add x1, x1, #1
  mul x4, x1, x1
  cmp x0, x4
  b.lt finish_prime
  udiv x4, x0, x1
  mul x4, x4, x1
  cmp x0, x4
  b.ne prime_loop
  mov x0, #0
  ret

finish_prime:
  mov x0, #1
  ret

finish_not_prime:
  mov x0, #0
  ret

_start:
  mov x0, #10
  
  bl is_prime

  mov x8, #93
  svc #0

