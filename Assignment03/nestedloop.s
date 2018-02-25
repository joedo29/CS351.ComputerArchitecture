## Author: Joe Do
## Date: Feb 24, 2018
## Assembly code
## Write a nested for loop structure that prints out a pyramid of stars

	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi0:
	.cfi_def_cfa_offset 16
Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi2:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	$1, -8(%rbp)
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
                                        ##     Child Loop BB0_7 Depth 2
	cmpl	$8, -8(%rbp)
	jg	LBB0_17
## BB#2:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %eax
	movl	%eax, -12(%rbp)
LBB0_3:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpl	$8, -12(%rbp)
	jge	LBB0_6
## BB#4:                                ##   in Loop: Header=BB0_3 Depth=2
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -20(%rbp)         ## 4-byte Spill
## BB#5:                                ##   in Loop: Header=BB0_3 Depth=2
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB0_3
LBB0_6:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	$1, -16(%rbp)
LBB0_7:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-16(%rbp), %eax
	movl	-8(%rbp), %ecx
	shll	$1, %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jg	LBB0_15
## BB#8:                                ##   in Loop: Header=BB0_7 Depth=2
	cmpl	$8, -8(%rbp)
	je	LBB0_11
## BB#9:                                ##   in Loop: Header=BB0_7 Depth=2
	cmpl	$1, -16(%rbp)
	je	LBB0_11
## BB#10:                               ##   in Loop: Header=BB0_7 Depth=2
	movl	-16(%rbp), %eax
	movl	-8(%rbp), %ecx
	shll	$1, %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jne	LBB0_12
LBB0_11:                                ##   in Loop: Header=BB0_7 Depth=2
	leaq	L_.str.1(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -24(%rbp)         ## 4-byte Spill
	jmp	LBB0_13
LBB0_12:                                ##   in Loop: Header=BB0_7 Depth=2
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -28(%rbp)         ## 4-byte Spill
LBB0_13:                                ##   in Loop: Header=BB0_7 Depth=2
	jmp	LBB0_14
LBB0_14:                                ##   in Loop: Header=BB0_7 Depth=2
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	LBB0_7
LBB0_15:                                ##   in Loop: Header=BB0_1 Depth=1
	leaq	L_.str.2(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -32(%rbp)         ## 4-byte Spill
## BB#16:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	LBB0_1
LBB0_17:
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	" "

L_.str.1:                               ## @.str.1
	.asciz	"*"

L_.str.2:                               ## @.str.2
	.asciz	"\n"


.subsections_via_symbols
