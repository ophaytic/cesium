; Copyright 2015-2023 Matt "MateoConLechuga" Waltz
;
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions are met:
;
; 1. Redistributions of source code must retain the above copyright notice,
;    this list of conditions and the following disclaimer.
;
; 2. Redistributions in binary form must reproduce the above copyright notice,
;    this list of conditions and the following disclaimer in the documentation
;    and/or other materials provided with the distribution.
;
; 3. Neither the name of the copyright holder nor the names of its contributors
;    may be used to endorse or promote products derived from this software
;    without specific prior written permission.
;
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
; POSSIBILITY OF SUCH DAMAGE.

; lookup tables for characters

lut_description_icon:
	db	$3e,$2a

lut_dcs_icon:
	db	$3e,$44,$43,$53,$3f,$2a

lut_dcs6_icon:
	db	$3e,$44,$43,$53,$36,$3f,$2a

lut_color_basic:
	db	$ff,$18,$e0,$00,$f8,$24,$e3,$61,$09,$13,$e6,$ff,$b5,$6b,$6a,$4a

lut_character_standard:
	db	0,'WRMH',0,0   			; + - × ÷ ^ undef
	db	0,'Z'+ 1,'VQLG',0,0 		; (-) 3 6 9 ) TAN VARS undef
	db	0,'ZUPKFC',0   			; . 2 5 8 ( COS PRGM STAT
	db	' YTOJEBX',0			; 0 1 4 7 , SIN APPS XT?n undef
	db	'XSNIDA'			; STO LN LOG x2 x-1 MATH

lut_character_lowercase:
	db	0,'wrmh',0,0   			; + - × ÷ ^ undef
	db	0,'Z'+ 1,'vqlg',0,0 		; (-) 3 6 9 ) TAN VARS undef
	db	0,'zupkfc',0   			; . 2 5 8 ( COS PRGM STAT
	db	' ytojebX',0			; 0 1 4 7 , SIN APPS XT?n undef
	db	'xsnida'			; STO LN LOG x2 x-1 MATH

lut_character_numbers:
	db	0,0,0,0,0,0,0   		; + - × ÷ ^ undef
	db	0,'369',0,0,0,0 		; (-) 3 6 9 ) TAN VARS undef
	db	0,'258',0,0,0,0			; . 2 5 8 ( COS PRGM STAT
	db	'0147',0,0,0,'X',0		; 0 1 4 7 , SIN APPS XT?n undef
	db	0,0,0,0,0,0,0			; STO LN LOG x2 x-1 MATH

lut_character_spacing:
	db 9,9,9,8,8,8,9,9,9,9,9,9,9,2,9,9
	db 8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9
	db 3,4,6,8,8,8,8,5,5,5,9,7,4,7,3,8
	db 8,7,8,8,8,8,8,8,8,8,3,4,6,7,6,7
	db 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
	db 8,8,8,8,9,8,8,8,8,8,9,8,8,5,8,9
	db 4,8,8,8,8,8,8,8,8,5,8,8,5,8,8,8
	db 8,8,8,8,7,8,8,8,8,8,8,7,3,7,5,8

lut_character_data:
	db $00,$00,$00,$00,$00,$00,$00,$00	; .
	db $7E,$81,$A5,$81,$BD,$BD,$81,$7E	; .
	db $7E,$FF,$DB,$FF,$C3,$C3,$FF,$7E	; .
	db $6C,$FE,$FE,$FE,$7C,$38,$10,$00	; .
	db $10,$38,$7C,$FE,$7C,$38,$10,$00	; .
	db $38,$7C,$38,$FE,$FE,$10,$10,$7C	; .
	db $00,$18,$3C,$7E,$FF,$7E,$18,$7E	; .
	db $00,$00,$18,$3C,$3C,$18,$00,$00	; .
	db $FF,$FF,$E7,$C3,$C3,$E7,$FF,$FF	; .
	db $00,$3C,$66,$42,$42,$66,$3C,$00	; .
	db $FF,$C3,$99,$BD,$BD,$99,$C3,$FF	; .
	db $0F,$07,$0F,$7D,$CC,$CC,$CC,$78	; .
	db $3C,$66,$66,$66,$3C,$18,$7E,$18	; .
	db $3F,$33,$3F,$30,$30,$70,$F0,$E0	; .
	db $7F,$63,$7F,$63,$63,$67,$E6,$C0	; .
	db $99,$5A,$3C,$E7,$E7,$3C,$5A,$99	; .
	db $80,$E0,$F8,$FE,$F8,$E0,$80,$00	; .
	db $02,$0E,$3E,$FE,$3E,$0E,$02,$00	; .
	db $18,$3C,$7E,$18,$18,$7E,$3C,$18	; .
	db $66,$66,$66,$66,$66,$00,$66,$00	; .
	db $7F,$DB,$DB,$7B,$1B,$1B,$1B,$00	; .
	db $3F,$60,$7C,$66,$66,$3E,$06,$FC	; .
	db $00,$00,$00,$00,$7E,$7E,$7E,$00	; .
	db $18,$3C,$7E,$18,$7E,$3C,$18,$FF	; .
	db $18,$3C,$7E,$18,$18,$18,$18,$00	; .
	db $18,$18,$18,$18,$7E,$3C,$18,$00	; .
	db $00,$18,$0C,$FE,$0C,$18,$00,$00	; .
	db $00,$30,$60,$FE,$60,$30,$00,$00	; .
	db $00,$00,$C0,$C0,$C0,$FE,$00,$00	; .
	db $00,$24,$66,$FF,$66,$24,$00,$00	; .
	db $00,$18,$3C,$7E,$FF,$FF,$00,$00	; .
	db $00,$FF,$FF,$7E,$3C,$18,$00,$00	; .
	db $00,$00,$00,$00,$00,$00,$00,$00	;
	db $C0,$C0,$C0,$C0,$C0,$00,$C0,$00	; !
	db $D8,$D8,$D8,$00,$00,$00,$00,$00	; "
	db $6C,$6C,$FE,$6C,$FE,$6C,$6C,$00	; #
	db $18,$7E,$C0,$7C,$06,$FC,$18,$00	; $
	db $00,$C6,$CC,$18,$30,$66,$C6,$00	; %
	db $38,$6C,$38,$76,$DC,$CC,$76,$00	; &
	db $30,$30,$60,$00,$00,$00,$00,$00	; '
	db $30,$60,$C0,$C0,$C0,$60,$30,$00	; (
	db $C0,$60,$30,$30,$30,$60,$C0,$00	; )
	db $00,$66,$3C,$FF,$3C,$66,$00,$00	; *
	db $00,$30,$30,$FC,$FC,$30,$30,$00	; +
	db $00,$00,$00,$00,$00,$60,$60,$C0	; ,
	db $00,$00,$00,$FC,$00,$00,$00,$00	; -
	db $00,$00,$00,$00,$00,$C0,$C0,$00	; .
	db $06,$0C,$18,$30,$60,$C0,$80,$00	; /
	db $7C,$CE,$DE,$F6,$E6,$C6,$7C,$00	; 0
	db $30,$70,$30,$30,$30,$30,$FC,$00	; 1
	db $7C,$C6,$06,$7C,$C0,$C0,$FE,$00	; 2
	db $FC,$06,$06,$3C,$06,$06,$FC,$00	; 3
	db $0C,$CC,$CC,$CC,$FE,$0C,$0C,$00	; 4
	db $FE,$C0,$FC,$06,$06,$C6,$7C,$00	; 5
	db $7C,$C0,$C0,$FC,$C6,$C6,$7C,$00	; 6
	db $FE,$06,$06,$0C,$18,$30,$30,$00	; 7
	db $7C,$C6,$C6,$7C,$C6,$C6,$7C,$00	; 8
	db $7C,$C6,$C6,$7E,$06,$06,$7C,$00	; 9
	db $00,$C0,$C0,$00,$00,$C0,$C0,$00	; :
	db $00,$60,$60,$00,$00,$60,$60,$C0	; ;
	db $18,$30,$60,$C0,$60,$30,$18,$00	; <
	db $00,$00,$FC,$00,$FC,$00,$00,$00	; =
	db $C0,$60,$30,$18,$30,$60,$C0,$00	; >
	db $78,$CC,$18,$30,$30,$00,$30,$00	; ?
	db $7C,$C6,$DE,$DE,$DE,$C0,$7E,$00	; @
	db $38,$6C,$C6,$C6,$FE,$C6,$C6,$00	; A
	db $FC,$C6,$C6,$FC,$C6,$C6,$FC,$00	; B
	db $7C,$C6,$C0,$C0,$C0,$C6,$7C,$00	; C
	db $F8,$CC,$C6,$C6,$C6,$CC,$F8,$00	; D
	db $FE,$C0,$C0,$F8,$C0,$C0,$FE,$00	; E
	db $FE,$C0,$C0,$F8,$C0,$C0,$C0,$00	; F
	db $7C,$C6,$C0,$C0,$CE,$C6,$7C,$00	; G
	db $C6,$C6,$C6,$FE,$C6,$C6,$C6,$00	; H
	db $7E,$18,$18,$18,$18,$18,$7E,$00	; I
	db $06,$06,$06,$06,$06,$C6,$7C,$00	; J
	db $C6,$CC,$D8,$F0,$D8,$CC,$C6,$00	; K
	db $C0,$C0,$C0,$C0,$C0,$C0,$FE,$00	; L
	db $C6,$EE,$FE,$FE,$D6,$C6,$C6,$00	; M
	db $C6,$E6,$F6,$DE,$CE,$C6,$C6,$00	; N
	db $7C,$C6,$C6,$C6,$C6,$C6,$7C,$00	; O
	db $FC,$C6,$C6,$FC,$C0,$C0,$C0,$00	; P
	db $7C,$C6,$C6,$C6,$D6,$DE,$7C,$06	; Q
	db $FC,$C6,$C6,$FC,$D8,$CC,$C6,$00	; R
	db $7C,$C6,$C0,$7C,$06,$C6,$7C,$00	; S
	db $FF,$18,$18,$18,$18,$18,$18,$00	; T
	db $C6,$C6,$C6,$C6,$C6,$C6,$FE,$00	; U
	db $C6,$C6,$C6,$C6,$C6,$7C,$38,$00	; V
	db $C6,$C6,$C6,$C6,$D6,$FE,$6C,$00	; W
	db $C6,$C6,$6C,$38,$6C,$C6,$C6,$00	; X
	db $C6,$C6,$C6,$7C,$18,$30,$E0,$00	; Y
	db $FE,$06,$0C,$18,$30,$60,$FE,$00	; Z
	db $7C,$C6,$C6,$FE,$C6,$C6,$7C,$00	; Theta
	db $C0,$60,$30,$18,$0C,$06,$02,$00	; \
	db $F0,$30,$30,$30,$30,$30,$F0,$00	; ]
	db $10,$38,$6C,$C6,$00,$00,$00,$00	; ^
	db $00,$00,$00,$00,$00,$00,$00,$FF	; _
	db $C0,$C0,$60,$00,$00,$00,$00,$00	; `
	db $00,$00,$7C,$06,$7E,$C6,$7E,$00	; a
	db $C0,$C0,$C0,$FC,$C6,$C6,$FC,$00	; b
	db $00,$00,$7C,$C6,$C0,$C6,$7C,$00	; c
	db $06,$06,$06,$7E,$C6,$C6,$7E,$00	; d
	db $00,$00,$7C,$C6,$FE,$C0,$7C,$00	; e
	db $1C,$36,$30,$78,$30,$30,$78,$00	; f
	db $00,$00,$7E,$C6,$C6,$7E,$06,$FC	; g
	db $C0,$C0,$FC,$C6,$C6,$C6,$C6,$00	; h
	db $60,$00,$E0,$60,$60,$60,$F0,$00	; i
	db $06,$00,$06,$06,$06,$06,$C6,$7C	; j
	db $C0,$C0,$CC,$D8,$F8,$CC,$C6,$00	; k
	db $E0,$60,$60,$60,$60,$60,$F0,$00	; l
	db $00,$00,$CC,$FE,$FE,$D6,$D6,$00	; m
	db $00,$00,$FC,$C6,$C6,$C6,$C6,$00	; n
	db $00,$00,$7C,$C6,$C6,$C6,$7C,$00	; o
	db $00,$00,$FC,$C6,$C6,$FC,$C0,$C0	; p
	db $00,$00,$7E,$C6,$C6,$7E,$06,$06	; q
	db $00,$00,$FC,$C6,$C0,$C0,$C0,$00	; r
	db $00,$00,$7E,$C0,$7C,$06,$FC,$00	; s
	db $30,$30,$FC,$30,$30,$30,$1C,$00	; t
	db $00,$00,$C6,$C6,$C6,$C6,$7E,$00	; u
	db $00,$00,$C6,$C6,$C6,$7C,$38,$00	; v
	db $00,$00,$C6,$C6,$D6,$FE,$6C,$00	; w
	db $00,$00,$C6,$6C,$38,$6C,$C6,$00	; x
	db $00,$00,$C6,$C6,$C6,$7E,$06,$FC	; y
	db $00,$00,$FE,$0C,$38,$60,$FE,$00	; z
	db $1C,$30,$30,$E0,$30,$30,$1C,$00	; {
	db $C0,$C0,$C0,$00,$C0,$C0,$C0,$00	; |
	db $E0,$30,$30,$1C,$30,$30,$E0,$00	; }
	db $F0,$C0,$C0,$C0,$C0,$C0,$F0,$00	; [
	db $00,$10,$38,$6C,$C6,$C6,$FE,$00	; .
	db $7C,$C6,$C0,$C0,$C0,$D6,$7C,$30	; .
	db $C6,$00,$C6,$C6,$C6,$C6,$7E,$00	; .
	db $0E,$00,$7C,$C6,$FE,$C0,$7C,$00	; .
	db $7E,$81,$3C,$06,$7E,$C6,$7E,$00	; .
	db $66,$00,$7C,$06,$7E,$C6,$7E,$00	; .
	db $E0,$00,$7C,$06,$7E,$C6,$7E,$00	; .
	db $18,$18,$7C,$06,$7E,$C6,$7E,$00	; .
	db $00,$00,$7C,$C6,$C0,$D6,$7C,$30	; .
	db $7E,$81,$7C,$C6,$FE,$C0,$7C,$00	; .
	db $66,$00,$7C,$C6,$FE,$C0,$7C,$00	; .
	db $E0,$00,$7C,$C6,$FE,$C0,$7C,$00	; .
	db $66,$00,$38,$18,$18,$18,$3C,$00	; .
	db $7C,$82,$38,$18,$18,$18,$3C,$00	; .
	db $70,$00,$38,$18,$18,$18,$3C,$00	; .
	db $C6,$10,$7C,$C6,$FE,$C6,$C6,$00	; .
	db $38,$38,$00,$7C,$C6,$FE,$C6,$00	; .
	db $0E,$00,$FE,$C0,$F8,$C0,$FE,$00	; .
	db $00,$00,$7F,$0C,$7F,$CC,$7F,$00	; .
	db $3F,$6C,$CC,$FF,$CC,$CC,$CF,$00	; .
	db $7C,$82,$7C,$C6,$C6,$C6,$7C,$00	; .
	db $66,$00,$7C,$C6,$C6,$C6,$7C,$00	; .
	db $E0,$00,$7C,$C6,$C6,$C6,$7C,$00	; .
	db $7C,$82,$00,$C6,$C6,$C6,$7E,$00	; .
	db $E0,$00,$C6,$C6,$C6,$C6,$7E,$00	; .
	db $66,$00,$66,$66,$66,$3E,$06,$7C	; .
	db $C6,$7C,$C6,$C6,$C6,$C6,$7C,$00	; .
	db $C6,$00,$C6,$C6,$C6,$C6,$FE,$00	; .
	db $18,$18,$7E,$D8,$D8,$D8,$7E,$18	; .
	db $38,$6C,$60,$F0,$60,$66,$FC,$00	; .
	db $66,$66,$3C,$18,$7E,$18,$7E,$18	; .
	db $F8,$CC,$CC,$FA,$C6,$CF,$C6,$C3	; .
	db $0E,$1B,$18,$3C,$18,$18,$D8,$70	; .
	db $0E,$00,$7C,$06,$7E,$C6,$7E,$00	; .
	db $1C,$00,$38,$18,$18,$18,$3C,$00	; .
	db $0E,$00,$7C,$C6,$C6,$C6,$7C,$00	; .
	db $0E,$00,$C6,$C6,$C6,$C6,$7E,$00	; .
	db $00,$FE,$00,$FC,$C6,$C6,$C6,$00	; .
	db $FE,$00,$C6,$E6,$F6,$DE,$CE,$00	; .
	db $3C,$6C,$6C,$3E,$00,$7E,$00,$00	; .
	db $3C,$66,$66,$3C,$00,$7E,$00,$00	; .
	db $18,$00,$18,$18,$30,$66,$3C,$00	; .
	db $00,$00,$00,$FC,$C0,$C0,$00,$00	; .
	db $00,$00,$00,$FC,$0C,$0C,$00,$00	; .
	db $C6,$CC,$D8,$3F,$63,$CF,$8C,$0F	; .
	db $C3,$C6,$CC,$DB,$37,$6D,$CF,$03	; .
	db $18,$00,$18,$18,$18,$18,$18,$00	; .
	db $00,$33,$66,$CC,$66,$33,$00,$00	; .
	db $00,$CC,$66,$33,$66,$CC,$00,$00	; .
	db $22,$88,$22,$88,$22,$88,$22,$88	; .
	db $55,$AA,$55,$AA,$55,$AA,$55,$AA	; .
	db $DD,$77,$DD,$77,$DD,$77,$DD,$77	; .
	db $18,$18,$18,$18,$18,$18,$18,$18	; .
	db $18,$18,$18,$18,$F8,$18,$18,$18	; .
	db $18,$18,$F8,$18,$F8,$18,$18,$18	; .
	db $36,$36,$36,$36,$F6,$36,$36,$36	; .
	db $00,$00,$00,$00,$FE,$36,$36,$36	; .
	db $00,$00,$F8,$18,$F8,$18,$18,$18	; .
	db $36,$36,$F6,$06,$F6,$36,$36,$36	; .
	db $36,$36,$36,$36,$36,$36,$36,$36	; .
	db $00,$00,$FE,$06,$F6,$36,$36,$36	; .
	db $36,$36,$F6,$06,$FE,$00,$00,$00	; .
	db $36,$36,$36,$36,$FE,$00,$00,$00	; .
	db $18,$18,$F8,$18,$F8,$00,$00,$00	; .
	db $00,$00,$00,$00,$F8,$18,$18,$18	; .
	db $18,$18,$18,$18,$1F,$00,$00,$00	; .
	db $18,$18,$18,$18,$FF,$00,$00,$00	; .
	db $00,$00,$00,$00,$FF,$18,$18,$18	; .
	db $18,$18,$18,$18,$1F,$18,$18,$18	; .
	db $00,$00,$00,$00,$FF,$00,$00,$00	; .
	db $18,$18,$18,$18,$FF,$18,$18,$18	; .
	db $18,$18,$1F,$18,$1F,$18,$18,$18	; .
	db $36,$36,$36,$36,$37,$36,$36,$36	; .
	db $36,$36,$37,$30,$3F,$00,$00,$00	; .
	db $00,$00,$3F,$30,$37,$36,$36,$36	; .
	db $36,$36,$F7,$00,$FF,$00,$00,$00	; .
	db $00,$00,$FF,$00,$F7,$36,$36,$36	; .
	db $36,$36,$37,$30,$37,$36,$36,$36	; .
	db $00,$00,$FF,$00,$FF,$00,$00,$00	; .
	db $36,$36,$F7,$00,$F7,$36,$36,$36	; .
	db $18,$18,$FF,$00,$FF,$00,$00,$00	; .
	db $36,$36,$36,$36,$FF,$00,$00,$00	; .
	db $00,$00,$FF,$00,$FF,$18,$18,$18	; .
	db $00,$00,$00,$00,$FF,$36,$36,$36	; .
	db $36,$36,$36,$36,$3F,$00,$00,$00	; .
	db $18,$18,$1F,$18,$1F,$00,$00,$00	; .
	db $00,$00,$1F,$18,$1F,$18,$18,$18	; .
	db $00,$00,$00,$00,$3F,$36,$36,$36	; .
	db $36,$36,$36,$36,$FF,$36,$36,$36	; .
	db $18,$18,$FF,$18,$FF,$18,$18,$18	; .
	db $18,$18,$18,$18,$F8,$00,$00,$00	; .
	db $00,$00,$00,$00,$1F,$18,$18,$18	; .
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF	; .
	db $00,$00,$00,$00,$FF,$FF,$FF,$FF	; .
	db $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0	; .
	db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F	; .
	db $FF,$FF,$FF,$FF,$00,$00,$00,$00	; .
	db $00,$00,$76,$DC,$C8,$DC,$76,$00	; .
	db $38,$6C,$6C,$78,$6C,$66,$6C,$60	; .
	db $00,$FE,$C6,$C0,$C0,$C0,$C0,$00	; .
	db $00,$00,$FE,$6C,$6C,$6C,$6C,$00	; .
	db $FE,$60,$30,$18,$30,$60,$FE,$00	; .
	db $00,$00,$7E,$D8,$D8,$D8,$70,$00	; .
	db $00,$66,$66,$66,$66,$7C,$60,$C0	; .
	db $00,$76,$DC,$18,$18,$18,$18,$00	; .
	db $7E,$18,$3C,$66,$66,$3C,$18,$7E	; .
	db $3C,$66,$C3,$FF,$C3,$66,$3C,$00	; .
	db $3C,$66,$C3,$C3,$66,$66,$E7,$00	; .
	db $0E,$18,$0C,$7E,$C6,$C6,$7C,$00	; .
	db $00,$00,$7E,$DB,$DB,$7E,$00,$00	; .
	db $06,$0C,$7E,$DB,$DB,$7E,$60,$C0	; .
	db $38,$60,$C0,$F8,$C0,$60,$38,$00	; .
	db $78,$CC,$CC,$CC,$CC,$CC,$CC,$00	; .
	db $00,$7E,$00,$7E,$00,$7E,$00,$00	; .
	db $18,$18,$7E,$18,$18,$00,$7E,$00	; .
	db $60,$30,$18,$30,$60,$00,$FC,$00	; .
	db $18,$30,$60,$30,$18,$00,$FC,$00	; .
	db $0E,$1B,$1B,$18,$18,$18,$18,$18	; .
	db $18,$18,$18,$18,$18,$D8,$D8,$70	; .
	db $18,$18,$00,$7E,$00,$18,$18,$00	; .
	db $00,$76,$DC,$00,$76,$DC,$00,$00	; .
	db $38,$6C,$6C,$38,$00,$00,$00,$00	; .
	db $00,$00,$00,$18,$18,$00,$00,$00	; .
	db $00,$00,$00,$00,$18,$00,$00,$00	; .
	db $0F,$0C,$0C,$0C,$EC,$6C,$3C,$1C	; .
	db $78,$6C,$6C,$6C,$6C,$00,$00,$00	; .
	db $ff,$ff,$e7,$fb,$e3,$db,$e3,$ff	; (a)
	db $ff,$e7,$d7,$f7,$f7,$f7,$c3,$ff	; (1)
	db $ff,$e7,$db,$db,$c3,$db,$db,$ff	; (A)
