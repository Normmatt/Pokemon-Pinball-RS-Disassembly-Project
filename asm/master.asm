 ; Pokemon Pinball - Ruby & Sapphire Disassembly - Master File

.gba				; Set the architecture to GBA
.create  "rom/output.gba",0x08000000		; Create output.gba for output.
					; 0x08000000 will be used as the
					; header size
					
.include "asm/defines.asm"
.include "asm/crt0.asm"
.include "asm/gfx.asm"

.close

 ; make sure to leave an empty line at the end
