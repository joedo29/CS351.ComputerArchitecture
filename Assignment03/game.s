## Author: Joe Do
## Date: Feb 24, 2018
## Assembly code
## Write assembly code to get the user to guess the number that the program has randomly picked

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
	subq	$48, %rsp
	xorl	%eax, %eax
	movl	%eax, %edi
	movl	$0, -4(%rbp)
	callq	_time
	movl	%eax, %ecx
	movl	%ecx, %edi
	callq	_srand
	callq	_rand
	leaq	L_.str(%rip), %rdi
	movl	$10, %ecx
	cltd
	idivl	%ecx
	movl	%edx, -8(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -16(%rbp)
	movb	$0, %al
	callq	_printf
	movl	%eax, -24(%rbp)         ## 4-byte Spill
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$0, -12(%rbp)
	jne	LBB0_7
## BB#2:                                ##   in Loop: Header=BB0_1 Depth=1
	leaq	L_.str.1(%rip), %rdi
	leaq	-20(%rbp), %rsi
	movb	$0, %al
	callq	_scanf
	movl	-16(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -16(%rbp)
	movl	-20(%rbp), %ecx
	cmpl	-8(%rbp), %ecx
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	jge	LBB0_4
## BB#3:                                ##   in Loop: Header=BB0_1 Depth=1
	leaq	L_.str.2(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -32(%rbp)         ## 4-byte Spill
	jmp	LBB0_1
LBB0_4:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	-20(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	LBB0_6
## BB#5:                                ##   in Loop: Header=BB0_1 Depth=1
	leaq	L_.str.3(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -36(%rbp)         ## 4-byte Spill
	jmp	LBB0_1
LBB0_6:                                 ##   in Loop: Header=BB0_1 Depth=1
	leaq	L_.str.4(%rip), %rdi
	movl	-16(%rbp), %esi
	movb	$0, %al
	callq	_printf
	movl	$1, -12(%rbp)
	movl	%eax, -40(%rbp)         ## 4-byte Spill
	jmp	LBB0_1
LBB0_7:
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Guess a number from 0 to 9: "

L_.str.1:                               ## @.str.1
	.asciz	"%d"

L_.str.2:                               ## @.str.2
	.asciz	"Too low. Guess again: "

L_.str.3:                               ## @.str.3
	.asciz	"Too hight. Guess again: "

L_.str.4:                               ## @.str.4
	.asciz	"You guess correctly in %d tries!\n"


.subsections_via_symbols
