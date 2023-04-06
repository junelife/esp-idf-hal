/*
 * SPDX-FileCopyrightText: 2022 Espressif Systems (Shanghai) CO LTD
 *
 * SPDX-License-Identifier: Apache-2.0
 */
	.section .text.vectors
	.global irq_vector
	.global reset_vector

/* The reset vector, jumps to startup code */
reset_vector:
	j _start

/* Interrupt handler */
.balign 16
irq_vector:
	ret

	.section .text

_start:
	/* setup the stack pointer */
	la sp, _stack_top
    // call _start_rust (in start.rs)
    // will automatically do restore and halt after main is run
    jal zero, _start_rust
loop:
	j loop

// Make sure there is an abort when linking
.global abort
abort:
    j abort