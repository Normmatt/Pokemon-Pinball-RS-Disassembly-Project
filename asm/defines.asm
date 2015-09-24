 ; Pokemon Pinball - Ruby & Sapphire Disassembly - Defines
 
;/*------------------------------------------------------------------*/
;/*                             Misc                                 */
;/*------------------------------------------------------------------*/

.macro adr,destReg,Address
	.if (. & 2) != 0
		add destReg, r15, (Address-.)-6
	.else
		add destReg, r15, (Address-.)-8
	.endif
.endmacro

.definelabel sp_usr,					0x03007F00			; User Stack
.definelabel sp_irq,					0x03007FA0			; Interrupt Stack
 
;/*------------------------------------------------------------------*/
;/*                Register & RAM Reset System Call                  */
;/*------------------------------------------------------------------*/

.definelabel RESET_ALL_FLAG,			0xFF				; Reset all

.definelabel RESET_ALL_REG_FLAG,		0xE0				; Reset all registers

.definelabel RESET_REG_FLAG,			0x80				; Reset registers 

.definelabel RESET_REG_SOUND_FLAG,		0x40				; Reset sound register
.definelabel RESET_REG_SIO_FLAG,		0x20				; Reset SIO register

.definelabel RESET_ALL_RAM_FLAG,		0x1F				; Clear the entire RAM

.definelabel RESET_EX_WRAM_FLAG,		0x01				; Clear CPU external RAM
.definelabel RESET_CPU_WRAM_FLAG,		0x02				; Clear CPU internal RAM
.definelabel RESET_PLTT_FLAG,			0x04				; Clear palette
.definelabel RESET_VRAM_FLAG,			0x08				; Clear VRAM
.definelabel RESET_OAM_FLAG,			0x10				; Clear OAM

;/*------------------------------------------------------------------*/
;/*                  Program Status Register                         */
;/*------------------------------------------------------------------*/
.definelabel PSR_CPU_MODE_MASK,			0x1F				; CPU Mode

.definelabel PSR_USER_MODE,				0x10				; User
.definelabel PSR_FIQ_MODE,				0x11				; FIQ
.definelabel PSR_IRQ_MODE,				0x12				; IRQ
.definelabel PSR_SVC_MODE,				0x13				; Supervisor
.definelabel PSR_ABORT_MODE,			0x17				; Abort (Prefetch/Data)
.definelabel PSR_UNDEF_MODE,			0x1B				; Undefined Command
.definelabel PSR_SYS_MODE,				0x1F				; System

.definelabel PSR_THUMB_STATE,			0x20				; THUMB State
.definelabel PSR_FIQ_DISABLE,			0x40				; FIQ Disable
.definelabel PSR_IRQ_DISABLE,			0x80				; IRQ Disable
.definelabel PSR_IRQ_FIQ_DISABLE,		0xC0				; IRQ & FIQ Disable

;/*------------------------------------------------------------------*/
;/*                  Interrupt Request/ Enable Flag                  */
;/*------------------------------------------------------------------*/

.definelabel V_BLANK_INTR_FLAG,			0x0001				; V Blank Interrupt
.definelabel H_BLANK_INTR_FLAG,			0x0002				; H Blank Interrupt
.definelabel V_COUNT_INTR_FLAG,			0x0004				; V Counter Corresponding Interrupt
.definelabel TIMER0_INTR_FLAG,			0x0008				; Timer 0 Interrupt
.definelabel TIMER1_INTR_FLAG,			0x0010				; Timer 1 Interrupt
.definelabel TIMER2_INTR_FLAG,			0x0020				; Timer 2 Interrupt
.definelabel TIMER3_INTR_FLAG,			0x0040				; Timer 3 Interrupt
.definelabel SIO_INTR_FLAG,				0x0080				; Serial Communication Interrupt
.definelabel DMA0_INTR_FLAG,			0x0100				; DMA0 Interrupt
.definelabel DMA1_INTR_FLAG,			0x0200				; DMA1 Interrupt
.definelabel DMA2_INTR_FLAG,			0x0400				; DMA2 Interrupt
.definelabel DMA3_INTR_FLAG,			0x0800				; DMA3 Interrupt
.definelabel KEY_INTR_FLAG,				0x1000				; Key Interrupt
.definelabel GAMEPAK_INTR_FLAG,			0x2000				; Game Pak Interrupt

.definelabel INTR_VECTOR_BUF,			0x03007FFC			; Pointer to Interrupt Handler

;/*------------------------------------------------------------------*/
;/*                          Key                                     */
;/*------------------------------------------------------------------*/

