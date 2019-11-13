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
  jne near temp_fif_ne_5
  mov rax, 0x6
  jmp near temp_fend_if_4
temp_fif_ne_5:
  mov rax, 0x2
temp_fend_if_4:
  mov [rsp + -24], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -24]
  cmp rax, 0x6
  jne near temp_if_ne_1
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
  jmp near temp_Iend_if_2
temp_if_ne_1:
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
  mov rax, temp_after_call_3
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call addEnd1
temp_after_call_3:
  mov rsp, [rsp + -16]
temp_Iend_if_2:
  ret
getVal1:
  mov rax, 1
  jo near error_handle_of
  mov [rsp + -16], rax
  mov rax, [rsp + 16]
  cmp rax, 0
  jne near temp_fif_ne_14
  mov rax, 0x6
  jmp near temp_fend_if_13
temp_fif_ne_14:
  mov rax, 0x2
temp_fend_if_13:
  mov [rsp + -24], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -24]
  cmp rax, 0x6
  jne near temp_if_ne_6
  mov rax, 0
  jmp near temp_Iend_if_7
temp_if_ne_6:
  mov rax, [rsp + 24]
  mov [rsp + -32], rax
  mov rax, [rsp + 8]
  cmp rax, [rsp + -32]
  jne near temp_eNe_11
  mov rax, 0x6
  jmp near temp_end_if_12
temp_eNe_11:
  mov rax, 0x2
temp_end_if_12:
  mov [rsp + -32], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -32]
  cmp rax, 0x6
  jne near temp_if_ne_8
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
  jmp near temp_Iend_if_9
temp_if_ne_8:
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
  mov rax, temp_after_call_10
  mov [rsp + -64], rax
  mov [rsp + -72], rsp
  sub rsp, 56
  call getVal1
temp_after_call_10:
  mov rsp, [rsp + -16]
temp_Iend_if_9:
temp_Iend_if_7:
  ret
createLLto1:
  mov rax, temp_after_call_16
  mov [rsp + -16], rax
  mov [rsp + -24], rsp
  sub rsp, 8
  call initList1
temp_after_call_16:
  mov rsp, [rsp + -16]
  mov [rsp + -16], rax
  mov rax, [rsp + 8]
  mov [rsp + -24], rax
  mov rax, [rsp + -16]
  mov [rsp + -32], rax
  mov rax, 1
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, temp_after_call_15
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call createLLhelp1
temp_after_call_15:
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
  jne near temp_eNe_20
  mov rax, 0x6
  jmp near temp_end_if_21
temp_eNe_20:
  mov rax, 0x2
temp_end_if_21:
  mov [rsp + -24], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -24]
  cmp rax, 0x6
  jne near temp_if_ne_17
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
  jmp near temp_Iend_if_18
temp_if_ne_17:
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
  mov rax, temp_after_call_19
  mov [rsp + -64], rax
  mov [rsp + -72], rsp
  sub rsp, 56
  call createLLhelp1
temp_after_call_19:
  mov rsp, [rsp + -16]
temp_Iend_if_18:
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

  mov rax, temp_after_call_40
  mov [rsp + -16], rax
  mov [rsp + -24], rsp
  sub rsp, 8
  call initList1
temp_after_call_40:
  mov rsp, [rsp + -16]
  mov [rsp + -16], rax
  mov rax, 37
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, temp_after_call_39
  mov [rsp + -32], rax
  mov [rsp + -40], rsp
  sub rsp, 24
  call createLLto1
