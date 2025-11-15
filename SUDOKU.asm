
[org 0x0100]
jmp start

oldhandler: dd 0 
oldtime: dw 0 
tickcount: dw 18
seconds: dw 0
minutes: dw 0 
start_msg db 'START', 0
start_len dw 5
exit_msg db 'EXIT', 0
exit_len dw 4
intruction_mess db 'INSTRUCTION',0
intruction_len dw 11
arrow db '>', 0          ; Arrow character
arrow_len dw 1           ; Length of the arrow string
easy_msg db 'EASY LEVEL', 0 
easy_len dw 10
medium_msg db 'MEDIUM LEVEL', 0
medium_len dw 12
hard_msg db 'HARD LEVEL', 0
hard_len dw 10
Divider db 186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,0
DividerLen db 25
Box  db 195,196,196,196,197,196,196,196,197,196,196,196,179,196,196,196,197,196,196,196,197,196,196,196,179,196,196,196,197,196,196,196,197,196,196,196,180,0
SubBox db 180,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,180,0
row1Data db 179,' 5 | 3 |   ',179,' 6 | 7 |   ',179,' 9 | 1 |   ',179,0
row2Data db 179,' 6 |   |   ',179,' 1 | 9 | 5 ',179,' 3 | 4 | 8 ',179,0
row3Data db 179,' 1 |   | 8 ',179,' 3 | 4 |   ',179,'   |   | 7 ',179,0
row4Data db 179,' 8 | 5 | 9 ',179,'   |   | 1 ',179,' 4 | 2 | 3 ',179,0
row5Data db 179,' 4 | 2 | 6 ',179,'   | 5 | 3 ',179,' 7 |   | 1 ',179,0
row6Data db 179,'   |   |   ',179,' 9 |   |   ',179,'   |   |   ',179,0
row7Data db 179,'   | 6 | 1 ',179,'   |   |   ',179,'   |   | 4 ',179,0
row8Data db 179,' 2 | 8 |   ',179,' 4 | 1 |   ',179,' 6 | 3 | 5 ',179,0
row9Data db 179,' 3 | 4 |   ',179,' 2 | 8 |   ',179,' 1 | 7 | 9 ',179,0 


;5 3 4 | 6 7 8 | 9 1 2
;6 7 2 | 1 9 5 | 3 4 8
;1 9 8 | 3 4 2 | 5 6 7
;------+-------+------
;8 5 9 | 7 6 1 | 4 2 3
;4 2 6 | 8 5 3 | 7 9 1
;7 1 3 | 9 2 4 | 8 5 6
;------+-------+------
;9 6 1 | 5 3 7 | 2 8 4
;2 8 7 | 4 1 9 | 6 3 5
;3 4 5 | 2 8 6 | 1 7 9


row1Data2 db 179,'   |   |   ',179,'   |   | 8 ',179,' 9 | 1 | 2 ',179,0
row2Data2 db 179,' 6 | 7 | 2 ',179,' 1 | 9 | 5 ',179,'   | 4 | 8 ',179,0
row3Data2 db 179,' 1 | 9 |   ',179,' 3 |   | 2 ',179,'   |   | 7 ',179,0
row4Data2 db 179,' 8 | 5 | 9 ',179,'   |   |   ',179,'   |   |   ',179,0
row5Data2 db 179,' 4 | 2 | 6 ',179,' 8 |   | 3 ',179,' 7 |   | 1 ',179,0
row6Data2 db 179,'   |   |   ',179,'   | 2 |   ',179,'   |   |   ',179,0
row7Data2 db 179,' 9 | 6 | 1 ',179,'   |   | 7 ',179,' 2 |   |   ',179,0
row8Data2 db 179,'   | 8 |   ',179,' 7 |   | 9 ',179,'   |   |   ',179,0
row9Data2 db 179,'   |   |   ',179,'   |   | 6 ',179,'   |   | 9 ',179,0 

 
row1Data1 db 179,'   | 3 |   ',179,'   | 7 | 8 ',179,' 9 |   |   ',179,0
row2Data1 db 179,' 6 |   |   ',179,' 1 |   | 5 ',179,' 3 | 4 | 8 ',179,0
row3Data1 db 179,' 1 | 9 |   ',179,' 3 | 4 |   ',179,' 5 |   | 7 ',179,0
row4Data1 db 179,' 8 | 5 | 9 ',179,'   | 6 |   ',179,'   | 2 |   ',179,0
row5Data1 db 179,' 4 | 2 | 6 ',179,' 8 | 5 |   ',179,' 7 | 9 | 1 ',179,0
row6Data1 db 179,'   |   |   ',179,'   |   | 4 ',179,' 8 | 5 |   ',179,0
row7Data1 db 179,'   |   |   ',179,'   |   |   ',179,'   | 1 |   ',179,0
row8Data1 db 179,' 2 | 8 | 7 ',179,' 4 |   |   ',179,'   |   |   ',179,0
row9Data1 db 179,'   | 4 |   ',179,'   |   |   ',179,' 1 | 7 | 9 ',179,0 

     solution: db 5,3,4,6,7,8,9,1,2,6,7,2,1,9,5,3,4,8,1,9,8,3,4,2,5,6,7,8,5,9,7,6,1,4,2,3,4,2,6,8,5,3,7,9,1,7,1,3,9,2,4,8,5,6,9,6,1,5,3,7,2,8,4,2,8,7,4,1,9,6,3,5,3,4,5,2,8,6,1,7,9
    ; notes_array :   db 1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8 
	
	solution1: db 8,2,7,1,5,4,3,9,6,9,6,5,3,2,7,1,4,8,3,4,1,6,8,9,7,5,2,5,9,3,4,6,8,2,7,1,4,7,2,5,1,3,6,8,9,6,1,8,9,7,2,4,3,5,7,8,6,2,3,5,9,1,4,1,5,4,7,9,6,8,2,3,2,3,9,8,4,1,5,6,7

  notes_array :  times 200 db 0
box:db '            *',0
    db '            *',0
	db '            *',0
    db '            *',0
	db '            *',0
	db '            *',0
    db '            *',0
	db '            *',0
    db '            *',0
	db '            *',0
	db '            *',0
    db '            *',0
	db '            *',0
    db '            *',0
	db '            *',0
	db '            *',0
    db '            *',0
	db '            *',0
    db '            *',0
	db '            *',0
	db '            *',0
    db '            *',0
	db '            *',0
	db '            *',0
    db '            *',0	
db 0
wronginput_mess: db 'wrong',0
wronginput_mess1 : db 'input',0
wronginput_mess_len dw 5

space : db '      ',0


 thanks_mesage: db 'THANKS FOR PLAYING SUDUKO',0
 thanks_mesage_len: dw 25

undo_coordinate: times 10 dw  0
undo_size: dw 0


 
current_selection db 0
welcome_msg db 'WELCOME To SUDOKU!',0
welcome_lenght dw 18
level_msg db 'Select the Level.(ECS to go back).' , 0
level_lenght  dw 34
timer_msg db 'TIMER:' ,0
timer_msg1 db 'TIMER:' ,0
timer_msg2 db 'TIMER:' ,0
timer_lenght dw 6
saved_tick dw 0            ; Define saved_tick in the data segment
mediumlife db 'Mistake count:',0
mediumlifelen dw 14
hardlife db 'Mistake count:',0
hardlifelen dw 14
easylife db 'Mistake count:',0
easylifelen dw 14

counter dw 0
counter_med dw 0
counter_hard dw 0
counter_check_level dw 0
score_count dw 0
score_text db 'SCORE:',0
score_text_len dw 6
game_over db 'Game Over.Press ESC to start again.'
game_over_len dw 35
game_over_2 db 'Press Enter to terminate game.'
game_over_len_2 dw 30

game_win db 'Congratulations! You Win! Press ESC to play again.'
game_win_len dw 47


notes_mess db '|NOTES| ',0
notes_len dw 8
suduko_mess db 'SUDUKO',0
suduko_len dw 6
instruction1 db '1. No repeats: Each number appears once per row, column, and box.', 0
    instruction2 db '2. Start with the given numbers: Sudoku puzzles have numbers filled in.',0
    instruction3 db '3. Use logic: Find patterns and fill in one square at a time.', 0
    instruction4 db '4. Look for the only place: A number can fit in just one spot sometimes.',0
	instruction5 db  '5. Avoid guessing: Use logical deduction instead of random guesses.',0
	instruction6 db '6. Check your work: Regularly review filled cells for potential mistakes.',0
	instruction7 db '7. Press N to edit a node, then press N to return to the grid.',0
	escape_instrution db 'Press ESC to go back',0
intruc1_len dw 65
intruc2_len dw 71
intruc3_len dw 62
intruc4_len dw 70
intruc5_len dw 67
intruc6_len dw 71
intruc7_len dw 62
escape_len dw 20




loopreset:
push si
push CX
mov si,notes_array   ; Load the starting address of the array
mov cx, 200                 ; Set counter for 200 elements

reset_loop:
    mov byte [si], 0    ; Set the current byte to 0
    inc si                  ; Move to the next byte
    loop reset_loop         ; Decrement CX and repeat if not zero
	pop cx
	pop si
ret



create_borders:
    ; Prepare video memory segment
    mov ax, 0xb800
    mov es, ax

    ; Top border
    mov di, 0           ; Start of video memory
    mov cx, 80          ; Width of screen
    mov ah, 0x60        ; Bright yellow on red background
top_border_loop:
    mov al, 205         ; Extended ASCII horizontal line character
    stosw               ; Store AX (character and attribute) at ES:DI and increment DI
    loop top_border_loop

    ; Bottom border
    mov di, (24 * 80 * 2)  ; Last row of screen
    mov cx, 80
    mov ah, 0x60        ; Bright yellow on red background
bottom_border_loop:
    mov al, 205         ; Extended ASCII horizontal line character
    stosw               ; Store AX (character and attribute) at ES:DI and increment DI
    loop bottom_border_loop

    ; Left border
    mov di, 0
    mov cx, 25          ; Screen height
    mov ah, 0x60        ; Bright yellow on red background
left_border_loop:
    mov al, 186         ; Extended ASCII vertical line character
    mov [es:di], ax
    add di, 160         ; Move to next row
    loop left_border_loop

    ; Right border
    mov di, 158         ; Last column (79 * 2)
    mov cx, 25          ; Screen height
    mov ah, 0x60        ; Bright yellow on red background
right_border_loop:
    mov al, 186         ; Extended ASCII vertical line character
    mov [es:di], ax
    add di, 160         ; Move to next row
    loop right_border_loop

    ; Corner characters
    ; Top-Left Corner (218 is single top-left corner)
    mov word [es:0], 0x4E21

    ; Top-Right Corner (191 is single top-right corner)
    mov word [es:158], 0x4E19

    ; Bottom-Left Corner (192 is single bottom-left corner)
    mov word [es:(24*80*2)], 0x4E19

    ; Bottom-Right Corner (217 is single bottom-right corner)
    mov word [es:(24*80*2+158)], 0x4E21

    ret
displ:
    mov ax,0xb800
	mov es,ax
    printl:
        lodsb
        cmp al, 0
        je nextlinee
        mov [es:di], al
        mov byte [es:di+1], 0x70
        add di, 2
        jmp printl
    nextlinee:
        add di, 134
        cmp byte [si], 0
        je doneee
        jmp printl
    doneee:
        ret
		
			print_text11:
    push bp
    mov bp, sp
    push es
    push ax
    push bx
    push cx
    push dx
    push di
    push si
    
    mov ax, 0xb800
    mov es, ax
    
    mov si, [bp+8]          ; Load string pointer
    mov di, [bp+6]          ; Get the calculated DI
    mov cx, 74              ; Maximum characters to print
    
 print_loop11:
    mov al, [si]            ; Get current character
    cmp al, 0               ; Check for null terminator
    je done_printing11      ; If null, we're done
    
    mov ah, 0x06            ; Color attribute (black on brown)
    mov [es:di], ax         ; Write character and color to screen
    
    ; Call delay routine to bring back animation
    push cx                 ; Preserve cx
    call delayy             ; Delay between characters
    pop cx                  ; Restore cx
    
    add di, 2               ; Move to next screen position
    inc si                  ; Move to next string character
    
    dec cx                  ; Decrement character counter
    jz done_printing11      ; Stop if we've printed max characters
    
    jmp print_loop11        ; Continue printing
    
 done_printing11:
    pop si
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    pop es
    pop bp
    ret
				Lprint_text11:
    push bp
    mov bp, sp
    push es
    push ax
    push bx
    push cx
    push dx
    push di
    push si
    
    mov ax, 0xb800
    mov es, ax
    
    mov si, [bp+8]          ; Load string pointer
    mov di, [bp+6]          ; Get the calculated DI
    mov cx, 74              ; Maximum characters to print
 Lprint_loop11:
    mov al, [si]            ; Get current character
    cmp al, 0               ; Check for null terminator
    je Ldone_printing11      ; If null, we're done
    
    mov ah, 0x04            ; Color attribute (black on brown)
    mov [es:di], ax         ; Write character and color to screen
    
    ; Call delay routine to bring back animation
    push cx                 ; Preserve cx
    call delayy             ; Delay between characters
    pop cx                  ; Restore cx
    
    add di, 2               ; Move to next screen position
    inc si                  ; Move to next string character
    
    dec cx                  ; Decrement character counter
    jz Ldone_printing11      ; Stop if we've printed max characters
    
    jmp Lprint_loop11        ; Continue printing
    
 Ldone_printing11:
    pop si
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    pop es
    pop bp
    ret
	