.definelabel BUTTON_MASK,				0x030F				; Button
.definelabel PLUS_KEY_MASK,				0x00F0				; +Control Pad
.definelabel ALL_KEY_MASK,				0x03FF				; All Key

.definelabel A_BUTTON,					0x0001				; A Button
.definelabel B_BUTTON,					0x0002				; B Button
.definelabel SELECT_BUTTON,				0x0004				; SELECT
.definelabel START_BUTTON,				0x0008				; START
.definelabel R_KEY,						0x0010				; Right Button
.definelabel L_KEY,						0x0020				; Left Button
.definelabel U_KEY,						0x0040				; Up Button
.definelabel D_KEY,						0x0080				; Down Button
.definelabel R_BUTTON,					0x0100				; R Button
.definelabel L_BUTTON,					0x0200				; L Button
.definelabel KEY_IF_ENABLE,				0x4000				; Interrupt Request Enable
.definelabel KEY_OR_INTR,				0x0000				; Normal Key Interrupt
.definelabel KEY_AND_INTR,				0x8000				; AND Key Interrupt

;/*--------------------------------------------------------------------*/
;/*                      Register Address                              */
;/*--------------------------------------------------------------------*/
.definelabel REG_BASE,					0x04000000			; Registers
.definelabel REG_IME,					(REG_BASE + 0x208)	; Interrupt Master Enable
.definelabel REG_IE,					(REG_BASE + 0x200)	; Interrupt Enable
.definelabel REG_IF,					(REG_BASE + 0x202)	; Interrupt Request

.definelabel REG_WAITCNT,				(REG_BASE + 0x204)	; Game Pak Wait Control

.definelabel REG_DISPCNT,				(REG_BASE + 0x0)	; Display Control
.definelabel REG_DISPSTAT,				(REG_BASE + 0x4)	; Display status
.definelabel REG_STAT,					(REG_BASE + 0x4)	; Display Status, backward compatibility 
.definelabel REG_VCOUNT,				(REG_BASE + 0x6)	; V Counter

.definelabel REG_MOSAIC,				(REG_BASE + 0x4c)	; Mosaic Size

.definelabel REG_BLDCNT,				(REG_BASE + 0x50)	; Blend Mode Control
.definelabel REG_BLDALPHA,				(REG_BASE + 0x52)	; Semi-transparent Parameter
.definelabel REG_BLDY,					(REG_BASE + 0x54)	; Brightness Change Parameter

.definelabel REG_WINCNT,				(REG_BASE + 0x40)	; Window Control
.definelabel REG_WIN0H,					(REG_BASE + 0x40)	; Window 0 Horizontal Area
.definelabel REG_WIN1H,					(REG_BASE + 0x42)	; Window 1 Horizontal Area
.definelabel REG_WIN0V,					(REG_BASE + 0x44)	; Window 0 Vertical Area
.definelabel REG_WIN1V,					(REG_BASE + 0x46)	; Window 1 Vertical Area
.definelabel REG_WININ,					(REG_BASE + 0x48)	; Internal Window Control
.definelabel REG_WIN0,					(REG_BASE + 0x48)	; Window 0 Control
.definelabel REG_WIN1,					(REG_BASE + 0x49)	; Window 1 Control
.definelabel REG_WINOUT,				(REG_BASE + 0x4a)	; External Window Control
.definelabel REG_OBJWIN,				(REG_BASE + 0x4b)	; OBJ Window Control


