	org 32768
.core.__START_PROGRAM:
	di
	push ix
	push iy
	exx
	push hl
	exx
	ld hl, 0
	add hl, sp
	ld (.core.__CALL_BACK__), hl
	ei
	jp .core.__MAIN_PROGRAM__
.core.__CALL_BACK__:
	DEFW 0
.core.ZXBASIC_USER_DATA:
	; Defines USER DATA Length in bytes
.core.ZXBASIC_USER_DATA_LEN EQU .core.ZXBASIC_USER_DATA_END - .core.ZXBASIC_USER_DATA
	.core.__LABEL__.ZXBASIC_USER_DATA_LEN EQU .core.ZXBASIC_USER_DATA_LEN
	.core.__LABEL__.ZXBASIC_USER_DATA EQU .core.ZXBASIC_USER_DATA
_a:
	DEFB 00, 00, 00, 00
_b:
	DEFB 00
.core.ZXBASIC_USER_DATA_END:
.core.__MAIN_PROGRAM__:
	ld hl, (_a + 2)
	push hl
	ld hl, (_a)
	push hl
	ld de, 0
	ld hl, 0
	call .core.__BOR32
	ld a, l
	ld (_b), a
	ld hl, (_a + 2)
	push hl
	ld hl, (_a)
	push hl
	ld de, 0
	ld hl, 1
	call .core.__BOR32
	ld a, l
	ld (_b), a
	ld hl, (_a + 2)
	push hl
	ld hl, (_a)
	push hl
	ld de, 0
	ld hl, 65535
	call .core.__BOR32
	ld a, l
	ld (_b), a
	ld hl, (_a)
	ld de, (_a + 2)
	ld bc, 0
	push bc
	ld bc, 0
	push bc
	call .core.__BOR32
	ld a, l
	ld (_b), a
	ld hl, (_a)
	ld de, (_a + 2)
	ld bc, 0
	push bc
	ld bc, 1
	push bc
	call .core.__BOR32
	ld a, l
	ld (_b), a
	ld hl, (_a)
	ld de, (_a + 2)
	ld bc, 0
	push bc
	ld bc, 65535
	push bc
	call .core.__BOR32
	ld a, l
	ld (_b), a
	ld hl, (_a + 2)
	push hl
	ld hl, (_a)
	push hl
	ld hl, (_a)
	ld de, (_a + 2)
	call .core.__BOR32
	ld a, l
	ld (_b), a
	ld hl, 0
	ld b, h
	ld c, l
.core.__END_PROGRAM:
	di
	ld hl, (.core.__CALL_BACK__)
	ld sp, hl
	exx
	pop hl
	exx
	pop iy
	pop ix
	ei
	ret
	;; --- end of user code ---
#line 1 "/zxbasic/src/arch/zx48k/library-asm/bor32.asm"
	; FASTCALL bitwise or 32 version.
	; Performs 32bit or 32bit and returns the bitwise
	; result DE,HL
	; First operand in DE,HL 2nd operand into the stack
	    push namespace core
__BOR32:
	    ld b, h
	    ld c, l ; BC <- HL
	    pop hl  ; Return address
	    ex (sp), hl ; HL <- Lower part of 2nd Operand
	    ld a, b
	    or h
	    ld b, a
	    ld a, c
	    or l
	    ld c, a ; BC <- BC & HL
	    pop hl  ; Return dddress
	    ex (sp), hl ; HL <- High part of 2nd Operand
	    ld a, d
	    or h
	    ld d, a
	    ld a, e
	    or l
	    ld e, a ; DE <- DE & HL
	    ld h, b
	    ld l, c ; HL <- BC  ; Always return DE,HL pair regs
	    ret
	    pop namespace
#line 80 "bor32.bas"
	END