delayy:
    push cx
    mov cx, 0x3FFF          ; Adjust this value to control animation speed
 delayy_loop:
    dec cx
    jnz delayy_loop
    pop cx 
    ret
	
	Wprint_text11:
    push bp
    mov bp, sp
    push es
    push ax
    push bx
    push cx
    push dx
    push di
    push si
    
    mov ax, 0xb800
    mov es, ax
    
    mov si, [bp+8]          ; Load string pointer
    mov di, [bp+6]          ; Get the calculated DI
    mov cx, 74              ; Maximum characters to print
 Wprint_loop11:
    mov al, [si]            ; Get current character
    cmp al, 0               ; Check for null terminator
    je Wdone_printing11      ; If null, we're done
    
    mov ah, 0x02          ; Color attribute (black on brown)
    mov [es:di], ax         ; Write character and color to screen
    
    ; Call delay routine to bring back animation
    push cx                 ; Preserve cx
    call delayy             ; Delay between characters
    pop cx                  ; Restore cx
    
    add di, 2               ; Move to next screen position
    inc si                  ; Move to next string character
    
    dec cx                  ; Decrement character counter
    jz Wdone_printing11      ; Stop if we've printed max characters
    
    jmp Wprint_loop11        ; Continue printing
    
 Wdone_printing11:
    pop si
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    pop es
    pop bp
    ret
	

;----------------------------------------------------------------------------------------------
; sounds start :)
;----------------------------------------------------------------------------------------------
play_game_over_sound:
    ; Preserve registers
    push ax
    push cx
    push dx
    push si
    push di

    ; Disable interrupts
    cli

    ; Game Over sound sequence
    mov cx, 8         ; Number of sound phases
    mov si, 50        ; Starting frequency progression (lower pitch for somber tone)

game_over_sound_loop:
    ; Create a descending, somber tone sequence
    mov ax, si        ; Base frequency progression
    add ax, 200       ; Frequency offset (lower tones)
    mul ax            ; Frequency transition (smooth)
    shr ax, 4         ; Control intensity (scaling factor)

    ; Speaker control
    mov al, 0xB6      ; Timer 2 command (programming PIT for sound)
    out 0x43, al      ; Speaker control port (start frequency)

    ; Set frequency
    out 0x42, al      ; Low byte of frequency (send lower byte)
    mov al, ah
    out 0x42, al      ; High byte of frequency (send higher byte)

    ; Enable speaker
    in al, 0x61       ; Read the current value of the speaker control port
    or al, 3          ; Set the speaker bit (bit 0 = speaker, bit 1 = timer 2)
    out 0x61, al      ; Output to control the speaker

    ; Melodic delay for each phase
    push cx
    mov dx, 0x3FFF    ; Somber delay (control tone length)
game_over_phase:
    dec dx
    jnz game_over_phase
    pop cx

    ; Soft inter-phase pause
    mov dx, 0x1FFF    ; Short pause between phases
inter_phase_pause1:
    dec dx
    jnz inter_phase_pause1

    ; Decrement frequency for the next phase
    sub si, 5         ; Gradually lower the frequency for each phase
    inc di            ; Add variation

    ; Decrement and continue loop
    loop game_over_sound_loop

    ; Extended somber finale
    mov cx, 0x7FFF    ; Final long delay for the somber tone
game_over_finale:
    dec cx
    jnz game_over_finale

    ; Disable speaker after sound ends
    in al, 0x61
    and al, 0xFC      ; Turn off speaker by clearing bit 0
    out 0x61, al

    ; Restore interrupts
    sti

    ; Restore registers
    pop di
    pop si
    pop dx
    pop cx
    pop ax
    ret
	
playWinScreensound:
    ; Preserve registers
    push ax
    push cx
    push dx
    push si
    push di

    ; Disable interrupts
    cli

    ; Victorious sound sequence
    mov cx, 10        ; Number of sound phases
    mov si, 0         ; Frequency progression (start at base frequency)

game_win_sound_loop:
    ; Create an ascending, celebratory tone sequence
    mov ax, si        ; Base frequency progression
    add ax, 300       ; Frequency offset
    mul ax            ; Create smooth frequency transitions
    shr ax, 4         ; Control intensity (scaling factor)

    ; Speaker control
    mov al, 0xB6      ; Timer 2 command (programming PIT for sound)
    out 0x43, al      ; Speaker control port (start frequency)

    ; Set frequency
    out 0x42, al      ; Low byte of frequency (send lower byte)
    mov al, ah
    out 0x42, al      ; High byte of frequency (send higher byte)

    ; Enable speaker
    in al, 0x61       ; Read the current value of the speaker control port
    or al, 3          ; Set the speaker bit (bit 0 = speaker, bit 1 = timer 2)
    out 0x61, al      ; Output to control the speaker

    ; Varied celebratory delay
    push cx
    mov dx, 0x4FFF    ; Melodic delay (control tone length)
win_sound_phase:
    dec dx
    jnz win_sound_phase
    pop cx

    ; Soft inter-phase pause (to avoid sound clash)
    mov dx, 0x1FFF    ; Shorter pause between phases
inter_phase_pause:
    dec dx
    jnz inter_phase_pause

    ; Increment frequency with ascending pattern
    add si, 10        ; Create uplifting progression for next phase
    inc di            ; Add variation (used later for other enhancements)

    ; Decrement and continue loop
    loop game_win_sound_loop

    ; Extended celebratory finale
    mov cx, 0x7FFF    ; Final long delay for the celebratory tone
victory_finale:
    dec cx
    jnz victory_finale

    ; Disable speaker after sound ends
    in al, 0x61
    and al, 0xFC      ; Turn off speaker by clearing bit 0
    out 0x61, al

    ; Restore interrupts
    sti

    ; Restore registers
    pop di
    pop si
    pop dx
    pop cx
    pop ax
    ret
	
play_wrong_input_sound:
    ; Preserve registers
    push ax
    push cx
    push dx

    ; Disable interrupts
    cli

    ; Wrong input sound parameters
    mov cx, 5         ; Number of sound pulses
    mov si, 0         ; Frequency variation

wrong_input_pulse:
    ; Create a harsh, discordant frequency
    mov ax, 100      ; Base low frequency
    add ax, si       ; Add variation
    mul ax           ; Create intensity
    shr ax, 3        ; Control volume

    ; Speaker control
    mov al, 0xB6     ; Timer 2 command
    out 0x43, al     ; Speaker control port

    ; Set frequency
    out 0x42, al     ; Low byte
    mov al, ah
    out 0x42, al     ; High byte

    ; Enable speaker
    in al, 0x61
    or al, 3
    out 0x61, al

    ; Short, sharp delay
    mov dx, 0x3FFF
wrong_input_delay:
    dec dx
    jnz wrong_input_delay

    ; Disable speaker
    in al, 0x61
    and al, 0xFC
    out 0x61, al

    ; Short pause between pulses
    mov dx, 0x1FFF
inter_pulse_delay:
    dec dx
    jnz inter_pulse_delay

    ; Increase frequency variation for each pulse
    add si, 50

    ; Continue pulse loop
    loop wrong_input_pulse

    ; Final sharp end
    mov cx, 0x2FFF
final_sharp_end:
    dec cx
    jnz final_sharp_end

    ; Restore interrupts
    sti

    ; Restore registers
    pop dx
    pop cx
    pop ax
    ret
playCyberPunk:
    ; Preserve registers
    push ax
    push cx
    push dx
    push si

    ; Disable interrupts
    cli

    ; Musical note sequence (inspired by gentle game startup sounds)
    ; Create a calm, ascending melodic pattern
    mov cx, 8        ; Number of musical notes
    mov si, 0        ; Note progression

soothing_sound_loop:
    ; Musical frequency calculation
    ; Using a more harmonious approach
    mov ax, si       ; Base note progression
    add ax, 500      ; Base frequency offset
    mul ax           ; Create smooth frequency transitions
    shr ax, 6        ; Soften the intensity

    ; Speaker control
    mov al, 0xB6     ; Timer 2 command
    out 0x43, al     ; Speaker control port

    ; Set frequency
    out 0x42, al     ; Low byte
    mov al, ah
    out 0x42, al     ; High byte

    ; Enable speaker
    in al, 0x61
    or al, 3
    out 0x61, al

    ; Gentle delay for each note
    push cx
    mov dx, 0x5FFF   ; Softer, more musical delay
musical_note_delay:
    dec dx
    jnz musical_note_delay
    pop cx

    ; Soft inter-note pause
    mov dx, 0x1FFF
inter_note_pause:
    dec dx
    jnz inter_note_pause

    ; Increment note progression with a more musical approach
    inc si
    add si, 2        ; Create a more melodic ascent

    ; Decrement and continue loop
    loop soothing_sound_loop

    ; Gradual sound fade-out
    mov cx, 0x3FFF
fade_out_delay:
    dec cx
    jnz fade_out_delay

    ; Disable speaker
    in al, 0x61
    and al, 0xFC
    out 0x61, al

    ; Restore interrupts
    sti

    ; Restore registers
    pop si
    pop dx
    pop cx
    pop ax
    ret


screetch:
    ; Preserve registers
    push ax
    push cx
    push dx
    push si
    push di

    ; Disable interrupts
    cli

    ; Mario-style sound sequence
    ; Will create a multi-phase sound reminiscent of classic Mario games
    mov cx, 20       ; Extended sound phases
    mov si, 0        ; Frequency base
    mov di, 1        ; Frequency multiplier
	mario_sound_loop:
    ; Complex frequency calculation inspired by game sound effects
    mov ax, si       ; Base frequency
    mul di           ; Multiply by increasing factor
    add ax, 500      ; Adjust base frequency
    shl ax, 1        ; Increase intensity

    ; Speaker control
    mov al, 0xB6     ; Timer 2 command
    out 0x43, al     ; Speaker control port

    ; Set frequency
    out 0x42, al     ; Low byte
    mov al, ah
    out 0x42, al     ; High byte

    ; Enable speaker
    in al, 0x61
    or al, 3
    out 0x61, al

    ; Varied delay to create interesting sound pattern
    push cx
    mov dx, 0xAFFF   ; Varying delay length
    sound_phase_delay:
        dec dx
        jnz sound_phase_delay
    pop cx

    ; Periodic speaker state changes for complex sound
    in al, 0x61
    xor al, 3        ; Toggle speaker state
    out 0x61, al

    ; Create ascending and descending frequency patterns
    cmp cx, 10
    jb descending_freq
    inc si           ; Ascending frequency
    jmp freq_control_done
descending_freq:
    dec si           ; Descending frequency

freq_control_done:
    ; Increment frequency multiplier
    inc di

    ; Inter-phase delay with variation
    mov dx, 0x1FFF
inter_phase_delay1:
    dec dx
    jnz inter_phase_delay1

    ; Continue sound loop
    loop mario_sound_loop

    ; Final prolonged sound effect
    mov cx, 0xFFFF
final_sound_delay:
    dec cx
    jnz final_sound_delay

    ; Disable speaker
    in al, 0x61
    and al, 0xFC
    out 0x61, al

    ; Restore interrupts
    sti

    ; Restore registers
    pop di
    pop si
    pop dx
    pop cx
    pop ax
    ret
playWinSound:
    ; Preserve registers
    push ax
    push cx
    push dx

    ; Disable interrupts
    cli

    ; Multiple sound phases for a more interesting effect
    mov cx, 5        ; Number of sound phases

fun_sound_loop:
    ; Unique frequency calculation for each phase
    mov ax, cx       ; Use loop counter for frequency variation
    add ax, 500      ; Base frequency
    mul ax           ; Create more dramatic frequency changes
    shr ax, 4        ; Adjust volume/intensity

    ; Speaker control
    mov al, 0xB6     ; Timer 2 command
    out 0x43, al     ; Speaker control port

    ; Set frequency
    out 0x42, al     ; Low byte
    mov al, ah
    out 0x42, al     ; High byte

    ; Enable speaker
    in al, 0x61
    or al, 3
    out 0x61, al

    ; Variable delay for each phase
    push cx
    mov dx, 0xFFFF
phase_delay:
    dec dx
    jnz phase_delay
    pop cx

    ; Disable speaker
    in al, 0x61
    and al, 0xFC
    out 0x61, al

    ; Slight pause between phases
    mov dx, 0x0FFF
inter_phase_delay:
    dec dx
    jnz inter_phase_delay

    loop fun_sound_loop

    ; Restore interrupts
    sti

    ; Restore registers
    pop dx
    pop cx
    pop ax
    ret