.definelabel REG_BGCNT,					(REG_BASE + 0x8)	; BG Control
.definelabel REG_BG0CNT,				(REG_BASE + 0x8)	; BG 0 Control
.definelabel REG_BG1CNT,				(REG_BASE + 0xa)	; BG 1 Control
.definelabel REG_BG2CNT,				(REG_BASE + 0xc)	; BG 2 Control
.definelabel REG_BG3CNT,				(REG_BASE + 0xe)	; BG 3 Control
.definelabel REG_BGOFS,					(REG_BASE + 0x10)	; BG Offset
.definelabel REG_BG0HOFS,				(REG_BASE + 0x10)	; BG 0 H Offset
.definelabel REG_BG0VOFS,				(REG_BASE + 0x12)	; BG 0 V Offset
.definelabel REG_BG1HOFS,				(REG_BASE + 0x14)	; BG 1 H Offset
.definelabel REG_BG1VOFS,				(REG_BASE + 0x16)	; BG 1 V Offset
.definelabel REG_BG2HOFS,				(REG_BASE + 0x18)	; BG 2 H Offset
.definelabel REG_BG2VOFS,				(REG_BASE + 0x1a)	; BG 2 V Offset
.definelabel REG_BG3HOFS,				(REG_BASE + 0x1c)	; BG 3 H Offset
.definelabel REG_BG3VOFS,				(REG_BASE + 0x1e)	; BG 3 V Offset
.definelabel REG_BG2AFFINE,				(REG_BASE + 0x20)	; BG 2 Affine Transformation Parameters
.definelabel REG_BG2PA,					(REG_BASE + 0x20)	; BG 2 Line Direction X Coordinate Differernce
.definelabel REG_BG2PB,					(REG_BASE + 0x22)	; BG 2 Vertical Direction X Coordinate Difference
.definelabel REG_BG2PC,					(REG_BASE + 0x24)	; BG 2 Line Direction Y Coordinate Difference
.definelabel REG_BG2PD,					(REG_BASE + 0x26)	; BG 2 Vertical Direction Y Coordinate Difference
.definelabel REG_BG2X,					(REG_BASE + 0x28)	; BG 2 Start X Coordinate
.definelabel REG_BG2X_L,				(REG_BASE + 0x28)
.definelabel REG_BG2X_H,				(REG_BASE + 0x2a)
.definelabel REG_BG2Y,					(REG_BASE + 0x2c)	; BG 2 Start Y Coordinate
.definelabel REG_BG2Y_L,				(REG_BASE + 0x2c)
.definelabel REG_BG2Y_H,				(REG_BASE + 0x2e)
.definelabel REG_BG3AFFINE,				(REG_BASE + 0x30)	; BG 3 Affine Transformation Parameters
.definelabel REG_BG3PA,					(REG_BASE + 0x30)	; BG 3 Line Direction X Coordinate Difference
.definelabel REG_BG3PB,					(REG_BASE + 0x32)	; BG 3 Vertical Direction X Coordinate Difference
.definelabel REG_BG3PC,					(REG_BASE + 0x34)	; BG 3 Line Direction Y Coordinate Difference
.definelabel REG_BG3PD,					(REG_BASE + 0x36)	; BG 3 Vertical Direction Y Coordinate Difference
.definelabel REG_BG3X,					(REG_BASE + 0x38)	; BG 3 Start X Coordinate
.definelabel REG_BG3X_L,				(REG_BASE + 0x38)
.definelabel REG_BG3X_H,				(REG_BASE + 0x3a)
.definelabel REG_BG3Y,					(REG_BASE + 0x3c)	; BG 3 Start Y Coordinate
.definelabel REG_BG3Y_L,				(REG_BASE + 0x3c)
.definelabel REG_BG3Y_H,				(REG_BASE + 0x3e)


.definelabel REG_SOUNDCNT,				(REG_BASE + 0x80)	; Sound Control
.definelabel REG_SOUNDCNT_L,			(REG_BASE + 0x80)
.definelabel REG_SOUNDCNT_H,			(REG_BASE + 0x82)
.definelabel REG_SOUNDCNT_X,			(REG_BASE + 0x84)

.definelabel REG_SOUNDBIAS,				(REG_BASE + 0x88)	; Sound BIAS

.definelabel REG_SOUND1CNT,				(REG_BASE + 0x60)	; Sound 1 Control
.definelabel REG_SOUND1CNT_L,			(REG_BASE + 0x60)
.definelabel REG_SOUND1CNT_H,			(REG_BASE + 0x62)
.definelabel REG_SOUND1CNT_X,			(REG_BASE + 0x64)
.definelabel REG_SOUND2CNT,				(REG_BASE + 0x68)	; Sound 2 Control
.definelabel REG_SOUND2CNT_L,			(REG_BASE + 0x68)
.definelabel REG_SOUND2CNT_H,			(REG_BASE + 0x6c)
.definelabel REG_SOUND3CNT,				(REG_BASE + 0x70)	; Sound 3 Control
.definelabel REG_SOUND3CNT_L,			(REG_BASE + 0x70)
.definelabel REG_SOUND3CNT_H,			(REG_BASE + 0x72)
.definelabel REG_SOUND3CNT_X,			(REG_BASE + 0x74)
.definelabel REG_SOUND4CNT,				(REG_BASE + 0x78)	; Sound 4 Control
.definelabel REG_SOUND4CNT_L,			(REG_BASE + 0x78)
.definelabel REG_SOUND4CNT_H,			(REG_BASE + 0x7c)

