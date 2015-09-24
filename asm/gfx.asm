 ; Pokemon Pinball - Ruby & Sapphire Disassembly - Graphics

.org 0x08120CC0
TitleScreen_TileMap:
.incbin "asm/bin/gfx/titlescreen/tilemap.bin"

.org 0x081214C0
TitleScreen_BgPalette:
.incbin "asm/bin/gfx/titlescreen/bg.pal"

.org 0x081216C0
TitleScreen_Tiles:
.incbin "asm/bin/gfx/titlescreen/tiles.bin"

.org 0x08137700
TitleScreen_FgPalette:
.incbin "asm/bin/gfx/titlescreen/fg.pal"

.org 0x0852B668
TitleScreen_MenuTiles:
.incbin "asm/bin/gfx/titlescreen/menu_tiles.bin"

.org 0x0852B868
TitleScreen_ButtonTiles:
.incbin "asm/bin/gfx/titlescreen/button_tiles.bin"

 ; make sure to leave an empty line at the end
