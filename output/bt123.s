  section .text
  extern error
  extern print
  extern heap_alloc
  global our_code_starts_here

createBst1:
  mov rax, [rsp + 8]
  mov [rsp + -24], rax
  mov rax, 0
  mov [rsp + -32], rax
  mov rax, 0
  mov [rsp + -40], rax
  mov [rsp + -16], r15
  mov rax, 3
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -24]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -32]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -40]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -16]
  ret
addBst1:
  mov rax, [rsp + 8]
  mov [rsp + -16], rax
  mov rax, 1
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
  sar rax, 1
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
  mov rax, [r15 + 0]
  mov r15, [rsp + -40]
  mov [rsp + -24], rax
  mov rax, [rsp + 8]
  mov [rsp + -32], rax
  mov rax, 5
  jo near error_handle_of
  mov [rsp + -40], rax
  sar rax, 1
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
  mov rax, [r15 + 0]
  mov r15, [rsp + -48]
  mov [rsp + -32], rax
  mov rax, [rsp + -16]
  mov [rsp + -40], rax
  mov rax, [rsp + 16]
  cmp rax, [rsp + -40]
  jne near temp_eNe_17
  mov rax, 0x6
  jmp near temp_end_if_18
temp_eNe_17:
  mov rax, 0x2
temp_end_if_18:
  mov [rsp + -40], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -40]
  cmp rax, 0x6
  jne near temp_if_ne_3
  mov rax, [rsp + 8]
  jmp near temp_Iend_if_4
temp_if_ne_3:
  mov rax, [rsp + -16]
  mov [rsp + -48], rax
  and rax, 1
  shl rax, 2
  add rax, 2
  cmp rax, 0x6
  jne near error_handle_num
  mov rax, [rsp + -48]
  sub rax, 1
  mov rax, [rsp + -48]
  mov rax, [rsp + 16]
  mov [rsp + -56], rax
  and rax, 1
  shl rax, 2
  add rax, 2
  cmp rax, 0x6
  jne near error_handle_num
  mov rax, [rsp + -48]
  sub rax, [rsp + -56]
  jo near error_handle_of
  shr rax, 61
  and rax, 4
  add rax, 0x2
  mov [rsp + -48], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -48]
  cmp rax, 0x6
  jne near temp_if_ne_5
  mov rax, [rsp + -32]
  cmp rax, 0
  jne near temp_fif_ne_16
  mov rax, 0x6
  jmp near temp_fend_if_15
temp_fif_ne_16:
  mov rax, 0x2
temp_fend_if_15:
  mov [rsp + -56], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -56]
  cmp rax, 0x6
  jne near temp_if_ne_12
  mov rax, [rsp + 8]
  mov [rsp + -64], rax
  mov rax, 5
  jo near error_handle_of
  mov [rsp + -72], rax
  mov rax, [rsp + 16]
  mov [rsp + -104], rax
  mov rax, 0
  mov [rsp + -112], rax
  mov rax, 0
  mov [rsp + -120], rax
  mov [rsp + -96], r15
  mov rax, 3
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -104]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -112]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -120]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -96]
  mov [rsp + -88], rax
  mov rax, [rsp + -72]
  cmp rax, 0
  jl near out_of_bounds
  mov [rsp + -80], r15
  mov r15, [rsp + -64]
  mov rax, [rsp + -72]
  sar rax, 1
  cmp rax, [r15 + 0]
  jg near out_of_bounds
  mov rax, [rsp + -72]
  sar rax, 1
  add rax, 1
  imul rax, 8
  add r15, rax
  mov rax, [rsp + -88]
  mov [r15 + 0], rax
  mov r15, [rsp + -80]
  mov rax, [rsp + -64]
  jmp near temp_Iend_if_13
temp_if_ne_12:
  mov rax, [rsp + 16]
  mov [rsp + -64], rax
  mov rax, [rsp + -32]
  mov [rsp + -72], rax
  mov rax, temp_after_call_14
  mov [rsp + -80], rax
  mov [rsp + -88], rsp
  sub rsp, 72
  call addBst1
temp_after_call_14:
  mov rsp, [rsp + -16]
temp_Iend_if_13:
  jmp near temp_Iend_if_6
temp_if_ne_5:
  mov rax, [rsp + -24]
  cmp rax, 0
  jne near temp_fif_ne_11
  mov rax, 0x6
  jmp near temp_fend_if_10
temp_fif_ne_11:
  mov rax, 0x2