.definelabel REG_WAVE_RAM,				(REG_BASE + 0x90)	; Sound 3 Waveform RAM
.definelabel REG_WAVE_RAM0,				(REG_BASE + 0x90)
.definelabel REG_WAVE_RAM0_L,			(REG_BASE + 0x90)
.definelabel REG_WAVE_RAM0_H,			(REG_BASE + 0x92)
.definelabel REG_WAVE_RAM1,				(REG_BASE + 0x94)
.definelabel REG_WAVE_RAM1_L,			(REG_BASE + 0x94)
.definelabel REG_WAVE_RAM1_H,			(REG_BASE + 0x96)
.definelabel REG_WAVE_RAM2,				(REG_BASE + 0x98)
.definelabel REG_WAVE_RAM2_L,			(REG_BASE + 0x98)
.definelabel REG_WAVE_RAM2_H,			(REG_BASE + 0x9a)
.definelabel REG_WAVE_RAM3,				(REG_BASE + 0x9c)
.definelabel REG_WAVE_RAM3_L,			(REG_BASE + 0x9c)
.definelabel REG_WAVE_RAM3_H,			(REG_BASE + 0x9e)

.definelabel REG_FIFO,					(REG_BASE + 0xa0)	; Sound FIFO
.definelabel REG_FIFO_A,				(REG_BASE + 0xa0)
.definelabel REG_FIFO_A_L,				(REG_BASE + 0xa0)
.definelabel REG_FIFO_A_H,				(REG_BASE + 0xa2)
.definelabel REG_FIFO_B,				(REG_BASE + 0xa4)
.definelabel REG_FIFO_B_L,				(REG_BASE + 0xa4)
.definelabel REG_FIFO_B_H,				(REG_BASE + 0xa6)


.definelabel REG_DMA0,					(REG_BASE + 0xb0)	; DMA 0
.definelabel REG_DMA0SAD,				(REG_BASE + 0xb0)	; (Internal Memory -> Internal Memory)
.definelabel REG_DMA0SAD_L,				(REG_BASE + 0xb0)
.definelabel REG_DMA0SAD_H,				(REG_BASE + 0xb2)
.definelabel REG_DMA0DAD,				(REG_BASE + 0xb4)
.definelabel REG_DMA0DAD_L,				(REG_BASE + 0xb4)
.definelabel REG_DMA0DAD_H,				(REG_BASE + 0xb6)
.definelabel REG_DMA0CNT,				(REG_BASE + 0xb8)
.definelabel REG_DMA0CNT_L,				(REG_BASE + 0xb8)
.definelabel REG_DMA0CNT_H,				(REG_BASE + 0xba)
.definelabel REG_DMA1,					(REG_BASE + 0xbc)	; DMA 1
.definelabel REG_DMA1SAD,				(REG_BASE + 0xbc)	; (Internal Memory -> Sound FIFO/Internal Memory)
.definelabel REG_DMA1SAD_L,				(REG_BASE + 0xbc)
.definelabel REG_DMA1SAD_H,				(REG_BASE + 0xbe)
.definelabel REG_DMA1DAD,				(REG_BASE + 0xc0)
.definelabel REG_DMA1DAD_L,				(REG_BASE + 0xc0)
.definelabel REG_DMA1DAD_H,				(REG_BASE + 0xc2)
.definelabel REG_DMA1CNT,				(REG_BASE + 0xc4)
.definelabel REG_DMA1CNT_L,				(REG_BASE + 0xc4)
.definelabel REG_DMA1CNT_H,				(REG_BASE + 0xc6)
.definelabel REG_DMA2,					(REG_BASE + 0xc8)	; DMA 2
.definelabel REG_DMA2SAD,				(REG_BASE + 0xc8)	; (Internal Memory -> Sound FIFO/Internal Memory)
.definelabel REG_DMA2SAD_L,				(REG_BASE + 0xc8)
.definelabel REG_DMA2SAD_H,				(REG_BASE + 0xca)
.definelabel REG_DMA2DAD,				(REG_BASE + 0xcc)
.definelabel REG_DMA2DAD_L,				(REG_BASE + 0xcc)
.definelabel REG_DMA2DAD_H,				(REG_BASE + 0xce)
.definelabel REG_DMA2CNT,				(REG_BASE + 0xd0)
.definelabel REG_DMA2CNT_L,				(REG_BASE + 0xd0)
.definelabel REG_DMA2CNT_H,				(REG_BASE + 0xd2)
.definelabel REG_DMA3,					(REG_BASE + 0xd4)	; DMA 3
.definelabel REG_DMA3SAD,				(REG_BASE + 0xd4)	; (Game Pak/Internal Memory <--> Internal Memory)
.definelabel REG_DMA3SAD_L,				(REG_BASE + 0xd4)
.definelabel REG_DMA3SAD_H,				(REG_BASE + 0xd6)
.definelabel REG_DMA3DAD,				(REG_BASE + 0xd8)
.definelabel REG_DMA3DAD_L,				(REG_BASE + 0xd8)
.definelabel REG_DMA3DAD_H,				(REG_BASE + 0xda)
.definelabel REG_DMA3CNT,				(REG_BASE + 0xdc)
.definelabel REG_DMA3CNT_L,				(REG_BASE + 0xdc)
.definelabel REG_DMA3CNT_H,				(REG_BASE + 0xde)


