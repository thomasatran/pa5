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

  mov rax, 11
  jo near error_handle_of
  mov [rsp + -16], rax
  mov rax, 135
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, [rsp + -24]
  mov [rsp + -32], rax
  and rax, 1
  shl rax, 2
  add rax, 2
  cmp rax, 0x6
  jne near error_handle_num
  mov rax, [rsp + -32]
  sub rax, 2
  jo near error_handle_of
  pop rbx
ret

