/*
 * \brief   Startup code for Genode applications
 * \author  Christian Helmuth
 * \date    2006-07-06
 */

/*
 * Copyright (C) 2006-2011 Genode Labs GmbH
 *
 * This file is part of the Genode OS framework, which is distributed
 * under the terms of the GNU General Public License version 2.
 */

/*--- .text (program code) -------------------------*/
	.text

	.globl _start
_start:

	movq __initial_sp@GOTPCREL(%rip), %rax
	movq %rsp, (%rax)
	/*
	 * environ = &argv[argc + 1]
	 * in Genode argc is always 1
	 */
	popq %rax /* argc */
	popq %rax /* argv[0] */
	popq %rax /* NULL */
	movq lx_environ@GOTPCREL(%rip), %rax
	movq %rsp, (%rax)

	/* XXX Switch to our own stack.  */
	leaq _stack_high@GOTPCREL(%rip), %rax
	movq (%rax), %rsp

	/* Clear the base pointer so that stack backtraces will work.  */
	xorq %rbp,%rbp

	/* Jump into init C code */
	callq _main

	/* We should never get here since _main does not return */
1:	int  $3
	jmp  2f
	.ascii "_main() returned."
2:	jmp  1b


/*--------------------------------------------------*/
	.data
	.p2align 8
	.globl	__dso_handle
__dso_handle:
	.quad	0
	
	.globl	__initial_sp
__initial_sp:
	.quad	0

/*--- .eh_frame (exception frames) -----------------*/
/*
	.section .eh_frame,"aw"
	.globl	__EH_FRAME_BEGIN__
__EH_FRAME_BEGIN__:
*/

/*--- .bss (non-initialized data) ------------------*/
	.bss
	.p2align 8
	.globl	_stack_low
_stack_low:
	.space	64*1024
	.globl	_stack_high
_stack_high:
