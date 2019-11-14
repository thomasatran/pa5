  section .text
  extern error
  extern print
  extern heap_alloc
  global our_code_starts_here

initList1:
  mov rax, 0
  mov [rsp + -24], rax
  mov rax, 0
  mov [rsp + -32], rax
  mov [rsp + -16], r15
  mov rax, 2
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -24]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -32]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -16]
  ret
addBeg1:
  mov rax, [rsp + 8]
  mov [rsp + -16], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -24], rax
  sar rax, 1
  cmp rax, 0
  jl near out_of_bounds
  mov [rsp + -32], r15
  mov r15, [rsp + -16]
  mov rax, [rsp + -24]
  sar rax, 1
  cmp rax, [r15 + 0]
  jg near out_of_bounds
  mov rax, [rsp + -24]
  sar rax, 1
  add rax, 1
  imul rax, 8
  add r15, rax
  mov rax, [r15 + 0]
  mov r15, [rsp + -32]
  mov [rsp + -16], rax
  mov rax, [rsp + 8]
  mov [rsp + -24], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + 16]
  mov [rsp + -64], rax
  mov rax, [rsp + -16]
  mov [rsp + -72], rax
  mov [rsp + -56], r15
  mov rax, 2
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -64]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -72]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -56]
  mov [rsp + -48], rax
  mov rax, [rsp + -32]
  cmp rax, 0
  jl near out_of_bounds
  mov [rsp + -40], r15
  mov r15, [rsp + -24]
  mov rax, [rsp + -32]
  sar rax, 1
  cmp rax, [r15 + 0]
  jg near out_of_bounds
  mov rax, [rsp + -32]
  sar rax, 1
  add rax, 1
  imul rax, 8
  add r15, rax
  mov rax, [rsp + -48]
  mov [r15 + 0], rax
  mov r15, [rsp + -40]
  mov rax, [rsp + -24]
  ret
addEnd1:
  mov rax, [rsp + 8]
  mov [rsp + -16], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -24], rax
  sar rax, 1
  cmp rax, 0
  jl near out_of_bounds
  mov [rsp + -32], r15
  mov r15, [rsp + -16]
  mov rax, [rsp + -24]
  sar rax, 1
  cmp rax, [r15 + 0]
  jg near out_of_bounds
  mov rax, [rsp + -24]
  sar rax, 1
  add rax, 1
  imul rax, 8
  add r15, rax
  mov rax, [r15 + 0]
  mov r15, [rsp + -32]
  mov [rsp + -16], rax
  mov rax, [rsp + -16]
  cmp rax, 0
  jne near temp_fif_ne_7
  mov rax, 0x6
  jmp near temp_fend_if_6
temp_fif_ne_7:
  mov rax, 0x2
temp_fend_if_6:
  mov [rsp + -24], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -24]
  cmp rax, 0x6
  jne near temp_if_ne_3
  mov rax, [rsp + 8]
  mov [rsp + -32], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + 16]
  mov [rsp + -72], rax
  mov rax, 0
  mov [rsp + -80], rax
  mov [rsp + -64], r15
  mov rax, 2
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -72]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -80]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -64]
  mov [rsp + -56], rax
  mov rax, [rsp + -40]
  cmp rax, 0
  jl near out_of_bounds
  mov [rsp + -48], r15
  mov r15, [rsp + -32]
  mov rax, [rsp + -40]
  sar rax, 1
  cmp rax, [r15 + 0]
  jg near out_of_bounds
  mov rax, [rsp + -40]
  sar rax, 1
  add rax, 1
  imul rax, 8
  add r15, rax
  mov rax, [rsp + -56]
  mov [r15 + 0], rax
  mov r15, [rsp + -48]
  mov rax, [rsp + -32]
  jmp near temp_Iend_if_4
temp_if_ne_3:
  mov rax, [rsp + 16]
  mov [rsp + -32], rax
  mov rax, [rsp + 8]
  mov [rsp + -40], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -48], rax
  sar rax, 1
  cmp rax, 0
  jl near out_of_bounds
  mov [rsp + -56], r15
  mov r15, [rsp + -40]
  mov rax, [rsp + -48]
  sar rax, 1
  cmp rax, [r15 + 0]
  jg near out_of_bounds
  mov rax, [rsp + -48]
  sar rax, 1
  add rax, 1
  imul rax, 8
  add r15, rax
  mov rax, [r15 + 0]
  mov r15, [rsp + -56]
  mov [rsp + -40], rax
  mov rax, temp_after_call_5
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call addEnd1
temp_after_call_5:
  mov rsp, [rsp + -16]
