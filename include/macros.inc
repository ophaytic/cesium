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

include 'fasmg-ez80/ez80.inc'
include 'fasmg-ez80/tiformat.inc'
format ti archived executable protected program 'CESIUM'
include 'app.inc'
include 'ti84pceg.inc'

macro relocate? name, address*
	name.source? := $
	name.destination? := address
	org name.destination?
	macro name.copy?
		ld	hl, name.source?
		ld	de, name.destination?
		ld	bc, name.length?
		ldir
	end macro
	macro name.run
		name.copy
		jp	name.destination?
	end macro
	macro name.call
		name.copy
		call	name.destination?
	end macro
	macro end?.relocate?
		name.length? := $ - name.destination?
		org name.source? + name.length?
		purge end?.relocate?
	end macro
end macro

macro set_cursor_x? x, y
	ld	bc,x
	ld	(lcd_x),bc
end macro

macro set_cursor? x, y
	ld	bc,x
	ld	a,y
	call	util_set_cursor
end macro

macro save_cursor?
	call	util_save_cursor
end macro

macro restore_cursor?
	call	util_restore_cursor
end macro

macro set_text_fg_color? index
	ld	a,index
	ld	(lcd_text_fg),a
end macro

macro set_text_bg_color? index
	ld	a,index
	ld	(lcd_text_bg),a
end macro

macro set_inverted_text?
	call	util_set_inverted_text_color
end macro

macro set_normal_text?
	call	util_set_normal_text_color
end macro

macro print? string, x, y
	ld	hl,string
	ld	bc,x
	ld	a,y
	call	util_string_xy
end macro

macro print_xy? x, y
	ld	bc,x
	ld	a,y
	call	util_string_xy
end macro

macro draw_rectangle Lx, Ty, Rx, By
	ld	bc,Rx - Lx
	ld	de,(ti.lcdWidth * Ty) + Lx
	ld	a,By - Ty
	call	lcd_rectangle.computed
end macro

macro draw_rectangle_outline? Lx, Ty, Rx, By
	ld	bc,Rx - Lx + 1
	ld	d,By - Ty + 1
	ld	e,Ty
	ld	hl,Lx
	call	lcd_rectangle_outline.computed
end macro

macro draw_rectangle_outline_color? Lx, Ty, Rx, By
	ld	bc,Rx - Lx + 1
	ld	d,By - Ty + 1
	ld	e,Ty
	ld	hl,Lx
	call	lcd_rectangle_outline.color
end macro

macro draw_rectangle_color? Lx, Ty, Rx, By
	call	util_set_primary
	draw_rectangle Lx, Ty, Rx, By
	call	util_restore_primary
end macro

macro draw_rectangle_outline_double? Lx, Ty, Rx, By
	draw_rectangle_outline Lx, Ty, Rx, By
	draw_rectangle_outline Lx+1, Ty+1, Rx-1, By-1
end macro

macro draw_horiz? x, y, length
	ld	hl,(ti.lcdWidth * y) + vRamBuffer + x
	ld	bc,length
	call	lcd_horizontal.computed
end macro

macro draw_vert? x, y, length
	ld	hl,(ti.lcdWidth * y) + vRamBuffer + x
	ld	b,length
	call	lcd_vertical.computed
end macro

macro draw_sprite? sprite, x, y
	ld	hl,sprite
	ld	bc,(256 * x) + y
	call	lcd_sprite
end macro

macro draw_sprite_2x? x, y
	ld	bc,(256 * x) + y
	call	lcd_sprite_2x
end macro

macro compare_hl_zero?
	add	hl,de
	or	a,a
	sbc	hl,de
end macro

macro compare_hl_de?
	or	a,a
	sbc	hl,de
	add	hl,de
end macro

macro draw_option? Lx, Ty, Rx, By
	ld	bc,Rx - Lx + 1
	ld	de,((By - Ty + 1) * 256) + Ty
	ld	hl,Lx
	call	gui_draw_option
end macro

macro draw_highlightable_option? Lx, Ty, index
	ld	bc,Lx + 8 - Lx + 1
	ld	de,((Ty + 8 - Ty + 1) * 256) + Ty
	ld	hl,Lx
	ld	a,index
	call	gui_draw_highlightable_option
end macro

macro draw_highlighted_option? Lx, Ty, index
	xor	a,a
	inc	a
	draw_highlightable_option Lx, Ty, index
end macro

; file management

file_asm := 0
file_c := 1
file_basic := 2
file_ice := 3
file_ice_source := 4
file_dir := 5
file_appvar := 6
file_usb_dir := 7

