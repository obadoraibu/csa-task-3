	.file	"logic.c"
	.intel_syntax noprefix
	.text
	.globl	logic
	.type	logic, @function
logic:
	endbr64
	push	rbp							# / Save rbp to stack
	mov	rbp, rsp						# | rbp := rsp
	sub	rsp, 48							# \ rsp -= 48
	movsd	QWORD PTR -40[rbp], xmm0	# QWORD PTR -40[rbp] := accuracy
	pxor	xmm0, xmm0					# / 
	movsd	QWORD PTR -8[rbp], xmm0		# \ double denominator = 0;
	movsd	xmm0, QWORD PTR .LC1[rip]	# /
	movsd	QWORD PTR -16[rbp], xmm0	# \ double res = 2;
.L2:	# while ()
	movsd	xmm0, QWORD PTR -16[rbp]	# / remember = res;
	movsd	QWORD PTR -24[rbp], xmm0	# \
	movsd	xmm1, QWORD PTR -8[rbp]		# /
	movsd	xmm0, QWORD PTR .LC1[rip]	# |
	addsd	xmm1, xmm0					# |
	movq	rax, xmm1					# |
	movq	xmm0, rax					# | denominator = sqrt(2 + denominator);
	call	sqrt@PLT					# |
	movq	rax, xmm0					# |
	mov	QWORD PTR -8[rbp], rax			# \
	movsd	xmm0, QWORD PTR .LC1[rip]	# /
	divsd	xmm0, QWORD PTR -8[rbp]		# |
	movsd	xmm1, QWORD PTR -16[rbp]	# | res *= 2 / denominator;
	mulsd	xmm0, xmm1					# |
	movsd	QWORD PTR -16[rbp], xmm0	# \
	movsd	xmm0, QWORD PTR -24[rbp]	# /
	subsd	xmm0, QWORD PTR -16[rbp]	# |
	movq	xmm1, QWORD PTR .LC2[rip]	# | if (fabs(remember - res) > accuracy)
	andpd	xmm0, xmm1					# | go to l2
	comisd	xmm0, QWORD PTR -40[rbp]	# |
	ja	.L2								# \ 
	movsd	xmm0, QWORD PTR -16[rbp]	#
	movq	rax, xmm0					#	
	movq	xmm0, rax					#
	leave							# / finish program
	ret								# \
	.size	logic, .-logic
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.align 16
.LC2:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