temp_Iend_if_4:
  ret
getVal1:
  mov rax, 1
  jo near error_handle_of
  mov [rsp + -16], rax
  mov rax, [rsp + 16]
  cmp rax, 0
  jne near temp_fif_ne_16
  mov rax, 0x6
  jmp near temp_fend_if_15
temp_fif_ne_16:
  mov rax, 0x2
temp_fend_if_15:
  mov [rsp + -24], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -24]
  cmp rax, 0x6
  jne near temp_if_ne_8
  mov rax, 0
  jmp near temp_Iend_if_9
temp_if_ne_8:
  mov rax, [rsp + 24]
  mov [rsp + -32], rax
  mov rax, [rsp + 8]
  cmp rax, [rsp + -32]
  jne near temp_eNe_13
  mov rax, 0x6
  jmp near temp_end_if_14
temp_eNe_13:
  mov rax, 0x2
temp_end_if_14:
  mov [rsp + -32], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -32]
  cmp rax, 0x6
  jne near temp_if_ne_10
  mov rax, [rsp + 16]
  mov [rsp + -40], rax
  mov rax, 1
  jo near error_handle_of
  mov [rsp + -48], rax
  sar rax, 1
  cmp rax, 0
  jl near out_of_bounds
  mov [rsp + -56], r15
  mov r15, [rsp + -40]
  mov rax, [rsp + -48]
  sar rax, 1
  cmp rax, [r15 + 0]
  jg near out_of_bounds
  mov rax, [rsp + -48]
  sar rax, 1
  add rax, 1
  imul rax, 8
  add r15, rax
  mov rax, [r15 + 0]
  mov r15, [rsp + -56]
  jmp near temp_Iend_if_11
temp_if_ne_10:
  mov rax, [rsp + 24]
  mov [rsp + -40], rax
  mov rax, [rsp + 16]
  mov [rsp + -48], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -56], rax
  sar rax, 1
  cmp rax, 0
  jl near out_of_bounds
  mov [rsp + -64], r15
  mov r15, [rsp + -48]
  mov rax, [rsp + -56]
  sar rax, 1
  cmp rax, [r15 + 0]
  jg near out_of_bounds
  mov rax, [rsp + -56]
  sar rax, 1
  add rax, 1
  imul rax, 8
  add r15, rax
  mov rax, [r15 + 0]
  mov r15, [rsp + -64]
  mov [rsp + -48], rax
  mov rax, [rsp + 8]
  mov [rsp + -56], rax
  and rax, 1
  shl rax, 2
  add rax, 2
  cmp rax, 0x6
  jne near error_handle_num
  mov rax, [rsp + -56]
  xor rax, 1
  mov [rsp + -56], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -64], rax
  and rax, 1
  shl rax, 2
  add rax, 2
  cmp rax, 0x6
  jne near error_handle_num
  mov rax, [rsp + -56]
  add rax, [rsp + -64]
  jo near error_handle_of
  mov [rsp + -56], rax
  mov rax, temp_after_call_12
  mov [rsp + -64], rax
  mov [rsp + -72], rsp
  sub rsp, 56
  call getVal1
temp_after_call_12:
  mov rsp, [rsp + -16]
temp_Iend_if_11:
temp_Iend_if_9:
  ret
createLLto1:
  mov rax, temp_after_call_18
  mov [rsp + -16], rax
  mov [rsp + -24], rsp
  sub rsp, 8
  call initList1
temp_after_call_18:
  mov rsp, [rsp + -16]
  mov [rsp + -16], rax
  mov rax, [rsp + 8]
  mov [rsp + -24], rax
  mov rax, [rsp + -16]
  mov [rsp + -32], rax
  mov rax, 1
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, temp_after_call_17
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call createLLhelp1
temp_after_call_17:
  mov rsp, [rsp + -16]
  mov rax, [rsp + -16]
  ret
createLLhelp1:
  mov rax, 1
  jo near error_handle_of
  mov [rsp + -16], rax
  mov rax, [rsp + 24]
  mov [rsp + -24], rax
  mov rax, [rsp + 8]
  cmp rax, [rsp + -24]
  jne near temp_eNe_22
  mov rax, 0x6
  jmp near temp_end_if_23
temp_eNe_22:
  mov rax, 0x2