.definelabel REG_TM0CNT,				(REG_BASE + 0x100)	; Timer 0
.definelabel REG_TM0CNT_L,				(REG_BASE + 0x100)
.definelabel REG_TM0CNT_H,				(REG_BASE + 0x102)
.definelabel REG_TM1CNT,				(REG_BASE + 0x104)	; Timer 1
.definelabel REG_TM1CNT_L,				(REG_BASE + 0x104)
.definelabel REG_TM1CNT_H,				(REG_BASE + 0x106)
.definelabel REG_TM2CNT,				(REG_BASE + 0x108)	; Timer 2
.definelabel REG_TM2CNT_L,				(REG_BASE + 0x108)
.definelabel REG_TM2CNT_H,				(REG_BASE + 0x10a)
.definelabel REG_TM3CNT,				(REG_BASE + 0x10c)	; Timer 3
.definelabel REG_TM3CNT_L,				(REG_BASE + 0x10c)
.definelabel REG_TM3CNT_H,				(REG_BASE + 0x10e)


.definelabel REG_RCNT,					(REG_BASE + 0x134)	; General Input/Ouput Control

.definelabel REG_SIOCNT,				(REG_BASE + 0x128)	; Serial Communication Control
.definelabel REG_SIODATA8,				(REG_BASE + 0x12a)	; 8 bit Serial Communication Data
.definelabel REG_SIODATA32,				(REG_BASE + 0x120)	; 32 bit Serial Communication Data
.definelabel REG_SIOMLT_SEND,			(REG_BASE + 0x12a)	; Multi-play SIO Send Data
.definelabel REG_SIOMLT_RECV,			(REG_BASE + 0x120)	; Multi-play SIO Receive Data
.definelabel REG_SIOMULTI0,				(REG_BASE + 0x120)
.definelabel REG_SIOMULTI1,				(REG_BASE + 0x122)
.definelabel REG_SIOMULTI2,				(REG_BASE + 0x124)
.definelabel REG_SIOMULTI3,				(REG_BASE + 0x126)

.definelabel REG_JOYCNT,				(REG_BASE + 0x140)	; JOY Bus Communication Control
.definelabel REG_JOYSTAT,				(REG_BASE + 0x158)	; JOY Bus Status
.definelabel REG_JOY_RECV,				(REG_BASE + 0x150)	; JOY Bus Receive Data
.definelabel REG_JOY_TRANS,				(REG_BASE + 0x154)	; Joy Bus Send Data


.definelabel REG_KEYINPUT,				(REG_BASE + 0x130)	; Key Input
.definelabel REG_KEYCNT,				(REG_BASE + 0x132)	; Key Control

;/*--------------------------------------------------------------------*/
;/*                      Register Offsets                              */
;/*--------------------------------------------------------------------*/

.definelabel OFFSET_REG_IME,			(0x208)	; Interrupt Master Enable
.definelabel OFFSET_REG_IE,				(0x200)	; Interrupt Enable
.definelabel OFFSET_REG_IF,				(0x202)	; Interrupt Request

.definelabel OFFSET_REG_WAITCNT,		(0x204)	; Game Pak Wait Control

.definelabel OFFSET_REG_DISPCNT,		(0x0)	; Display Control
.definelabel OFFSET_REG_DISPSTAT,		(0x4)	; Display status
.definelabel OFFSET_REG_STAT,			(0x4)	; Display Status, backward compatibility 
.definelabel OFFSET_REG_VCOUNT,			(0x6)	; V Counter

.definelabel OFFSET_REG_MOSAIC,			(0x4c)	; Mosaic Size

.definelabel OFFSET_REG_BLDCNT,			(0x50)	; Blend Mode Control
.definelabel OFFSET_REG_BLDALPHA,		(0x52)	; Semi-transparent Parameter
.definelabel OFFSET_REG_BLDY,			(0x54)	; Brightness Change Parameter