play_wood_tick_sound:
    ; Preserve registers
    push ax
    push cx
    push dx

    ; Disable interrupts
    cli

    ; Wood tick sound parameters
    mov cx, 3        ; Number of short, sharp ticks
    mov si, 300      ; Base frequency for wood-like sound

wood_tick_loop:
    ; Create a sharp, percussive frequency
    mov ax, si       ; Base frequency
    add ax, 50       ; Add slight variation
    mul ax           ; Create intensity
    shr ax, 5        ; Control volume (make it sharper)

    ; Speaker control
    mov al, 0xB6     ; Timer 2 command
    out 0x43, al     ; Speaker control port

    ; Set frequency
    out 0x42, al     ; Low byte
    mov al, ah
    out 0x42, al     ; High byte

    ; Enable speaker
    in al, 0x61
    or al, 3
    out 0x61, al

    ; Very short, sharp delay to create tick sound
    mov dx, 0x1FFF
wood_tick_delay:
    dec dx
    jnz wood_tick_delay

    ; Disable speaker
    in al, 0x61
    and al, 0xFC
    out 0x61, al

    ; Short pause between ticks
    mov dx, 0x0FFF
inter_tick_delay:
    dec dx
    jnz inter_tick_delay

    ; Slightly change frequency for each tick
    add si, 20

    ; Continue tick loop
    loop wood_tick_loop

    ; Restore interrupts
    sti

    ; Restore registers
    pop dx
    pop cx
    pop ax
    ret