temp_after_call_39:
  mov rsp, [rsp + -16]
  mov [rsp + -24], rax
  mov rax, [rsp + -16]
  mov rdi, rax
  sub rsp, 32
  call print
  add rsp, 32
  mov rax, 181
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + -16]
  mov [rsp + -40], rax
  mov rax, temp_after_call_22
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call addBeg1
temp_after_call_22:
  mov rsp, [rsp + -16]
  mov rax, 161
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + -16]
  mov [rsp + -40], rax
  mov rax, temp_after_call_23
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call addBeg1
temp_after_call_23:
  mov rsp, [rsp + -16]
  mov rax, 141
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + -16]
  mov [rsp + -40], rax
  mov rax, temp_after_call_24
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call addBeg1
temp_after_call_24:
  mov rsp, [rsp + -16]
  mov rax, 121
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + -16]
  mov [rsp + -40], rax
  mov rax, temp_after_call_25
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call addBeg1
temp_after_call_25:
  mov rsp, [rsp + -16]
  mov rax, 101
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + -16]
  mov [rsp + -40], rax
  mov rax, temp_after_call_26
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call addBeg1
temp_after_call_26:
  mov rsp, [rsp + -16]
  mov rax, [rsp + -16]
  mov rdi, rax
  sub rsp, 32
  call print
  add rsp, 32
  mov rax, 161
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + -16]
  mov [rsp + -40], rax
  mov rax, temp_after_call_27
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call addEnd1
temp_after_call_27:
  mov rsp, [rsp + -16]
  mov rax, 141
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + -16]
  mov [rsp + -40], rax
  mov rax, temp_after_call_28
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call addEnd1
temp_after_call_28:
  mov rsp, [rsp + -16]
  mov rax, 121
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + -16]
  mov [rsp + -40], rax
  mov rax, temp_after_call_29
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call addEnd1
temp_after_call_29:
  mov rsp, [rsp + -16]
  mov rax, 101
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + -16]
  mov [rsp + -40], rax
  mov rax, temp_after_call_30
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call addEnd1
temp_after_call_30:
  mov rsp, [rsp + -16]
  mov rax, 161
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + -16]
  mov [rsp + -40], rax
  mov rax, temp_after_call_31
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call addEnd1
temp_after_call_31:
  mov rsp, [rsp + -16]
  mov rax, 141
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + -16]
  mov [rsp + -40], rax
  mov rax, temp_after_call_32
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call addEnd1
temp_after_call_32:
  mov rsp, [rsp + -16]
  mov rax, 121
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + -16]
  mov [rsp + -40], rax
  mov rax, temp_after_call_33
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call addEnd1
temp_after_call_33:
  mov rsp, [rsp + -16]
  mov rax, 101
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + -16]
  mov [rsp + -40], rax
  mov rax, temp_after_call_34
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call addEnd1
temp_after_call_34:
  mov rsp, [rsp + -16]
  mov rax, [rsp + -16]
  mov rdi, rax
  sub rsp, 32
  call print
  add rsp, 32
  mov rax, 27
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + -16]
  mov [rsp + -40], rax
  mov rax, 1
  jo near error_handle_of
  mov [rsp + -48], rax
  mov rax, temp_after_call_35
  mov [rsp + -56], rax
  mov [rsp + -64], rsp
  sub rsp, 48
  call getVal1
temp_after_call_35:
  mov rsp, [rsp + -16]
  mov rdi, rax
  sub rsp, 32
  call print
  add rsp, 32
  mov rax, [rsp + -24]
  mov rdi, rax
  sub rsp, 32
  call print
  add rsp, 32
  mov rax, 161
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + -24]
  mov [rsp + -40], rax
  mov rax, temp_after_call_36
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call addEnd1
temp_after_call_36:
  mov rsp, [rsp + -16]
  mov rax, 121
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, [rsp + -24]
  mov [rsp + -40], rax
  mov rax, temp_after_call_37
  mov [rsp + -48], rax
  mov [rsp + -56], rsp
  sub rsp, 40
  call addBeg1
temp_after_call_37:
  mov rsp, [rsp + -16]
  mov rax, [rsp + -24]
  mov rdi, rax
  sub rsp, 32
  call print
  add rsp, 32
  mov rax, 15
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, temp_after_call_38
  mov [rsp + -40], rax
  mov [rsp + -48], rsp
  sub rsp, 32
  call createLLto1
temp_after_call_38:
  mov rsp, [rsp + -16]
  pop rbx
ret

