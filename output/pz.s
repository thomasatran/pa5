  section .text
  extern error
  extern print
  extern heap_alloc
  global our_code_starts_here

p1:
  mov rax, [rsp + 16]
  mov [rsp + -24], rax
  mov rax, [rsp + 8]
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
pPlus1:
  mov rax, [rsp + 16]
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
  mov r15, [rsp + -40]
  mov [rsp + -24], rax
  mov rax, [rsp + -24]
  xor rax, 1
  mov [rsp + -24], rax
  mov rax, [rsp + 8]
  mov [rsp + -32], rax
  mov rax, 1
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
  mov rax, [rsp + -24]
  add rax, [rsp + -32]
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, [rsp + 16]
  mov [rsp + -32], rax
  mov rax, 3
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
  mov rax, [rsp + -32]
  xor rax, 1
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
  mov rax, [rsp + -32]
  add rax, [rsp + -40]
  jo near error_handle_of
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

  mov rax, 11
  jo near error_handle_of
  mov [rsp + -16], rax
  mov rax, 13
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, temp_after_call_6
  mov [rsp + -32], rax
  mov [rsp + -40], rsp
  sub rsp, 24
  call p1
temp_after_call_6:
  mov rsp, [rsp + -16]
  mov [rsp + -16], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, 37
  jo near error_handle_of
  mov [rsp + -32], rax
  mov rax, temp_after_call_7
  mov [rsp + -40], rax
  mov [rsp + -48], rsp
  sub rsp, 32
  call p1
temp_after_call_7:
  mov rsp, [rsp + -16]
  mov [rsp + -24], rax
  mov rax, temp_after_call_8
  mov [rsp + -32], rax
  mov [rsp + -40], rsp
  sub rsp, 24
  call pPlus1
temp_after_call_8:
  mov rsp, [rsp + -16]
  mov [rsp + -16], rax
  mov rax, [rsp + -16]
  pop rbx
ret

