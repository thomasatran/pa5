  section .text
  extern error
  extern print
  extern heap_alloc
  global our_code_starts_here

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

  mov rax, 39
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, 47
  jo near error_handle_of
  mov [rsp + -40], rax
  mov rax, 29
  jo near error_handle_of
  mov [rsp + -48], rax
  mov rax, 3031
  jo near error_handle_of
  mov [rsp + -56], rax
  mov [rsp + -16], r15
  mov rax, 5
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
  mov rax, [rsp + -48]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -56]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -16]
  mov [rsp + -16], rax
  mov rax, 39
  jo near error_handle_of
  mov [rsp + -64], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -72], rax
  mov rax, 47
  jo near error_handle_of
  mov [rsp + -80], rax
  mov rax, 29
  jo near error_handle_of
  mov [rsp + -88], rax
  mov rax, 3031
  jo near error_handle_of
  mov [rsp + -96], rax
  mov rax, 39
  jo near error_handle_of
  mov [rsp + -112], rax
  mov rax, [rsp + -16]
  mov [rsp + -120], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -128], rax
  mov rax, 47
  jo near error_handle_of
  mov [rsp + -136], rax
  mov rax, 29
  jo near error_handle_of
  mov [rsp + -144], rax
  mov rax, 3031
  jo near error_handle_of
  mov [rsp + -152], rax
  mov [rsp + -104], r15
  mov rax, 6
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
  mov rax, [rsp + -136]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -144]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -152]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -104]
  mov [rsp + -104], rax
  mov [rsp + -56], r15
  mov rax, 6
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -64]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -72]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -80]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -88]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -96]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -104]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -56]
  mov [rsp + -24], rax
  mov rax, 11
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
  mov r15, [rsp + -24]
  mov rdi, rax
  sub rsp, 24
  call print
  add rsp, 24
  mov rax, [rsp + -16]
  mov [rsp + -24], rax
  mov rax, 7
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, 11
  jo near error_handle_of
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
  mov r15, [rsp + -24]
  mov rax, [rsp + -24]
  mov rax, [rsp + -16]
  mov rdi, rax
  sub rsp, 24
  call print
  add rsp, 24
  mov rax, [rsp + -16]
  mov [rsp + -24], rax
  mov rax, 9
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
  mov r15, [rsp + -24]
  mov rdi, rax
  sub rsp, 24
  call print
  add rsp, 24
  mov rax, [rsp + -16]
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
  mov r15, [rsp + -24]
  mov [rsp + -24], rax
  mov rax, [rsp + -24]
  xor rax, 1
  mov [rsp + -24], rax
  mov rax, [rsp + -16]
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
  mov r15, [rsp + -32]
  mov [rsp + -32], rax
  mov rax, [rsp + -24]
  add rax, [rsp + -32]
  jo near error_handle_of
  mov rdi, rax
  sub rsp, 24
  call print
  add rsp, 24
  mov rax, [rsp + -16]
  mov [rsp + -24], rax
  mov rax, 1
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, 0x6
  mov rax, 0x6
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
  mov r15, [rsp + -24]
  mov rax, [rsp + -24]
  mov rax, [rsp + -16]
  mov rdi, rax
  sub rsp, 24
  call print
  add rsp, 24
  mov rax, [rsp + -16]
  mov [rsp + -56], rax
  mov rax, 1
  jo near error_handle_of
  mov [rsp + -64], rax
  mov rax, 0x2
  mov [rsp + -80], rax
  mov rax, [rsp + -64]
  cmp rax, 0
  jl near out_of_bounds
  mov [rsp + -72], r15
  mov r15, [rsp + -56]
  mov rax, [rsp + -64]
  sar rax, 1
  cmp rax, [r15 + 0]
  jg near out_of_bounds
  mov rax, [rsp + -64]
  sar rax, 1
  add rax, 1
  imul rax, 8
  add r15, rax
  mov rax, [rsp + -80]
  mov [r15 + 0], rax
  mov r15, [rsp + -56]
  mov rax, [rsp + -56]
  mov [rsp + -24], rax
  mov rax, 1
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
  mov r15, [rsp + -24]
  pop rbx
ret

