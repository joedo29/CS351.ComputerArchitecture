## Author: Joe Do
## Date: Mar 01, 2018
## Assembly code
## Write assembly code to get the user to guess the number that the program has randomly picked


.arch armv6
  ## read only data
  .section .rodata

.LC0:
  .ascii  "Guess a number from 0 to 9: \000"

.LC1:
  .ascii  "%d\000"

.LC2:
  .ascii  "Too low. Guess again: \000"

.LC3:
  .ascii  "Too hight. Guess again: \000"

.LC4:
  .ascii  "You guess correctly in %d tries!\012\000"

  .text
  .global main
  .type   main, %function
main:
## STMFD means to push one or more things onto a stack
## "SP!" means that stack pointer will be used to point to the stack
## 'lr' means the return address is what is to be pushed.
## 'fp' is frame pointer for our local variable
## 'putchar' is used to print character to the console

  stmfd   sp!, {fp, lr}
  add     fp, sp, #4
  sub     sp, sp, #16
  mov     r0, #0
  bl      time
  mov     r3, r0
  mov     r0, r3
  bl      srand
  bl      rand
  mov     r2, r0
  ldr     r3, .L7
  smull   r1, r3, r3, r2

  ## perform Arithmetic Shift Right
  mov     r1, r3, asr #2
  mov     r3, r2, asr #31

  ## The RSB instruction subtracts the value in Rn from the value of Operand2.
  rsb     r1, r3, r1
  mov     r3, r1
  mov     r3, r3, asl #2
  add     r3, r3, r1
  mov     r3, r3, asl #1
  rsb     r3, r3, r2
  str     r3, [fp, #-16]
  mov     r3, #0
  str     r3, [fp, #-8]
  mov     r3, #0
  str     r3, [fp, #-12]
  ldr     r0, .L7+4

  ## calling printf to print out an integer
  bl      printf
  b       .L2
.L5:
  sub     r3, fp, #20
  ldr     r0, .L7+8
  mov     r1, r3

  ## take a series of inputs saved as a string
  bl      __isoc99_scanf
  ldr     r3, [fp, #-12]
  add     r3, r3, #1
  str     r3, [fp, #-12]
  ldr     r2, [fp, #-20]
  ldr     r3, [fp, #-16]
  cmp     r2, r3
  bge     .L3
  ldr     r0, .L7+12
  bl      printf
  b       .L2
.L3:
  ldr     r2, [fp, #-20]
  ldr     r3, [fp, #-16]
  cmp     r2, r3
  ble     .L4
  ldr     r0, .L7+16
  bl      printf
  b       .L2
.L4:
  ldr     r0, .L7+20
  ldr     r1, [fp, #-12]
  bl      printf
  mov     r3, #1
  str     r3, [fp, #-8]
.L2:
  ldr     r3, [fp, #-8]
  cmp     r3, #0
  beq     .L5
  mov     r3, #0
  mov     r0, r3
  sub     sp, fp, #4
  ldmfd   sp!, {fp, pc}
.L8:

.L7:
  .word   1717986919 # using for modulo
  .word   .LC0
  .word   .LC1
  .word   .LC2
  .word   .LC3
  .word   .LC4