.definelabel OFFSET_REG_WINCNT,			(0x40)	; Window Control
.definelabel OFFSET_REG_WIN0H,			(0x40)	; Window 0 Horizontal Area
.definelabel OFFSET_REG_WIN1H,			(0x42)	; Window 1 Horizontal Area
.definelabel OFFSET_REG_WIN0V,			(0x44)	; Window 0 Vertical Area
.definelabel OFFSET_REG_WIN1V,			(0x46)	; Window 1 Vertical Area
.definelabel OFFSET_REG_WININ,			(0x48)	; Internal Window Control
.definelabel OFFSET_REG_WIN0,			(0x48)	; Window 0 Control
.definelabel OFFSET_REG_WIN1,			(0x49)	; Window 1 Control
.definelabel OFFSET_REG_WINOUT,			(0x4a)	; External Window Control
.definelabel OFFSET_REG_OBJWIN,			(0x4b)	; OBJ Window Control


.definelabel OFFSET_REG_BGCNT,			(0x8)	; BG Control
.definelabel OFFSET_REG_BG0CNT,			(0x8)	; BG 0 Control
.definelabel OFFSET_REG_BG1CNT,			(0xa)	; BG 1 Control
.definelabel OFFSET_REG_BG2CNT,			(0xc)	; BG 2 Control
.definelabel OFFSET_REG_BG3CNT,			(0xe)	; BG 3 Control
.definelabel OFFSET_REG_BGOFS,			(0x10)	; BG Offset
.definelabel OFFSET_REG_BG0HOFS,		(0x10)	; BG 0 H Offset
.definelabel OFFSET_REG_BG0VOFS,		(0x12)	; BG 0 V Offset
.definelabel OFFSET_REG_BG1HOFS,		(0x14)	; BG 1 H Offset
.definelabel OFFSET_REG_BG1VOFS,		(0x16)	; BG 1 V Offset
.definelabel OFFSET_REG_BG2HOFS,		(0x18)	; BG 2 H Offset
.definelabel OFFSET_REG_BG2VOFS,		(0x1a)	; BG 2 V Offset
.definelabel OFFSET_REG_BG3HOFS,		(0x1c)	; BG 3 H Offset
.definelabel OFFSET_REG_BG3VOFS,		(0x1e)	; BG 3 V Offset
.definelabel OFFSET_REG_BG2AFFINE,		(0x20)	; BG 2 Affine Transformation Parameters
.definelabel OFFSET_REG_BG2PA,			(0x20)	; BG 2 Line Direction X Coordinate Differernce
.definelabel OFFSET_REG_BG2PB,			(0x22)	; BG 2 Vertical Direction X Coordinate Difference
.definelabel OFFSET_REG_BG2PC,			(0x24)	; BG 2 Line Direction Y Coordinate Difference
.definelabel OFFSET_REG_BG2PD,			(0x26)	; BG 2 Vertical Direction Y Coordinate Difference
.definelabel OFFSET_REG_BG2X,			(0x28)	; BG 2 Start X Coordinate
.definelabel OFFSET_REG_BG2X_L,			(0x28)
.definelabel OFFSET_REG_BG2X_H,			(0x2a)
.definelabel OFFSET_REG_BG2Y,			(0x2c)	; BG 2 Start Y Coordinate
.definelabel OFFSET_REG_BG2Y_L,			(0x2c)
.definelabel OFFSET_REG_BG2Y_H,			(0x2e)
.definelabel OFFSET_REG_BG3AFFINE,		(0x30)	; BG 3 Affine Transformation Parameters
.definelabel OFFSET_REG_BG3PA,			(0x30)	; BG 3 Line Direction X Coordinate Difference
.definelabel OFFSET_REG_BG3PB,			(0x32)	; BG 3 Vertical Direction X Coordinate Difference
.definelabel OFFSET_REG_BG3PC,			(0x34)	; BG 3 Line Direction Y Coordinate Difference
.definelabel OFFSET_REG_BG3PD,			(0x36)	; BG 3 Vertical Direction Y Coordinate Difference
.definelabel OFFSET_REG_BG3X,			(0x38)	; BG 3 Start X Coordinate
.definelabel OFFSET_REG_BG3X_L,			(0x38)
.definelabel OFFSET_REG_BG3X_H,			(0x3a)
.definelabel OFFSET_REG_BG3Y,			(0x3c)	; BG 3 Start Y Coordinate
.definelabel OFFSET_REG_BG3Y_L,			(0x3c)
.definelabel OFFSET_REG_BG3Y_H,			(0x3e)


