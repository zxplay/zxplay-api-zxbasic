	org 32768
core.__START_PROGRAM:
	di
	push ix
	push iy
	exx
	push hl
	exx
	ld hl, 0
	add hl, sp
	ld (core.__CALL_BACK__), hl
	ei
	jp core.__MAIN_PROGRAM__
core.__CALL_BACK__:
	DEFW 0
core.ZXBASIC_USER_DATA:
	; Defines USER DATA Length in bytes
core.ZXBASIC_USER_DATA_LEN EQU core.ZXBASIC_USER_DATA_END - core.ZXBASIC_USER_DATA
	core.__LABEL__.ZXBASIC_USER_DATA_LEN EQU core.ZXBASIC_USER_DATA_LEN
	core.__LABEL__.ZXBASIC_USER_DATA EQU core.ZXBASIC_USER_DATA
core.ZXBASIC_USER_DATA_END:
core.__MAIN_PROGRAM__:
	call _Drawscreen
__LABEL__Shoottable1:
__LABEL__Shoottable2:
__LABEL__UDGs01:
__LABEL__Buffer:
	ld bc, 0
core.__END_PROGRAM:
	di
	ld hl, (core.__CALL_BACK__)
	ld sp, hl
	exx
	pop hl
	pop iy
	pop ix
	exx
	ei
	ret
_Drawscreen:
	push ix
	ld ix, 0
	add ix, sp
	ld hl, 0
	push hl
	inc sp
	ld (ix-1), 0
	jp __LABEL0
__LABEL4:
	inc (ix-1)
__LABEL0:
	ld a, 21
	cp (ix-1)
	jp nc, __LABEL4
_Drawscreen__leave:
	ld sp, ix
	pop ix
	ret
	;; --- end of user code ---
	END
