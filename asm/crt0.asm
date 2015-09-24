 ; Pokemon Pinball - Ruby & Sapphire Disassembly - GBA Header

.include "asm/rom_header.asm"

.definelabel IntrTable, 0x02003060
.definelabel AgbMain, 0x0800095C

.arm
; This should already be at correct address but just making sure
.org 0x080000C0
start_vector:
	mov		r0, #PSR_IRQ_MODE		; switch to IRQ mode
	msr		cpsr, r0
	ldr		sp, =sp_irq				; set SP_irq
	mov		r0, #PSR_SYS_MODE		; switch to system mode
	msr		cpsr, r0
	ldr		sp, =sp_usr				; set SP_usr
	ldr		r1, =INTR_VECTOR_BUF	; set interrupt address
	adr		r0, intr_main
	str		r0, [r1]
	ldr		r1, =AgbMain			; start & switch to 16bit code
	mov		lr, pc
	bx		r1
	b		start_vector			; reset

.pool

intr_main:
	MOV		R3, #REG_BASE						;check IE/IF
	ADD		R3, R3, #OFFSET_REG_IE
	LDR		R2, [R3]
	LDRH	R1, [R3,#(REG_IME - REG_IE)]
	MRS		R0, SPSR
	STMFD	SP!, {R0-R3,LR}
	MOV		R0, #1
	STRH	R0, [R3,#(REG_IME - REG_IE)]
	AND		R1, R2, R2, LSR#16					;r1: IE & IF
	MOV		R12, #0
	ANDS	R0, R1, #SIO_INTR_FLAG				; serial communication interrupt
	BNE		jump_intr
	ADD		R12, R12, #4
	ANDS	R0, R1, #TIMER3_INTR_FLAG			; timer 3 interrupt
	BNE		jump_intr
	ADD		R12, R12, #4
	ANDS	R0, R1, #V_BLANK_INTR_FLAG      ; V-blank interrupt
	BNE		jump_intr
	ADD		R12, R12, #4
	ANDS	R0, R1, #H_BLANK_INTR_FLAG      ; H-blank interrupt
	BNE		jump_intr
	ADD		R12, R12, #4
	ANDS	R0, R1, #V_COUNT_INTR_FLAG      ; V-counter interrupt
	BNE		jump_intr
	ADD		R12, R12, #4
	ANDS	R0, R1, #TIMER0_INTR_FLAG      ; timer 0 interrupt
	BNE		jump_intr
	ADD		R12, R12, #4
	ANDS	R0, R1, #TIMER1_INTR_FLAG   ; timer 1 interrupt
	BNE		jump_intr
	ADD		R12, R12, #4
	ANDS	R0, R1, #TIMER2_INTR_FLAG   ; timer 2 interrupt
	BNE		jump_intr
	ADD		R12, R12, #4
	ANDS	R0, R1, #DMA0_INTR_FLAG  ; DMA0 interrupt
	BNE		jump_intr
	ADD		R12, R12, #4
	ANDS	R0, R1, #DMA1_INTR_FLAG  ; DMA1 interrupt
	BNE		jump_intr
	ADD		R12, R12, #4
	ANDS	R0, R1, #DMA2_INTR_FLAG  ; DMA2 interrupt
	BNE		jump_intr
	ADD		R12, R12, #4
	ANDS	R0, R1, #DMA3_INTR_FLAG  ; DMA3 interrupt
	BNE		jump_intr
	ADD		R12, R12, #4
	ANDS	R0, R1, #KEY_INTR_FLAG ; key interrupt
	BNE		jump_intr
	ADD		R12, R12, #4
	ANDS	R0, R1, #GAMEPAK_INTR_FLAG ; Game Pak interrupt
	STRNEB	R0, [R3,#(REG_SOUNDCNT_X - REG_IE)]

@@loop:
	BNE		@@loop

jump_intr:
	STRH	R0, [R3,#2]				;IF clear
	MOV		R1, #0x20C0
	BIC		R2, R2, R0
	AND		R1, R1, R2
	STRH	R1, [R3]				;IE
	MRS		R3, CPSR
	BIC		R3, R3, #0xDF
	ORR		R3, R3, #0x1F
	MSR		CPSR_cf, R3
	LDR		R1, =IntrTable
	ADD		R1, R1, R12
	LDR		R0, [R1]
	STMFD	SP!, {LR}
	ADR		LR, exit_intr
	BX		R0

exit_intr:
	LDMFD	SP!, {LR}
	MRS		R3, CPSR
	BIC		R3, R3, #0xDF
	ORR		R3, R3, #0x92
	MSR		CPSR_cf, R3
	LDMFD	SP!, {R0-R3,LR}
	STRH	R2, [R3]
	STRH	R1, [R3,#8]
	MSR		SPSR_cf, R0
	BX		LR

	.pool

 ; make sure to leave an empty line at the end