byte_icon := $01
byte_description := $02
byte_jp := $c3
byte_ice_source := $2c
byte_ice := $7f
byte_c := $00
byte_dir := file_dir
byte_usb_dir := file_usb_dir
byte_edit_return := $aa

item_location_base := ti.saveSScreen + 8400

; lcd

vRamBuffer := ti.vRam + ((ti.vRamEnd - ti.vRam) / 2)

; password

password_max_length := 10

; settings flags

settings_flag := $22
setting_basic_indicator := 0
setting_clock := 1
setting_show_battery := 2
setting_ram_backup := 3
setting_hide_hidden := 4
setting_enable_shortcuts := 5
setting_delete_confirm := 6

settings_adv_flag := $21
setting_special_directories := 0
setting_list_count := 1
setting_enable_usb := 2

settings_default := (1 shl setting_show_battery) or (1 shl setting_enable_shortcuts) or (1 shl setting_delete_confirm) or (1 shl setting_basic_indicator)
settings_adv_default := (1 shl setting_special_directories) or (1 shl setting_enable_usb)

; cesium flags

cesium_flag := $21
cesium_is_disabled := 3
cesium_is_nl_disabled := 4
cesium_execute_alt := 5

; program flags

item_flag := $2f
drawing_selected := 0
scroll_down_available := 1
scroll_up_available := 2
item_renaming := 3
item_is_directory := 4
item_is_ti := 5
item_is_prgm := 6
item_is_hidden := 7

prgm_flag := $30
prgm_archived := 0
prgm_locked := 1
prgm_hidden := 2
prgm_is_basic := 3
prgm_is_usb_directory := 4

temp_prgm_flag := $31
temp_prgm_archived := 0
temp_prgm_locked := 1
temp_prgm_hidden := 2
temp_prgm_is_basic := 3
temp_prgm_is_usb_directory := 4

; location of items

clock_x := 230
clock_y := 7
item_count_x := 160
item_count_y := 7

; return flags

return_goto := $aa
return_prgm := $bb
return_settings := $cc
return_edit := $ee
edit_archived := $ff				; edit_status
edit_goto := return_edit			; edit_mode

; location of variables

hook_chain := ti.appData
edit_status := hook_chain + 4
edit_mode := edit_status + 1
return_info := edit_mode			; yes this is right
backup_prgm_name := edit_mode + 1
backup_home_hook_location := backup_prgm_name + 11
backup_app_change_hook_location := backup_home_hook_location + 3
settings_data := backup_app_change_hook_location + 3
setting_color_primary := settings_data
setting_color_secondary := setting_color_primary + 1
setting_color_tertiary := setting_color_secondary + 1
setting_color_quaternary := setting_color_tertiary + 1
setting_color_quinary := setting_color_quaternary + 1
setting_color_senary := setting_color_quinary + 1
setting_config := setting_color_senary + 1
setting_adv_config := setting_config + 1
setting_brightness := setting_adv_config + 1
setting_editor_name := setting_brightness + 1
setting_password := setting_editor_name + 10
current_option_selection := setting_password + password_max_length + 1
current_selection_absolute := current_option_selection + 1
current_selection := current_selection_absolute + 3
scroll_amount := current_selection + 3
current_screen := scroll_amount + 3
prgm_ptr := current_screen + 1
prgm_data_ptr := prgm_ptr + 3
prgm_size := prgm_data_ptr + 3
prgm_real_size := prgm_size + 3
prgm_type := prgm_real_size + 3
item_ptr := prgm_type + 1;
number_of_items := item_ptr + 3
error_offset := number_of_items + 3

sprite_temp := ti.mpLcdCrsrImage
string_temp := ti.mpLcdCrsrImage
string_other_temp := ti.mpLcdCrsrImage + 512

settings_size := setting_password + password_max_length + 1 - settings_data

; colors

color_primary := setting_color_primary
color_secondary := setting_color_secondary
color_tertiary := setting_color_tertiary
color_quaternary := setting_color_quaternary
color_quinary := setting_color_quinary
color_senary := setting_color_senary

color_primary_default := 107
color_secondary_default := 107
color_tertiary_default := 230
color_quaternary_default := 255
color_quinary_default := 181
color_senary_default := 255

; constants

screen_programs := 0
screen_apps := 1
screen_appvars := 2
screen_usb := 3

; these should go in ti84pce.inc

sysHookFlg := 52
appInpPrmptInit := 0
appInpPrmptDone := 1
appWantHome := 4