temp_end_if_23:
  mov [rsp + -24], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -24]
  cmp rax, 0x6
  jne near temp_if_ne_19
  mov rax, [rsp + 16]
  mov [rsp + -32], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + 8]
  mov [rsp + -72], rax
  mov rax, 0
  mov [rsp + -80], rax
  mov [rsp + -64], r15
  mov rax, 2
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -72]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -80]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -64]
  mov [rsp + -56], rax
  mov rax, [rsp + -40]
  cmp rax, 0
  jl near out_of_bounds
  mov [rsp + -48], r15
  mov r15, [rsp + -32]
  mov rax, [rsp + -40]
  sar rax, 1
  cmp rax, [r15 + 0]
  jg near out_of_bounds
  mov rax, [rsp + -40]
  sar rax, 1
  add rax, 1
  imul rax, 8
  add r15, rax
  mov rax, [rsp + -56]
  mov [r15 + 0], rax
  mov r15, [rsp + -48]
  mov rax, [rsp + -32]
  jmp near temp_Iend_if_20
temp_if_ne_19:
  mov rax, 1
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + 16]
  mov [rsp + -40], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -48], rax
  mov rax, [rsp + 8]
  mov [rsp + -80], rax
  mov rax, 0
  mov [rsp + -88], rax
  mov [rsp + -72], r15
  mov rax, 2
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -80]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -88]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -72]
  mov [rsp + -64], rax
  mov rax, [rsp + -48]
  cmp rax, 0
  jl near out_of_bounds
  mov [rsp + -56], r15
  mov r15, [rsp + -40]
  mov rax, [rsp + -48]
  sar rax, 1
  cmp rax, [r15 + 0]
  jg near out_of_bounds
  mov rax, [rsp + -48]
  sar rax, 1
  add rax, 1
  imul rax, 8
  add r15, rax
  mov rax, [rsp + -64]
  mov [r15 + 0], rax
  mov r15, [rsp + -56]
  mov rax, [rsp + -40]
  mov rax, [rsp + 24]
  mov [rsp + -40], rax
  mov rax, [rsp + 16]
  mov [rsp + -48], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -56], rax
  sar rax, 1
  cmp rax, 0
  jl near out_of_bounds
  mov [rsp + -64], r15
  mov r15, [rsp + -48]
  mov rax, [rsp + -56]
  sar rax, 1
  cmp rax, [r15 + 0]
  jg near out_of_bounds
  mov rax, [rsp + -56]
  sar rax, 1
  add rax, 1
  imul rax, 8
  add r15, rax
  mov rax, [r15 + 0]
  mov r15, [rsp + -64]
  mov [rsp + -48], rax
  mov rax, [rsp + 8]
  mov [rsp + -56], rax
  and rax, 1
  shl rax, 2
  add rax, 2
  cmp rax, 0x6
  jne near error_handle_num
  mov rax, [rsp + -56]
  xor rax, 1
  mov [rsp + -56], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -64], rax
  and rax, 1
  shl rax, 2
  add rax, 2
  cmp rax, 0x6
  jne near error_handle_num
  mov rax, [rsp + -56]
  add rax, [rsp + -64]
  jo near error_handle_of
  mov [rsp + -56], rax
  mov rax, temp_after_call_21
  mov [rsp + -64], rax
  mov [rsp + -72], rsp
  sub rsp, 56
  call createLLhelp1
temp_after_call_21:
  mov rsp, [rsp + -16]
temp_Iend_if_20:
  ret
error_handle_num:
  mov rdi, 0
  push 0
  call error
error_handle_bool:
  mov rdi, 1
  push 0
  call error
error_handle_of:
  mov rdi, 2
  push 0
  call error
out_of_bounds:
  mov rdi, 3
  push 0
  call error
our_code_starts_here:
push rbx
  mov r15, rdi
  mov [rsp - 8], rsi

  mov rax, temp_after_call_45
  mov [rsp + -16], rax
  mov [rsp + -24], rsp
  sub rsp, 8
  call initList1
temp_after_call_45:
  mov rsp, [rsp + -16]
  mov [rsp + -16], rax
  mov rax, 37
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, temp_after_call_44
  mov [rsp + -32], rax
  mov [rsp + -40], rsp
  sub rsp, 24
  call createLLto1