.definelabel OFFSET_REG_SOUNDCNT,		(0x80)	; Sound Control
.definelabel OFFSET_REG_SOUNDCNT_L,		(0x80)
.definelabel OFFSET_REG_SOUNDCNT_H,		(0x82)
.definelabel OFFSET_REG_SOUNDCNT_X,		(0x84)

.definelabel OFFSET_REG_SOUNDBIAS,		(0x88)	; Sound BIAS

.definelabel OFFSET_REG_SOUND1CNT,		(0x60)	; Sound 1 Control
.definelabel OFFSET_REG_SOUND1CNT_L,	(0x60)
.definelabel OFFSET_REG_SOUND1CNT_H,	(0x62)
.definelabel OFFSET_REG_SOUND1CNT_X,	(0x64)
.definelabel OFFSET_REG_SOUND2CNT,		(0x68)	; Sound 2 Control
.definelabel OFFSET_REG_SOUND2CNT_L,	(0x68)
.definelabel OFFSET_REG_SOUND2CNT_H,	(0x6c)
.definelabel OFFSET_REG_SOUND3CNT,		(0x70)	; Sound 3 Control
.definelabel OFFSET_REG_SOUND3CNT_L,	(0x70)
.definelabel OFFSET_REG_SOUND3CNT_H,	(0x72)
.definelabel OFFSET_REG_SOUND3CNT_X,	(0x74)
.definelabel OFFSET_REG_SOUND4CNT,		(0x78)	; Sound 4 Control
.definelabel OFFSET_REG_SOUND4CNT_L,	(0x78)
.definelabel OFFSET_REG_SOUND4CNT_H,	(0x7c)

.definelabel OFFSET_REG_WAVE_RAM,		(0x90)	; Sound 3 Waveform RAM
.definelabel OFFSET_REG_WAVE_RAM0,		(0x90)
.definelabel OFFSET_REG_WAVE_RAM0_L,	(0x90)
.definelabel OFFSET_REG_WAVE_RAM0_H,	(0x92)
.definelabel OFFSET_REG_WAVE_RAM1,		(0x94)
.definelabel OFFSET_REG_WAVE_RAM1_L,	(0x94)
.definelabel OFFSET_REG_WAVE_RAM1_H,	(0x96)
.definelabel OFFSET_REG_WAVE_RAM2,		(0x98)
.definelabel OFFSET_REG_WAVE_RAM2_L,	(0x98)
.definelabel OFFSET_REG_WAVE_RAM2_H,	(0x9a)
.definelabel OFFSET_REG_WAVE_RAM3,		(0x9c)
.definelabel OFFSET_REG_WAVE_RAM3_L,	(0x9c)
.definelabel OFFSET_REG_WAVE_RAM3_H,	(0x9e)

.definelabel OFFSET_REG_FIFO,			(0xa0)	; Sound FIFO
.definelabel OFFSET_REG_FIFO_A,			(0xa0)
.definelabel OFFSET_REG_FIFO_A_L,		(0xa0)
.definelabel OFFSET_REG_FIFO_A_H,		(0xa2)
.definelabel OFFSET_REG_FIFO_B,			(0xa4)
.definelabel OFFSET_REG_FIFO_B_L,		(0xa4)
.definelabel OFFSET_REG_FIFO_B_H,		(0xa6)