;----------------------------------------------------------------------------------------------
; sounds END :(
;----------------------------------------------------------------------------------------------


Timerprintnum: 
    push bp
    mov bp, sp
    push es
    push ax
    push bx
    push cx
    push dx
    push di
    mov ax, 0xb800
    mov es, ax
    mov ax, [bp+4]      ; number to print
    mov di, [bp+6]    ; screen position
    mov bx, 10
    mov cx, 0
    ; Handle zero case
    test ax, ax
    jnz Timernextdigit
    push 0x30           ; push '0'
    inc cx
Timernextdigit: 
    test ax, ax
    jz Timercheckdigits
    mov dx, 0
    div bx
    add dl, 0x30        ; convert to ASCII
    push dx
    inc cx
    jmp Timernextdigit
Timercheckdigits:
    cmp cx, 2           ; check if we have at least 2 digits
    jae Timerprintdigits     ; if 2 or more digits, print them
    push 0x30           ; else push leading '0'
    inc cx
Timerprintdigits:
    pop dx              ; get next digit
    mov dh, 0x70        ; attribute
    mov [es:di], dx     ; print character
    add di, 2
    loop Timerprintdigits    ; repeat for all digits
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    pop es
    pop bp
    ret 4

; Print colon between minutes and seconds
Timerprintcolon:
    push es
    push ax
    push di
    mov ax, 0xb800
    mov es, ax
    mov di, 612        ; position between minutes and seconds
    mov ax, 0x703A      ; ':' with attribute
    mov [es:di], ax
    pop di
    pop ax
    pop es
    ret

timer: 
    push ax
    push dx 
    
    dec word [cs:tickcount]     ; decrement tick count
    cmp word [cs:tickcount], 0  ; check if 1 second passed
    ja skipSecondInc
    
    mov word [cs:tickcount], 18 ; reset ticks (18.2 per second)
    inc word [cs:seconds]       ; increment seconds
    cmp word [cs:seconds], 60   ; check if reached 60 seconds
    jb skipMinuteInc
    
    mov word [cs:seconds], 0    ; reset seconds
    inc word [cs:minutes]       ; increment minutes
    cmp word [cs:minutes], 60   ; check if reached 60 minutes
    jb skipMinuteInc
    mov word [cs:minutes], 0    ; reset minutes if reached 60
    
skipMinuteInc:
    ; Display minutes
    push 608                    ; position
    push word [cs:minutes]      ; value
    call Timerprintnum
    
    ; Display colon
    call Timerprintcolon
    
    ; Display seconds
    push 614                    ; position
    push word [cs:seconds]      ; value
    call Timerprintnum
    
skipSecondInc:
    mov al, 0x20
    out 0x20, al               ; End of interrupt
    pop dx 
    pop ax
    iret

; Function to start the timer
starttimer:
    push ax
    push es
    push bx
    
    ; Initialize counters
    mov word [seconds], 0
    mov word [minutes], 0
    mov word [tickcount], 18
    
    ; Save old interrupt handler
    xor ax, ax
    mov es, ax
    mov bx, [es:8*4]
    mov [oldhandler], bx
    mov bx, [es:8*4+2]
    mov [oldhandler+2], bx
    
    ; Install new timer interrupt handler
    cli
    mov word [es:8*4], timer
    mov word [es:8*4+2], cs
    sti
    
    ; Initial display
    push 608            ; Display initial minutes (00)
    push word [minutes]
    call Timerprintnum
    
    call Timerprintcolon
    
    push 614            ; Display initial seconds (00)
    push word [seconds]
    call Timerprintnum
    
    pop bx
    pop es
    pop ax
    ret

; Function to stop the timer
stoptimer:
    push ax
    push es
    
    ; Restore original interrupt handler
    cli
    xor ax, ax
    mov es, ax
    mov ax, [oldhandler]
    mov [es:8*4], ax
    mov ax, [oldhandler+2]
    mov [es:8*4+2], ax
    sti
	
    
    pop es
    pop ax
    ret


delay:
    push cx
    mov cx, 1 ; change the values to increase delay time
	
delay_loop1:
    push cx
    mov cx, 0xFFFF
delay_loop2:
    loop delay_loop2
    pop cx
    loop delay_loop1
    pop cx
    ret


print_notes_grid:
push bp
mov bp,sp
push ax
push bx
push cx
push es
push di


mov ax,0xb800
mov es,ax
mov al,196
mov ah,0x70
mov cx,7
mov di,1560+320
cld
rep stosw
mov cx,7
mov di,1880+320
rep stosw
mov al,179
mov di,1560+158+320
stosw
mov di,1560+8+158+320
stosw
mov di,1560+16+158+320
stosw
mov al,218
mov di,1558+320
stosw
mov al,192
mov di,1558+160+160+320
stosw
mov al,217
mov di,1560+14+320+320
stosw
mov al,191
mov di,1560+14+320
stosw


    ; Load the base video memory segment into ES
    mov ax, 0xb800
    mov es, ax

    ; Calculate the index for notes_array based on the value of [bp-4]
    mov bx, dx
    shl bx, 1                  ; bx = bx * 2 (optimized multiplication by 2)

    ; Access and display the first note
    mov cl, byte [notes_array + bx ] ; Load the first note into CL
    mov ah, 0x70                            ; Set color attribute
    add cl, 0x30  
   mov al,cl	; Convert to ASCII
    mov di, 2042                           ; Start writing to video memory at this offset
    mov [es:di], ax                         ; Write the first note

    ; Access and display the second note
    mov cl, byte [notes_array + bx +1] ; Load the second note into CL
    add di, 4                               ; Move to the next character position in video memory
    mov ah, 0x70                            ; Set color attribute
    add cl, 0x30   
  mov al,cl	; Convert to ASCII
    mov [es:di+4], ax                         ; Write the second note
 pop di
 pop es

 pop cx
 pop bx
 pop ax
 pop bp
 ret
 
printnum: push bp
 mov bp, sp
 push es
 push ax
 push bx
 push cx
 push dx
 push di
 mov ax, 0xb800
 mov es, ax ; point es to video base
 mov ax, [bp+4] ; load number in ax
 mov bx, 10 ; use base 10 for division
 mov cx, 0 ; initialize count of digits
nextdigit: mov dx, 0 ; zero upper half of dividend
 div bx ; divide by 10
 add dl, 0x30 ; convert digit into ascii value
 push dx ; save ascii value on stack
 inc cx ; increment count of values
 cmp ax, 0 ; is the quotient zero
 jnz nextdigit ; if no divide it again
 mov di,1248 ; point di to top left column
nextpos: pop dx ; remove a digit from the stack
 mov dh, 0x70 ; use normal attribute
 mov [es:di], dx ; print char on screen
 add di, 2 ; move to next screen location
 loop nextpos ; repeat for all digits on stack
 pop di
 pop dx
 pop cx
 pop bx
 pop ax
 pop es
 pop bp
 ret 2 


  
 print_card_layout:
      mov ax,7
	  push ax
	  mov ax,21
	  push ax 
	  mov ax,0x70
	  push ax
	  mov ax,Card1
	  push ax
	  push word [Card1Len]
	  call printstr
	  mov ax,6
	  push ax
	  mov ax,22 
	  push ax 
	  mov ax,0x70
	  push ax
	  mov ax,Card2
	  push ax
	  push word [Card2Len]
	  call printstr 
   mov ax,6
	  push ax
	  mov ax,23 
	  push ax 
	  mov ax,0x70
	  push ax
	  mov ax,Card3
	  push ax
	  push word [Card3Len]
	  call printstr 
      mov ax,6
	  push ax
	  mov ax,24
	  push ax 
	  mov ax,0x70
	  push ax
	  mov ax,Card4
	  push ax
	  push word [Card4Len]
	  call printstr 
      ret
	  
	  printscoretext:
	  
	  	 mov ax, 57
    push ax                ; y position = 0
    mov ax, 7
    push ax
    mov ax, 0x70         ; highlighted for "Easy"
    push ax
    mov ax, score_text
    push ax
    push word [score_text_len]
    call printstr
	
	
	ret
	
	
	printgameover:
	call play_game_over_sound
	call play_game_over_sound
	call play_game_over_sound
    mov si, p1
	push si 
	mov di, (2+8*80)*2
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call Lprint_text11
	add sp, 6
	mov si, p2
	push si 
	mov di, (2+8*80)*2+160
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call Lprint_text11
	add sp, 6
	
	mov si, p3
	push si 
	mov di, (2+8*80)*2+160*2
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call Lprint_text11
	add sp, 6
	
	
	mov si, p4
	push si 
	mov di, (2+8*80)*2+160*3
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call Lprint_text11
	add sp, 6
	
	mov si, p5
	push si 
	mov di, (2+8*80)*2+160*4
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call Lprint_text11
	add sp, 6
	
    mov ax, 6
    push ax                ; y position = 0
    mov ax, 21
    push ax
    mov ax, 0x74         ; highlighted for "Easy"
    push ax
    mov ax, game_over
    push ax
    push word [game_over_len]
    call printstr1
	   mov ax, 6
    push ax                ; y position = 0
    mov ax, 22
    push ax
    mov ax, 0x74         ; highlighted for "Easy"
    push ax
    mov ax, game_over_2
    push ax
    push word [game_over_len_2]
    call printstr1
		mov si,box 
	mov di,(40+0*80)*2
	call displ
	
	ret 	
 
 printgamewin:
 call playWinScreensound
  call playWinScreensound
   call playWinScreensound
	mov si,box
	mov di,(40+0*80)*2
	call displ
	 mov si, w1
	push si 
	mov di, (2+8*80)*2
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call Wprint_text11
	add sp, 6
	mov si, w2
	push si 
	mov di, (2+8*80)*2+160
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call Wprint_text11
	add sp, 6
	
	mov si, w3
	push si 
	mov di, (2+8*80)*2+160*2
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call Wprint_text11
	add sp, 6
	
	
	mov si, w4
	push si 
	mov di, (2+8*80)*2+160*3
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call Wprint_text11
	add sp, 6
	
	mov si, w5
	push si 
	mov di, (2+8*80)*2+160*4
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call Wprint_text11
	add sp, 6
	
	
    mov ax, 1
    push ax                ; y position = 0
    mov ax, 22
    push ax
    mov ax, 0xF2         ; highlighted for "Easy"
    push ax
    mov ax, game_win
    push ax
    push word [game_win_len]
    call printstr1
	 mov ax, 1
    push ax                ; y position = 0
    mov ax, 23
    push ax
    mov ax, 0xF2         ; highlighted for "Easy"
    push ax
    mov ax, game_over_2
    push ax
    push word [game_over_len_2]
    call printstr1
	ret
	  
	  printwronginput:
	  		 mov ax, 44
    push ax                ; y position = 0
    mov ax, 10
    push ax
    mov ax, 0x74         ; highlighted for "Easy"
    push ax
    mov ax, wronginput_mess
    push ax
    push word [wronginput_mess_len]
	
    call printstr1
		  		 mov ax, 44
    push ax                ; y position = 0
    mov ax, 11
    push ax
    mov ax, 0x74         ; highlighted for "Easy"
    push ax
    mov ax, wronginput_mess1
    push ax
    push word [wronginput_mess_len]
    call printstr1
	
	ret
	clear_wrong:
	
	 mov ax, 44
    push ax                ; y position = 0
    mov ax, 10
    push ax
    mov ax, 0x74         ; highlighted for "Easy"
    push ax
    mov ax, space
    push ax
    push word [wronginput_mess_len]
    call printstr
		 mov ax, 44
    push ax                ; y position = 0
    mov ax, 11
    push ax
    mov ax, 0x74         ; highlighted for "Easy"
    push ax
    mov ax, space
    push ax
    push word [wronginput_mess_len]
    call printstr
	
	
	ret
	  
	
     printUndo:
	 mov ax,64
	 push ax
	 mov ax,21 
	 push ax 
	 mov ax,0x70
	 push ax
	 mov ax,undo_msg
	 push ax
	 push word [undoLen]
	 call printstr
	 mov ax, 62
     push ax                ; y position = 4
     mov ax, 20
     push ax
     mov ax, 0x70           ; regular white on black
     push ax
     mov ax, undoBoxTop
     push ax
     push word [undoBoxTopLen]
     call printstr
	 mov ax, 62
     push ax                ; y position = 4
     mov ax, 21
     push ax
     mov ax, 0x70          ; regular white on black
     push ax
     mov ax, vert
     push ax
     push word[vertLen]
	 call printstr
	 mov ax, 76
     push ax                ; y position = 4
     mov ax, 21
     push ax
     mov ax, 0x70           ; regular white on black
     push ax
     mov ax, vert
     push ax
     push word[vertLen]
	 call printstr
	 mov ax, 62
     push ax                ; y position = 4
     mov ax, 22
     push ax
     mov ax, 0x70        ; regular white on black
     push ax
     mov ax, undoBoxBott
     push ax
     push word[undoBoxBottLen]
	 call printstr
     ret
	printstrGrid:
    push es
    push ax
    push cx
    push si
    push di
    mov bx, 0xb800          ; Video memory address
    mov es, bx

next_char:
    lodsb                   ; Load character from string into AL
    stosw                   ; Store AX (character in AL, attribute in AH) to ES:DI
    loop next_char          ; Loop until the string is fully printed

    pop di
    pop si
    pop cx
    pop ax
    pop es
    ret
clrscr1:
    push es
    push ax
    push di
    mov ax, 0xb800          ; Video memory address (for text mode)
    mov es, ax
    mov di, 0               ; Start at top left corner
	next_loc:
    mov word [es:di], 0x7020 ; Clear screen character with gray background (space character)
    add di, 2               ; Move to next word in video memory
    cmp di, 4000            ; 80x25 = 2000 words (each word is 2 bytes)
    jne next_loc
    pop di
    pop ax
    pop es
    ret
	    print_hard:
	 mov ax, 57
    push ax                ; y position = 0
    mov ax, 1
    push ax
    mov ax, 0x70         ; highlighted for "Easy"
    push ax
    mov ax, hard_msg
    push ax
    push word [hard_len]
    call printstr
	
	ret
	print_easy:
	 mov ax, 57
    push ax                ; y position = 0
    mov ax, 1
    push ax
    mov ax, 0x70         ; highlighted for "Easy"
    push ax
    mov ax, easy_msg
    push ax
    push word [easy_len]
    call printstr
	
	
	ret
print_medium:
 mov ax, 57
    push ax                ; y position = 0
    mov ax, 1
    push ax
    mov ax, 0x70         ; highlighted for "Easy"
    push ax
    mov ax, medium_msg
    push ax
    push word [medium_len]
    call printstr

ret
Grid9x9:
    push es
    push ax
    push cx
    push si
    push di
    push bx
    push dx
    mov ax, 0xb800          ; Video memory address
    mov es, ax
    mov di, (80 * 1 + 6) * 2  ; Start at row 3, column 2
   
    mov cx, 9
    mov bx, 1
display_row:
    push cx
    mov si, Box 
    cmp bx, 1
    je useSubBoxx
    cmp bx, 4
    je useSubBoxx
    cmp bx, 7
    je useSubBoxx
    jmp printline
useSubBoxx:
    mov si, SubBox 
    
printline:
    mov cx, 37              ; Length of grid line
    mov ah, 0x70           ; Black text on gray background
printLinee:
    lodsb
    stosw
    dec cx
    cmp cx, 0
    jne printLinee
    
    add di, (80 - 37) * 2   ; Move to next row
    ; Print grid row content
    cmp bx, 1
    je print_row11
    cmp bx, 2
    je print_row22
    cmp bx, 3
    je print_row33
    cmp bx, 4
    je print_row44
    cmp bx, 5
    je print_row55
    cmp bx, 6
    je print_row66
    cmp bx, 7
    je print_row77
    cmp bx, 8
    je print_row88
    cmp bx, 9
    je print_row99
print_row11:
    mov si, row1Data
    jmp printGridDataa
print_row22:
    mov si, row2Data
    jmp printGridDataa
print_row33:
    mov si, row3Data
    jmp printGridDataa
print_row44:
    mov si, row4Data
    jmp printGridDataa
print_row55:
    mov si, row5Data
    jmp printGridDataa
print_row66:
    mov si, row6Data
    jmp printGridDataa
print_row77:
    mov si, row7Data
    jmp printGridDataa
print_row88:
    mov si, row8Data
    jmp printGridDataa
print_row99:
    mov si, row9Data
printGridDataa:
    mov cx, 37              ; Length of grid row
    mov ah, 0x70           ; Black text on gray background
    push di                ; Save current video position
print_grid_row_loopp:
    push cx                ; Save counter
    push si                ; Save source pointer
    
    ; Check existing character at current position
    mov ax, [es:di]        ; Get word at current position (char + attribute)
    cmp al, ' '            ; Check if it's a space
    je print_new_char      ; If space, print new character
    cmp al, '1'            ; Check if it's a number
    jb print_new_char
    cmp al, '9'
    ja print_new_char
    
    ; If we get here, there's a number - preserve it
    pop si                 ; Restore source pointer
    lodsb                  ; Skip the source character
    add di, 2              ; Move to next screen position
    jmp next_char1
    
print_new_char:
    pop si                 ; Restore source pointer
    lodsb                  ; Get new character
    stosw                  ; Print it with attribute
    jmp next_char1
    
next_char1:
    pop cx                 ; Restore counter
    loop print_grid_row_loopp
    
    pop di                 ; Restore original position
    add di, (80 * 2)       ; Move to next row
    inc bx
    
    pop cx
    dec cx
    jnz display_row
    
    ; Print final thick line
    mov si, SubBox
    mov cx, 37
    mov ah, 0x70
Lastt:
    lodsb
    stosw
    loop Lastt
    
    ; Print divider
    mov si, Divider
    mov cx, DividerLen
    mov ah, 0x70
    mov di, (80 * 0 + 50) * 2
print_separation:
    lodsb
    stosw
    add di, 158
    loop print_separation
    
    pop dx
    pop bx
    pop di
    pop si
    pop cx
    pop ax
    pop es
    ret
	
	
	
	Grid9x91:
    push es
    push ax
    push cx
    push si
    push di
    push bx
    push dx
    mov ax, 0xb800          ; Video memory address
    mov es, ax
    mov di, (80 * 1 + 6) * 2  ; Start at row 3, column 2
   
    mov cx, 9
    mov bx, 1
display_row1:
    push cx
    mov si, Box 
    cmp bx, 1
    je useSubBoxx1
    cmp bx, 4
    je useSubBoxx1
    cmp bx, 7
    je useSubBoxx1
    jmp printline1
useSubBoxx1:
    mov si, SubBox 
    
printline1:
    mov cx, 37              ; Length of grid line
    mov ah, 0x70           ; Black text on gray background
printLinee1:
    lodsb
    stosw
    dec cx
    cmp cx, 0
    jne printLinee1
    
    add di, (80 - 37) * 2   ; Move to next row
    ; Print grid row content
    cmp bx, 1
    je print_row1
    cmp bx, 2
    je print_row2
    cmp bx, 3
    je print_row3
    cmp bx, 4
    je print_row4
    cmp bx, 5
    je print_row5
    cmp bx, 6
    je print_row6
    cmp bx, 7
    je print_row7
    cmp bx, 8
    je print_row8
    cmp bx, 9
    je print_row9
print_row1:
    mov si, row1Data1
    jmp printGridDataa1
print_row2:
    mov si, row2Data1
    jmp printGridDataa1
print_row3:
    mov si, row3Data1
    jmp printGridDataa1
print_row4:
    mov si, row4Data1
    jmp printGridDataa1
print_row5:
    mov si, row5Data1
    jmp printGridDataa1
print_row6:
    mov si, row6Data1
    jmp printGridDataa1
print_row7:
    mov si, row7Data1
    jmp printGridDataa1
print_row8:
    mov si, row8Data1
    jmp printGridDataa1
print_row9:
    mov si, row9Data1
printGridDataa1:
    mov cx, 37              ; Length of grid row
    mov ah, 0x70           ; Black text on gray background
    push di                ; Save current video position
print_grid_row_loopp1:
    push cx                ; Save counter
    push si                ; Save source pointer
    
    ; Check existing character at current position
    mov ax, [es:di]        ; Get word at current position (char + attribute)
    cmp al, ' '            ; Check if it's a space
    je print_new_char1      ; If space, print new character
    cmp al, '1'            ; Check if it's a number
    jb print_new_char1
    cmp al, '9'
    ja print_new_char1
    
    ; If we get here, there's a number - preserve it
    pop si                 ; Restore source pointer
    lodsb                  ; Skip the source character
    add di, 2              ; Move to next screen position
    jmp next_char11
    
print_new_char1:
    pop si                 ; Restore source pointer
    lodsb                  ; Get new character
    stosw                  ; Print it with attribute
    jmp next_char11
    
next_char11:
    pop cx                 ; Restore counter
    loop print_grid_row_loopp1
    
    pop di                 ; Restore original position
    add di, (80 * 2)       ; Move to next row
    inc bx
    
    pop cx
    dec cx
    jnz display_row1
    
    ; Print final thick line
    mov si, SubBox
    mov cx, 37
    mov ah, 0x70
Lastt1:
    lodsb
    stosw
    loop Lastt1
    
    ; Print divider
    mov si, Divider
    mov cx, DividerLen
    mov ah, 0x70
    mov di, (80 * 0 + 50) * 2
print_separation1:
    lodsb
    stosw
    add di, 158
    loop print_separation1
    
    pop dx
    pop bx
    pop di
    pop si
    pop cx
    pop ax
    pop es
    ret
	
	Grid9x92:
    push es
    push ax
    push cx
    push si
    push di
    push bx
    push dx
    mov ax, 0xb800          ; Video memory address
    mov es, ax
    mov di, (80 * 1 + 6) * 2  ; Start at row 3, column 2
   
    mov cx, 9
    mov bx, 1
display_row2:
    push cx
    mov si, Box 
    cmp bx, 1
    je useSubBoxx2
    cmp bx, 4
    je useSubBoxx2
    cmp bx, 7
    je useSubBoxx2
    jmp printline2
useSubBoxx2:
    mov si, SubBox 
    
printline2:
    mov cx, 37              ; Length of grid line
    mov ah, 0x70           ; Black text on gray background
printLinee2:
    lodsb
    stosw
    dec cx
    cmp cx, 0
    jne printLinee2
    
    add di, (80 - 37) * 2   ; Move to next row
    ; Print grid row content
    cmp bx, 1
    je print_row12
    cmp bx, 2
    je print_row23
    cmp bx, 3
    je print_row32
    cmp bx, 4
    je print_row42
    cmp bx, 5
    je print_row52
    cmp bx, 6
    je print_row62
    cmp bx, 7
    je print_row72
    cmp bx, 8
    je print_row82
    cmp bx, 9
    je print_row92
print_row12:
    mov si, row1Data2
    jmp printGridDataa2
print_row23:
    mov si, row2Data2
    jmp printGridDataa2
print_row32:
    mov si, row3Data2
    jmp printGridDataa2
print_row42:
    mov si, row4Data2
    jmp printGridDataa2
print_row52:
    mov si, row5Data2
    jmp printGridDataa2
print_row62:
    mov si, row6Data2
    jmp printGridDataa2
print_row72:
    mov si, row7Data2
    jmp printGridDataa2
print_row82:
    mov si, row8Data2
    jmp printGridDataa2
print_row92:
    mov si, row9Data2
printGridDataa2:
    mov cx, 37              ; Length of grid row
    mov ah, 0x70           ; Black text on gray background
    push di                ; Save current video position
print_grid_row_loopp2:
    push cx                ; Save counter
    push si                ; Save source pointer
    
    ; Check existing character at current position
    mov ax, [es:di]        ; Get word at current position (char + attribute)
    cmp al, ' '            ; Check if it's a space
    je print_new_char2      ; If space, print new character
    cmp al, '1'            ; Check if it's a number
    jb print_new_char2
    cmp al, '9'
    ja print_new_char2
    
    ; If we get here, there's a number - preserve it
    pop si                 ; Restore source pointer
    lodsb                  ; Skip the source character
    add di, 2              ; Move to next screen position
    jmp next_char12
    
print_new_char2:
    pop si                 ; Restore source pointer
    lodsb                  ; Get new character
    stosw                  ; Print it with attribute
    jmp next_char12
    
next_char12:
    pop cx                 ; Restore counter
    loop print_grid_row_loopp2
    
    pop di                 ; Restore original position
    add di, (80 * 2)       ; Move to next row
    inc bx
    
    pop cx
    dec cx
    jnz display_row2
    
    ; Print final thick line
    mov si, SubBox
    mov cx, 37
    mov ah, 0x70
Lastt2:
    lodsb
    stosw
    loop Lastt2
    
    ; Print divider
    mov si, Divider
    mov cx, DividerLen
    mov ah, 0x70
    mov di, (80 * 0 + 50) * 2
print_separation2:
    lodsb
    stosw
    add di, 158
    loop print_separation2
    
    pop dx
    pop bx
    pop di
    pop si
    pop cx
    pop ax
    pop es
    ret


clrscr:
    push es
    push ax
    push di
    mov ax, 0xb800          ; point to video memory base
    mov es, ax
    mov di, 0               ; start at top-left of screen
    mov ah, 0x70          ; space (0x20) with off-white background (0xF0)
    mov cx, 2000            ; 80x25 = 2000 characters
rep stosw                   ; fill screen with off-white background
    pop di
    pop ax
    pop es
    ret

; Subroutine to print a string at a given position
printstr:
    push bp
    mov bp, sp
    push es
    push ax
    push cx
    push si
    push di

    mov ax, 0xb800
    mov es, ax
    mov al, 80
    mul byte [bp+10]
    add ax, [bp+12]
    shl ax, 1
    mov di, ax
    mov si, [bp+6]
    mov cx, [bp+4]
    mov ah, [bp+8]

nextchar:    mov al, [si]
    mov [es:di], ax
    add di, 2
    add si, 1
    loop nextchar

    pop di
    pop si
    pop cx
    pop ax
    pop es
    pop bp
    ret 10
	
	printstr1:
    push bp
    mov bp, sp
    push es
    push ax
    push cx
    push si
    push di

    mov ax, 0xb800
    mov es, ax
    mov al, 80
    mul byte [bp+10]
    add ax, [bp+12]
    shl ax, 1
    mov di, ax
    mov si, [bp+6]
    mov cx, [bp+4]
    mov ah, [bp+8]

nextchar1:
call delay
    mov al, [si]
    mov [es:di], ax
    add di, 2
    add si, 1
    loop nextchar1

    pop di
    pop si
    pop cx
    pop ax
    pop es
    pop bp
    ret 10
	
	move_pointer:
	 ;169 170 196 179 192 217
	 push bp
	 mov bp,sp
	 pusha
	 mov bx,0x7020

mov ax,0xb800
mov es,ax
mov di,[bp+4]
mov ah,0xf0
mov al,169
mov [es:di], ax
add di,2
mov [es:di], bx
add di,2
mov [es:di], bx
add di,2
mov al,170
mov [es:di], ax
add di,154
mov [es:di], bx
add di,6
mov [es:di], bx
add di,154
mov al,192
mov [es:di], ax
add di,2
mov [es:di], bx
add di,2
mov [es:di], bx
add di,2
mov al,217
mov [es:di], ax



	 popa
	 pop bp
	 ret 2
	move_pointer1:
	 ;169 170 196 179 192 217
	 push bp
	 mov bp,sp
	 pusha
	 mov bx,0x7020

mov ax,0xb800
mov es,ax
mov di,[bp+4]
mov ah,0xf0
mov al,169
mov [es:di], ax
add di,8
mov al,170
mov [es:di], ax

add di,154+152+6
mov al,192
mov [es:di], ax

add di,2+6
mov al,217
mov [es:di], ax



	 popa
	 pop bp
	 ret 2
	 
	 print_thanks_message:
   mov ax,20
	  push ax
	  mov ax,10
	  push ax 
	  mov ax,0x04
	  push ax
	  mov ax,thanks_mesage
	  push ax
	  push word [thanks_mesage_len]
	  call printstr1
	  ret

  diff_menu:
 
 
  
    call clrscr

    call create_borders
    mov ax, 24
    push ax                ; y position = 0
    mov ax, 8
    push ax
    mov ax, 0x0F        ; highlighted for "Easy"
    push ax
    mov ax, level_msg
    push ax
    push word [level_lenght]
    call printstr


    mov ax, 34
    push ax                ; y position = 0
    mov ax, 15
    push ax
    mov ax, 0x87         ; highlighted for "Easy"
    push ax
    mov ax, easy_msg
    push ax
    push word [easy_len]
    call printstr

    mov ax, 34
    push ax                ; y position = 2
    mov ax, 17
    push ax
    mov ax, 0x87           ; regular white on black
    push ax
    mov ax, medium_msg
    push ax
    push word [medium_len]
    call printstr

    mov ax, 34
    push ax                ; y position = 4
    mov ax, 19
    push ax
    mov ax, 0x87           ; regular white on black
    push ax
    mov ax, hard_msg
    push ax
    push word [hard_len]
    call printstr




        cmp byte [current_selection],1
    jz medium_arrow
        cmp byte [current_selection],2
        jz hard_arrow
    
    mov ax, 32               ; y position = 0
    push ax
    mov ax, 15               ; x position = 8 (left of "Start")
    push ax
    mov ax, 0x06            ; black text on off-white background (blinking)
    push ax
    mov ax, arrow            ; Arrow message
    push ax
    push word [arrow_len]
    call printstr            ; Print the arrow next to "Start
    ret
medium_arrow:
     mov ax, 32               ; y position = 0
    push ax
    mov ax, 17               ; x position = 8 (left of "Start")
    push ax
    mov ax, 0x06           ; black text on off-white background (blinking)
    push ax
    mov ax, arrow            ; Arrow message
    push ax
    push word [arrow_len]
    call printstr    
    ret
hard_arrow:
     mov ax, 32               ; y position = 0
    push ax
    mov ax, 19               ; x position = 8 (left of "Start")
    push ax
    mov ax, 0x06             ; black text on off-white background (blinking)
    push ax
    mov ax, arrow            ; Arrow message
    push ax
    push word [arrow_len]
    call printstr     

    ; Implement difficulty level selection logic here...
    ret


print_menu:
    
    call clrscr
    call create_borders
; mov ax, 27
; push ax                ; y position = 25
; mov ax, 8
; push ax                ; x position = 8
; mov ax, 0x01           ; Red text (0x4) with Light Cyan background (0xB) (no blink)
; push ax
; mov ax, welcome_msg
; push ax                ; "Start" message
; push word [welcome_lenght]
; call printstr          ; Call the print string function


   
    ; mov ax, 28
    ; push ax                ; y position = 0
    ; mov ax, 10
    ; push ax                ; x position = 10
   ; mov ax, 0x01          ; Red text (0x4) with Light Cyan background (0xB) (no blink)

    ; push ax
    ; mov ax, start_msg
    ; push ax                ; "Start" message
    ; push word [start_len]
    ; call printstr
		
		; First line
	mov si, s1
	push si 
	mov di, (8+4*80)*2
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp, 6
	
	;  Second line
	mov si, s2
	 push si 
	 mov di, (8+4*80)*2+160*1
	 push di 
	 mov ah, 0x06
     mov al, 0   
     push ax 
	 call print_text11
	 add sp, 6
	
	; ; Third line
	 mov si, s3
	 push si 
	 mov di, (8+4*80)*2+160*2
	 push di 
	 mov ah, 0x06
     mov al, 0   
     push ax 
	 call print_text11
	 add sp, 6
	
	; ; Fourth line - now with more explicit setup
	 mov si, s4
	 push si 
	 mov di, (8+4*80)*2+160*3
	 push di 
	 mov ah, 0x06
     mov al, 0   
     push ax 
	 call print_text11
	 add sp, 6
	
	; ; Fifth line
	mov si, s5
	 push si 
	 mov di, (8+4*80)*2+160*4
	 push di 
	 mov ah, 0x06
     mov al, 0   
     push ax 
     call print_text11
	 add sp, 6
	
	
	 mov si, u1
	 push si 
	 mov di, (52+8+4*80)*2+160*0
	 push di 
	 mov ah, 0x06
     mov al, 0   
     push ax 
	 call print_text11
	 add sp,6 
	 mov si, u2
	 push si 
	 mov di, (52+8+4*80)*2+160*1
	 push di 
	 mov ah, 0x06
     mov al, 0   
     push ax 
	 call print_text11
	 add sp,6 
	
	 mov si, u3
	push si 
	mov di, (52+8+4*80)*2+160*2
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
    mov si, u4
	push si 
	mov di, (52+8+4*80)*2+160*3
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
	mov si, u5
	push si 
	mov di, (52+8+4*80)*2+160*4
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
    
	mov si, u1
	push si 
	mov di, (9+8+4*80)*2+160*0
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
	mov si, u2
	push si 
	mov di, (9+8+4*80)*2+160*1
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
    mov si, u3
	push si 
	mov di, (9+8+4*80)*2+160*2
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
    mov si, u4
	push si 
	mov di, (9+8+4*80)*2+160*3
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
	mov si, u5
	push si 
	mov di, (9+8+4*80)*2+160*4
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6

    mov si, kk1
	push si 
	mov di, (39+8+4*80)*2+160*0
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
	mov si, kk2
	push si 
	mov di, (39+8+4*80)*2+160*1
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
    mov si, kk3
	push si 
	mov di, (39+8+4*80)*2+160*2
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
    mov si, kk4
	push si 
	mov di, (39+8+4*80)*2+160*3
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
	mov si, kk5
	push si 
	mov di, (39+8+4*80)*2+160*4
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	

    mov si, d1
	push si 
	mov di, (19+8+4*80)*2+160*0
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
	mov si, d2
	push si 
	mov di, (19+8+4*80)*2+160*1
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
    mov si, d3
	push si 
	mov di, (19+8+4*80)*2+160*2
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
    mov si, d4
	push si 
	mov di, (19+8+4*80)*2+160*3
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
	mov si, d5
	push si 
	mov di, (19+8+4*80)*2+160*4
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
		
	  mov si, o1
	push si 
	mov di, (29+8+4*80)*2+160*0
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
	mov si, o2
	push si 
	mov di, (29+8+4*80)*2+160*1
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
    mov si, o3
	push si 
	mov di, (29+8+4*80)*2+160*2
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
    mov si, o4
	push si 
	mov di, (29+8+4*80)*2+160*3
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
	mov si, o5
	push si 
	mov di, (29+8+4*80)*2+160*4
	push di 
	mov ah, 0x06
    mov al, 0   
    push ax 
	call print_text11
	add sp,6 
	
	call playWinSound
	call playWinSound
	call playWinSound
    

ret


clrscr2:
    push es
    push ax
    push di
    mov ax, 0xb800          ; point to video memory base
    mov es, ax
    mov di, 2400+40             ; start at top-left of screen
    mov ah, 0x70          ; space (0x20) with off-white background (0xF0)
    mov cx, 40            ; 80x25 = 2000 characters
rep stosw                   ; fill screen with off-white background
    pop di
    pop ax
    pop es
    ret
	
	clrscr3:
    push es
    push ax
    push di
    mov ax, 0xb800          ; point to video memory base
    mov es, ax
    mov di, 2400+40+160+160             ; start at top-left of screen
    mov ah, 0x70          ; space (0x20) with off-white background (0xF0)
    mov cx, 40            ; 80x25 = 2000 characters
rep stosw                   ; fill screen with off-white background
    pop di
    pop ax
    pop es
    ret
	clrscr4:
    push es
    push ax
    push di
    mov ax, 0xb800          ; point to video memory base
    mov es, ax
    mov di, 2400+40+160+160+160+160            ; start at top-left of screen
    mov ah, 0x70          ; space (0x20) with off-white background (0xF0)
    mov cx, 40            ; 80x25 = 2000 characters
rep stosw                   ; fill screen with off-white background
    pop di
    pop ax
    pop es
    ret
	
print_menu2:

call clrscr3
call clrscr4
call clrscr2
	 mov ax, 34
     push ax                ; y position = 0
     mov ax, 15
     push ax                ; x position = 10
     mov ax, 0x87          ; Red text (0x4) with Light Cyan background (0xB) (no blink)
     push ax
     mov ax, start_msg
     push ax                ; "Start" message
     push word [start_len]
     call printstr
	
	 mov ax, 34
    push ax                ; y position = 2
    mov ax, 17
    push ax                ; x position = 11
   mov ax, 0x87          ; Red text (0x4) with Light Cyan background (0xB) (no blink)

    push ax
    mov ax, intruction_mess
    push ax                ; "Exit" message
    push word [intruction_len]
    call printstr

    mov ax, 34
    push ax                ; y position = 2
    mov ax, 19
    push ax                ; x position = 11
   mov ax, 0x87           ; Red text (0x4) with Light Cyan background (0xB) (no blink)

    push ax
    mov ax, exit_msg
    push ax                ; "Exit" message
    push word [exit_len]
    call printstr
   
    ; Print arrow and "Start"
    cmp byte [current_selection],2
    jz exitarrow
	  cmp byte [current_selection],1
	  jz intruction_arrow
    mov ax, 32              ; y position = 0
    push ax
    mov ax, 15               ; x position = 8 (left of "Start")
    push ax
    mov ax, 0x06            ; black text on off-white background (blinking)
    push ax
    mov ax, arrow            ; Arrow message
    push ax
    push word [arrow_len]
    call printstr            ; Print the arrow next to "Start
    ret
	
	intruction_arrow:
	    mov ax, 32              ; y position = 0
    push ax
    mov ax, 17              ; x position = 8 (left of "Start")
    push ax
    mov ax, 0x06           ; black text on off-white background (blinking)
    push ax
    mov ax, arrow            ; Arrow message
    push ax
    push word [arrow_len]
    call printstr            ; Print the arrow next to "Start
    ret
	
	
    exitarrow:
     mov ax, 32               ; y position = 0
    push ax
    mov ax, 19              ; x position = 8 (left of "Start")
    push ax
    mov ax, 0x06            ; black text on off-white background (blinking)

    push ax
    mov ax, arrow            ; Arrow message
    push ax
    push word [arrow_len]
    call printstr     
 ret

  jump_exit:
   jmp terminate

    print_timer:
    mov ax, 57
    push ax                ; y position = 0
    mov ax, 3
    push ax
    mov ax, 0xF0         ; highlighted for "Easy"
    push ax
    mov ax, timer_msg
    push ax
    push word [timer_lenght]
    call printstr
    ret
   print_timer1:
    mov ax, 57
    push ax                ; y position = 0
    mov ax, 3
    push ax
    mov ax, 0x70         ; highlighted for "Easy"
    push ax
    mov ax, timer_msg1
    push ax
    push word [timer_lenght]
    call printstr
    ret
 print_timer2:
    mov ax, 57
    push ax                ; y position = 0
    mov ax, 3
    push ax
    mov ax, 0x70         ; highlighted for "Easy"
    push ax
    mov ax, timer_msg2
    push ax
    push word [timer_lenght]
    call printstr
    ret
	
	
	
	
	
print_eas_life:

 
     mov ax,0xb800
    mov es,ax
    mov di,944
xor ax,ax
 
  mov word ax,[counter]
  
	add ax,0x30
    mov ah,0x70
	
    mov [es:di],ax
		xor ax,ax
	mov word ax,[score_count]
	push ax
	call printnum
	


	
	
	

	
    mov ax, 57
    push ax                ; y position = 0
    mov ax, 5
    push ax
    mov ax, 0x70         ; highlighted for "Easy"
    push ax
    mov ax, easylife
    push ax
    push word [easylifelen]
    call printstr
    ret

   
	
	print_notes:
    mov ax, 57
    push ax                ; y position = 0
    mov ax, 9
    push ax
    mov ax, 0x70         
    push ax
    mov ax, notes_mess
    push ax
    push word [notes_len]
    call printstr
    ret
	
	print_suduko:
    mov ax, 20
    push ax                ; y position = 0
    mov ax, 1
    push ax
    mov ax, 0x70         
    push ax
    mov ax, suduko_mess
    push ax
    push word [suduko_len]
    call printstr
    ret
	
	
    intstruction_print:
	
	;funtion to print instructions
	
	call clrscr
    mov ax, 4              ;x position
    push ax                ; y position 
    mov ax, 3
    push ax
    mov ax, 0x04         
    push ax
    mov ax, instruction1
    push ax
    push word [intruc1_len]
    call printstr1
	
	
	   mov ax, 4
    push ax                
    mov ax, 5
    push ax
    mov ax, 0x04         
    push ax
    mov ax, instruction2
    push ax
    push word [intruc2_len]
    call printstr1
	
	
	   mov ax, 4
    push ax                
    mov ax, 7
    push ax
    mov ax, 0x04         
    push ax
    mov ax, instruction3
    push ax
    push word [intruc3_len]
    call printstr1
	
	
	   mov ax, 4
    push ax                
    mov ax, 9
    push ax
    mov ax, 0x04         
    push ax
    mov ax, instruction4
    push ax
    push word [intruc4_len]
	
    call printstr1
		   mov ax, 4
    push ax                
    mov ax, 11
    push ax
    mov ax, 0x04         
    push ax
    mov ax, instruction5
    push ax
    push word [intruc5_len]
    call printstr1
	
		   mov ax, 4
    push ax                
    mov ax, 13
    push ax
    mov ax, 0x04         
    push ax
    mov ax, instruction6
    push ax
    push word [intruc6_len]
    call printstr1
	
			   mov ax, 4
    push ax                
    mov ax, 15
    push ax
    mov ax, 0x04         
    push ax
    mov ax, instruction7
    push ax
    push word [intruc7_len]
    call printstr1
	
			   mov ax, 20
    push ax                
    mov ax, 17
    push ax
    mov ax, 0x04         
    push ax
    mov ax, escape_instrution
    push ax
    push word [escape_len]
    call printstr1
	
	 mov ah, 0
    int 0x16           ; wait for keypress
    cmp al, 0x1B          ; ESC key
    je start
	
	ret
    
    




menu_input2:

;call print_menu
; Handle menu input and movement
menu_input:

call print_menu2
    mov ah, 0
    int 0x16           ; wait for keypress
    cmp al, 0x1B          ; ESC key
    je jump_exit
    cmp ah, 0x50           ; Down arrow (0x50 is the scan code for down arrow)
    je move_down
    cmp ah, 0x48           ; Up arrow (0x48 is the scan code for up arrow)
    je move_up
    cmp al, 0x0D           ; Enter key
    je select_option
    jmp menu_input

move_down:
     cmp byte [current_selection], 2   ; If already on Hard, do nothing
    je menu_input
    inc byte [current_selection]      ; Move to next option (Easy -> Medium -> Hard)
	call playCyberPunk
   ; call print_menu                  ; Reprint the menu with updated selection
    jmp menu_input

move_up:
    cmp byte [current_selection], 0   ; If already on Easy, do nothing
    je menu_input
    dec byte [current_selection]      ; Move to previous option (exit -> INSTRUCTION -> strat)
		call playCyberPunk
    jmp menu_input                 ; Reprint the menu with updated selection
    jmp menu_input_level


select_option:
call playWinSound
   cmp byte [current_selection], 2   ; If "exit" selected
    je jump_exit
    cmp byte [current_selection], 0   ; If "start" selected
    je menu_input_level
    cmp byte [current_selection], 1   ; If "instruction" selected
    jmp intstruction_print
   
   
    

    
    


    ; Handle menu input and movement
menu_input_level:

call loopreset
 mov word [counter],0
 mov word [score_count],0
 
call diff_menu
    mov ah, 0               ; Wait for keypress
    int 0x16
    cmp ah, 0x01            ; ESC key
	
    je start
    cmp ah, 0x50            ;  scan code for key for moving down
    je move_down1
    cmp ah, 0x48            ;  key for moving up
    je move_up1
    cmp al, 0x0D      	; Enter key
    je select_option1
    jmp menu_input_level

move_down1:
    cmp byte [current_selection], 2   ; If already on Hard, do nothing
    je menu_input_level
    inc byte [current_selection]      ; Move to next option (Easy -> Medium -> Hard)
		call playCyberPunk
    call diff_menu                   ; Reprint the menu with updated selection
    jmp menu_input_level

move_up1:
    cmp byte [current_selection], 0   ; If already on Easy, do nothing
    je menu_input_level
    dec byte [current_selection]      ; Move to previous option (Hard -> Medium -> Easy)
	call playCyberPunk
    call diff_menu                   ; Reprint the menu with updated selection
    jmp menu_input_level

select_option1:
   ; call playWinSound
    cmp byte [current_selection], 0   ; If "Easy" selected
    je game_easy
    cmp byte [current_selection], 1   ; If "Medium" selected
    je game_medium
    cmp byte [current_selection], 2   ; If "Hard" selected
    je game_hard
    jmp menu_input_level
	
	
	
	
	
	
	
	

	
find_element_row:
    push ax
    push bx
	
    mov ax, dx
    mov bx, 9
    mul bx                ; Calculate row index (row * 9)
	
    add ax, 1             ; Adjust index if needed
    mov dx, ax            ; Store result in DX
    pop bx 
    pop ax
    ret

calculate_number_of_element:
    push bp
    mov bp, sp
     push cx
push di
push bx
push ax
               ; Save all registers for function safety
	
    mov di, [bp+4]       ; Load parameter from stack
    mov cx, 320          ; Divisor for determining row
    xor bx, bx           ; Reset quotient
    mov dx, di           ; Set remainder for division

divide_loop22:
    cmp dx, cx           ; Compare remainder with divisor
    jb division_done22   ; If remainder < divisor, division is complete
    sub dx, cx           ; Subtract divisor from remainder
    inc bx               ; Increment quotient
    jmp divide_loop22    ; Repeat

division_done22:
    ; `bx` = row number, `dx` = column offset
    mov dx, bx
    call find_element_row ; Call to adjust row if necessary
    mov cx, dx           ; Store adjusted row number
    mov ax, 320
    mul bx               ; Compute row start in video memory
    
    mov dx, cx
    add ax, 172          ; Adjust to the left boundary

    xor cx, cx
loop_calculate_location1:
    add ax, 8            ; Move to next column
    inc cx
    cmp ax, di           ; Check for match with `di`
    je print_the_element1 ; If matched, print
    jmp loop_calculate_location1

print_the_element1:
    add dx, cx           ; Add column offset to base offset
    mov bx, dx           ; Store final offset in `bx`

    xor dx, dx           ; Clear `dx`
    dec bx
    mov dx, bx

  pop ax
pop bx
pop di
pop cx                 ; Restore all registers
    pop bp
    ret 2                ; Return, cleaning 2 bytes from the stack


	
	
	
	
print_notes_number:
    push bp
    mov bp, sp
    pusha

    ; Load the base video memory segment into ES
    mov ax, 0xb800
    mov es, ax

    ; Calculate the index for notes_array based on the value of [bp-4]
    mov bx, [bp-4]
    shl bx, 1                  ; bx = bx * 2 (optimized multiplication by 2)

    ; Access and display the first note
    mov cl, byte [notes_array + bx + 1] ; Load the first note into CL
    mov ah, 0x70                            ; Set color attribute
    add cl, 0x30  
   mov al,cl	; Convert to ASCII
    mov di, 2044                            ; Start writing to video memory at this offset
    mov [es:di], ax                         ; Write the first note

    ; Access and display the second note
    mov cl, byte [notes_array + bx + 2] ; Load the second note into CL
    add di, 4                               ; Move to the next character position in video memory
    mov ah, 0x70                            ; Set color attribute
    add cl, 0x30   
  mov al,cl	; Convert to ASCII
    mov [es:di+4], ax                         ; Write the second note

    popa
    pop bp
    ret 2                                   ; Clean up stack (2 bytes)




	
	
	
	
	 
	
print_ascii:
    push bp
    mov bp, sp
    push ax
    push di
    push es
    push cx
    push dx
    push si

    mov si, bx           ; Save input value in `si` (assumed ASCII character with attributes)
    mov ax, 0xb800
    mov es, ax           ; Set segment to video memory
    mov di, [bp-4]
	add di,164
	mov ax,[es:di]
	cmp al,0x20
	jne end1
	sub di,164
 
	
	cmp di,172
	je one1
	
	cmp di,1772
	je five
	cmp di,2092
	je one
	cmp di,2412
	je two
	cmp di,2732
	je three
	cmp di,812
	je four
	
	

   

    ; Perform division to determine row and column based on `di`
    mov cx, 320          ; Divisor for determining row
    xor bx, bx           ; Reset quotient
    mov dx, di           ; Set remainder for division

divide_loop11:
    cmp dx, cx           ; Compare remainder with divisor
    jb division_done11   ; If remainder < divisor, division is complete
    sub dx, cx           ; Subtract divisor from remainder
    inc bx               ; Increment quotient
    jmp divide_loop11    ; Repeat

division_done11:
    ; `bx` = row number, `dx` = column offset
    mov dx,bx
    call find_element_row ; (Optional: Call external function if required)
    mov cx,dx
  ;  mov dx, bx           ; Restore original quotient (row number)
    mov ax, 320
    mul bx               ; Compute row start in video memory
    
    mov dx,cx
    add ax, 172          ; Adjust to the left boundary
    ;cmp ax, di           ; Check if it's the desired location
    ;je print_the_element ; If yes, proceed to print

    xor cx, cx
loop_calculate_location:
    add ax, 8            ; Move to next column
    inc cx
    cmp ax, di           ; Check for match with `di`
    je print_the_element ; If matched, print
    jmp loop_calculate_location

    print_the_element:
    add dx, cx           ; Add column offset to base offset
    mov bx, dx           ; Store final offset in `bx`

    xor dx, dx           ; Clear `dx`

    dec bx

	
	
	
	
	
    mov dx, [solution + bx] ; Load solution value at offset `bx`
	
	
    add dx, 0x30            ; Convert to ASCII
    mov bx,si
mov cx,di
    cmp dl, bl              ; Check if it matches the input value
    jne wrong                ; If not, exit
	
	
print_number_ascci:
call playWinSound
;call clear_wrong
add di,164


    mov [es:di], si  
add word [score_count],10
	xor ax,ax
	mov word ax,[score_count]
	push ax
	call printnum
jmp end1; Write the value to the video memory location

	  one1:
	 
  mov dx,[solution]
 add dx,0x30
  cmp bl,dl
  je print_number_ascci
  mov cx,di
  jmp wrong
	
	  one:
	 
  mov dx,[solution+54]
 add dx,0x30
  cmp bl,dl
  je print_number_ascci
  mov cx,di
  jmp wrong
  	  two:
	 
  mov dx,[solution+63]
 add dx,0x30
  cmp bl,dl
  je print_number_ascci
  mov cx,di
  jmp wrong
  	  three:
	 
  mov dx,[solution+72]
 add dx,0x30
  cmp bl,dl
  je print_number_ascci
  mov cx,di
  jmp wrong
  
  four:
   mov dx,[solution+18]
 add dx,0x30
  cmp bl,dl
  je print_number_ascci
  mov cx,di
  jmp wrong
    five:
   mov dx,[solution+45]
 add dx,0x30
  cmp bl,dl
  je print_number_ascci
  mov cx,di
  jmp wrong
  
 
  
  wrong:
    inc word [counter]
    call print_eas_life
	call print_number_ascci_wrong ; Call to print with attributes 0x74
    call printwronginput
    call play_wrong_input_sound
	 cmp word [counter_check_level],1
 je counter_easy1
 cmp word [counter_check_level],0
 je counter_med1
  cmp word [counter_check_level],2
 je counter_hard1
	
	counter_easy1:
	cmp word [counter],8 
	je exit_game
	  jmp end1    
	
		counter_med1:
	cmp word [counter],5 
	je exit_game
	  jmp end1    
	
		counter_hard1:
	cmp word [counter],3 
	je exit_game
	  jmp end1    
	
	
	
	
	
	
    jmp end1                     ; Skip score addition and proceed
	

print_number_ascci_wrong:
mov di,cx
   ; call clear_wrong
    add di, 164                   ; Move to the next position
    mov bx, si                    ; Use `si` for the input value
    mov bh, 0x74                  ; Set attribute to 0x74
    mov [es:di], bx               ; Write value with the attribute
    ;jmp end11    
  mov bx, [undo_size]        ; Load current undo size
    shl bx,1
    mov [undo_coordinate + bx], di ; Save coordinate
    shr bx,1
    inc bx                     ; Increment undo size
    mov [undo_size], bx        ; Update undo size
	
ret

 


end1:
    pop si
    pop dx
    pop cx
    pop es
    pop di
    pop ax
    pop bp

    ret 2                   ; Return with 2 bytes popped from the stack

number_print:
    mov bl, al              ; Load ASCII value into `bl`
    mov bh, 0x70            ; Set attribute
    mov di,[bp-2]
    push di
	
	
	
	
    call print_ascii
;jmp pointer_movment
 cmp word [counter_check_level],1
 je jmpeasy
 cmp word [counter_check_level],0
 je jmpmed
  cmp word [counter_check_level],2
 je jmphard

 jmpeasy:
 jmp pointer_movment
 jmpmed:
 jmp pointer_movment_medium

 jmphard:
 jmp pointer_movment_hard
 
gamewin:

pusha

mov ax,0xb800
mov es,ax

    mov cx, 9           ; Outer loop runs 9 times (rows)
    mov bx, 172          ; Start value
	

outer_loop:
    mov dx, 8            ; Inner loop counter (8 iterations)
    mov di, bx           ; Initialize AX with starting value
	mov ax,[es:di+164]
	cmp al,0x20
	je return

inner_loop:
    add di, 8            ; Add 8 in each iteration
    mov ax,[es:di+164]
	cmp al,0x20
	je return
    dec dx               ; Decrement inner loop counter
    jnz inner_loop       ; Repeat inner loop until dx == 0

cmp cx,1 
je exit_game_win
    add di, 256          ; Add 236 after 8 iterations
    mov bx, di           ; Update BX for the next outer loop
    loop outer_loop      ; Decrement CX and repeat outer loop if not zero
	jmp exit_game_win
return:
popa
ret
exit_game_win:
jmp exit_win
;Functions for each difficulty


  game_easy:
  push bp
  mov bp, sp
  pusha
mov word [counter_check_level],1
  sub sp, 2
 
  mov di, 172            ;Initial pointer position (top-left corner of the grid)
  mov [bp-2], di
  

   call clrscr1
   call Grid9x9
   ;call clrscr_vertical_half_right
   call playWinSound
   call printUndo
   call print_card_layout
   call print_easy
   	call starttimer
   call print_timer1
   call print_timer
   call print_eas_life
   call print_notes
   call print_notes_grid
   call printscoretext

  mov di, [bp-2]
  

  

  

pointer_movment:

call gamewin

  mov di, [bp-2]
  xor ax, ax 
  int 0x16                ; wait for keypress
  

  cmp ah, 0x4D            ; Right arrow key
  je check_move_right
  cmp ah, 0x4B            ; Left arrow key
  je check_move_left
  cmp ah, 0x50            ; Down arrow key
  je check_move_down
  cmp ah, 0x48            ; Up arrow key
  je check_move_up
  cmp ah, 0x01            ; ESC key to exit
  je jmp_menu_input_level
  cmp ah,0x31
  je jump_notes_pointer
  
  cmp ah,0x16
  je undofuntion
  

 
  
 

  ; Check for number keys '1' through '9' and jump to number_print
  cmp al, 0x31            ; ASCII for '1'
  je number_print
  cmp al, 0x32            ; ASCII for '2'
  je number_print
  cmp al, 0x33            ; ASCII for '3'
  je number_print
  cmp al, 0x34            ; ASCII for '4'
  je number_print
  cmp al, 0x35            ; ASCII for '5'
  je number_print
  cmp al, 0x36            ; ASCII for '6'
  je number_print
  cmp al, 0x37            ; ASCII for '7'
  je number_print
  cmp al, 0x38            ; ASCII for '8'
  je number_print
  cmp al, 0x39            ; ASCII for '9'
  je number_print

  jmp pointer_movment     ; Loop back to wait for keypress if no matching key


  
undofuntion:
    pusha                      ; Save all registers
    mov bx, [undo_size]        ; Load undo size
    cmp bx, 0
    je undo_end                ; If undo_size is 0, exit

    dec bx                     ; Decrement undo size
    mov [undo_size], bx        ; Update undo size
    shl bx,1
    mov di, [undo_coordinate + bx] ; Load last coordinate
    
    mov ax, 0xb800
    mov es, ax                 ; Set video memory segment
    mov ax, 0x7020             ; Blank character with attribute 0x70
    mov [es:di], ax            ; Clear the character from the screen

undo_end:
    popa                       ; Restore all registers                  ; Restore all registers
   

  
jmp pointer_movment
jump_notes_pointer:



 mov di,1878
 push di
  call move_pointer1
  
  jump_notes_pointer1:
   xor ax, ax 
  int 0x16                ; wait for keypress

  cmp ah, 0x4D            ; Right arrow key
  je check_note_right
  cmp ah, 0x4B            ; Left arrow key
  je check_note_left
  cmp ah, 0x50            ; Down arrow key
  
  cmp ah, 0x31            ; Down arrow key
  je pointer_movment
  
    cmp al, 0x31            ; ASCII for '1'
  je number_print1
  cmp al, 0x32            ; ASCII for '2'
  je number_print1
  cmp al, 0x33            ; ASCII for '3'
  je number_print1
  cmp al, 0x34            ; ASCII for '4'
  je number_print1
  cmp al, 0x35            ; ASCII for '5'
  je number_print1
  cmp al, 0x36            ; ASCII for '6'
  je number_print1
  cmp al, 0x37            ; ASCII for '7'
  je number_print1
  cmp al, 0x38            ; ASCII for '8'
  je number_print1
  cmp al, 0x39            ; ASCII for '9'
  je number_print1
  jmp jump_notes_pointer1
  
  
  
  number_print1:
  mov cx,di
  mov di,[bp-2]
   push di
  call calculate_number_of_element
  
  mov bx,dx
  shl bx,1
   sub al,0x30
  
  cmp cx,1878+8
  je store_second
  mov byte [notes_array+bx],al
  jmp endjump
  
  store_second:
    mov byte [notes_array+bx+1],al
	
  endjump:
  
   call print_notes_grid
  mov di,cx
  push di
   call move_pointer
  ;call print_notes_grid
  
  jmp jump_notes_pointer1
  
  
  
  
  check_note_right:
  cmp di,1878+8
je jump_notes_pointer1
 ; mov dx,5
call print_notes_grid

  add di,8
  push di
  
  call move_pointer
  ;mov di, [bp-2]
  ;push di
;call calculate_number_of_element

  
  
  jmp jump_notes_pointer1
  
  
  check_note_left:
   cmp di,1878
  je jump_notes_pointer1
  ;mov dx,5
call print_notes_grid
  sub di,8
  push di
  
  call move_pointer
  ;mov di, [bp-2]
  ;push di
;call calculate_number_of_element

  
  
  jmp jump_notes_pointer1
  
jmp pointer_movment     ; Update display


  

check_move_right:
  mov di, [bp-2]        ; Load current position
  add di, 8             ; Move right by 8

  mov cx, 320            ; Load divisor (320) into cx
  mov bx, 0              ; Initialize quotient (bx) to 0
  mov dx, di             ; Store initial value of di in dx for division

divide_loop:
    cmp dx, cx         ; Compare remainder with divisor
    jb division_done   ; If remainder < divisor, division is complete
    sub dx, cx         ; Subtract divisor from remainder
    inc bx             ; Increment quotient
    jmp divide_loop    ; Repeat until dx < cx

division_done:
    ; At this point:
    ; bx = quotient
    ; dx = remainder
	mov ax,320
	mul bx

add ax,236
  cmp di, ax            ; Compare desired position with boundary
  
  ja skip               ; Skip if di > boundary

  mov [bp-2], di        ; Update position if within bounds
  call update_screen    ; Call update function
  call play_wood_tick_sound
  jmp pointer_movment   ; Jump to next movement step

  


check_move_left:
    mov di, [bp-2]         ; Load current position
    sub di, 8              ; Move left by 8

    ; Custom division to calculate row (di / 320)
    mov cx, 320            ; Divisor (320)
    mov bx, 0              ; Initialize quotient to 0
    mov dx, di             ; Remainder initialized with di

divide_loop1:
    cmp dx, cx             ; Compare remainder with divisor
    jb division_done1      ; If remainder < divisor, division is done
    sub dx, cx             ; Subtract divisor from remainder
    inc bx                 ; Increment quotient
    jmp divide_loop1       ; Repeat until dx < cx

division_done1:
    ; At this point:
    ; bx = quotient (row index)
    ; dx = remainder

    ; Calculate left boundary for this row
    mov ax, 320
    mul bx                 ; ax = row number * 320
    add ax, 172            ; Left boundary for this row

    cmp di, ax             ; Check if di is below the left boundary
    jb skip1                ; Skip if di < boundary

    ; Update position and screen if within bounds
    mov [bp-2], di         ; Update position
    call update_screen     ; Update display
    call play_wood_tick_sound
    jmp pointer_movment    ; Continue to next movement step

skip1:
    jmp pointer_movment    ; Skip updating position if out of bounds

check_move_down:
  mov di, [bp-2]
  add di, 320             ; Attempt to move down by one row (320 pixels)

  cmp di, 2796            ; 5116 is the last valid position in the 9x9 grid
  ja skip                 ; Skip if moving down goes out of bounds

  mov [bp-2], di          ; Update position if within bounds
  call update_screen
  call play_wood_tick_sound
  jmp pointer_movment

check_move_up:
  mov di, [bp-2]
  sub di, 320             ; Attempt to move down by one row (320 pixels)
                    ; 172 is the last valid position in the 9x9 grid
  jb skip                 ; Skip if moving down goes out of bounds
cmp di,320
  mov [bp-2], di          ; Update position if within bounds
  call update_screen
  call play_wood_tick_sound
  jmp pointer_movment

update_screen:
  ;call clrscr1
  call clear_wrong
  call Grid9x9
  ;call clrscr_vertical_half_right
  mov di, [bp-2]
  push di
call calculate_number_of_element

call print_notes_grid
xor dx,dx

   
  mov di, [bp-2]
  
  push di
  call move_pointer
  ret


skip:
  jmp pointer_movment 

jmp_menu_input_level:
  popa
  ret


  
	

	 

game_medium:
    ; Implemented logic for Medium difficulty
	
    
   ;call print_suduko
   push bp
  mov bp, sp
  pusha
mov word [counter_check_level],0

  sub sp, 2
  mov di, 172            ; Initial pointer position (top-left corner of the grid)
  mov [bp-2], di

  call clrscr1
	call Grid9x91
	call playWinSound
	call printUndo
	call print_card_layout
	call print_medium
    call starttimer
   call print_timer1
   call print_timer
   call print_eas_life
   call print_notes
   call print_notes_grid
      call printscoretext

  mov di, [bp-2]
  push di
  call move_pointer

pointer_movment_medium:
call gamewin
mov word [counter_check_level],0
  mov di, [bp-2]
  mov ah, 0 
  int 0x16                ; wait for keypress

  cmp ah, 0x4D            ; Right arrow key
  je check_move_right_medium
  cmp ah, 0x4B            ; Left arrow key
  je check_move_left_medium
  cmp ah, 0x50            ; Down arrow key
  je check_move_down_medium
  cmp ah, 0x48            ; Up arrow key
  je check_move_up_medium
  cmp ah, 0x01            ; ESC key to exit
  je jmp_menu_input_level
    cmp ah,0x31
  je jump_notes_pointer
  cmp ah,0x16
  je undofuntion
  


  
    cmp al, 0x31            ; ASCII for '1'
  je number_print
  cmp al, 0x32            ; ASCII for '2'
  je number_print
  cmp al, 0x33            ; ASCII for '3'
  je number_print
  cmp al, 0x34            ; ASCII for '4'
  je number_print
  cmp al, 0x35            ; ASCII for '5'
  je number_print
  cmp al, 0x36            ; ASCII for '6'
  je number_print
  cmp al, 0x37            ; ASCII for '7'
  je number_print
  cmp al, 0x38            ; ASCII for '8'
  je number_print
  cmp al, 0x39            ; ASCII for '9'
  je number_print

    jmp pointer_movment_medium    ; Loop back to wait for keypress if no matching key

  

check_move_right_medium:
  mov di, [bp-2]        ; Load current position
  add di, 8             ; Move right by 8

mov cx, 320            ; Load divisor (320) into cx
mov bx, 0              ; Initialize quotient (bx) to 0
mov dx, di             ; Store initial value of di in dx for division

divide_loop_medium:
    cmp dx, cx         ; Compare remainder with divisor
    jb division_done_medium   ; If remainder < divisor, division is complete
    sub dx, cx         ; Subtract divisor from remainder
    inc bx             ; Increment quotient
    jmp divide_loop_medium    ; Repeat until dx < cx

division_done_medium:
    ; At this point:
    ; bx = quotient
    ; dx = remainder
	mov ax,320
	mul bx

add ax,236
  cmp di, ax            ; Compare desired position with boundary
  
  ja skip_medium               ; Skip if di > boundary

  mov [bp-2], di        ; Update position if within bounds
  call update_screen_medium   ; Call update function
 call play_wood_tick_sound
  jmp pointer_movment_medium   ; Jump to next movement step

  


check_move_left_medium:
    mov di, [bp-2]         ; Load current position
    sub di, 8              ; Move left by 8

    ; Custom division to calculate row (di / 320)
    mov cx, 320            ; Divisor (320)
    mov bx, 0              ; Initialize quotient to 0
    mov dx, di             ; Remainder initialized with di

divide_loop1_medium:
    cmp dx, cx             ; Compare remainder with divisor
    jb division_done1_medium      ; If remainder < divisor, division is done
    sub dx, cx             ; Subtract divisor from remainder
    inc bx                 ; Increment quotient
    jmp divide_loop1_medium  ; Repeat until dx < cx

division_done1_medium:
    ; At this point:
    ; bx = quotient (row index)
    ; dx = remainder

    ; Calculate left boundary for this row
    mov ax, 320
    mul bx                 ; ax = row number * 320
    add ax, 172            ; Left boundary for this row

    cmp di, ax             ; Check if di is below the left boundary
    jb skip_medium              ; Skip if di < boundary

    ; Update position and screen if within bounds
    mov [bp-2], di         ; Update position
    call update_screen_medium     ; Update display
    call play_wood_tick_sound
    jmp pointer_movment_medium    ; Continue to next movement step



check_move_down_medium:
  mov di, [bp-2]
  add di, 320             ; Attempt to move down by one row (320 pixels)

  cmp di, 2796            ; 5116 is the last valid position in the 9x9 grid
  ja skip_medium                 ; Skip if moving down goes out of bounds

  mov [bp-2], di          ; Update position if within bounds
  call update_screen_medium
 call play_wood_tick_sound
  jmp pointer_movment_medium

check_move_up_medium:
  mov di, [bp-2]
  sub di, 320             ; Attempt to move down by one row (320 pixels)
                    ; 172 is the last valid position in the 9x9 grid
  jb skip_medium                 ; Skip if moving down goes out of bounds
cmp di,320
  mov [bp-2], di          ; Update position if within bounds
  call update_screen_medium
 call play_wood_tick_sound
  jmp pointer_movment_medium

update_screen_medium:

  call Grid9x91
    mov di, [bp-2]
  push di
call calculate_number_of_element

call print_notes_grid

   call print_eas_life
  mov di, [bp-2]
  push di
  call move_pointer
  ret


skip_medium:
  jmp pointer_movment_medium 


game_hard:
    ; Implemented logic for Hard difficulty
 
  
   push bp
  mov bp, sp
  pusha
mov word [counter_check_level],2

  sub sp, 2
  sub sp,2
  mov di, 172            ; Initial pointer position (top-left corner of the grid)
  mov [bp-2], di

    call clrscr1
	call Grid9x92
	call playWinSound
	call printUndo
	call print_card_layout
	call print_hard
    call starttimer
    call print_timer1
    call print_timer
    call print_eas_life
    call print_notes
    call  print_notes_grid
     call printscoretext
  

  mov di, [bp-2]
  push di
  call move_pointer

pointer_movment_hard:
call gamewin
  mov di, [bp-2]
  mov ah, 0 
  int 0x16                ; wait for keypress

  cmp ah, 0x4D            ; Right arrow key
  je check_move_right_hard
  cmp ah, 0x4B            ; Left arrow key
  je check_move_left_hard
  cmp ah, 0x50            ; Down arrow key
  je check_move_down_hard
  cmp ah, 0x48            ; Up arrow key
  je check_move_up_hard
  cmp ah, 0x01            ; ESC key to exit
  je jmp_menu_input_level
    cmp ah,0x31
  je jump_notes_pointer

  
      cmp ah,0x16




  
  

  cmp al, 0x31            ; ASCII for '1'
  je number_print
  cmp al, 0x32            ; ASCII for '2'
  je number_print
  cmp al, 0x33            ; ASCII for '3'
  je number_print
  cmp al, 0x34            ; ASCII for '4'
  je number_print
  cmp al, 0x35            ; ASCII for '5'
  je number_print
  cmp al, 0x36            ; ASCII for '6'
  je number_print
  cmp al, 0x37            ; ASCII for '7'
  je number_print
  cmp al, 0x38            ; ASCII for '8'
  je number_print
  cmp al, 0x39            ; ASCII for '9'
  je number_print
    cmp ah,0x16
  je undofuntion
  


  




jmp pointer_movment_hard



check_move_right_hard:
  mov di, [bp-2]        ; Load current position
  add di, 8             ; Move right by 8

mov cx, 320            ; Load divisor (320) into cx
mov bx, 0              ; Initialize quotient (bx) to 0
mov dx, di             ; Store initial value of di in dx for division

divide_loop_hard:
    cmp dx, cx         ; Compare remainder with divisor
    jb division_done_hard   ; If remainder < divisor, division is complete
    sub dx, cx         ; Subtract divisor from remainder
    inc bx             ; Increment quotient
    jmp divide_loop_hard    ; Repeat until dx < cx

division_done_hard:
    ; At this point:
    ; bx = quotient
    ; dx = remainder
	mov ax,320
	mul bx

add ax,236
  cmp di, ax            ; Compare desired position with boundary
  
  ja skip_hard               ; Skip if di > boundary

  mov [bp-2], di        ; Update position if within bounds
  call update_screen_hard    ; Call update function
 call play_wood_tick_sound
  jmp pointer_movment_hard   ; Jump to next movement step

  
   

   check_move_left_hard:
    mov di, [bp-2]         ; Load current position
    sub di, 8              ; Move left by 8

    ; Custom division to calculate row (di / 320)
    mov cx, 320            ; Divisor (320)
    mov bx, 0              ; Initialize quotient to 0
    mov dx, di             ; Remainder initialized with di
   divide_loop1_hard:
    cmp dx, cx             ; Compare remainder with divisor
    jb division_done1_hard      ; If remainder < divisor, division is done
    sub dx, cx             ; Subtract divisor from remainder
    inc bx                 ; Increment quotient
    jmp divide_loop1_hard       ; Repeat until dx < cx

   division_done1_hard:
    ; At this point:
    ; bx = quotient (row index)
    ; dx = remainder

    ; Calculate left boundary for this row
    mov ax, 320
    mul bx                 ; ax = row number * 320
    add ax, 172            ; Left boundary for this row

    cmp di, ax             ; Check if di is below the left boundary
    jb skip_hard              ; Skip if di < boundary

    ; Update position and screen if within bounds
    mov [bp-2], di         ; Update position
    call update_screen_hard     ; Update display
   call play_wood_tick_sound
    jmp pointer_movment_hard    ; Continue to next movement step



    check_move_down_hard:
  mov di, [bp-2]
  add di, 320             ; Attempt to move down by one row (320 pixels)

  cmp di, 2796            ; 5116 is the last valid position in the 9x9 grid
  ja skip_hard                 ; Skip if moving down goes out of bounds

  mov [bp-2], di          ; Update position if within bounds
  call update_screen_hard
  call play_wood_tick_sound
  jmp pointer_movment_hard

   check_move_up_hard:
  mov di, [bp-2]
  sub di, 320             ; Attempt to move up by one row (320 pixels)
                    ; 172 is the last valid position in the 9x9 grid
  jb skip                 ; Skip if moving down goes out of bounds
   cmp di,320
  mov [bp-2], di          ; Update position if within bounds
  call update_screen_hard
   call play_wood_tick_sound
  jmp pointer_movment_hard

  update_screen_hard:
 
	call Grid9x92
	  mov di, [bp-2]
  push di
call calculate_number_of_element

call print_notes_grid
  call print_eas_life
  mov di, [bp-2]
  push di
  call move_pointer
  ret


skip_hard:
  jmp pointer_movment



exit_win:
 call clrscr1
 
 call printgamewin
 jmp exit11

exit_game:
 call clrscr1


 call printgameover
 ;call printgamewin
 exit11:
 call printscoretext
 mov word ax,[score_count]
 push ax
 call printnum
 call stoptimer
 call print_eas_life
 call print_timer
  
  exit_game1:
   mov ax, 0 
  int 0x16  
  cmp ah, 0x01            ; ESC key to exit
  je menu_input_level
  cmp al, 0x0D
je terminate  
  
  jmp exit_game1
  
 terminate:
 call clrscr
 call print_thanks_message
    mov ax, 0x4c00
    int 0x21               ;terminate program

start:
   
	
    
   ; call facee
	call clrscr
    call print_menu        ; display the main menu
	call print_menu2
    call menu_input2        ; wait for input

    mov ax, 0x4c00         ; terminate program
    int 0x21


undoBoxTop: 
 db 218,196,196,196,196,196,196,196,196,196,196,196,196,196,191,0
 undoBoxTopLen:
 dw 15,0
 vert:
 db 179,0
 vertLen: dw 1 ,0
 undoBoxBott:
 db 192,196,196,196,196,196,196,196,196,196,196,196,196,196,217,0
 undoBoxBottLen:
 dw 15,0

 undo_msg:db 'TO UNDO = U',0
 db 0
 undoLen dw 11,0
 Card1:db '               cards                 ',0
  Card2:
        db '+---+---+---+---+---+---+---+---+---+',0
  Card3:db '| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |',0
  Card4:db '+---+---+---+---+---+---+---+---+---+',0
  Card1Len : dw 37
  Card2Len : dw 37
  Card3Len : dw 37
  Card4Len : dw 37
  ascii : dw 0

   p1 db '  L       LLLLL     LLLLLL   LLLLLLL',0
   p2 db '  L     LL     LL   L           L   ',0
   p3 db '  L     LL     LL   LLLLLL      L   ',0
   p4 db '  L     LL     LL         L     L   ',0
   p5 db '  LLLLLL  LLLLL     LLLLLLL     L   ',0
   
   
   w1 db '     W         W    WWWWWW  WW     W ',0
   w2 db '     W         W    W    W  W W    W ',0
   w3 db '     W    W    W    W    W  W  W   W ',0
   w4 db '      W  W W  W     W    W  W    W W ',0
   w5 db '       W    W       WWWWWW  W     WW ',0
	
	
	
	
		kk1 db ' KK     KK   ',0
    kk2 db ' KK  KK      ',0
    kk3 db ' KK KK       ',0
    kk4 db ' KK   KK     ',0
    kk5 db ' KK     KK   ',0
	
	d1 db '  DDDDDDD ',0   
    d2 db '  D     DD',0     
    d3 db '  D     DD',0   
    d4 db '  D     DD',0  
    d5 db '  DDDDDDD ',0   
	
	s1 db '  SSSSSS ',0   
    s2 db ' SS      ',0     
    s3 db '  SSSSSS ',0   
    s4 db '       SS',0  
    s5 db '  SSSSSS ',0   
	
	u1 db ' UU     UU',0
    u2 db ' UU     UU',0
    u3 db ' UU     UU',0
    u4 db ' UU     UU',0
    u5 db '  UUUUUUU ',0
	
    o1 db '  OOOOOOO ',0
    o2 db ' OO     OO',0
    o3 db ' OO     OO',0
    o4 db ' OO     OO',0
    o5 db '  OOOOOOO ',0

