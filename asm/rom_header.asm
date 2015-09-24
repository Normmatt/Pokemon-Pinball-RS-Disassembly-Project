 ; Pokemon Pinball - Ruby & Sapphire Disassembly - GBA Header

.org 0x08000000

.arm
b 0x080000C0								;ROM Entry Point (TODO: Link to disassembled ctr0 code)
.incbin "asm/bin/gfx/nintendo_logo.bin" 	;Nintendo Logo
.ascii "POKEPIN R/S", 0						;Game Title
.ascii "BPPE"								;Game Code
.ascii "01"									;Maker Code
.byte 0x96									;Fixed value
.byte 0x00									;Main unit code
.byte 0x00									;Device type
.fill 7										;Reserved Area
.byte 0x00									;Software version
.byte 0xBF									;Complement check
.fill 2										;Reserved Area

 ; make sure to leave an empty line at the end
