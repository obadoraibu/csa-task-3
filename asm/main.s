	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"Error"
.LC2:
	.string	"%lf"
	.align 8
.LC5:
	.string	"Wrong accuracy(must be between 0.000002 and 0.0005), will be replaced with default 0.0005"
.LC6:
	.string	"w"
.LC7:
	.string	"%lf "
	.align 8
.LC8:
	.string	"Wrong amount of console parapmeters"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp						# / Save rbp to stack
	mov	rbp, rsp					# | rbp := rsp
	sub	rsp, 48						# \ rsp -= 48
	mov	DWORD PTR -36[rbp], edi		# argc
	mov	QWORD PTR -48[rbp], rsi		# argv
	cmp	DWORD PTR -36[rbp], 3   	# / if (argc != 3) {go to L2} 
	jne	.L2							# \
	mov	rax, QWORD PTR -48[rbp]		#
	add	rax, 8						#
	mov	rax, QWORD PTR [rax]		#
	lea	rdx, .LC0[rip]				# rdx := "r"
	mov	rsi, rdx					# rsi := rdx("r")
	mov	rdi, rax					# rdi := argv[1]
	call	fopen@PLT				# fopen(rdi(argv[1]), rsi("r"))		
	mov	QWORD PTR -8[rbp], rax		# returns input* in rax and saves in QWORD PTR -8[rbp]
	cmp	QWORD PTR -8[rbp], 0		# / if (input != NULL) {go to L3} 
	jne	.L3							# \
	lea	rax, .LC1[rip]				# 
	mov	rdi, rax					# rdi := "Error"
	mov	eax, 0				
	call	printf@PLT				# printf("Error")
	mov	eax, 0						# return 0
	jmp	.L9							# go to the end (L9)
.L3:
	lea	rdx, -24[rbp]				# rdx := &accuracy
	mov	rax, QWORD PTR -8[rbp]		# rax := input*
	lea	rcx, .LC2[rip]				# rcx := "%lf"
	mov	rsi, rcx					# rsi := rcx
	mov	rdi, rax					# rdi := rax(input*)
	mov	eax, 0
	call	__isoc99_fscanf@PLT		# fscanf(rdi, rsi, rdx);
	mov	rax, QWORD PTR -8[rbp]		# /
	mov	rdi, rax					# \ rdi := input
	call	fclose@PLT				# fclose(rdi(input));
	movsd	xmm0, QWORD PTR -24[rbp] 	#
	comisd	xmm0, QWORD PTR .LC3[rip]	#
	ja	.L5								# if (accuracy > 0.0005 || accuracy < 0.000001)
	movsd	xmm1, QWORD PTR -24[rbp]	#
	movsd	xmm0, QWORD PTR .LC4[rip]	#
	comisd	xmm0, xmm1					#
	jbe	.L6								#
.L5:
	lea	rax, .LC5[rip]					# /
	mov	rdi, rax						# | printf(.LC5);
	mov	eax, 0							# |
	call	printf@PLT					# \
	movsd	xmm0, QWORD PTR .LC3[rip]	# /
	movsd	QWORD PTR -24[rbp], xmm0	# \ accuracy = 0.0005;
.L6:	
	mov	rax, QWORD PTR -48[rbp]   		# 
	add	rax, 16							# 
	mov	rax, QWORD PTR [rax]			# rax = argv[2]
	lea	rdx, .LC6[rip]					# 
	mov	rsi, rdx						# rsi := "w"
	mov	rdi, rax						#
	call	fopen@PLT					# FILE *output = fopen(rdi(argv[2]), rsi("w"));	
	mov	QWORD PTR -16[rbp], rax			# QWORD PTR -16[rbp] := output
	cmp	QWORD PTR -16[rbp], 0			# / if (output != NULL) { go to L8}
	jne	.L8								# \
	lea	rax, .LC1[rip]					#
	mov	rdi, rax						# rdi := "Error"
	mov	eax, 0							#
	call	printf@PLT					# printf("Error");
	mov	eax, 0							#
	jmp	.L9								# go to L9
.L8:
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rax
	call	logic@PLT					# logic(accuracy)
	movq	rax, xmm0
	mov	rdx, QWORD PTR -16[rbp]
	movq	xmm0, rax				# resul from logic(accuracy)
	lea	rax, .LC7[rip]
	mov	rsi, rax
	mov	rdi, rdx					# rdi := output
	mov	eax, 1						# 
	call	fprintf@PLT				# fprintf(output, "%lf ", logic(accuracy));
	mov	rax, QWORD PTR -16[rbp]		
	mov	rdi, rax					# rdi := output
	call	fclose@PLT				# fclose(output)
	mov	eax, 0
	jmp	.L9							# go to L9
.L2:
	lea	rax, .LC8[rip]
	mov	rdi, rax					# rdi := "Wrong amount of console parapmeters"
	mov	eax, 0
	call	printf@PLT				# printf(rdi("Wrong amount of console parapmeters"))
	mov	eax, 0						# return 0;
.L9:
	leave							# / finish program
	ret								# \
	.size	main, .-main
	.section	.rodata
	.align 8
.LC3:
	.long	-755914244
	.long	1061184077
	.align 8
.LC4:
	.long	-1598689907
	.long	1051772663
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
