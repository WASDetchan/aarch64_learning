
input:
  mov x4, #0
  bl input_symbol
  subs x0, x0, #'0'
  b.lt finish_input
  cmp x0, #9
  b.gt finish_input
  mov x2, #10
  mul x4, x4, x2
  add x4, x4, x0
  b input

input_symbol:
  sub sp, sp, #16
  mov x8, #63 
  mov x0, #0
  mov x1, sp
  mov x2, 1
  svc #0
  ldr x0, [sp]
  add sp, sp, #16
  ret

finish_input:
  mov x0,x4
  ret

output:
  mov x4, x0
output_start:
  mov x2, #10
  udiv x0, x4, x2
  msub x0, x0, x2, x4
  bl output_symbol
  cmp x4, #0
  b output_start
  ret

output_symbol:
  sub sp, sp, #16
  str x0, [sp]
  mov x8, #64
  mov x0, #1
  mov x1, sp
  mov x2, 1
  svc #0
  add sp, sp, #16
  ret

