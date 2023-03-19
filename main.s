	.file	"main.c"
	.text
	.globl	mxx_size
	.section	.rodata
	.align 4
	.type	mxx_size, @object
	.size	mxx_size, 4
mxx_size:
	.long	5000
	.text
	.globl	reverse
	.type	reverse, @function
reverse:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -12(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L2
.L9:
	movl	-20(%rbp), %eax
	movl	%eax, -8(%rbp)
.L6:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L3
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$122, %al
	jle	.L4
.L3:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jg	.L4
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$90, %al
	jg	.L11
.L4:
	addl	$1, -20(%rbp)
	jmp	.L6
.L11:
	nop
	movl	-8(%rbp), %eax
	movl	%eax, -16(%rbp)
	jmp	.L7
.L8:
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, -4(%rbp)
	movl	-16(%rbp), %eax
	subl	-8(%rbp), %eax
	movl	%eax, %edx
	movl	-20(%rbp), %eax
	subl	%edx, %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movl	-16(%rbp), %eax
	subl	-8(%rbp), %eax
	movl	%eax, %edx
	movl	-20(%rbp), %eax
	subl	%edx, %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movb	%dl, (%rax)
	addl	$1, -16(%rbp)
.L7:
	movl	-16(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jle	.L8
	addl	$1, -20(%rbp)
.L2:
	movl	-20(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.L9
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	reverse, .-reverse
	.section	.rodata
	.align 8
.LC0:
	.string	"Run the program with 2 arguments: 1) name for input file. 2) name for output file."
.LC1:
	.string	"Openning pipe error."
.LC2:
	.string	"Creation child-procces error."
	.align 8
.LC3:
	.string	"Cant close reading descriptor of pipe."
.LC4:
	.string	"Reading file error."
.LC5:
	.string	"Error with closing file."
	.align 8
.LC6:
	.string	"Error with writing data to pipe."
	.align 8
.LC7:
	.string	"Cant close writing descriptor of pipe."
	.align 8
.LC8:
	.string	"Error with reading data from pipe."
.LC9:
	.string	"Cant open output file."
	.align 8
.LC10:
	.string	"Erorr with writing data in output file, not enough size."
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$80, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %r12
	cmpl	$3, -84(%rbp)
	je	.L13
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	jmp	.L14
.L13:
	movl	$5000, %eax
	cltq
	subq	$1, %rax
	movq	%rax, -56(%rbp)
	movl	$5000, %eax
	cltq
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$5000, %eax
	cltq
	movq	%rax, %rcx
	movl	$0, %ebx
	movl	$5000, %eax
	cltq
	movl	$16, %edx
	subq	$1, %rdx
	addq	%rdx, %rax
	movl	$16, %ebx
	movl	$0, %edx
	divq	%rbx
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L15:
	cmpq	%rdx, %rsp
	je	.L16
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L15
.L16:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L17
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L17:
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -48(%rbp)
	movl	$0, -80(%rbp)
	jmp	.L18
.L19:
	movq	-48(%rbp), %rdx
	movl	-80(%rbp), %eax
	cltq
	movb	$0, (%rdx,%rax)
	addl	$1, -80(%rbp)
.L18:
	movl	$5000, %eax
	cmpl	%eax, -80(%rbp)
	jl	.L19
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	pipe@PLT
	cmpl	$-1, %eax
	je	.L20
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	pipe@PLT
	cmpl	$-1, %eax
	jne	.L21
.L20:
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L21:
	call	fork@PLT
	movl	%eax, -76(%rbp)
	cmpl	$0, -76(%rbp)
	jns	.L22
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L22:
	cmpl	$0, -76(%rbp)
	jle	.L23
	movl	-40(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	testl	%eax, %eax
	jns	.L24
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L24:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movl	$438, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -60(%rbp)
	cmpl	$0, -60(%rbp)
	jns	.L25
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L25:
	movl	$5000, %eax
	movslq	%eax, %rdx
	movq	-48(%rbp), %rcx
	movl	-60(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	-60(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	testl	%eax, %eax
	jns	.L26
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L26:
	movl	$5000, %eax
	movslq	%eax, %rdx
	movl	-36(%rbp), %eax
	movq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	%eax, -68(%rbp)
	movl	$5000, %eax
	cmpl	%eax, -68(%rbp)
	je	.L27
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L27:
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	testl	%eax, %eax
	jns	.L28
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L23:
	call	fork@PLT
	movl	%eax, -72(%rbp)
	cmpl	$0, -72(%rbp)
	jns	.L29
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L29:
	cmpl	$0, -72(%rbp)
	jle	.L30
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	testl	%eax, %eax
	jns	.L31
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L31:
	movl	$5000, %eax
	movslq	%eax, %rdx
	movl	-40(%rbp), %eax
	movq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -68(%rbp)
	cmpl	$0, -68(%rbp)
	jns	.L32
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L32:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	reverse
	movl	-40(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	testl	%eax, %eax
	jns	.L33
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L33:
	movl	$5000, %eax
	movslq	%eax, %rdx
	movl	-28(%rbp), %eax
	movq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	%eax, -68(%rbp)
	movl	$5000, %eax
	cmpl	%eax, -68(%rbp)
	je	.L34
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L34:
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	testl	%eax, %eax
	jns	.L28
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L30:
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	testl	%eax, %eax
	jns	.L35
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L35:
	movl	$5000, %eax
	movslq	%eax, %rdx
	movl	-32(%rbp), %eax
	movq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -68(%rbp)
	cmpl	$0, -68(%rbp)
	jns	.L36
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L36:
	movl	-32(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	testl	%eax, %eax
	jns	.L37
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L37:
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movl	$438, %edx
	movl	$65, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -64(%rbp)
	cmpl	$0, -64(%rbp)
	jns	.L38
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L38:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-48(%rbp), %rcx
	movl	-64(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	movslq	%eax, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	%rax, %rbx
	je	.L39
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L39:
	movl	-64(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	testl	%eax, %eax
	jns	.L28
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L28:
	movl	$5000, %eax
	movq	-48(%rbp), %rdx
	cltq
	movb	$0, (%rdx,%rax)
	movl	$0, %eax
.L14:
	movq	%r12, %rsp
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L41
	call	__stack_chk_fail@PLT
.L41:
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
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
