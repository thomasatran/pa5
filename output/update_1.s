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
  mov [rsp + -56], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -64], rax
  mov rax, 47
  jo near error_handle_of
  mov [rsp + -72], rax
  mov rax, 29
  jo near error_handle_of
  mov [rsp + -80], rax
  mov rax, 3031
  jo near error_handle_of
  mov [rsp + -88], rax
  mov [rsp + -48], r15
  mov rax, 5
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -56]
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
  mov rax, [rsp + -48]
  mov [rsp + -16], rax
  mov rax, 7
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, 39
  jo near error_handle_of
  mov [rsp + -56], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -64], rax
  mov rax, 47
  jo near error_handle_of
  mov [rsp + -72], rax
  mov rax, 29
  jo near error_handle_of
  mov [rsp + -80], rax
  mov rax, 3031
  jo near error_handle_of
  mov [rsp + -88], rax
  mov [rsp + -48], r15
  mov rax, 5
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -56]
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
  mov rax, [rsp + -48]
  mov [rsp + -40], rax
  mov rax, [rsp + -24]
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
  mov rax, [rsp + -40]
  mov [r15 + 0], rax
  mov r15, [rsp + -32]
  mov rax, [rsp + -16]
  pop rbx
ret