temp_after_call_44:
  mov rsp, [rsp + -16]
  mov [rsp + -24], rax
  mov rax, -199997
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, 0
  mov [rsp + -48], rax
  mov rax, 0
  mov [rsp + -56], rax
  mov rax, 0
  mov [rsp + -64], rax
  mov [rsp + -32], r15
  mov rax, 4
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -40]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -48]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -56]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -64]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -32]
  mov [rsp + -32], rax
  mov rax, [rsp + -16]
  mov rdi, rax
  sub rsp, 40
  call print
  add rsp, 40
  mov rax, 181
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -16]
  mov [rsp + -48], rax
  mov rax, temp_after_call_24
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addBeg1
temp_after_call_24:
  mov rsp, [rsp + -16]
  mov rax, 161
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -16]
  mov [rsp + -48], rax
  mov rax, temp_after_call_25
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addBeg1
temp_after_call_25:
  mov rsp, [rsp + -16]
  mov rax, 141
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -16]
  mov [rsp + -48], rax
  mov rax, temp_after_call_26
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addBeg1
temp_after_call_26:
  mov rsp, [rsp + -16]
  mov rax, 121
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -16]
  mov [rsp + -48], rax
  mov rax, temp_after_call_27
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addBeg1
temp_after_call_27:
  mov rsp, [rsp + -16]
  mov rax, 101
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -16]
  mov [rsp + -48], rax
  mov rax, temp_after_call_28
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addBeg1
temp_after_call_28:
  mov rsp, [rsp + -16]
  mov rax, [rsp + -16]
  mov rdi, rax
  sub rsp, 40
  call print
  add rsp, 40
  mov rax, 161
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -16]
  mov [rsp + -48], rax
  mov rax, temp_after_call_29
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addEnd1
temp_after_call_29:
  mov rsp, [rsp + -16]
  mov rax, 141
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -16]
  mov [rsp + -48], rax
  mov rax, temp_after_call_30
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addEnd1
temp_after_call_30:
  mov rsp, [rsp + -16]
  mov rax, 121
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -16]
  mov [rsp + -48], rax
  mov rax, temp_after_call_31
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addEnd1
temp_after_call_31:
  mov rsp, [rsp + -16]
  mov rax, 101
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -16]
  mov [rsp + -48], rax
  mov rax, temp_after_call_32
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addEnd1
temp_after_call_32:
  mov rsp, [rsp + -16]
  mov rax, 161
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -16]
  mov [rsp + -48], rax
  mov rax, temp_after_call_33
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addEnd1
temp_after_call_33:
  mov rsp, [rsp + -16]
  mov rax, 141
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -16]
  mov [rsp + -48], rax
  mov rax, temp_after_call_34
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addEnd1
temp_after_call_34:
  mov rsp, [rsp + -16]
  mov rax, 121
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -16]
  mov [rsp + -48], rax
  mov rax, temp_after_call_35
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addEnd1
temp_after_call_35:
  mov rsp, [rsp + -16]
  mov rax, 101
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -16]
  mov [rsp + -48], rax
  mov rax, temp_after_call_36
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addEnd1
temp_after_call_36:
  mov rsp, [rsp + -16]
  mov rax, [rsp + -16]
  mov rdi, rax
  sub rsp, 40
  call print
  add rsp, 40
  mov rax, 27
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -16]
  mov [rsp + -48], rax
  mov rax, 1
  jo near error_handle_of
  mov [rsp + -56], rax
  mov rax, temp_after_call_37
  mov [rsp + -64], rax
  mov [rsp + -72], rsp
  sub rsp, 56
  call getVal1
temp_after_call_37:
  mov rsp, [rsp + -16]
  mov rdi, rax
  sub rsp, 40
  call print
  add rsp, 40
  mov rax, [rsp + -24]
  mov rdi, rax
  sub rsp, 40
  call print
  add rsp, 40
  mov rax, 161
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -24]
  mov [rsp + -48], rax
  mov rax, temp_after_call_38
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addEnd1
temp_after_call_38:
  mov rsp, [rsp + -16]
  mov rax, 121
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -24]
  mov [rsp + -48], rax
  mov rax, temp_after_call_39
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addBeg1
temp_after_call_39:
  mov rsp, [rsp + -16]
  mov rax, [rsp + -24]
  mov rdi, rax
  sub rsp, 40
  call print
  add rsp, 40
  mov rax, 15
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, temp_after_call_40
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call createLLto1
temp_after_call_40:
  mov rsp, [rsp + -16]
  mov rdi, rax
  sub rsp, 40
  call print
  add rsp, 40
  mov rax, 179
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -32]
  mov [rsp + -48], rax
  mov rax, temp_after_call_41
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addBeg1
temp_after_call_41:
  mov rsp, [rsp + -16]
  mov rax, 385
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -32]
  mov [rsp + -48], rax
  mov rax, temp_after_call_42
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addBeg1
temp_after_call_42:
  mov rsp, [rsp + -16]
  mov rax, 999
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, [rsp + -32]
  mov [rsp + -48], rax
  mov rax, temp_after_call_43
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call addEnd1
temp_after_call_43:
  mov rsp, [rsp + -16]
  mov rax, [rsp + -32]
  pop rbx
ret