.definelabel OFFSET_REG_DMA0,			(0xb0)	; DMA 0
.definelabel OFFSET_REG_DMA0SAD,		(0xb0)	; (Internal Memory -> Internal Memory)
.definelabel OFFSET_REG_DMA0SAD_L,		(0xb0)
.definelabel OFFSET_REG_DMA0SAD_H,		(0xb2)
.definelabel OFFSET_REG_DMA0DAD,		(0xb4)
.definelabel OFFSET_REG_DMA0DAD_L,		(0xb4)
.definelabel OFFSET_REG_DMA0DAD_H,		(0xb6)
.definelabel OFFSET_REG_DMA0CNT,		(0xb8)
.definelabel OFFSET_REG_DMA0CNT_L,		(0xb8)
.definelabel OFFSET_REG_DMA0CNT_H,		(0xba)
.definelabel OFFSET_REG_DMA1,			(0xbc)	; DMA 1
.definelabel OFFSET_REG_DMA1SAD,		(0xbc)	; (Internal Memory -> Sound FIFO/Internal Memory)
.definelabel OFFSET_REG_DMA1SAD_L,		(0xbc)
.definelabel OFFSET_REG_DMA1SAD_H,		(0xbe)
.definelabel OFFSET_REG_DMA1DAD,		(0xc0)
.definelabel OFFSET_REG_DMA1DAD_L,		(0xc0)
.definelabel OFFSET_REG_DMA1DAD_H,		(0xc2)
.definelabel OFFSET_REG_DMA1CNT,		(0xc4)
.definelabel OFFSET_REG_DMA1CNT_L,		(0xc4)
.definelabel OFFSET_REG_DMA1CNT_H,		(0xc6)
.definelabel OFFSET_REG_DMA2,			(0xc8)	; DMA 2
.definelabel OFFSET_REG_DMA2SAD,		(0xc8)	; (Internal Memory -> Sound FIFO/Internal Memory)
.definelabel OFFSET_REG_DMA2SAD_L,		(0xc8)
.definelabel OFFSET_REG_DMA2SAD_H,		(0xca)
.definelabel OFFSET_REG_DMA2DAD,		(0xcc)
.definelabel OFFSET_REG_DMA2DAD_L,		(0xcc)
.definelabel OFFSET_REG_DMA2DAD_H,		(0xce)
.definelabel OFFSET_REG_DMA2CNT,		(0xd0)
.definelabel OFFSET_REG_DMA2CNT_L,		(0xd0)
.definelabel OFFSET_REG_DMA2CNT_H,		(0xd2)
.definelabel OFFSET_REG_DMA3,			(0xd4)	; DMA 3
.definelabel OFFSET_REG_DMA3SAD,		(0xd4)	; (Game Pak/Internal Memory <--> Internal Memory)
.definelabel OFFSET_REG_DMA3SAD_L,		(0xd4)
.definelabel OFFSET_REG_DMA3SAD_H,		(0xd6)
.definelabel OFFSET_REG_DMA3DAD,		(0xd8)
.definelabel OFFSET_REG_DMA3DAD_L,		(0xd8)
.definelabel OFFSET_REG_DMA3DAD_H,		(0xda)
.definelabel OFFSET_REG_DMA3CNT,		(0xdc)
.definelabel OFFSET_REG_DMA3CNT_L,		(0xdc)
.definelabel OFFSET_REG_DMA3CNT_H,		(0xde)


.definelabel OFFSET_REG_TM0CNT,			(0x100)	; Timer 0
.definelabel OFFSET_REG_TM0CNT_L,		(0x100)
.definelabel OFFSET_REG_TM0CNT_H,		(0x102)
.definelabel OFFSET_REG_TM1CNT,			(0x104)	; Timer 1
.definelabel OFFSET_REG_TM1CNT_L,		(0x104)
.definelabel OFFSET_REG_TM1CNT_H,		(0x106)
.definelabel OFFSET_REG_TM2CNT,			(0x108)	; Timer 2
.definelabel OFFSET_REG_TM2CNT_L,		(0x108)
.definelabel OFFSET_REG_TM2CNT_H,		(0x10a)
.definelabel OFFSET_REG_TM3CNT,			(0x10c)	; Timer 3
.definelabel OFFSET_REG_TM3CNT_L,		(0x10c)
.definelabel OFFSET_REG_TM3CNT_H,		(0x10e)


.definelabel OFFSET_REG_RCNT,			(0x134)	; General Input/Ouput Control

.definelabel OFFSET_REG_SIOCNT,			(0x128)	; Serial Communication Control
.definelabel OFFSET_REG_SIODATA8,		(0x12a)	; 8 bit Serial Communication Data
.definelabel OFFSET_REG_SIODATA32,		(0x120)	; 32 bit Serial Communication Data
.definelabel OFFSET_REG_SIOMLT_SEND,	(0x12a)	; Multi-play SIO Send Data
.definelabel OFFSET_REG_SIOMLT_RECV,	(0x120)	; Multi-play SIO Receive Data
.definelabel OFFSET_REG_SIOMULTI0,		(0x120)
.definelabel OFFSET_REG_SIOMULTI1,		(0x122)
.definelabel OFFSET_REG_SIOMULTI2,		(0x124)
.definelabel OFFSET_REG_SIOMULTI3,		(0x126)

.definelabel OFFSET_REG_JOYCNT,			(0x140)	; JOY Bus Communication Control
.definelabel OFFSET_REG_JOYSTAT,		(0x158)	; JOY Bus Status
.definelabel OFFSET_REG_JOY_RECV,		(0x150)	; JOY Bus Receive Data
.definelabel OFFSET_REG_JOY_TRANS,		(0x154)	; Joy Bus Send Data


.definelabel OFFSET_REG_KEYINPUT,		(0x130)	; Key Input
.definelabel OFFSET_REG_KEYCNT,			(0x132)	; Key Control

 ; make sure to leave an empty line at the end