temp_fend_if_10:
  mov [rsp + -56], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -56]
  cmp rax, 0x6
  jne near temp_if_ne_7
  mov rax, 1
  jo near error_handle_of
  mov [rsp + -64], rax
  mov rax, [rsp + 8]
  mov [rsp + -72], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -80], rax
  mov rax, [rsp + 16]
  mov [rsp + -112], rax
  mov rax, 0
  mov [rsp + -120], rax
  mov rax, 0
  mov [rsp + -128], rax
  mov [rsp + -104], r15
  mov rax, 3
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -112]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -120]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -128]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -104]
  mov [rsp + -96], rax
  mov rax, [rsp + -80]
  cmp rax, 0
  jl near out_of_bounds
  mov [rsp + -88], r15
  mov r15, [rsp + -72]
  mov rax, [rsp + -80]
  sar rax, 1
  cmp rax, [r15 + 0]
  jg near out_of_bounds
  mov rax, [rsp + -80]
  sar rax, 1
  add rax, 1
  imul rax, 8
  add r15, rax
  mov rax, [rsp + -96]
  mov [r15 + 0], rax
  mov r15, [rsp + -88]
  mov rax, [rsp + -72]
  mov rax, [rsp + 8]
  jmp near temp_Iend_if_8
temp_if_ne_7:
  mov rax, [rsp + 16]
  mov [rsp + -64], rax
  mov rax, [rsp + -24]
  mov [rsp + -72], rax
  mov rax, temp_after_call_9
  mov [rsp + -80], rax
  mov [rsp + -88], rsp
  sub rsp, 72
  call addBst1
temp_after_call_9:
  mov rsp, [rsp + -16]
temp_Iend_if_8:
temp_Iend_if_6:
temp_Iend_if_4:
  ret
inBst1:
  mov rax, [rsp + 8]
  mov [rsp + -16], rax
  mov rax, 1
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
  sar rax, 1
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
  mov rax, [r15 + 0]
  mov r15, [rsp + -40]
  mov [rsp + -24], rax
  mov rax, [rsp + 8]
  mov [rsp + -32], rax
  mov rax, 5
  jo near error_handle_of
  mov [rsp + -40], rax
  sar rax, 1
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
  mov rax, [r15 + 0]
  mov r15, [rsp + -48]
  mov [rsp + -32], rax
  mov rax, [rsp + -16]
  mov [rsp + -40], rax
  mov rax, [rsp + 16]
  cmp rax, [rsp + -40]
  jne near temp_eNe_33
  mov rax, 0x6
  jmp near temp_end_if_34
temp_eNe_33:
  mov rax, 0x2
temp_end_if_34:
  mov [rsp + -40], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -40]
  cmp rax, 0x6
  jne near temp_if_ne_19
  mov rax, 0x6
  mov rax, 0x6
  jmp near temp_Iend_if_20
temp_if_ne_19:
  mov rax, [rsp + -16]
  mov [rsp + -48], rax
  and rax, 1
  shl rax, 2
  add rax, 2
  cmp rax, 0x6
  jne near error_handle_num
  mov rax, [rsp + -48]
  sub rax, 1
  mov rax, [rsp + -48]
  mov rax, [rsp + 16]
  mov [rsp + -56], rax
  and rax, 1
  shl rax, 2
  add rax, 2
  cmp rax, 0x6
  jne near error_handle_num
  mov rax, [rsp + -48]
  sub rax, [rsp + -56]
  jo near error_handle_of
  shr rax, 61
  and rax, 4
  add rax, 0x2
  mov [rsp + -48], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -48]
  cmp rax, 0x6
  jne near temp_if_ne_21
  mov rax, [rsp + -32]
  cmp rax, 0
  jne near temp_fif_ne_32
  mov rax, 0x6
  jmp near temp_fend_if_31
temp_fif_ne_32:
  mov rax, 0x2
temp_fend_if_31:
  mov [rsp + -56], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -56]
  cmp rax, 0x6
  jne near temp_if_ne_28
  mov rax, 0x2
  jmp near temp_Iend_if_29
temp_if_ne_28:
  mov rax, [rsp + 16]
  mov [rsp + -64], rax
  mov rax, [rsp + -32]
  mov [rsp + -72], rax
  mov rax, temp_after_call_30
  mov [rsp + -80], rax
  mov [rsp + -88], rsp
  sub rsp, 72
  call inBst1
temp_after_call_30:
  mov rsp, [rsp + -16]
