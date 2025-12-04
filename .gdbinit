# Auto-display registers for AArch64
define a64regs
  display/x {$x0, $x1, $x2, $x3, $x4, $x5}
  display/x {$x29, $x30, $sp}
  display $cpsr
  display/i $pc
end

# Start debugging session
define debug
  target remote localhost:1234
  a64regs
  break _start
end
