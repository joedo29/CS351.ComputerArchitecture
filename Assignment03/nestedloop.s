## Author: Joe Do
## Date: Mar 01, 2018
## Assembly code
## Write assembly code using nested loop to print out an equilateral triangle of stars


  .text
  .global main
main:
  ## STMFD means to push one or more things onto a stack
  ## "SP!" means that stack pointer will be used to point to the stack
  ## 'lr' means the return address is what is to be pushed.
  ## 'fp' is frame pointer for our local variable
  ## 'putchar' is used to print character to the console

  stmfd   sp!, {fp, lr}
  add     fp, sp, #4
  sub     sp, sp, #8
  mov     r3, #1
  str     r3, [fp, #-8]
  b       .L2
.L10:
  ldr     r3, [fp, #-8]
  str     r3, [fp, #-12]
  b       .L3
.L4:
  mov     r0, #32
  bl      putchar
  ldr     r3, [fp, #-12]
  add     r3, r3, #1
  str     r3, [fp, #-12]
.L3:
  ldr     r3, [fp, #-12]
  cmp     r3, #7
  ble     .L4
  mov     r3, #1
  str     r3, [fp, #-12]
  b       .L5
  .L9:
  ldr     r3, [fp, #-8]
  cmp     r3, #8
  beq     .L6
  ldr     r3, [fp, #-12]
  cmp     r3, #1
  beq     .L6
  ldr     r3, [fp, #-8]
  mov     r3, r3, asl #1
  sub     r2, r3, #1
  ldr     r3, [fp, #-12]
  cmp     r2, r3
  bne     .L7
.L6:
  mov     r0, #42
  bl      putchar
  b       .L8
.L7:
  mov     r0, #32
  bl      putchar
.L8:
  ldr     r3, [fp, #-12]
  add     r3, r3, #1
  str     r3, [fp, #-12]
.L5:
  ldr     r3, [fp, #-8]
  mov     r3, r3, asl #1
  sub     r2, r3, #1
  ldr     r3, [fp, #-12]
  cmp     r2, r3
  bge     .L9
  mov     r0, #10
  bl      putchar
  ldr     r3, [fp, #-8]
  add     r3, r3, #1
  str     r3, [fp, #-8]
.L2:
  ldr     r3, [fp, #-8]
  cmp     r3, #8
  ble     .L10
  mov     r3, #0
  mov     r0, r3
  sub     sp, fp, #4

  ## Pop from the stack
  ldmfd   sp!, {fp, pc}