temp_Iend_if_29:
  jmp near temp_Iend_if_22
temp_if_ne_21:
  mov rax, [rsp + -24]
  cmp rax, 0
  jne near temp_fif_ne_27
  mov rax, 0x6
  jmp near temp_fend_if_26
temp_fif_ne_27:
  mov rax, 0x2
temp_fend_if_26:
  mov [rsp + -56], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -56]
  cmp rax, 0x6
  jne near temp_if_ne_23
  mov rax, 0x2
  jmp near temp_Iend_if_24
temp_if_ne_23:
  mov rax, [rsp + 16]
  mov [rsp + -64], rax
  mov rax, [rsp + -24]
  mov [rsp + -72], rax
  mov rax, temp_after_call_25
  mov [rsp + -80], rax
  mov [rsp + -88], rsp
  sub rsp, 72
  call inBst1
temp_after_call_25:
  mov rsp, [rsp + -16]
temp_Iend_if_24:
temp_Iend_if_22:
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

  mov rax, 5
  jo near error_handle_of
  mov [rsp + -16], rax
  mov rax, temp_after_call_43
  mov [rsp + -24], rax
  mov [rsp + -32], rsp
  sub rsp, 16
  call createBst1
temp_after_call_43:
  mov rsp, [rsp + -16]
  mov [rsp + -16], rax
  mov rax, [rsp + -16]
  mov rdi, rax
  sub rsp, 24
  call print
  add rsp, 24
  mov rax, 9
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, [rsp + -16]
  mov [rsp + -32], rax
  mov rax, temp_after_call_35
  mov [rsp + -40], rax
  mov [rsp + -48], rsp
  sub rsp, 32
  call addBst1
temp_after_call_35:
  mov rsp, [rsp + -16]
  mov rax, -5
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, [rsp + -16]
  mov [rsp + -32], rax
  mov rax, temp_after_call_36
  mov [rsp + -40], rax
  mov [rsp + -48], rsp
  sub rsp, 32
  call inBst1
temp_after_call_36:
  mov rsp, [rsp + -16]
  mov rdi, rax
  sub rsp, 24
  call print
  add rsp, 24
  mov rax, [rsp + -16]
  mov rdi, rax
  sub rsp, 24
  call print
  add rsp, 24
  mov rax, 33
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, [rsp + -16]
  mov [rsp + -32], rax
  mov rax, temp_after_call_37
  mov [rsp + -40], rax
  mov [rsp + -48], rsp
  sub rsp, 32
  call addBst1
temp_after_call_37:
  mov rsp, [rsp + -16]
  mov rax, -5
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, [rsp + -16]
  mov [rsp + -32], rax
  mov rax, temp_after_call_38
  mov [rsp + -40], rax
  mov [rsp + -48], rsp
  sub rsp, 32
  call addBst1
temp_after_call_38:
  mov rsp, [rsp + -16]
  mov rax, -117
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, [rsp + -16]
  mov [rsp + -32], rax
  mov rax, temp_after_call_39
  mov [rsp + -40], rax
  mov [rsp + -48], rsp
  sub rsp, 32
  call addBst1
temp_after_call_39:
  mov rsp, [rsp + -16]
  mov rax, [rsp + -16]
  mov rdi, rax
  sub rsp, 24
  call print
  add rsp, 24
  mov rax, -5
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, [rsp + -16]
  mov [rsp + -32], rax
  mov rax, temp_after_call_40
  mov [rsp + -40], rax
  mov [rsp + -48], rsp
  sub rsp, 32
  call inBst1
temp_after_call_40:
  mov rsp, [rsp + -16]
  mov rdi, rax
  sub rsp, 24
  call print
  add rsp, 24
  mov rax, 801
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, [rsp + -16]
  mov [rsp + -32], rax
  mov rax, temp_after_call_41
  mov [rsp + -40], rax
  mov [rsp + -48], rsp
  sub rsp, 32
  call inBst1
temp_after_call_41:
  mov rsp, [rsp + -16]
  mov rdi, rax
  sub rsp, 24
  call print
  add rsp, 24
  mov rax, 33
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, [rsp + -16]
  mov [rsp + -32], rax
  mov rax, temp_after_call_42
  mov [rsp + -40], rax
  mov [rsp + -48], rsp
  sub rsp, 32
  call inBst1
temp_after_call_42:
  mov rsp, [rsp + -16]
  mov rdi, rax
  sub rsp, 24
  call print
  add rsp, 24
  pop rbx
ret

